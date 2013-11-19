class NewShowNamingSystem < ActiveRecord::Migration
  def change
    add_column :shows, :location, :string
    remove_column :shows, :name, :string
  end
end
