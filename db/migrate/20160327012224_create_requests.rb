class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :description
      t.integer :due_date
      t.integer :requestable_id

      t.timestamps null: false
    end
  end
end
