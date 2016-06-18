class AddMissingAmountToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :pending_debt, :integer, default: 0, null: false
  end
end
