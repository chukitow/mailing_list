FactoryGirl.define do
  factory :mailing do
    name  { Faker::Name.name }
    email { Faker::Internet.email }
  end
end
