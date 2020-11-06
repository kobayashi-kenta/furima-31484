class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do

    validates :item_name
    validates :description
    validates :category_id
    validates :status_id
    validates :money_type_id
    validates :area_id
    validates :send_day_id
    PRICE_REGEX = /\A[0-9]+\z/
    PRICE_MESSAGE = '半角数字のみで入力して下さい'
    validates :price, format: {with: PRICE_REGEX, message: PRICE_MESSAGE}, 
                          length: { minimum: 300, maximum: 9999999}
  end
end
