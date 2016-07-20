require 'rails_helper'

describe DashboardController, 'GET#index' do
  let(:user) { FactoryGirl.create(:user) }

  before do
    session[:user_id] = user.id
    get :index
  end

  it 'retrieves all mailings' do
    expect(assigns(:mailings)).to eq(Mailing.all)
  end

  it 'renders index template' do
    expect(response).to render_template(:index)
  end
end

describe DashboardController, 'GET#show' do
  let(:user) { FactoryGirl.create(:user) }
  let(:mailing) { FactoryGirl.create(:mailing) }

  before do
    session[:user_id] = user.id
    get :show, id: mailing.id
  end

  it 'retrieves the mailing' do
    expect(assigns(:mailing)).to eq(mailing)
  end

  it 'renders show template' do
    expect(response).to render_template(:show)
  end
end
