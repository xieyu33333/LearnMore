class ChangeColumnBlogLikeCountDefault < ActiveRecord::Migration
  def up
  	change_column :blogs, :faverates_count, :integer, :default => 0
  end

  def down
  	change_column :blogs, :faverates_count, :integer
  end
end
