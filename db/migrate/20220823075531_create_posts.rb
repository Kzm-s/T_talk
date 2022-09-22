class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.references :user, foreign_key: true
      t.integer :type
      t.string :title, null: false
      t.text :content, null: false
      t.string :image
      t.integer :status, default: 0, null: false
      t.timestamps
    end
  end
end
