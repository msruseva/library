class AuthController < ApplicationController
  layout 'simple'

  def login
    if session[:user]
      redirect_to books_path
    end
  end

  def process_login
    user = User.where(username: params[:username]).first
    if user and user.valid_password?(params[:password])
      log_in(user)
      redirect_to books_path
    else
      flash[:error] = 'Invalid username or password'
      redirect_to action: 'login'
    end
  end

  def logout
    log_out
    redirect_to root_path
  end

end