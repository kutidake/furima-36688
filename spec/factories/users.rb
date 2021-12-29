FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Lorem.characters(number: 10, min_alpha: 4)}
    password_confirmation {password}
    last_name             {'あ'}
    last_name_f             {'ア'}
    first_name             {'あ'}
    first_name_f             {'ア'}
    birth             {'1990/3/3'}
  end
end