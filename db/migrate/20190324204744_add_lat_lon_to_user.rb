class AddLatLonToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :lat, :decimal, precision: 10, scale: 6
    add_column :users, :lon, :decimal, precision: 10, scale: 6
  end
end
