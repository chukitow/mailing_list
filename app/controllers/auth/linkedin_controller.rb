class Auth::LinkedinController < AuthController
  def callback
    mailing = Mailing.find(session[:mailing_id])

    if params[:code].present?
      profile_information = Auth::Linkedin.get_profile_information(params[:code])
      mailing.update_attributes({
        linkedin_id: profile_information["id"],
        linkedin_connections: profile_information["numConnections"],
        linkedin_pictureUrl: profile_information["pictureUrl"],
      })
    end

    redirect_to mailing
  end
end
