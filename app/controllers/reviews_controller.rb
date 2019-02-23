class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @product = Product.find params[:product_id]
    @review.product_id = params[:product_id]
    @review.user_id = current_user.id 

    if @review.save
      redirect_to [:products], notice: 'Review created!'
      puts "This worked"
    else
      redirect_to [:products], notice: 'Shit is broken'
      puts "This didn't work"
    end
  end

  def review_params 
    params.require(:review).permit(
      :product_id,
      :description,
      :rating,
      
    )
  end
end