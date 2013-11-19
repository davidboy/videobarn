class CreateVideoViews < ActiveRecord::Migration
  def change
    create_table :video_views do |t|
      t.integer :video_id
      t.integer :user_id
      t.datetime :viewed_on

      t.timestamps
    end
  end
end
