class RemoveExtraColumns < ActiveRecord::Migration
  def up
    remove_column :users, :section_id
    remove_column :sections, :user_id
    remove_column :sections, :blog_id
    remove_column :sections, :studyfile_id
  end

  def down
    add_column :users, :section_id, :integer
    add_column :sections, :user_id, :integer
    add_column :sections, :blog_id, :integer
    add_column :sections, :studyfile_id, :integer
  end
end
