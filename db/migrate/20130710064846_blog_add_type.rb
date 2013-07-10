class BlogAddType < ActiveRecord::Migration
  def up
  	add_column :blogs, :blogtype, :integer
  end

  def down
  	remove_column :blogs, :blogtype
  end
end
