class AddColumnHit < ActiveRecord::Migration
  def up
  	add_column :blogs, :hit, :integer, :default => 0
  end

  def down
  	remove_column :blogs, :hit
  end
end
