class MoviePurchaseOption < ActiveRecord::Base

# Associations
  belongs_to :movie
  belongs_to :purchase_option
  has_many :purchases

# Validations
  validates_presence_of :price

# Callbacks
  before_validation :set_price

  private

  def set_price
    self.price = self.purchase_option.price
  end
end
