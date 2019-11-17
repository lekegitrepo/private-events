class SessionsController < ApplicationController
  def new
    session[:user_id] = ''
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user
      sign_in user
      redirect_to user, notice: 'User was successfully signed in!'
    else
      flash.now[:error] = 'Wrong email.'
      render 'new'
    end
  end

  def delete
    sign_out current_user
    redirect_to login_path
  end
end
