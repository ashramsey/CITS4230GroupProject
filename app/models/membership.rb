# == Schema Information
# Schema version: 20101019061558
#
# Table name: memberships
#
#  id          :integer         not null, primary key
#  user_id     :integer
#  chatroom_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Membership < ActiveRecord::Base
	belongs_to :user
  belongs_to :chatroom
end
