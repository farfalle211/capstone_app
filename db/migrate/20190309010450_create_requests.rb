class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.boolean :confirmed
      t.integer :user_event_id
      t.integer :group_id

      t.timestamps
    end
  end
end
