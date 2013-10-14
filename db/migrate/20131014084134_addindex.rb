class Addindex < ActiveRecord::Migration
  def up
    add_index :blogs, :sort
    add_index :blogs, :user_id
    add_index :blogs, :section_id
    add_index :blogs, :blogtype
    add_index :blogs, :status

    add_index :studyfiles, :sort
    add_index :studyfiles, :user_id
    add_index :studyfiles, :section_id
    add_index :studyfiles, :filetype

    add_index :faverates, :user_id
    add_index :faverates, :blog_id
    add_index :faverates, :studyfile_id
  end

  def down
    remove_index :blogs, :index_blogs_on_sort
    remove_index :blogs, :index_blogs_on_user_id
    remove_index :blogs, :index_blogs_on_section_id
    remove_index :blogs, :index_blogs_on_blogtype
    remove_index :blogs, :index_blogs_on_status

    remove_index :studyfiles, :index_studyfiles_on_sort
    remove_index :studyfiles, :index_studyfiles_on_user_id
    remove_index :studyfiles, :index_studyfiles_on_section_id
    remove_index :studyfiles, :index_studyfiles_on_filetype

    remove_index :faverates, :index_faverates_on_user_id
    remove_index :faverates, :index_faverates_on_blog_id
    remove_index :faverates, :index_faverates_on_studyfile_id
  end
end
