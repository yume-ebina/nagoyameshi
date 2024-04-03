class ReviewsController < ApplicationController
  def create
    restaurant = Restaurant.find(params[:restaurant_id])
    review = restaurant.reviews.new(review_params)
    review.save
    redirect_to restaurant_url(restaurant)
  end

  private
    def review_params
      params.require(:review).permit(:content, :score).merge(user_id: current_user.id, restaurant_id: params[:restaurant_id])
    end
end
