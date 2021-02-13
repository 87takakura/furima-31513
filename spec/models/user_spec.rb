require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

 describe 'ユーザー新規登録'do
  
  
  it 'ニックネームが空では登録できない' do
   @user.nickname = ''
   @user.valid?
   expect(@user.errors.full_messages).to include "Nickname can't be blank"
  end
 
  it 'メールアドレスが空では登録できない' do
   @user.email = ''
   @user.valid?
   expect(@user.errors.full_messages). to include("Email can't be blank")
  end
  it '重複したemailがある場合登録できない' do
   @user.save
   another_user = FactoryBot.build(:user)
   another_user.email = @user.email 
   another_user.valid?
   expect(another_user.errors.full_messages).to include('Email has already been taken')
  end
  it 'メールアドレスは、@を含む必要がある' do
   @user.email = '0@0'
   expect(@user).to be_valid 
  end

  it 'passwordが空では登録できない' do
   @user.password = ''
   @user.valid?
   expect(@user.errors.full_messages).to include("Password can't be blank")
  end
  it 'passwordとpassword_confirmationが６文字以上あれば登録できる' do
   @user.password = 'aaaaa0'
   @user.password_confirmation = 'aaaaa0'
   expect(@user).to be_valid
  end
  it 'passwordは半角英数混合であれば登録できる' do
    @user.password = 'aaaaa0'
    @user.password_confirmation = 'aaaaa0'
    expect(@user).to be_valid
  end
  it 'passwordが存在してもpassword_confirmationが空では登録できない' do
   @user.password = '000000'
   @user.password_confirmation = '' 
   @user.valid?
   expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
  end
  it 'passwordとpassword_confirmationが一致すれば登録できる' do
   @user.password = @user.password_confirmation
   expect(@user).to be_valid   
  end


  
  
  #本人確認情報のexampleの整理
  it 'firstnameが存在しなければ登録できない' do
    @user.firstname = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Firstname can't be blank")
  end

  it 'lastnameが存在しなければ登録できない' do
    @user.lastname = ''  
    @user.valid?
    expect(@user.errors.full_messages).to include("Lastname can't be blank")
  end

  it 'ユーザー本名は、全角（漢字・ひらがな・カタカナ）であれば登録できる' do
    @user.firstname = '亜あア'
    @user.lastname = '亜あア'
    expect(@user).to be_valid
  end

  it 'katakanafirstnameが存在しなければ登録できない' do
    @user.katakanafirstname = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Katakanafirstname can't be blank")
  end

  it 'katakanalastnameが存在しなければ登録できない' do
    @user.katakanalastname = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Katakanalastname can't be blank")
  end

  it 'birthdayが存在しなければ登録できない' do
    @user.birthday = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Birthday can't be blank")
  end

  it 'ユーザー本名のフリガナは、全角（カタカナ）であれば登録できる' do 
    @user.firstname = '亜あア'
    @user.lastname = '亜あア'
    expect(@user).to be_valid
  end
 end
end
