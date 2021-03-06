class SessionsController < ApplicationController
  before_action :validate_session, only: [:new]

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to dashboard_path
    else
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end

  private
  def validate_session
    redirect_to dashboard_path unless current_user.nil?
  end
end
