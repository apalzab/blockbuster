class MoviePurchaseOption < ActiveRecord::Base

# Associations
  belongs_to :movie
  belongs_to :purchase_option

# Validations
  validates_presence_of :price
end
