class CreateTimeslots < ActiveRecord::Migration
  def change
    create_table :timeslots do |t|
      t.string :time

      t.timestamps null: false
    end
  end
end
