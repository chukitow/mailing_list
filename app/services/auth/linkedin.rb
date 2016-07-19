class Auth::Linkedin

  def initialize
  end

  def self.authorize
    new.url
  end

  def self.get_profile_information(code)
    uri =  URI("https://www.linkedin.com/oauth/v2/accessToken")
    res = Net::HTTP.post_form(uri, new.access_token_parameters.merge({code: code}))

    access_token = JSON.parse(res.body)['access_token']
    url = URI("https://api.linkedin.com/v1/people/~:(id,num-connections,picture-url)?oauth2_access_token=#{access_token}&format=json")
    res = Net::HTTP.get(url)

    JSON.parse(res)
  end

  def url
    "#{authorization_url}?#{authorization_parameters.to_query}"
  end

  def authorization_url
    "https://www.linkedin.com/oauth/v2/authorization"
  end

  def host
    ENV['application_host']
  end

  def authorization_parameters
    {
      response_type: 'code',
      client_id: ENV['linkedin_client_id'],
      state: ENV['linkedin_state'],
      redirect_uri: "#{ENV['application_host']}/auth/linkedin/callback",
      scope: 'r_emailaddress r_basicprofile'
    }
  end

  def access_token_parameters
    {
      grant_type: 'authorization_code',
      redirect_uri: "#{ENV['application_host']}/auth/linkedin/callback",
      client_id: ENV['linkedin_client_id'],
      client_secret: ENV['linkedin_client_secret'],
    }
  end
end
