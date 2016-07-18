require 'rails_helper'

describe MailingsController, 'GET#show' do
  let(:mailing) { FactoryGirl.create(:mailing) }
  before { get :show, id: mailing.id }

  it 'finds the mailing' do
    expect(assigns(:mailing)).to eq(mailing)
  end

  it 'renders show template' do
    expect(response).to render_template(:show)
  end
end

describe MailingsController, 'GET#new' do
  before { get :new }

  it 'creates a new Mailing instance' do
    expect(assigns(:mailing)).to be_a_new(Mailing)
  end

  it 'renders new template' do
    expect(response).to render_template(:new)
  end
end

describe MailingsController, 'POST#create' do
  context 'when has valid params' do
    before { post :create, mailing: FactoryGirl.attributes_for(:mailing) }

    it 'redirects to the mailing' do
      expect(response).to redirect_to(Mailing.last)
    end
  end

  context 'when hasn\'t valid params' do
    before { post :create, mailing: FactoryGirl.attributes_for(:mailing, email: nil) }

    it 'renders new template' do
      expect(response).to render_template(:new)
    end
  end
end
