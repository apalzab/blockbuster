FactoryGirl.define do
  factory :user do
    nickname { Faker::Name.name }
    email { Faker::Internet.email }
    password pwd = Faker::Internet.password(8)
    password_confirmation pwd
  end

  factory :confirmed_user, parent: :user do
    after(:create) do |user|
      user.purchases << create(:purchase, user_id: user.id)
    end
  end
end
