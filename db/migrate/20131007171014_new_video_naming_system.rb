class NewVideoNamingSystem < ActiveRecord::Migration
  def change
    change_table :videos do |t|
      t.boolean :has_mp4
      t.boolean :has_webm
      t.rename :filename, :uuid
    end
  end
end
