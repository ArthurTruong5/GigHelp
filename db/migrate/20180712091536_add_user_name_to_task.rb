class AddUserNameToTask < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :user_name, :string
  end
end
