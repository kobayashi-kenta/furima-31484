class OrderInfo
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :area_id, :adress_number, :city, :building_name, :house_number, :phone_number, :token

  # ここにバリデーションの処理を書く
  with_options presence: true do
    validates :item_id
    validates :area_id, numericality: { other_than: 1 }
    validates :adress_number, format: { with: /\A\d{3}-\d{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :city
    validates :house_number
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'is invalid.' }
    validates :user_id
    validates :token
  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    SendUser.create(order_id: order.id, area_id: area_id, adress_number: adress_number, city: city, building_name: building_name, house_number: house_number, phone_number: phone_number)
  end
end
