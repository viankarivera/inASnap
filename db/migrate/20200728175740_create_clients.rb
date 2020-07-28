class CreateClients < ActiveRecord::Migration[6.0]
  def change
    create_table :clients do |t|
      t.string :name
      t.integer :phone_number
      t.float :price

      t.timestamp null: false

    end
  end
end
