class UsersController < ApplicationController
  def new
    render :new
  end
  
  def create
    @user = User.new(users_params)
    if @user.save
      redirect_to cats_url
    else 
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end

  end

  private

  def users_params
    params.require(:user).permit(:username, :password)
  end
end