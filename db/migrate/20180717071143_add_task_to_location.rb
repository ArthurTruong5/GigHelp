class AddTaskToLocation < ActiveRecord::Migration[5.2]
  def change
    add_reference :locations, :task, foreign_key: true
  end
end
