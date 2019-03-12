class ChangeDefaultConfirmationStatus < ActiveRecord::Migration[5.2]
  def change
    change_column :requests, :confirmed, :boolean, default: false
  end
end
