class AddIdsToSchedules < ActiveRecord::Migration
  def change
    add_column :schedules, :timeslot_id, :integer
    add_column :schedules, :user_id, :integer
  end
end
