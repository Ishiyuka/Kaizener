require 'rails_helper'

RSpec.describe "Users", type: :system do

  describe 'the function to sign in' do
    context 'to register new account' do
      it 'is shown the page of new uesr' do
        visit root_path
        visit new_user_registration_path
        fill_in 'user[name]', with: 'new'
        fill_in 'user[department]', with: 'new'
        fill_in 'user[email]', with: 'new@example.com'
        fill_in 'user[password]', with: 'newpasswprd'
        fill_in 'user[password_confirmation]', with: 'newpasswprd'
        click_on 'アカウント登録'
        expect(page).to have_content '完了'
      end
    end
  end
  
  describe 'the function to session' do
    let!(:user){ FactoryBot.create(:user)}
    context 'to log in as general' do
      it 'user can log in' do
        visit new_user_session_path
        fill_in 'Eメール', with: 'factory@example.com'
        fill_in 'パスワード', with: 'factory'
        click_button 'ログイン'
        expect(page).to have_content 'ログインしました'
      end
    end

    let!(:user){ FactoryBot.create(:user)}
    context 'to log out as general ' do
      it 'user can log out' do
        visit new_user_session_path
        fill_in 'Eメール', with: 'factory@example.com'
        fill_in 'パスワード', with: 'factory'
        click_button 'ログイン'
        sleep(1)
        click_on 'ログアウト'
        expect(page).to have_content 'ログアウトしました。'
      end
    end

    context 'to log in as guest user' do
      it 'guest user can log in' do
        visit root_path
        click_on "ゲスト(一般)ログイン"
        expect(page).to have_content '一般'
      end
    end

    context 'to log in as guest admin user ' do
      it 'guest admin user can log in' do
        visit root_path
        click_on 'ゲスト(管理者)ログイン'
        expect(page).to have_content '管理者'
      end
    end

    context 'to go to teams_path in case of user did not login' do
      it 'redirect to new_user_session_path' do
        visit root_path
        visit teams_path
        expect(page).to have_content 'ログインもしくはアカウント登録してください。'
      end
    end
  end
end
