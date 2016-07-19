class Auth::TwitterController < AuthController
  def callback
    if params[:oauth_token].present? && params[:oauth_verifier].present?
      mailing = Mailing.find(session[:mailing_id])

      mailing.update_attributes({
        twitter_id: request.env['omniauth.auth']['extra']['raw_info']['id'],
        twitter_followers: request.env['omniauth.auth']['extra']['raw_info']['followers_count'],
        twitter_follows: request.env['omniauth.auth']['extra']['raw_info']['friends_count'],
        twitter_profile_image_url: request.env['omniauth.auth']['extra']['raw_info']['profile_image_url']
      })

      redirect_to mailing
    else
      redirect_to root_url
    end
  end
end
