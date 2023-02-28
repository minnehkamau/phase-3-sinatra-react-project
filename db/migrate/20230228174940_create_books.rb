class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :image_url
      t.string :title
      t.string :author
      t.string :genre
    end
  end
end
