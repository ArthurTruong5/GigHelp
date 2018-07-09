class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.date :due
      t.integer :people

      t.timestamps
    end
  end
end
