class CreateDownloads < ActiveRecord::Migration
  def change
    create_table :downloads do |t|
      t.integer :user_id
      t.integer :studyfile_id

      t.timestamps
    end
  end
end
