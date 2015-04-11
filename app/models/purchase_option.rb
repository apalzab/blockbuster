class PurchaseOption < ActiveRecord::Base

# Associations
  has_many :movie_purchase_options
  has_many :movies, through: :movie_purchase_options

# Validations
  validates_presence_of :quality, :price
  validates :quality, uniqueness: { scope: :price }

# Callbacks
  before_validation :parameterize_quality

  private

  def parameterize_quality
    return unless quality # for testing purposes
    self.quality = self.quality.parameterize
  end

end
