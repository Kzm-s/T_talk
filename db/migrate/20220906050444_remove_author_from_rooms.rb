class RemoveAuthorFromRooms < ActiveRecord::Migration[6.1]
  def change
    remove_reference :rooms, :user, null: false, foreign_key: true
  end
end
