class Spinach::Features::LogIn < Spinach::FeatureSteps
  step 'I go to the login page' do
    visit new_user_session_path
  end

  step 'I log in with invalid credentials' do
    within("form#new_session") do
      fill_in 'user_email', with: Faker::Internet.email
      fill_in 'user_password', with: Faker::Internet.password
      click_button 'Log in'
    end
  end

  step 'I should see invalid message' do
    within('.errors') do
      page.has_text? ('Invalid email or password.')
    end
  end

  step 'I log in with valid credentials' do
    User.create(email: 'email@example.com', nickname: 'bender', password: 'password', password_confirmation: 'password')
    page.execute_script("$('#user_email').val('email@example.com');")
    page.execute_script("$('#user_password').val('password');")
    page.execute_script("$('form').submit();")
  end

  step 'I should be logged in' do
    sleep 3
    expect(page).to have_content "Close Session"
  end
end
