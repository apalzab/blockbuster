class Spinach::Features::MakeAPurchase < Spinach::FeatureSteps
  include Warden::Test::Helpers
  Warden.test_mode!

  step 'I do not exist as user' do
    user = FactoryGirl.create(:user)
  end

  step 'I go to a movie page' do
    movie_purchase_option = FactoryGirl.create(:movie_purchase_option)
    visit movie_path movie_purchase_option.movie
  end

  step 'I can not purchase a movie' do
    page.has_content?('You must log in to make a purchase')
  end

  step 'I am logged in' do
    @user = FactoryGirl.create(:confirmed_user)
    login_as(@user , :scope => :user)
  end

  step 'I click purchase' do
    page.execute_script('$(".btn").first().click();')
  end

  step 'I should go to purchases path' do
    sleep 5
    current_path.should == purchases_path
  end
end
