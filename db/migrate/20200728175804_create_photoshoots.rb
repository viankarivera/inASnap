class CreatePhotoshoots < ActiveRecord::Migration[6.0]
  def change
    create_table :photoshoots do |t|
      t.integer :client_id
      t.integer :location_id
      t.float :price
    end
  end
end
