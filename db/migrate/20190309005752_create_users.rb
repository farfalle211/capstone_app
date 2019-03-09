class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.integer :age
      t.integer :gender
      t.text :summary
      t.string :location

      t.timestamps
    end
  end
end
