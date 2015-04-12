require 'rails_helper'

RSpec.describe Purchase, :type => :model do

# Associations
  it { should belong_to(:movie_purchase_option) }
  it { should belong_to(:user) }

# Validations
  it { should validate_presence_of :user }
  it { should validate_presence_of :movie_purchase_option }

# Factories
  it "has a valid factory" do
    purchase = create(:purchase)
    expect(purchase).to be_valid
  end
end
