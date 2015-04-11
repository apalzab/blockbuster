FactoryGirl.define do
  factory :purchase_option do
    price 2.99
    quality "hd"
  end

  factory :hd_purchase_option, parent: :purchase_option do
    quality "hd"
  end

  factory :sd_purchase_option, parent: :purchase_option do
    quality "sd"
  end
end
