class RemoveUserNameFromTask < ActiveRecord::Migration[5.2]
  def change
    remove_column :tasks, :user_name, :string
  end
end
