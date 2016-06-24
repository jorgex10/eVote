class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name,                 null: false
      t.text :description
      t.integer :polling_process_id,  null: false

      t.timestamps null: false
    end
  end
end
