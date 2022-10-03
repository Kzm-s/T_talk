class ChangeColumnDefaultToComments < ActiveRecord::Migration[6.1]
  def change
    change_column_default :comments, :status, from: nil, to: 0
  end
end
