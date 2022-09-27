class RemoveUserIdFromRooms < ActiveRecord::Migration[6.1]
  def change
    remove_reference :rooms, :user
  end
end
