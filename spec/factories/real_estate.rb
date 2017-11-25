FactoryGirl.define do
  factory :real_estate do
    street { Faker::Address.street_address }
    city { Faker::Address.city }
    zip { Faker::Address.zip }
    state { Faker::Address.state }
    beds_number { Faker::Number.between(1, 5) }
    square_feet { Faker::Number.between(1, 2147483647) }
    building_type { RealEstate.building_types.keys.sample }
    sale_date { Faker::Date.between(5.years.ago, Date.today) }
    price { Faker::Number.between(1, 2147483647) }
    latitude { Faker::Address.latitude }
    longitude { Faker::Address.longitude }
  end
end
