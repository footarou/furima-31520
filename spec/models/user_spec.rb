require 'rails_helper'

RSpec.describe User, type: :model do
   describe "ユーザー新規登録" do
   it "nicknameが空だと登録できない" do
      user = User.new(nickname: "", email: "kkk@com", password: "kkk123", password_confirmation: "kkk123", last_name: "田中", first_name: "花子", last_kana: "タナカ", first_kana: "ハナコ", birthday: "1935-04-10")
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
   it "emailが空だと登録できない" do
      user = User.new(nickname: "kkk", email: "", password: "kkk123", password_confirmation: "kkk123", last_name: "田中", first_name: "花子", last_kana: "タナカ", first_kana: "ハナコ", birthday: "1935-04-10")
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
    it "emailに＠が含まれないと登録できない" do
      user = User.new(nickname: "kkk", email: "kkkcom", password: "kkk123", password_confirmation: "kkk123", last_name: "田中", first_name: "花子", last_kana: "タナカ", first_kana: "ハナコ", birthday: "1935-04-10")
      user.valid?
      expect(user.errors.full_messages).to include("Email is invalid")
    end
    it "passwordが空だと登録できない" do
      user = User.new(nickname: "kkk", email: "kkk@com", password: "", password_confirmation: "kkk123", last_name: "田中", first_name: "花子", last_kana: "タナカ", first_kana: "ハナコ", birthday: "1935-04-10")
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank", "Password confirmation doesn't match Password")
    end
    it "passwordが5文字以下だと登録できない" do
      user = User.new(nickname: "kkk", email: "kkk@com", password: "kkk12", password_confirmation: "kkk12", last_name: "田中", first_name: "花子", last_kana: "タナカ", first_kana: "ハナコ", birthday: "1935-04-10")
      user.valid?
      expect(user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it "passwordが半角英数字混合でないと登録できない" do
      user = User.new(nickname: "kkk", email: "kkk@com", password: "kkkkkk", password_confirmation: "kkkkkk", last_name: "田中", first_name: "花子", last_kana: "タナカ", first_kana: "ハナコ", birthday: "1935-04-10")
      user.valid?
      expect(user.errors.full_messages).to include("Password 半角英数字混合を入力してください")
    end
    it "last_nameが空だと登録できない" do
      user = User.new(nickname: "kkk", email: "kkk@com", password: "kkk123", password_confirmation: "kkk123", last_name: "", first_name: "花子", last_kana: "タナカ", first_kana: "ハナコ", birthday: "1935-04-10")
      user.valid?
      expect(user.errors.full_messages).to include("Last name can't be blank")
    end
    it "first_nameが空だと登録できない" do
      user = User.new(nickname: "kkk", email: "kkk@com", password: "kkk123", password_confirmation: "kkk123", last_name: "田中", first_name: "", last_kana: "タナカ", first_kana: "ハナコ", birthday: "1935-04-10")
      user.valid?
      expect(user.errors.full_messages).to include("First name can't be blank")
    end
    it "last_kanaが空だと登録できない" do
      user = User.new(nickname: "kkk", email: "kkk@com", password: "kkk123", password_confirmation: "kkk123", last_name: "田中", first_name: "花子", last_kana: "", first_kana: "ハナコ", birthday: "1935-04-10")
      user.valid?
      expect(user.errors.full_messages).to include("Last kana can't be blank")
    end
    it "first_kanaが空だと登録できない" do
      user = User.new(nickname: "kkk", email: "kkk@com", password: "kkk123", password_confirmation: "kkk123", last_name: "田中", first_name: "花子", last_kana: "タナカ", first_kana: "", birthday: "1935-04-10")
      user.valid?
      expect(user.errors.full_messages).to include("First kana can't be blank")
    end
    it "birthdayが空だと登録できない" do
      user = User.new(nickname: "kkk", email: "kkk@com", password: "kkk123", password_confirmation: "kkk123", last_name: "田中", first_name: "花子", last_kana: "タナカ", first_kana: "ハナコ", birthday: "")
      user.valid?
      expect(user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end

