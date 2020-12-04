class CreateBoards < ActiveRecord::Migration[5.2]
  def change
    create_table :boards do |t|
      t.string :name
      t.string :book_title
      t.string :book_author
      t.text :book_thumbnail_link
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
