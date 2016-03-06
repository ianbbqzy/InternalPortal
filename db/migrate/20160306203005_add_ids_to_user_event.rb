class AddIdsToUserEvent < ActiveRecord::Migration
  def change
    add_column :user_events, :user_id, :integer
    add_column :user_events, :event_id, :integer
  end
end
