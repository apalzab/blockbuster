class Spinach::Features::SignUp < Spinach::FeatureSteps
  step 'I go to the sign up page' do
    visit new_user_registration_path
  end

  step 'I sign up with invalid data' do
    within("form#new_user") do
      fill_in 'user_email', with: Faker::Internet.email
      fill_in 'user_password', with: 'not_same_password'
      click_button 'Sign up'
    end
  end

  step 'I should see errors' do
    within('.errors') do
      page.has_text? ("doesn't match Password")
    end
  end

  step 'I do not exist as user' do
    @user = FactoryGirl.attributes_for(:user)
  end

  step 'I log in with valid credentials' do
    page.execute_script("$('#user_nickname').val('hello_world');")
    page.execute_script("$('#user_email').val('aitor.palacios@deusto.es');")
    page.execute_script("$('#user_password').val('password');")
    page.execute_script("$('#user_password_confirmation').val('password');")
    page.execute_script("$('form').submit();")
  end

  step 'I should be signed up' do
    sleep 3
    expect(page).to have_content("Close Session")
  end
end
