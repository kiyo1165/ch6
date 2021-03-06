class UsersController < ApplicationController
  def new
    @user = User.new
    # debugger
  end

  def show
    @user = User.find(params[:id])
    # debugger
    # binding.pry
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to My page"
      redirect_to user_url(@user)
      # binding.pry
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit( :name, :email, :password, :password_confirmation )
  end
end
