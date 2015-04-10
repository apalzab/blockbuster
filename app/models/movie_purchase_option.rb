class MoviePurchaseOption < ActiveRecord::Base

# Associations
  belongs_to :movie
  belongs_to :purchase_option
  has_many :purchases

# Validations
  validates_presence_of :price
end
