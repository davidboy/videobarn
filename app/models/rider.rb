# == Schema Information
#
# Table name: riders
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  fav           :boolean
#  notes         :text
#  created_at    :datetime
#  updated_at    :datetime
#  sortable_name :string(255)
#

class Rider < ActiveRecord::Base
  has_many :runs
  has_many :riders

  has_many :horses, :through => :runs
  has_many :shows,  :through => :runs
  has_many :videos, :through => :runs

  default_scope { order('sortable_name ASC') }

  before_save do
    self.sortable_name = self.name.split.last
  end

  def horses_ridden
    Horse.find(self.runs.pluck(:horse_id).uniq)
  end

  def times_viewed
    # FIXME: There's most likely a better way to do this, but since there's
    #   less than 100 riders in the database and we're using sqlite, and this
    #   is only used by an admin page,  it's not a real problem at the moment.
    VideoView.joins(:video).joins(:run).joins(:rider).where(riders: {id: self.id }).count
  end
end
