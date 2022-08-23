class CreateNotices < ActiveRecord::Migration[6.1]
  def change
    create_table :notices do |t|
      t.references :user, foreign_key: true
      t.references :admin, foreign_key: true
      t.text :content, null: false
      t.boolean :is_checked
      t.timestamps
    end
  end
end
