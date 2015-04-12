require 'rails_helper'

RSpec.describe SessionsController, :type => :controller do

  before :each do
    @request.env["devise.mapping"] = Devise.mappings[:user]
  end

  describe 'POST #create' do
    context "with valid user" do
      let(:user) do
        create(:confirmed_user)
      end
      it "creates a new session" do
        post :create, format: :json, user: { email: user.email, password: user.password }
        expect(response).to have_http_status(:created)
      end
    end
    context "with invalid user" do
      let(:user) do
        build(:confirmed_user)
      end
      it "do not create a session" do
        post :create, format: :json, user: { email: user.email, password: user.password }
        expect(response).to have_http_status(401)
      end
    end
  end
end
