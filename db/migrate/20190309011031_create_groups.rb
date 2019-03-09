class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.integer :size
      t.integer :event_id
      t.integer :seating_quality
      t.boolean :open
      t.string :label
      t.integer :meet_before
      t.integer :drink_level
      t.integer :gender_preference
      t.integer :creater_id

      t.timestamps
    end
  end
end
