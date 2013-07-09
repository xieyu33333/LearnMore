class AddUserAttr < ActiveRecord::Migration
  def up
  	add_column :users, :point, :integer, :default => 10
  	add_column :users, :cost, :decimal, :default => 0
  	add_column :users, :all_point, :integer, :default => 10
  end

  def down
  	remove_column :users, :point
  	remove_column :users, :cost
  	remove_column :users, :all_point
  end
end
