# == Schema Information
#
# Table name: riders
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  fav        :boolean
#  notes      :text
#  created_at :datetime
#  updated_at :datetime
#

class Rider < ActiveRecord::Base
  has_many :runs
  has_many :riders

  has_many :horses, :through => :runs
  has_many :shows,  :through => :runs

  default_scope { order('fav DESC, name ASC') }
end
