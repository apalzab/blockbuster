FactoryGirl.define do
  factory :purchase do
    association :user, factory: :confirmed_user
    association :movie_purchase_option
  end
end
