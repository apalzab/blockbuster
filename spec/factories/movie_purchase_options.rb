FactoryGirl.define do
  factory :movie_purchase_option do
    association :movie
    association :purchase_option
    active true

    after(:build) do |movie_purchase_option|
      movie_purchase_option.price = movie_purchase_option.purchase_option.price
    end
  end

  factory :inactive_movie_purchase_option, parent: :movie_purchase_option do
    active false
  end

end
