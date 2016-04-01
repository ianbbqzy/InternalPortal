class CreateUserTimeslots < ActiveRecord::Migration
  def change
    create_table :user_timeslots do |t|

      t.timestamps null: false
    end
  end
end
