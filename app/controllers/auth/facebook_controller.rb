class Auth::FacebookController < AuthController
  def callback
    mailing = Mailing.find(session[:mailing_id])

    @graph = Koala::Facebook::API.new(request.env['omniauth.auth']['credentials']['token'])
    friends = @graph.get_connection("me", "friends",api_version:"v2.0").raw_response["summary"]["total_count"]

    mailing.update_attributes({
      facebook_id: request.env['omniauth.auth']['uid'],
      facebook_friends: friends,
      facebook_profile_image_url: request.env['omniauth.auth']['info']['image'],
    })

    redirect_to mailing
  end
end
