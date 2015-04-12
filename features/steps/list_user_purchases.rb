class Spinach::Features::ListUserPurchases < Spinach::FeatureSteps

  include Warden::Test::Helpers
  Warden.test_mode!

  step 'I do not exist as user' do
    user = FactoryGirl.create(:user)
  end

  step 'I go to purchases page' do
    visit purchases_path
  end

  step 'I should be redirected to new user session path' do
    current_path.should == new_user_session_path
  end

  step 'I am logged in' do
    @user = FactoryGirl.create(:confirmed_user)
    login_as(@user , :scope => :user)
  end

  step 'I should see my purchases' do
    current_path.should == purchases_path
  end
end
