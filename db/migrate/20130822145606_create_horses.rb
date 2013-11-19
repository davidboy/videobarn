class CreateHorses < ActiveRecord::Migration
  def change
    create_table :horses do |t|
      t.string :name
      t.text :notes

      t.timestamps
    end
  end
end
