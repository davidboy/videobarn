# == Schema Information
#
# Table name: videos
#
#  id            :integer          not null, primary key
#  run_id        :integer
#  uuid          :string(255)
#  notes         :text
#  created_at    :datetime
#  updated_at    :datetime
#  has_mp4       :boolean
#  has_webm      :boolean
#  original_name :string(255)
#  source        :string(255)
#

require 'fileutils'
require 'json'

class Video < ActiveRecord::Base
  has_many :video_views
  belongs_to :run

  scope :unlabeled, -> { where(has_webm: true, has_mp4: true, run_id: nil) }

  def mark_as_bad
    update(has_webm: false, has_mp4: false)
  end

  def times_viewed
    self.video_views.count
  end
end