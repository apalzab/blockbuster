class Movie < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

# Associations
  has_many :movie_purchase_options
  has_many :purchase_options, through: :movie_purchase_options

# Validations
  validates_presence_of :title, :plot
end
