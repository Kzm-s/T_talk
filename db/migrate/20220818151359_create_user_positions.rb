class CreateUserPositions < ActiveRecord::Migration[6.1]
  def change
    create_table :user_positions do |t|
      t.references :user_id, foreign_key: false
      t.references :position_id, foreign_key: false
      t.timestamps
    end
  end
end
