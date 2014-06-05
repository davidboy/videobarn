# == Schema Information
#
# Table name: runs
#
#  id            :integer          not null, primary key
#  show_id       :integer
#  rider_id      :integer
#  horse_id      :integer
#  time          :decimal(, )
#  placing       :integer
#  penalty       :string(255)
#  fav           :boolean
#  notes         :text
#  created_at    :datetime
#  updated_at    :datetime
#  show_class_id :integer
#

class Run < ActiveRecord::Base
  belongs_to :rider
  belongs_to :horse
  belongs_to :show
  belongs_to :show_class
  has_one :category, through: :show_class

  has_one :video

  default_scope { order('time ASC') }

  acts_as_taggable
  before_save :update_tags

  def self.at(arena)
    self.includes('show').where(shows: {location: arena})
  end

  def times_viewed
    self.video.times_viewed
  end

  def display_placing
    if placing.nil?
      'No placing'
    elsif placing == 99
      'Unknown'
    else 
      placing.ordinalize
    end
  end

  private
    def update_tags
      tags = [self.rider.name, self.horse.name, self.show_class.name, self.category.name,
        self.show.location, self.show.date, self.show.date.year, 
        self.show.date.strftime("%b"), self.show.date.strftime("%e"),
        self.show.date.strftime("%-m-%-d"), self.time, self.penalty]
      tags.map! do |tag|
        tag.to_s.split(' ')
      end
    
      self.tag_list = tags
    end
end

=begin

Stake Race - 12 & Under
Stake Race - 13-17
Stake Race - 18 & Over
Pony Pole Bending
Pole Bending - 12 and Under
Pole Bending - 13-17
Pole Bending - 18 & Over
Pole Bending Open
Leadline Barrels
Cloverleaf Barrels
Pony Barrels
Barrel Race - 12 and Under
Barrel Race - 13-17
Ladies' Barrels
Men's Barrels
Barrels Open
Pony Arena Race
Arena Race - 12 & Under
Arena Race - 13-17
Arena Race - 18 and Over
Arena Race - Open

    change_table :runs do |t|
      t.references :show_class

      remove_column :runs, :category, :string
      remove_column :runs, :classification, :string
    end

=end
