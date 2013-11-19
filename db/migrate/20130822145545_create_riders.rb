class CreateRiders < ActiveRecord::Migration
  def change
    create_table :riders do |t|
      t.string :name
      t.boolean :fav
      t.text :notes

      t.timestamps
    end
  end
end
