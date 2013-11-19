class GenerateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.integer :user_id
      t.string :query
      t.datetime :searched_on
    end
  end
end
