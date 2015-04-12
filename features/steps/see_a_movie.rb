class Spinach::Features::SeeAMovie < Spinach::FeatureSteps
  step 'I go to the movies path' do
    visit movies_path
  end

  step 'I click one of see movie buttons' do
    within("#movies") do
      click_on('Movie information')
    end
  end

  step 'I should see movie details' do
    page.has_text?('Movie').must_equal true
  end
end
