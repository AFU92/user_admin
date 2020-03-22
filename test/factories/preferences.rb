FactoryBot.define do
  factory :preference do
    description { Constants::ADDITIONAL_DATA[0] }
    data { %w[a b c] }
    user_id { create(:user).__id__ }
  end
end
