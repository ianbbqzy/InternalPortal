class AddAssignmentToSchedules < ActiveRecord::Migration
  def change
    add_column :schedules, :assignment, :text
  end
end
