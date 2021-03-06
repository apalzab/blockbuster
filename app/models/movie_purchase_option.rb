class MoviePurchaseOption < ActiveRecord::Base

# Associations
  belongs_to :movie
  belongs_to :purchase_option
  has_many :purchases

# Validations
  validates_presence_of :price

# Callbacks
  before_validation :set_price

# Method delegations (Law of Demeter)
  delegate :quality, to: :purchase_option

# Scopes
  scope :active, -> { where(active: true) }

  private

  def set_price
    return unless self.purchase_option # for testing purposes
    self.price = self.purchase_option.price
  end
end
