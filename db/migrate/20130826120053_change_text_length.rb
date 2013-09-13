class ChangeTextLength < ActiveRecord::Migration
  def up
    change_column :blogs, :artical, :mediumtext
  end

  def down
    change_column :blogs, :artical, :text
  end
end
