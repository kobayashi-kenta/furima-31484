FactoryBot.define do
  factory :user do
    nickname {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    password = "a1" + Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
    last_name_1 {"田中"}
    first_name_1 {"太郎"}
    last_name_2 {"タナカ"}
    first_name_2 {"タロウ"}
    birthday {"1988-12-03"}
  end
end