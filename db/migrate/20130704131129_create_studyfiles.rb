class CreateStudyfiles < ActiveRecord::Migration
  def change
    create_table :studyfiles do |t|
      t.string :filename,           :null => false 
      t.integer :filetype,          :null => false, :default => 0,  :limit => 1  #文档类型
      t.integer :download_count,    :null => false, :default => 0  #下载数量
      t.integer :faverate_count,    :null => false, :default => 0  #喜欢数量
      t.string :file_url,           :null => false
      t.integer :user_id,           :null => false
      t.integer :point,             :null => false, :default => 0  #文档分数

      t.timestamps
    end
  end
end
