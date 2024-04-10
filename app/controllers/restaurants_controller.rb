class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant

    if(params['category_ids'].present?)
      category_ids = params['category_ids'].split(',').map do |category_id|
        Restaurant.category_ids[category_id]
      end
      @restaurants = @restaurants.where(category_id: category_ids)
    end

    if(params['name'].present?)
      @restaurants = @restaurants.where('name LIKE ?', "%#{params[:name]}%")
    end

    @restaurants = @restaurants.page(params[:page])
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @reviews = @restaurant.reviews.order(created_at: :desc)
  end

end
