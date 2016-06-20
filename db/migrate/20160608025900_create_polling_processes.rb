class CreatePollingProcesses < ActiveRecord::Migration
  def change
    create_table :polling_processes do |t|
      t.string :name,				null: false
      t.text :description
      t.integer :school_id, null: false

      t.timestamps null: false
    end
  end
end
