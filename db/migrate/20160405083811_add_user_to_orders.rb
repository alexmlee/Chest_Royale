class AddUserToOrders < ActiveRecord::Migration
  def change
  	add_reference :orders, :user, index: true, foreign_key: true
  	add_column :orders, :list, :string
  end
end
