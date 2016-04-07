class ChangeOrderListToArray < ActiveRecord::Migration
  def change
  	add_column :orders, :list, :text, array: true, default: []
  end
end
