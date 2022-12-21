require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validation for user' do
    # 名前、部署、メール、パスワードがあれば有効な状態であること
    context 'user with name, department, password, email' do
      it 'is valid' do
        user = FactoryBot.build(:user)
        expect(user).to be_valid
      end
    end

    # 名前がなければ無効な状態であること
    context 'user without a name' do
      it 'is invalid' do
        user = User.new(
          name: '',
          department: 'Factory',
          email: 'factory@example.com',
          password: 'factory',
          password_confirmation: 'factory',
          admin: false
        )
        expect(user).to be_invalid
      end
    end

    # 重複したメールアドレスなら無効な状態であること
    context 'user with a duplicate email address' do
      it 'is invalid' do
        User.create(
          name: 'test1',
          department: 'test1',
          email: 'test1@example.com',
          password: 'test01'
        )
        user = User.new(
          name: 'test1',
          department: 'test1',
          email: 'test1@example.com',
          password: 'test01'
        )
        expect(user).to be_invalid
      end
    end
  end
end
