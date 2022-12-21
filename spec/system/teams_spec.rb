require 'rails_helper'

RSpec.describe 'Teams', type: :system do
  let!(:team_member) { FactoryBot.create(:user, name: 'team_member') }
  let!(:leader) { FactoryBot.create(:user, name: 'leader', email: 'leader@example.com', password: 'leader', password_confirmation: 'leader') }
  let!(:team) { FactoryBot.create(:team, name: 'fugafuga', owner: leader) }
  let!(:assign) { FactoryBot.create(:assign, user: team_member, team: team) }
  let!(:assign) { FactoryBot.create(:assign, user: leader, team: team) }

  describe 'the function to manage team' do
    context 'to see teams index' do
      it 'are shown all teams' do
        visit root_path
        visit new_user_session_path
        fill_in 'Eメール', with: 'leader@example.com'
        fill_in 'パスワード', with: 'leader'
        click_button 'ログイン'
        visit teams_path
        expect(page).to have_content '一覧'
      end
    end

    context 'to create new team' do
      it 'is shown in index page' do
        visit root_path
        visit new_user_session_path
        fill_in 'Eメール', with: 'leader@example.com'
        fill_in 'パスワード', with: 'leader'
        click_button 'ログイン'
        visit teams_path
        click_on '新たにチームを作成する'
        fill_in 'team[name]', with: 'hogehoge'
        click_on '登録する'
        expect(page).to have_content '作成しました'
      end
    end

    context 'to edit a team' do
      it 'is shown the updated team' do
        visit root_path
        visit new_user_session_path
        fill_in 'Eメール', with: 'leader@example.com'
        fill_in 'パスワード', with: 'leader'
        click_button 'ログイン'
        visit teams_path
        click_on '編集'
        fill_in 'team[name]', with: 'changed team name'
        click_on '更新する'
        expect(page).to have_content '更新'
      end
    end

    context 'to destroy the team' do
      it 'is not shown the team' do
        visit root_path
        visit new_user_session_path
        fill_in 'Eメール', with: 'leader@example.com'
        fill_in 'パスワード', with: 'leader'
        click_button 'ログイン'
        visit teams_path
        click_on '削除'
        page.driver.browser.switch_to.alert.accept
        expect(page).not_to have_content 'fugafuga'
      end
    end

    describe 'the function to assign member to the team' do
      context 'to invite the new member' do
        it 'is shown the member\'s page' do
          visit root_path
          visit new_user_session_path
          fill_in 'Eメール', with: 'leader@example.com'
          fill_in 'パスワード', with: 'leader'
          click_button 'ログイン'
          visit teams_path
          click_on '詳細'
          invited_member = FactoryBot.create(:user, name: 'invited', email: 'invited@example.com')
          fill_in 'email', with: 'invited@example.com'
          click_on '招待'
          expect(page).to have_content 'アサインしました'
        end
      end
    end
    context 'to remove the team' do
      it 'is not shown the team' do
        visit root_path
        visit new_user_session_path
        fill_in 'Eメール', with: 'leader@example.com'
        fill_in 'パスワード', with: 'leader'
        click_button 'ログイン'
        visit teams_path
        click_on '詳細'
        click_on 'チームから外れる'
        expect(page).to have_content '外れました'
      end
    end
  end
end
