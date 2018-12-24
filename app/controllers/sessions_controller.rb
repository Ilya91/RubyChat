class SessionsController < ApplicationController
  # @return [Object]
  def login; end

  def authenticate
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:green] = 'You have successfully logged in'
      redirect_to root_path
    else
      flash.now[:red] = 'There was something wrong...'
      render 'login'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'You have logged out!'
    redirect_to login_path
  end

  def signup
    @user = User.new
  end

  def register
    @user = User.new(register_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Welcome to the blog #{@user.username}"
      redirect_to root_path
    else
      render 'signup'
    end
  end

  def register_params
    params.require(:session).permit(:username, :email, :password)
  end
end
