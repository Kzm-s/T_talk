class CreateNotices < ActiveRecord::Migration[6.1]
  def change
    create_table :notices do |t|
      t.references :user_id, foreign_key: true
      t.references :admin_id, foreign_key: true
      t.text :content, null: false
      t.boolean :is_checked, null: false, default: false
      t.timestamps
    end
  end
end
