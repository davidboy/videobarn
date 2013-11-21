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
  UPLOADS_DIRECTORY = '/home/david/Documents/VideoBarn/public/uploads'.freeze


  has_many :video_views
  belongs_to :run

  scope :unlabeled, -> { where(has_webm: true, has_mp4: true, run_id: nil) }

  def mark_as_bad
    FileUtils.rm("#{UPLOADS_DIRECTORY}/webm/#{uuid}.webm", verbose: true)
    FileUtils.rm("#{UPLOADS_DIRECTORY}/mp4/#{uuid}.mp4", verbose: true)

    update(has_webm: false, has_mp4: false)
  end

  def times_viewed
    self.video_views.count
  end

  def length
    ffmpeg_info['format']['duration'].to_f
  end

  def format
    ffmpeg_info['format']['format_long_name']
  end

  def original_video_format
    ffmpeg_info['streams'].each do |stream|
      return stream['codec_long_name'] if stream['codec_type'] == 'video'
    end

    'unknown'
  end

  def original_audio_format
    ffmpeg_info['streams'].each do |stream|
      return stream['codec_long_name'] if stream['codec_type'] == 'audio'
    end

    'unknown'
  end

  private

  def ffmpeg_info
    @ffmpeg_info ||= JSON.parse(`ffprobe -loglevel error -show_format -show_streams #{UPLOADS_DIRECTORY}/raw/#{self.uuid} -print_format json`)
  end
end