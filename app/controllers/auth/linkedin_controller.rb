class Auth::LinkedinController < ApplicationController
  before_action :check_mailing_presence, only: [:callback]

  def callback
    mailing = Mailing.find(params[:mailing_id])

    if params[:code].present?
      profile_information = Auth::Linkedin.get_profile_information(mailing, params[:code])
      mailing.update_attributes({
        linkedin_id: profile_information["id"],
        linkedin_connections: profile_information["numConnections"],
        linkedin_pictureUrl: profile_information["pictureUrl"],
      })
    end

    redirect_to mailing
  end

  private
  def check_mailing_presence
    redirect_to root_url unless params[:mailing_id].present?
  end
end
