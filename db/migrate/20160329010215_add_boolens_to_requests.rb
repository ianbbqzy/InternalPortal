class AddBoolensToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :done, :boolean
    add_column :requests, :approved, :boolean
  end
end
