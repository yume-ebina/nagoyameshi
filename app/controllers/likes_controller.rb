class LikesController < ApplicationController
  authorize_resource class: self
  before_action :authenticate_user!
  before_action :set_restaurant

  # POST /restaurants/:restaurant_id/like
  def create
    @like = current_user.likes.create(restaurant_id: params[:restaurant_id])
    redirect_to @restaurant
  end

  # DELETE /restaurants/:restaurant_id/unlike
  def destroy
    # お気に入り登録を解除
    @like = current_user.likes.find_by(restaurant_id: @restaurant.id)
    @like.destroy
    redirect_to @restaurant
  end

  private
  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

end