class AddTeamRefToPlans < ActiveRecord::Migration[6.1]
  def change
    add_reference :plans, :team, null: false, foreign_key: true
  end
end
