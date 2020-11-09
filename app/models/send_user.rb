class SendUser < ApplicationRecord
  belongs_to :order
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area

  with_options presence: true do
    validates :item_id
    validates :area_id
    validates :adress_number
    validates :city
    validates :house_number
    validates :phone_number
  end
end
