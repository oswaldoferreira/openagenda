FactoryGirl.define do
  factory :event do
    title { Faker::Name.name }
    start_at { DateTime.new }
    user
  end
end
