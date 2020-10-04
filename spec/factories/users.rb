FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.name}
    email                 {Faker::Internet.email(separators: '@')}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    family_name           {Faker::Name.name}
    first_name            {Faker::Name.first_name}
    family_name_kana      {Faker::Name.name}
    first_name_kana       {Faker::Name.first_name}
    birthday              {Faker::Date.birthday}
  end
end