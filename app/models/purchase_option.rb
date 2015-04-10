class PurchaseOption < ActiveRecord::Base

# Associations
  has_many :movie_purchase_options
  has_many :movies, through: :movie_purchase_options

# Validations
  validates_presence_of :quality, :price
end
