require 'rails_helper'

RSpec.describe User, :type => :model do

# Associations 
  it { should have_many :purchases }

# Validations 
  it { should validate_uniqueness_of(:nickname) }

# Factories
  it "has a valid factory" do
    user = create(:user)
    expect(user).to be_valid
  end
end
