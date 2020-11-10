FactoryBot.define do
  factory :order_info do
    user_id {1}
    item_id {1}
    area_id {2}
    adress_number {"123-4567"}
    city {"東京"}
    house_number {"世田谷1−2"}
    phone_number {"09012345678"}
    building_name {"レジデンス"}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
