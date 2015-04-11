class Purchase < ActiveRecord::Base

# Associations
  belongs_to :user
  belongs_to :movie_purchase_option

# Validations
  validates_presence_of :movie_purchase_option, :user

# Method delegations (Law of Demeter)
  delegate :movie, to: :movie_purchase_option
  delegate :price, to: :movie_purchase_option
end
