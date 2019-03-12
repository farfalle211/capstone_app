class AddDefaultOpenToGroups < ActiveRecord::Migration[5.2]
  def change
    change_column :groups, :open, :boolean, default: true
  end
end
