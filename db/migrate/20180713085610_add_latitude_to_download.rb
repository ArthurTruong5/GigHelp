class AddLatitudeToDownload < ActiveRecord::Migration[5.2]
  def change
    add_column :downloads, :latitude, :float
  end
end
