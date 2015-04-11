FactoryGirl.define do
  factory :movie do
    title { Faker::Name.title }
    plot { Faker::Lorem.sentence(3) }
  end

end
