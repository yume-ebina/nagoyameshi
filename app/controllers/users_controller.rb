class UsersController < ApplicationController
  before_action :set_user
  before_action :authenticate_user!

  def edit
  end

  def update
    @user.update_without_password(user_params)
    redirect_to mypage_edit_users_url
  end

  def mypage
  end

  def favorite
    @favorite_restaurants = @user.restaurants.page(params[:page])
  end

  def reserve
    @user = User.find(current_user.id)
    @user_reservations = current_user.reservations.where("start_time >= ?", DateTime.current).order(day: :desc)
    @visit_historys = current_user.reservations.where("start_time < ?", DateTime.current).where("start_time > ?", DateTime.current << 12).order(day: :desc)
  end

  def register_card
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    @count = 0
    card_info = {}

    if @user.token != ""
      result = Payjp::Customer.retrieve(@user.token).cards.all(limit: 1).data[0]
      @count = Payjp::Customer.retrieve(@user.token).cards.all.count

      card_info[:brand] = result.brand
      card_info[:exp_month] = result.exp_month
      card_info[:exp_year] = result.exp_year
      card_info[:last4] = result.last4
    end

    @card = card_info
  end

  def token
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    customer = @user.token

    if @user.token != ""
      cu = Payjp::Customer.retrieve(customer)
      delete_card = cu.cards.retrieve(cu.cards.data[0]["id"])
      delete_card.delete
      cu.cards.create(:card => params["payjp-token"])
    else
      cu = Payjp::Customer.create
      cu.cards.create(:card => params["payjp-token"])
      @user.token = cu.id
      @user.save
    end
    redirect_to mypage_users_url
  end

  def registration
  end

  def plan #定期課金プラン
    Payjp::Plan.create(
      :amount => 330,
      :interval => 'month',
      :currency => 'jpy',
    )
  end

  def paid_decision
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Subscription.create(
                          :customer => current_user.token,
                          :plan => plan
                        )
    @user.update(premium_end_date: Time.now.next_month)
    redirect_to mypage_users_url
  end

  private
    def user_params
      params.require(:user).permit(:name, :kana, :gender, :birthday, :email, :password, :password_confirmation, :premium_end_date)
    end

    def set_user
      @user = current_user
    end
end
