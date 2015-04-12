require 'rails_helper'

RSpec.describe RegistrationsController, :type => :controller do

  before :each do
    @request.env["devise.mapping"] = Devise.mappings[:user]
  end

  describe 'POST #create' do
    context "with valid user" do
      let(:user) do
        build(:confirmed_user)
      end
      it "creates a new user" do
        expect {
          post :create, format: :json, user: { nickname: user.nickname, email: user.email,
                                             password: user.password, password_confirmation: user.password }
        }.to change(User, :count).by(1)
      end
    end
    context "with invalid user" do
      let(:user) do
        build(:confirmed_user)
      end
      it "do not creates an user" do
        post :create, format: :json, user: { email: user.email, password: user.password }
        expect {
          post :create, format: :json, user: { email: user.email,
                                             password: user.password, password_confirmation: user.password }
        }.to change(User, :count).by(0)
      end
    end
  end
end
