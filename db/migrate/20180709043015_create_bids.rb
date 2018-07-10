class CreateBids < ActiveRecord::Migration[5.2]
  def change
    create_table :bids do |t|
      t.references :task, foreign_key: true
      t.string :name
      t.text :comment
      t.integer :offer

      t.timestamps
    end
  end
end
