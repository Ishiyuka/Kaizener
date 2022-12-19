require 'rails_helper'

RSpec.describe Team, type: :model do
  describe 'validation for team' do
      # 名前とオーナーidがあれば有効な状態であること
      context 'team with name and owner' do
        it 'is valid' do
          user = FactoryBot.create(:user)
          team = Team.new(
            name: 'test1',
            owner_id: user.id)
          expect(team).to be_valid
        end
      end

      # チーム名とオーナーidがなければ無効な状態であること
      context 'team without name' do
        it "is invalid" do
          user = FactoryBot.create(:user)
          team1 = Team.create(name:'', owner_id: user.id)
          expect(team1).to be_invalid
        end
      end

      context 'team without owner_id' do
        it "is invalid" do
          user = FactoryBot.create(:user)
          team2 = Team.create(name:'team2', owner_id: nil)
          expect(team2).to be_invalid
        end
      end

      # チーム名が重複していたら無効な状態であること
      context 'team with a duplicate team name' do
        it 'is invalid' do
          Team.create(
            name: 'test1',
            owner_id: 1)
          team = Team.new(
            name: 'test1',
            owner_id: 2)
          expect(team).to be_invalid
        end
      end

      # チーム名が31文字以上なら無効な状態であること
      context 'team with team name is 31 or more characters' do
      it 'is invalid' do
        team = Team.new(
          name: "A"*31,
          owner_id: 1)
        expect(team).to be_invalid
      end
    end
  end
end
