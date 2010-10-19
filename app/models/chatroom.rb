# == Schema Information
# Schema version: 20101018135746
#
# Table name: chatrooms
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Chatroom < ActiveRecord::Base
   
   attr_accessible :name
   
   validates_presence_of :name
end
