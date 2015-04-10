require 'rails_helper'

RSpec.describe Movie, :type => :model do

# Associations
  it { should have_many(:movie_purchase_options) }
  it { should have_many(:purchase_options).through(:movie_purchase_options) }

# Validations
  it { should validate_presence_of(:title) }
  it { should validate_uniqueness_of(:title) }
  it { should validate_presence_of(:plot) }

  it "has a valid factory" do
    movie = create(:movie)
    expect(movie).to be_valid
  end

end
