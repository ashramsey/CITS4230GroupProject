# == Schema Information
# Schema version: 20101019061558
#
# Table name: entries
#
#  id          :integer         not null, primary key
#  chatroom_id :integer
#  user_id     :integer
#  message     :text
#  created_at  :datetime
#  updated_at  :datetime
#

class Entry < ActiveRecord::Base
	attr_accessible :message

  belongs_to :user

  validates_presence_of :message, :user_id
  validates_length_of   :message, :maximum => 140

  def user
    User.scoped(:all, :conditions => { :user_id => :id } )
  end
end
