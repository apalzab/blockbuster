class Purchase < ActiveRecord::Base

# Associations
  belongs_to :user
  belongs_to :movie_purchase_option

# Validations
end
