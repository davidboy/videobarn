class AddOriginalNameToVideos < ActiveRecord::Migration
  def change
    change_table :videos do |t|
      t.string :original_name
      t.string :source
    end
  end
end
