class UsersController < ApplicationController
  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to '/'
    elsif !user.valid?
      redirect_to '/login'
        flash[:error] = "That e-mail is already in our system. Please try to login instead!"
    else
      redirect_to '/signup' 
        flash[:error] = "Something went wrong. Try again and make sure all fields are filled in!"
    end
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end

end
