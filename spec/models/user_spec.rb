require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it 'nicknameとemail、passwordとpassword_confirmation、last_nameとfirst_name、last_kanaとfirst_kana、birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailに＠が含まれないと登録できない' do
        @user.email = 'kkkcom'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'emailが他のユーザーと重複していると登録できないこと' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'passwordが空だと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下だと登録できない' do
        @user.password = 'kkk12'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが半角英数字混合でないと登録できない' do
        @user.password = 'kkkkkk'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password 半角英数字混合を入力してください')
      end
      it 'passwordとpassword_confirmationは、値の一致が必須であること' do
        @user.password = 'kkk123'
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordは半角数字のみでは登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password 半角英数字混合を入力してください')
      end
      it 'passwordは全角では登録できないこと' do
        @user.password = 'ｋｋｋ１２３'
        @user.password_confirmation = 'ｋｋｋ１２３'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password 半角英数字混合を入力してください')
      end
      it 'last_nameが空だと登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'last_nameが半角だと登録できない' do
        @user.last_name = 'tanaka'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid. Input full-width characters.')
      end
      it 'first_nameが空だと登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'first_nameが半角文字だと登録できない' do
        @user.first_name = 'hanako'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid. Input full-width characters.')
      end
      it 'last_kanaが空だと登録できない' do
        @user.last_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last kana can't be blank")
      end
      it 'last_kanaが半角文字だと登録できない' do
        @user.last_kana = 'tanaka'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last kana is invalid. Input full-width katakana characters.')
      end
      it 'last_kanaがカタカナ以外の全角文字だと登録できない' do
        @user.last_kana = '田中'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last kana is invalid. Input full-width katakana characters.')
      end
      it 'first_kanaが空だと登録できない' do
        @user.first_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First kana can't be blank")
      end
      it 'first_kanaが半角文字だと登録できない' do
        @user.first_kana = 'hanako'
        @user.valid?
        expect(@user.errors.full_messages).to include('First kana is invalid. Input full-width katakana characters.')
      end
      it 'first_kanaがカタカナ以外の全角文字だと登録できない' do
        @user.first_kana = '花子'
        @user.valid?
        expect(@user.errors.full_messages).to include('First kana is invalid. Input full-width katakana characters.')
      end
      it 'birthdayが空だと登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
