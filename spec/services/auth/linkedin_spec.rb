require 'rails_helper'

describe Auth::Linkedin, '.authorize' do
  let(:mailing) { FactoryGirl.create(:mailing) }
  let(:authorization_parameters) do
    {
      response_type: 'code',
      client_id: ENV['linkedin_client_id'],
      state: ENV['linkedin_state'],
      redirect_uri: "#{ENV['application_host']}/auth/linkedin/callback?mailing_id=#{mailing.id}",
      scope: 'r_emailaddress r_basicprofile'
    }
  end

  it 'retrieves authorization url' do
    url = URI.parse(Auth::Linkedin.authorize(mailing))

    expect(url.host).to eq('www.linkedin.com')
    expect(url.path).to eq('/oauth/v2/authorization')
    expect(url.query).to eq(authorization_parameters.to_query)
  end

end

describe Auth::Linkedin, '.get_profile_information' do
  let(:mailing) { FactoryGirl.create(:mailing) }
  let(:code) { Faker::Lorem.characters }
  let(:access_token) { Faker::Lorem.characters }
  let(:access_token_stub) { { access_token: access_token }.to_json }
  let(:profile_information_stub) do
    {
      "id"=> Faker::Lorem.characters,
      "numConnections"=> Faker::Number.number(3),
      "pictureUrl" => Faker::Placeholdit.image
    }
  end

  before do
    stub_request(:post, "https://www.linkedin.com/oauth/v2/accessToken").to_return(body: access_token_stub)
    stub_request(:get, "https://api.linkedin.com/v1/people/~:(id,num-connections,picture-url)?oauth2_access_token=#{access_token}&format=json").to_return(body: profile_information_stub.to_json)
  end

  it 'retrieves profile\'s information' do
    profile_information = Auth::Linkedin.get_profile_information(mailing, code)
    expect(profile_information).to eq(profile_information_stub)
  end
end
