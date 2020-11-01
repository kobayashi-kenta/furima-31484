class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do

    validates :nickname
    validates :last_name_1, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: '全角ひらがな、全角カタカナ、漢字のみで入力して下さい' }
    validates :first_name_1, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: '全角ひらがな、全角カタカナ、漢字のみで入力して下さい' }
    validates :last_name_2, format: { with: /\A[ァ-ヶー－]+\z/, message: '全角カタカナのみで入力して下さい' }
    validates :first_name_2, format: { with: /\A[ァ-ヶー－]+\z/, message: '全角カタカナのみで入力して下さい' }
    validates :birthday
      
  end
    PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
    validates :password, format: { with: PASSWORD_REGEX }, length: { minimum: 6 }
end
