class CreateShowClasses < ActiveRecord::Migration
  def change
    create_table :show_classes do |t|
      t.string :name
      t.references :category, index: true

      t.timestamps
    end
  end
end
