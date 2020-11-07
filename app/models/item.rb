class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area
  belongs_to :category
  belongs_to :status
  belongs_to :money_type
  belongs_to :send_day

  with_options presence: true do
    validates :image
    validates :item_name
    validates :description
    validates :area_id, numericality: { other_than: 1 } 
    validates :category_id, numericality: { other_than: 1 } 
    validates :money_type_id, numericality: { other_than: 1 } 
    validates :status_id, numericality: { other_than: 1 } 
    validates :send_day_id, numericality: { other_than: 1 }   
    PRICE_REGEX = /\A[0-9]+\z/
    PRICE_MESSAGE = '半角数字のみで入力して下さい'
    validates :price, format: {with: PRICE_REGEX, message: PRICE_MESSAGE}, 
    numericality: { only_integer: true, greater_than: 300, less_than: 9999999}  
  end

end
