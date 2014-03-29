class AddSortableNameToRiders < ActiveRecord::Migration
  class Rider < ActiveRecord::Base
  end

  def up
    change_table :riders do |t|
      t.string :sortable_name
    end

    Rider.find_each do |rider|
      rider.update sortable_name: rider.name.split.last
    end
  end

  def down
    change_table :riders do |t|
      t.remove :sortable_name
    end
  end
end
