require 'rails_helper'

RSpec.describe Issue, type: :model do
  describe 'validation' do

    # 必要項目があれば有効な状態であること
    context 'issue with title, goal, gap, due_date_at, prioprity' do
      it 'is valid' do
        user = FactoryBot.create(:user)
        team = Team.create(name: 'test1',owner_id: user.id)
        issue = Issue.create(title: 'a', goal: 'a', gap: 'a', due_date_at: '2022-12-01', priority: 0, user_id: user.id, team_id: team.id)
        expect(issue).to be_valid
      end
    end

    # 必要項目がなければ無効な状態であること
    context 'issue without title, goal, gap, due_date_at, prioprity, status, done_flag' do
      it 'is invalid' do
        user = FactoryBot.create(:user)
        team = Team.create(name: 'test1',owner_id: user.id)
        issue1 = Issue.new(title: '', goal: 'a', gap: 'a', due_date_at: '2022-12-01', priority: 0, user_id: user.id, team_id: team.id)
        issue2 = Issue.new(title: 'a', goal: '', gap: 'a', due_date_at: '2022-12-01', priority: 0, user_id: user.id, team_id: team.id)
        issue3 = Issue.new(title: 'a', goal: 'a', gap: '', due_date_at: '2022-12-01', priority: 0, user_id: user.id, team_id: team.id)
        issue4 = Issue.new(title: 'a', goal: 'a', gap: '', due_date_at: nil, priority: 0, user_id: user.id, team_id: team.id)
        issue5 = Issue.new(title: 'a', goal: 'a', gap: 'a', due_date_at: '2022-12-01', priority: '', user_id: user.id, team_id: team.id)
        expect(issue1).to be_invalid
        expect(issue2).to be_invalid
        expect(issue3).to be_invalid
        expect(issue4).to be_invalid
        expect(issue5).to be_invalid
      end
    end
  end
end
