class UsersController < ApplicationController
  before_action :set_user
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

  private
    def user_params
      params.require(:user).permit(:name, :kana, :gender, :birthday, :email, :password, :password_confirmation)
    end

    def set_user
      @user = current_user
    end
end
