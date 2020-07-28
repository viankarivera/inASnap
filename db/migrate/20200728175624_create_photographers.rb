class CreatePhotographers < ActiveRecord::Migration[6.0]
  def change
    create_table :photographers do |t|
      t.string :username
      t.string :email
      t.string :password_digest

      t.timestamp null: false
    end
  end
end
