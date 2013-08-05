class ChangeColumnBlogType < ActiveRecord::Migration
  def up
    change_column :blogs, :blogtype, :string
  end

  def down
    change_column :blogs, :blogtype, :integer
  end
end
