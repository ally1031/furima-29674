FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.name }
    email                 { Faker::Internet.email }
    password              { 'aaa000' }
    password_confirmation { password }
    family_name           { '田中' }
    first_name            { 'たろう' }
    family_name_kana      { 'タナカ' }
    first_name_kana       { 'タロウ' }
    birthday              { Faker::Date.birthday }
  end
end
