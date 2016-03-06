class AddAttributesToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :name, :string
  end
end
