FactoryGirl.define do
  factory :purchase do
    association :user
    association :movie_purchase_option
  end
end
