class AddColumnOrderInBlogAndStudyfile < ActiveRecord::Migration
  def up
    add_column :blogs, :order, :integer, :default => 100000
    add_column :studyfiles, :order, :integer,:default => 100000
  end

  def down
    remove_column :blogs, :order
    remove_column :studyfiles, :order
  end
end
