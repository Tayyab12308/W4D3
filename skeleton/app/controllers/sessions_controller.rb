class SessionsController < ApplicationController
  def new
    debugger
    render :new
  end

  def create
    debugger
    @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
    if @user  
      # @user.login!
      session[:session_token] = @user.reset_session_token
      debugger
      redirect_to cats_url
    else  
      flash.now[:errors] = ['Invalid username or password']
      render :new
    end
  end

  def destroy

  end
end