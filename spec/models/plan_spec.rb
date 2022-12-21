require 'rails_helper'

RSpec.describe Plan, type: :model do
  describe 'validation' do
    # 必要項目があれば有効な状態であること
    context 'plan with action, pic, due_date_at, feedback' do
      it 'is valid' do
        user = FactoryBot.create(:user)
        team = Team.create(name: 'test1', owner_id: user.id)
        issue = Issue.create(title: 'a', goal: 'a', gap: 'a', due_date_at: '2022-12-01', priority: 0, user_id: user.id, team_id: team.id)
        plan = Plan.create(action: 'a', pic: 'a', due_date_at: '2022-12-01', feedback: 0, user_id: user.id, team_id: team.id, issue_id: issue.id)
        expect(plan).to be_valid
      end
    end

    # 必要項目がなければ無効な状態であること
    context 'plan without action, pic, due_date_at, feedback' do
      it 'is invalid' do
        user = FactoryBot.create(:user)
        team = Team.create(name: 'test1', owner_id: user.id)
        issue = Issue.create(title: 'a', goal: 'a', gap: 'a', due_date_at: '2022-12-01', priority: 0, user_id: user.id, team_id: team.id)
        plan1 = Plan.create(action: '', pic: 'a', due_date_at: '2022-12-01', feedback: 0, user_id: user.id, team_id: team.id, issue_id: issue.id)
        plan2 = Plan.create(action: 'a', pic: '', due_date_at: '2022-12-01', feedback: 0, user_id: user.id, team_id: team.id, issue_id: issue.id)
        plan3 = Plan.create(action: 'a', pic: 'a', due_date_at: '', feedback: 0, user_id: user.id, team_id: team.id, issue_id: issue.id)
        plan4 = Plan.create(action: 'a', pic: 'a', due_date_at: 'a', feedback: '', user_id: user.id, team_id: team.id, issue_id: issue.id)
        expect(plan1).to be_invalid
        expect(plan2).to be_invalid
        expect(plan3).to be_invalid
        expect(plan4).to be_invalid
      end
    end

    # アクションが201文字以上なら無効な状態であること
    context 'action for plan is 201 or more characters' do
      it 'is invalid' do
        user = FactoryBot.create(:user)
        team = Team.create(name: 'test1', owner_id: user.id)
        issue = Issue.new(title: 'a', goal: 'a', gap: 'a', due_date_at: '2022-12-01', priority: 0, user_id: user.id, team_id: team.id)
        plan = Plan.create(action: 'a' * 201, pic: 'a', due_date_at: '2022-12-01', feedback: 0, user_id: user.id, team_id: team.id, issue_id: issue.id)
        expect(plan).to be_invalid
      end
    end
  end
end
