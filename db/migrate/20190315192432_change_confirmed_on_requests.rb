class ChangeConfirmedOnRequests < ActiveRecord::Migration[5.2]
  def change
    remove_column :requests, :confirmed, :boolean, default: false
    add_column :requests, :confirmed, :integer
  end
end
