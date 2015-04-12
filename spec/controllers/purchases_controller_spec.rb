require 'rails_helper'

RSpec.describe PurchasesController, type: :controller do

  describe "logged in user" do
    before :each do
      @user = create(:confirmed_user)
      sign_in @user
    end

    describe 'GET #index' do
      it "populates an array of purchases" do
        purchases = @user.purchases
        get :index
        expect(assigns(:purchases)).to match_array(purchases)
      end

      it "renders the :index template" do
        get :index
        expect(response).to render_template :index
      end
    end

    describe "POST #create " do
      let(:movie_purchase_option) do
        create(:movie_purchase_option)
      end

      describe "html output" do
        it "saves new purchase in the database" do
          expect {
            post :create, purchase: { movie_purchase_option_id: movie_purchase_option.id }
          }.to change(Purchase, :count).by(1)
        end

        it "redirects to purchases" do
          post :create, purchase: { movie_purchase_option_id: movie_purchase_option.id }
          expect(response).to redirect_to purchases_path
        end
      end

      describe "js output" do
        it "saves new purchase in the database" do
          expect {
            post :create, format: :js, purchase: { movie_purchase_option_id: movie_purchase_option.id }
          }.to change(Purchase, :count).by(1)
        end

        it "renders the :create js template" do
          post :create, format: :js, purchase: { movie_purchase_option_id: movie_purchase_option.id }
          expect(response).to render_template :create
        end
      end
    end
  end

  describe "not logged in user" do
    describe 'GET #index' do
      it "redirects to new user session path" do
        get :index
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

end
