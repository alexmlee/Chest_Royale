class AddNumberOfMatchesToOrder < ActiveRecord::Migration
  def change
  	add_column :orders, :number_of_matches, :integer
  end
end
