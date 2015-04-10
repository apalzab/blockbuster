class Movie < ActiveRecord::Base

# Associations
  has_many :movie_purchase_options
  has_many :purchase_options, through: :movie_purchase_options

# Validations
  validates_presence_of :title, :plot
  validates_uniqueness_of :title
end
