class AuthController < ApplicationController
  before_action :validation_mailing_presence

  private
  def validation_mailing_presence
    redirect_to root_url if session[:mailing_id].nil?
  end
end
