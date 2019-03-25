class ChangeLatLonForUser < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :lat, :latitude
    rename_column :users, :lon, :longitude
  end
end
