class ChangeDataJobTitleToUser < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :job_title, :integer
  end
end
