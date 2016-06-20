class CreatePollingStations < ActiveRecord::Migration
  def change
    create_table :polling_stations do |t|
      t.string :code,										null: false
      t.string :name,										null: false
      t.integer :school_id, 						null: false
      t.integer :polling_process_id,		null: false

      t.timestamps null: false
    end
  end
end
