class Spinach::Features::SeeMovies < Spinach::FeatureSteps
  step 'I do not exist as user' do
    user = FactoryGirl.create(:user) # it's not registered
  end

  step 'I go to the root path' do
    visit root_path
  end

  step 'I should see movies' do
     page.has_content?('Movies').must_equal true
  end
end
