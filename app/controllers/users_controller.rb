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
  end

  private
    def user_params
      params.require(:user).permit(:name, :kana, :gender, :birthday, :email, :password, :password_confirmation)
    end

    def set_user
      @user = current_user
    end
end
