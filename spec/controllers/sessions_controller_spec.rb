require 'rails_helper'

describe SessionsController, 'GET#new' do
  it 'renders new template' do
    get :new

    expect(response).to render_template(:new)
  end
end

describe SessionsController, 'POST#create' do
  let(:user) { FactoryGirl.create(:user, password: '12345678') }

  context 'when user provide valid credentials' do
    it 'redirects to dashboard' do
      post :create, email: user.email, password: '12345678'

      expect(response).to redirect_to(dashboard_path)
    end
  end

  context 'when user provide invalid credentials' do
    it 'redirects to login' do
      post :create, email: user.email, password: '12345678123'

      expect(response).to redirect_to(login_path)
    end
  end
end

describe SessionsController, 'POST#destroy' do
  it 'redirects to login' do
    delete :destroy

    expect(response).to redirect_to(login_path)
  end
end
