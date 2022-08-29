class CreateAdmins < ActiveRecord::Migration[6.1]
  def change
    create_table :admins do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :password, null: false
      t.string :password_confirmation, null: false
      t.timestamps
    end
  end
end