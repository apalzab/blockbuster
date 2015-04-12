module PurchasesHelper

  def number_to_euro(amount)
    number_to_currency(amount, :unit => '€')
  end
end
