class AddIssueRefToPlans < ActiveRecord::Migration[6.1]
  def change
    add_reference :plans, :issue, null: false, foreign_key: true
  end
end
