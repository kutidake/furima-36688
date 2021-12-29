FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {'1a' + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name             {'あ'}
    last_name_f             {'ア'}
    first_name             {'あ'}
    first_name_f             {'ア'}
    birth             {'1990/3/3'}
  end
end