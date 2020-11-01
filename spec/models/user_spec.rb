require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it 'nickname,email,password,password_confirmation,last_name_1,first_name_1,last_name2,first_name_2,birthdayが存在すれば登録できること' do
      expect(@user).to be_valid
    end

    it 'nicknameが空では登録できないこと' do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空では登録できないこと' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'passwordが空では登録できないこと' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it '同じemailでは登録できないこと' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it 'emailに＠を含んでいなければ登録できないこと' do
      @user.email = 'abcdefghijklmnopqrstuvwxyz'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end

    it 'emailに＠を含んでいれば登録できること' do
      @user.email = 'abcdefghijkl@mnopqrstuvwxyz'
      expect(@user).to be_valid
    end

    it 'passwordが6文字以上であれば登録できること' do
      @user.password = '1234aa'
      @user.password_confirmation = '1234aa'
      expect(@user).to be_valid
    end

    it 'passwordが文５字以下では登録できないこと' do
      @user.password = '123aa'
      @user.password_confirmation = '123aa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'passwordは半角英数字混合でないと登録できないこと' do
      @user.password = '1234567'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end

    it 'passwordは半角英数字混合であれば登録できること' do
      @user.password = '12345aa'
      @user.password_confirmation = '12345aa'
      expect(@user).to be_valid
    end

    it 'passwordとpassword_confirmationが一致していなければ登録できないこと' do
      @user.password = '123456aa'
      @user.password_confirmation = '1234567aa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'last_name_1が空では登録できないこと' do
      @user.last_name_1 = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name 1 can't be blank")
    end

    it 'first_name_1が空では登録できないこと' do
      @user.first_name_1 = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name 1 can't be blank")
    end

    it 'last_name_1が全角（漢字・ひらがな・カタカナ）以外では登録できないこと' do
      @user.last_name_1 = 'aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name 1 全角ひらがな、全角カタカナ、漢字のみで入力して下さい')
    end

    it 'first_name_1が全角（漢字・ひらがな・カタカナ）以外では登録できないこと' do
      @user.first_name_1 = 'aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name 1 全角ひらがな、全角カタカナ、漢字のみで入力して下さい')
    end

    it 'last_name_2が空では登録できないこと' do
      @user.last_name_2 = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name 2 can't be blank")
    end

    it 'first_name_2が空では登録できないこと' do
      @user.first_name_2 = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name 2 can't be blank")
    end

    it 'last_name_2が全角カタカナ以外では登録できないこと' do
      @user.last_name_2 = 'aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name 2 全角カタカナのみで入力して下さい')
    end

    it 'first_name_2が全角カタカナ以外では登録できないこと' do
      @user.first_name_2 = 'aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name 2 全角カタカナのみで入力して下さい')
    end

    it 'birthdayが空では登録できないこと' do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
