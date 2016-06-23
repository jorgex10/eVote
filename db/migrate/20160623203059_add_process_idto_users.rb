class AddProcessIdtoUsers < ActiveRecord::Migration
  def change
    add_column :users, :polling_process_id, :integer, null:false
  end
end
