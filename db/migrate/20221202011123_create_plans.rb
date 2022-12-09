class CreatePlans < ActiveRecord::Migration[6.1]
  def change
    create_table :plans do |t|
      t.text :action, null: false
      t.string :pic, null: false
      t.date :due_date_at, null: false
      t.integer :status, null: false
      t.integer :feedback, null: false

      t.timestamps
    end
  end
end
