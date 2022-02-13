class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :author, null: false
      t.string :title
      t.text :body
      t.boolean :published

      t.timestamps
    end
  end
end
