FactoryBot.define do
  factory :item do
    item_name { 'aaa' }
    description { 'abcdefghijklmn' }
    area_id { 2 }
    category_id { 2 }
    money_type_id { 2 }
    send_day_id { 2 }
    status_id { 2 }
    price { 4000 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
