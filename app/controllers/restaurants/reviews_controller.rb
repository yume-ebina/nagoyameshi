module Restaurants
  class ReviewsController < ApplicationController
    authorize_resource class: ReviewsController

    def create
      restaurant = Restaurant.find(params[:restaurant_id])
      review = restaurant.reviews.new(review_params)
      review.user = current_user
      review.save
      redirect_to restaurant_url(restaurant)
    end

    private
      def review_params
        params.require(:review).permit(:content, :score)
      end
  end
end
