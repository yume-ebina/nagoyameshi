class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.display_list(category_params, params[:page])
    @categories = Category.all
    @category = Category.request_category(category_params)
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @reviews = @restaurant.reviews.order(created_at: :desc)
  end

  private
  def category_params
    params[:category].present? ? params[:category]
                               : "none"
  end

end
