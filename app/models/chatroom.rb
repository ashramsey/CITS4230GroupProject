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
		has_many :memberships
  	has_many :users, :through => :memberships
   
   	attr_accessible :name
   	validates_presence_of :name

    def users
        User.scoped(:joins => :entries, :select => "users.*, count(entries.id) as entries_count", :group => "users.id")
    end
		
		def entries
        # Get all the entries where the user's id matches the chatroom's id in the membership table
    		Entry.scoped(:joins => {:user => :memberships}, :conditions => { :memberships => { :chatroom_id => id } })
  	end
end
