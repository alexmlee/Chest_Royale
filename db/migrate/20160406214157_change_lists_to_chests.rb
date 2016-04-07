class ChangeListsToChests < ActiveRecord::Migration
  def change
  	remove_column :orders, :lists, :text, array: true, default: [] 
  	add_column :orders, :chests, :text, array: true, default: []
  end
end
