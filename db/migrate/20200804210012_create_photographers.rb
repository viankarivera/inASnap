class CreatePhotographers < ActiveRecord::Migration[6.0]
  def change
    create_table :photographers do |t|
      t.string :name
      t.string :camera
      t.string :area
      t.string :ratings
    end
  end
end
