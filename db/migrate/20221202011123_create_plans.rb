class CreatePlans < ActiveRecord::Migration[6.1]
  def change
    create_table :plans do |t|
      t.text :action
      t.string :pic
      t.date :due_date_at
      t.integer :status
      t.integer :feedback

      t.timestamps
    end
  end
end
