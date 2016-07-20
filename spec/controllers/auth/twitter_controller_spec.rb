require 'rails_helper'

describe Auth::TwitterController, 'GET#callback' do
  context 'when oauth_token and oauth_token are present in the url' do
    let(:mailing) { FactoryGirl.create(:mailing) }

    before do
      controller.request.env['omniauth.auth'] = {
        'extra' => {
          'raw_info' => {
            'id' => Faker::Number.number(3),
            'followers_count' => Faker::Number.number(3),
            'friends_count' => Faker::Number.number(3),
            'profile_image_url' => Faker::Placeholdit.image,
          }
        }
      }

      session[:mailing_id] = mailing.id
      get :callback, mailing_id: mailing.id, oauth_token: Faker::Lorem.characters, oauth_verifier: Faker::Lorem.characters
    end

    it 'updates mailing twitter information' do
      expect(mailing.reload.twitter_id).to_not be_nil
      expect(mailing.reload.twitter_followers).to_not be_nil
      expect(mailing.reload.twitter_follows).to_not be_nil
      expect(mailing.reload.twitter_profile_image_url).to_not be_nil
    end

    it 'redirects to mailing' do
      expect(response).to redirect_to(mailing)
    end
  end

  context 'when oauth_token and oauth_token are not present in the url' do
    it 'redirects to root url' do
      get :callback

      expect(response).to redirect_to(root_url)
    end
  end
end
