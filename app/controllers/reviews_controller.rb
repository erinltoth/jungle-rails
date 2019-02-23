class ReviewsController < ApplicationController
  before_action :require_login
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


  def destroy
    @review = Review.find(params[:id])
    @review.destroy

    redirect_to controller: 'products', action: 'show', id: params[:product_id]
  end

  private

  def require_login
    unless current_user
      flash[:error] = "You must be logged in to post reviews."
      redirect_to controller: 'products', action: 'show', id: params[:product_id]
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
