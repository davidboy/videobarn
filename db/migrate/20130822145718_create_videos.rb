class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.references :run
      t.string :filename
      t.text :notes

      t.timestamps
    end
  end
end
