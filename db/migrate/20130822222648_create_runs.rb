class CreateRuns < ActiveRecord::Migration
  def change
    create_table :runs do |t|
      t.references :show
      t.references :rider
      t.references :horse
      t.string :classification
      t.string :category
      t.decimal :time
      t.integer :placing
      t.string :penalty
      t.boolean :fav
      t.text :notes

      t.timestamps
    end
  end
end
