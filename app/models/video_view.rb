# == Schema Information
#
# Table name: video_views
#
#  id         :integer          not null, primary key
#  video_id   :integer
#  user_id    :integer
#  viewed_on  :datetime
#  created_at :datetime
#  updated_at :datetime
#

class VideoView < ActiveRecord::Base
  belongs_to :video
  belongs_to :user

  has_one :run, :through => :video
  has_one :rider, :through => :run
end
