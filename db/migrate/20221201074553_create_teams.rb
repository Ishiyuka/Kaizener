class CreateTeams < ActiveRecord::Migration[6.1]
  def change
    create_table :teams do |t|
      t.string :name, null: false, unique: true
      t.integer :owner_id, index: true, null: false

      t.timestamps
    end
    add_foreign_key :teams, :users, column: :owner_id
  end
end
