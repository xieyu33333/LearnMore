class AddColumnSectionIdInBlogAndStudyfile < ActiveRecord::Migration
  def up
    add_column :blogs, :section_id, :integer
    add_column :studyfiles, :section_id, :integer
    add_column :users, :section_id, :integer
  end

  def down
    remove_column :blogs, :section_id
    remove_column :studyfiles, :section_id
    remove_column :users, :section_id
  end
end
