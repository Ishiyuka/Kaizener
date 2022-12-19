require 'rails_helper'

RSpec.describe "Issues", type: :system do
  let!(:user){ FactoryBot.create(:user, name: 'leader', email: 'leader@example.com')}
  let!(:team){ FactoryBot.create(:team, name: 'fugafuga', owner: user)}
  let!(:assign){ FactoryBot.create(:assign, user: user, team: team)}
  let!(:issue){ FactoryBot.create(:issue, user: user, team: team)}
  let!(:plan){ FactoryBot.create(:plan, user: user, team: team, issue: issue, pic: user.id.to_s)}
  before do
    visit root_path
    visit new_user_session_path
    fill_in 'Eメール', with: 'factory@example.com'
    fill_in 'パスワード', with: 'factory'
    click_button 'ログイン'
    visit user_path(user)
  end

  describe 'management Issue' do
    context 'to see issue index' do
      it 'in the page' do
        visit root_path
        visit new_user_session_path
        fill_in 'Eメール', with: 'leader@example.com'
        fill_in 'パスワード', with: 'factory'
        click_button 'ログイン'
        visit user_path(user)
        click_on '課題一覧'
        expect(page).to have_content 'action'
      end
    end

    context 'to create new issue' do
      it 'is shown new issue' do
        visit root_path
        visit new_user_session_path
        fill_in 'Eメール', with: 'leader@example.com'
        fill_in 'パスワード', with: 'factory'
        click_button 'ログイン'
        visit user_path(user)
        click_on '課題追加'
        fill_in '題目', with: 'a'
        fill_in '目標', with: 'a'
        fill_in 'ギャップ', with: 'a'
        fill_in 'issue[due_date_at]', with: '002022-12-01'
        select '高', from: '優先度'
        click_on '登録する'
        expect(page).to have_content '追加'
      end
    end


    context 'to create new issue & plan' do
      it 'is shown new issue & plan' do
        visit root_path
        visit new_user_session_path
        fill_in 'Eメール', with: 'leader@example.com'
        fill_in 'パスワード', with: 'factory'
        click_button 'ログイン'
        visit user_path(user)
        click_on '課題追加'
        fill_in '題目', with: 'a'
        fill_in '目標', with: 'a'
        fill_in 'ギャップ', with: 'a'
        fill_in 'issue[due_date_at]', with: '002022-12-01'
        select '高', from: '優先度'
        fill_in 'アクション', with: 'a'
        select 'leader', from: '担当者'
        fill_in 'issue[plans_attributes][0][due_date_at]', with: '002022-12-01'
        select '要改善', from: '評価'
        click_on '登録する'
        expect(page).to have_content '追加'
      end
    end

    context 'to edit a Issue' do
      it 'is shown the updated issue' do
        visit root_path
        visit new_user_session_path
        fill_in 'Eメール', with: 'leader@example.com'
        fill_in 'パスワード', with: 'factory'
        click_button 'ログイン'
        visit user_path(user)
        click_on '課題一覧'
        click_on '編集'
        fill_in '題目', with: 'changed b'
        click_on '更新する'
        expect(page).to have_content 'changed b'
      end
    end

    context 'to edit a Plan' do
      it 'is shown the updated plan' do
        visit root_path
        visit new_user_session_path
        fill_in 'Eメール', with: 'leader@example.com'
        fill_in 'パスワード', with: 'factory'
        click_button 'ログイン'
        visit user_path(user)
        click_on '課題一覧'
        click_on '編集'
        sleep(5)
        fill_in 'アクション', with: 'changed'
        click_on '更新する'
        expect(page).to have_content 'changed'
      end
    end

    context 'to edit a Issue & Plan' do
      it 'is shown the updated issue & plan' do
        visit root_path
        visit new_user_session_path
        fill_in 'Eメール', with: 'leader@example.com'
        fill_in 'パスワード', with: 'factory'
        click_button 'ログイン'
        visit user_path(user)
        click_on '課題一覧'
        click_on '編集'
        fill_in '題目', with: 'changed b'
        fill_in 'アクション', with: 'changed'
        click_on '更新する'
        expect(page).to have_content 'changed'
      end
    end

    context 'to destroy a issue' do
      it 'is not shown the issue' do
        visit root_path
        visit new_user_session_path
        fill_in 'Eメール', with: 'leader@example.com'
        fill_in 'パスワード', with: 'factory'
        click_button 'ログイン'
        visit user_path(user)
        click_on '課題一覧'
        click_on '削除'
        page.driver.browser.switch_to.alert.accept
        expect(page).not_to have_content 'title'
      end
    end

    context 'to destroy a plan' do
      it 'is not shown the plan' do
        visit root_path
        visit new_user_session_path
        fill_in 'Eメール', with: 'leader@example.com'
        fill_in 'パスワード', with: 'factory'
        click_button 'ログイン'
        visit user_path(user)
        click_on '課題一覧'
        click_on '編集'
        click_on '削除'
        expect(page).not_to have_content 'action'
      end
    end
  end
end
