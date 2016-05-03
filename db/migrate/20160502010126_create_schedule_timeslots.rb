class CreateScheduleTimeslots < ActiveRecord::Migration
  def change
    create_table :schedule_timeslots do |t|
      t.integer :timeslot_id
      t.integer :schedule_id

      t.timestamps null: false
    end
  end
end
