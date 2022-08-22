class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.references :message_room_id, foreign_key: true
      t.references :sender_id, foreign_key: true
      t.text :content
      t.string :image
      t.boolean :is_checked, null: false, default: false
      t.timestamps
    end
  end
end
