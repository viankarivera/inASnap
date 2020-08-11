class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|

      t.text :comment
      t.integer :user_id
      t.integer :photographer_id
    end
  end
end
