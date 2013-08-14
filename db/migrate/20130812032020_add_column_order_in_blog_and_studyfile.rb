class AddColumnOrderInBlogAndStudyfile < ActiveRecord::Migration
  def up
    add_column :blogs, :sort, :integer, :default => 100000
    add_column :studyfiles, :sort, :integer,:default => 100000
  end

  def down
    remove_column :blogs, :sort
    remove_column :studyfiles, :sort
  end
end
