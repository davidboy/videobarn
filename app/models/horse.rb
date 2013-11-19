# == Schema Information
#
# Table name: horses
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  notes      :text
#  created_at :datetime
#  updated_at :datetime
#

class Horse < ActiveRecord::Base
  default_scope { order('name ASC') }
end
