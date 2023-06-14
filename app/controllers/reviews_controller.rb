class ReviewsController < ApplicationController
  def new
    @restaurant = Restaurant.find(params["restaurant_id"])
    @review = Review.new
  end

  def create
    @restaurant = Restaurant.find(params[:article_id])
    @review = @restaurant.reviews.build(review_params)
    @review.save
    redirect_to restaurent_path(@restaurant)
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
