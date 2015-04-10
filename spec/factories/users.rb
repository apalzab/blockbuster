FactoryGirl.define do
  factory :user do
    nickname { Faker::Name.name }

    after(:create) do |user|
      user.purchases.create(attributes_for(:purchase))
    end
  end
end
