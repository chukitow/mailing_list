require 'rails_helper'

describe Auth::LinkedinController, 'GET#callback' do
  context 'when mailing is present' do
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
      get :callback, mailing_id: mailing.id, code: code
    end

    it 'updates mailing information' do
      expect(mailing.reload.linkedin_id).to eq(profile_information_stub['id'])
      expect(mailing.reload.linkedin_connections).to eq(profile_information_stub['numConnections'].to_i)
      expect(mailing.reload.linkedin_pictureUrl).to eq(profile_information_stub['pictureUrl'])
    end

    it 'redirects to mailing' do
      expect(response).to redirect_to(mailing)
    end
  end

  context 'when mailing is not present' do
    it 'redirects to root url' do
      get :callback

      expect(response).to redirect_to(root_url)
    end
  end
end
