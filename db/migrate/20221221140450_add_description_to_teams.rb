class AddDescriptionToTeams < ActiveRecord::Migration[6.1]
  def change
    add_column :teams, :description, :string
    add_column :teams, :team_image, :string
  end
end
