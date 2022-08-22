class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.references :user_id, foreign_key: true
      t.integer :type, null: false
      t.string :title, null: false
      t.text :content
      t.string :image
      t.integer :status, null: false
      t.timestamps
    end
  end
end
