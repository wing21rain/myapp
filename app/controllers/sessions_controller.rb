class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_or_create_by(name: params[:username])
  session[:user_id] = user.id
  redirect_to chests_path
  end

  def destroy
  end
end
