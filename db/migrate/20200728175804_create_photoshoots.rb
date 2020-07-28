class CreatePhotoshoots < ActiveRecord::Migration[6.0]
  def change
    create_table :photoshoots do |t|
      t.string :photographer
      t.string :client
      t.string :location
    end
  end
end
