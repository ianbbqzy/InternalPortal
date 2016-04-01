class AddRequestByToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :requestor_id, :integer
    add_column :requests, :event_id, :integer
  end
end
