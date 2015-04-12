class Purchase < ActiveRecord::Base

# Associations
  belongs_to :user
  belongs_to :movie_purchase_option

# Validations
  validates_presence_of :movie_purchase_option, :user
  # validate :is_movie_purchase_option_active?

# Method delegations (Law of Demeter)
  delegate :movie, to: :movie_purchase_option
  delegate :price, to: :movie_purchase_option
  delegate :active, to: :movie_purchase_option

  private

  # def is_movie_purchase_option_active?
  #   return unless self.movie_purchase_option # for testing purposes
  #   errors.add[:movie_purchase_option, "The purchase option is not available"] unless self.active
  # end
end
