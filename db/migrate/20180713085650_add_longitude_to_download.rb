class AddLongitudeToDownload < ActiveRecord::Migration[5.2]
  def change
    add_column :downloads, :longitude, :float
  end
end
