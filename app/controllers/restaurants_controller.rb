class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @reviews = @restaurant.reviews_with_id
    @review = @reviews.new
    @star_repeat_select = Review.star_repeat_select
  end

end
