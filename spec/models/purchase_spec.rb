require 'rails_helper'

RSpec.describe Purchase, :type => :model do

# Associations
  it { should belong_to(:movie_purchase_option) }
  it { should belong_to(:user) }

# Validations
  it { should validate_presence_of :user }
  it { should validate_presence_of :movie_purchase_option }

  it "is invalid if movie_purchase_option is false" do
    mpo = FactoryGirl.create(:inactive_movie_purchase_option)
    user = FactoryGirl.create(:confirmed_user)
    purchase = Purchase.new(movie_purchase_option_id: mpo.id, user_id: user.id)
    expect(purchase).not_to be_valid
  end

# Factories
  it "has a valid factory" do
    purchase = create(:purchase)
    expect(purchase).to be_valid
  end
end
