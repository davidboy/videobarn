# == Schema Information
#
# Table name: shows
#
#  id            :integer          not null, primary key
#  date          :date
#  double_judged :boolean
#  notes         :text
#  created_at    :datetime
#  updated_at    :datetime
#  location      :string(255)
#

class Show < ActiveRecord::Base
  has_many :runs

  default_scope { order('date DESC') }

  def name
    "#{date} #{location}"
  end

  def self.locations
    Show.select(:location).distinct.map{ |show| show.location }
  end
end
