class PurchaseOption < ActiveRecord::Base

# Associations
  has_many :movie_purchase_options
  has_many :movies, through: :movie_purchase_options

# Validations
  validates_presence_of :quality, :price
  validates :quality, uniqueness: { scope: :price }

# Callbacks
  before_validation :parameterize_quality
  after_update :create_movie_purchase_option, if: :price_changed?

  private

  def parameterize_quality
    return unless quality # for testing purposes
    self.quality = self.quality.parameterize
  end

  def price_changed?
    if self.persisted?
      price != price_was
    else
      false
    end
  end

  def create_movie_purchase_option
    old_mpos = MoviePurchaseOption.where(purchase_option_id: self.id).active
    old_mpos.each do |old_mpo|
      old_mpo.active = false
      old_mpo.save
      MoviePurchaseOption.create(movie_id: old_mpo.movie_id, purchase_option_id: id, active: true)
    end
  end

end
