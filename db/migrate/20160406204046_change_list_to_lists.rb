class ChangeListToLists < ActiveRecord::Migration
  def change
  	remove_column :orders, :list, :text, array: true, default: [] 
  	add_column :orders, :lists, :text, array: true, default: []
  end
end
