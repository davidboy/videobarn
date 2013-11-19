class AddRolesToUser < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.boolean :is_admin
      t.boolean :is_mod
    end
  end
end
