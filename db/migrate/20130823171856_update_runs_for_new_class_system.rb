class UpdateRunsForNewClassSystem < ActiveRecord::Migration
  def change
    change_table :runs do |t|
      t.references :show_class

      remove_column :runs, :category, :string
      remove_column :runs, :classification, :string
    end
  end
end
