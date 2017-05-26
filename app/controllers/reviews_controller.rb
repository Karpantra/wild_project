class ReviewsController < ApplicationController

  def create
    @product = Product.find(params[:product_id])
    @review = Review.new(review_params)
    @review.product = @product
    if @review.save
      respond_to do |format|
        format.html { redirect_to product_path(@product) }
        format.js
      end
    else
      respond_to do |format|
        format.html { render 'products/show' }
        format.js
      end
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
