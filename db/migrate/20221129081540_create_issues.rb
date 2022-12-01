class CreateIssues < ActiveRecord::Migration[6.1]
  def change
    create_table :issues do |t|
      t.string :title, null: false
      t.text :detail
      t.string :image
      t.text :cause
      t.text :goal, null: false
      t.text :gap, null: false
      t.date :due_date_at, null: false
      t.integer :priority, null: false
      t.integer :status, null: false
      t.boolean :done_flag, null: false, default: false

      t.timestamps
    end
  end
end
