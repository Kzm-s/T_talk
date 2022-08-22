class CreateMessageRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :message_rooms do |t|
      t.references :self_id, foreign_key: true
      t.references :other_id, foreign_key: true
      t.timestamps
    end
  end
end
