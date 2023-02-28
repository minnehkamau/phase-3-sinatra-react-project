class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.string :comment
      t.integer :rating
      t.string :user_id
      t.string :book_id
      t.timestamps
    end

  end
end
