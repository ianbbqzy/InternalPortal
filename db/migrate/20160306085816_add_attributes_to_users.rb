class AddAttributesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :team, :string
    add_column :users, :year, :string
    add_column :users, :major, :string
  end
end
