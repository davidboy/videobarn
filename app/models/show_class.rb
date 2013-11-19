# == Schema Information
#
# Table name: show_classes
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  category_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class ShowClass < ActiveRecord::Base
  belongs_to :category
  has_many :runs
end
