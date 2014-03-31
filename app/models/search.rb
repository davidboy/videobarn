# == Schema Information
#
# Table name: searches
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  query       :string(255)
#  searched_on :datetime
#


class Search < ActiveRecord::Base
  belongs_to :user
end
