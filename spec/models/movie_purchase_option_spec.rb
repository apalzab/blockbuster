require 'rails_helper'

RSpec.describe MoviePurchaseOption, :type => :model do

# Associations
  it { should belong_to(:movie) }
  it { should belong_to(:purchase_option) }
  it { should have_many(:purchases) }

# Validations
  it { should validate_presence_of(:price) }

# Factories
  it "has a valid factory" do
    movie_purchase_option = create(:movie_purchase_option)
    expect(movie_purchase_option).to be_valid
  end

# Scopes
  it "excludes inactive movie_purchase_options" do
    active_mpo = create(:movie_purchase_option)
    inactive_mpo = create(:inactive_movie_purchase_option)
    MoviePurchaseOption.active.should_not include(inactive_mpo)
  end
end
