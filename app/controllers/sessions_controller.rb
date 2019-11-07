class SessionsController < ApplicationController
  def new
    session[:user_id] = ''
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user #&.authenticate(params[:session][:email])
      sign_in user
      redirect_to user, notice: 'User was successfully signed in!'
    else
      flash.now[:error] = 'Wrong email.'
      render 'new'
    end
  end
end
