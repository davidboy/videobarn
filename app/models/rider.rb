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
end
