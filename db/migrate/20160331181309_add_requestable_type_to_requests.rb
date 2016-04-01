class AddRequestableTypeToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :requestable_type, :string
  end
end
