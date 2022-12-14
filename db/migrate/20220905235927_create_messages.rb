class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.references :user, null: false, foreign_key: true
      t.references :room, null: false, foreign_key: true
      t.text :content, null: false
      t.string :image
      t.boolean :is_check, null: false, default: false


      t.timestamps
    end
  end
end
