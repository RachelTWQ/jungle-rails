class ReviewsController < ApplicationController
    before_action :set_product, only: [:show, :edit, :update, :destroy]
  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id 
    @review.product_id = params[:product_id] 

    if @review.save
        redirect_to "/products/#{params[:product_id]}", notice: 'Review was successfully created.'

    else
        redirect_to "/products/#{params[:product_id]}", notice: 'Error'
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @product = Product.find(params[:product_id])
    @review.destroy!
    redirect_to "/products/#{params[:product_id]}", notice: 'Review was deleted.'
  end
  private
  def set_product
    @product = Product.includes(:reviews).find(params[:id])
  end
  def review_params
    params.require(:review).permit(
        :description,
        :rating,
    )
  end
end
