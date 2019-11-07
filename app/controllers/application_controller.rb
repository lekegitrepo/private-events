class ApplicationController < ActionController::Base
  def sign_in(user)
    session[:user_id] = user.id
    new_token = User.create_token

    # store token as a cookie in the browser
    cookies.permanent[:remember_token] = new_token
    cookies.permanent.signed[:user_id] = user.id
    user.update_attribute(:remember_digest, User.digest(new_token))
    current_user
  end
end
