FactoryBot.define do
  factory :user do
    name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    phone_number { Faker::PhoneNumber.cell_phone }
    email { Faker::Internet.email }
    address { Faker::Address.full_address }
  end
end
