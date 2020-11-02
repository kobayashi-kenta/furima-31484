class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do

    validates :nickname
    NAME_REGEX1 = /\A[ぁ-んァ-ン一-龥]/
    NAME_MESSAGE1 = '全角ひらがな、全角カタカナ、漢字のみで入力して下さい'
    validates :last_name_1, format: { with: NAME_REGEX1, message: NAME_MESSAGE1 }
    validates :first_name_1, format: { with: NAME_REGEX1, message: NAME_MESSAGE1 }
    NAME_REGEX2 = /\A[ァ-ヶー－]+\z/
    NAME_MESSAGE2 = '全角カタカナのみで入力して下さい'
    validates :last_name_2, format: { with: NAME_REGEX2, message: NAME_MESSAGE2 }
    validates :first_name_2, format: { with: NAME_REGEX2, message: NAME_MESSAGE2 }
    validates :birthday
      
  end
    PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
    validates :password, format: { with: PASSWORD_REGEX }, length: { minimum: 6 }
end
