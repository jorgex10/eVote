class AddPollingStationToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :polling_station_id, :integer
  end
end
