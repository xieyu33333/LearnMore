class AddColumnEditingUserInBlog < ActiveRecord::Migration
  def up
    add_column :blogs , :editer, :integer, :default => 0
  end

  def down
    remove_column :blogs , :editer
  end
end
