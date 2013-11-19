class CreateShows < ActiveRecord::Migration
  def change
    create_table :shows do |t|
      t.string :name
      t.date :date
      t.boolean :double_judged
      t.text :notes

      t.timestamps
    end
  end
end
