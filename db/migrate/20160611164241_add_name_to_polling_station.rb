class AddNameToPollingStation < ActiveRecord::Migration
  def change
  	add_column :polling_stations, :name, :string, null: false
  end
end
