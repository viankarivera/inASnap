class CreateLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :locations do |t|
      t.string :location
      t.integer :photoshoot_id
      t.integer :client_id
      t.integer :photographer_id
    end
  end
end
