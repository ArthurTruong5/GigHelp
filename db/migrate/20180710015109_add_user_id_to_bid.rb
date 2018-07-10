class AddUserIdToBid < ActiveRecord::Migration[5.2]
  def change
    add_column :bids, :user_id, :integer
  end
end
