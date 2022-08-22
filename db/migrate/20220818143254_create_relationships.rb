class CreateRelationships < ActiveRecord::Migration[6.1]
  def change
    create_table :relationships do |t|
      t.references :follower_id, foreign_key: true
      t.references :followed_id, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
