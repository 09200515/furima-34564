require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it '必要な情報が正しく入力されているとき登録できる' do
        expect(@user).to be_valid
      end
      it 'passwrodは半角英数混合で6文字以上のとき登録できる' do
        @user.password = 'abcde1'
        @user.password_confirmation = 'abcde1'
        expect(@user).to be_valid
      end
    end

    context 'ユーザー新規登録できない時' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end

      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end

      it 'password_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end

      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank"
      end

      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end

      it 'kana_last_nameが空では登録できない' do
        @user.kana_last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Kana last name can't be blank"
      end

      it 'kana_first_nameが空では登録できない' do
        @user.kana_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Kana first name can't be blank"
      end

      it 'birthdayの年が空では登録できない' do
        @user.birthday = '/12/31'
        @user.valid?
        expect(@user.errors.full_messages).to include "Birthday can't be blank"
      end

      it 'birthdayの月が空では登録できない' do
        @user.birthday = '1995//30'
        @user.valid?
        expect(@user.errors.full_messages).to include "Birthday can't be blank"
      end

      it 'birthdayの日が空では登録できない' do
        @user.birthday = '1995/12/'
        @user.valid?
        expect(@user.errors.full_messages).to include "Birthday can't be blank"
      end

      it '重複したemailが存在する時登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include "Email has already been taken"
      end

      it 'passwordが5文字以下だと登録できない' do
        @user.password = 'abcd1'
        @user.password_confirmation = 'abcd1'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is too short (minimum is 6 characters)'
      end

      it 'passwordとpassword_confirmationが不一致だと登録できない' do
        @user.password = 'abcde1'
        @user.password_confirmation = 'efghi2'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end

      it 'passwordに英字が含まれていない場合登録できない' do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is invalid'
      end

      it 'passwordに数字が含まれていない場合登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is invalid'
      end

      it 'last_nameに英字が含まれている場合登録できない' do
        @user.last_name = 'takaはし'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name is invalid'
      end

      it 'first_nameに英字が含まれている場合登録できない' do
        @user.first_name = 'keい'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name is invalid'
      end

      it 'kana_last_nameがカタカナでない場合登録できない' do
        @user.kana_last_name = 'たかはし'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Kana last name is invalid'
      end

      it 'kana_first_nameがカタカナでない場合登録できない' do
        @user.kana_first_name = 'けい'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Kana first name is invalid'
      end
    end
  end
end
