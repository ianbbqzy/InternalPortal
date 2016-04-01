class AddIdsToUserTimeslot < ActiveRecord::Migration
  def change
    add_column :user_timeslots, :user_id, :integer
    add_column :user_timeslots, :timeslot_id, :integer
  end
end
