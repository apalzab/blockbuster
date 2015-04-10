require 'rails_helper'

RSpec.describe PurchaseOption, :type => :model do

# Associations
  it { should have_many(:movie_purchase_options) }
  it { should have_many(:movies).through(:movie_purchase_options) }

# Validations
  it { should validate_presence_of(:quality) }
  it { should validate_presence_of(:price) }

  it "has a valid factory" do
    purchase_option = create(:purchase_option)
    expect(purchase_option).to be_valid
  end
end
