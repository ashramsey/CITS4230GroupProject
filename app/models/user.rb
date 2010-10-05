# == Schema Information
# Schema version: 20101004201830
#
# Table name: users
#
#  id                 :integer         not null, primary key
#  name               :string(255)
#  email              :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  encrypted_password :string(255)
#  salt               :string(255)
#

require 'digest'

class User < ActiveRecord::Base
    # Create a virtual password attribute (not ever be written to the database, used to perform password confirmation
    # and encryption)
    attr_accessor :password
    
    # Which attributes can be modified by outside users
    attr_accessible :name, :email, :password, :password_confirmation
    
    EmailRegex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    
    # Validating the presence of name, email attributes
    validates_presence_of :name, :email
    validates_length_of :name, :within => 3..50#, :on => :create, :message => "must be present"
    validates_format_of :email, :with => EmailRegex#, :on => :create, :message => " is invalid"
    validates_uniqueness_of :email, :case_sensitive => false#, :on => :create, :message => "must be unique"
    
    # Validating the presence and confirmation of password
    validates_confirmation_of :password, :on => :create, :message => "should match confirmation"
    validates_presence_of :password, :on => :create, :message => "can't be blank"
    validates_length_of :password, :within => 6..40, :on => :create, :message => "must be present"

    before_save :encrypt_password
    
    # Authetication interface
    def has_password?(submitted_password)
        # Return true if the user's password matches the submitted password.
        encrypted_password == encrypt(submitted_password)
    end
    
    def self.authenticate(email, submitted_password)
        user = find_by_email(email)
        return nil  if user.nil?
        return user if user.has_password?(submitted_password)
    end
    
    # Password encryption - keep private from public interface
    private
        def encrypt_password
            self.salt = make_salt
            self.encrypted_password = encrypt(password)
        end
        
        # Add salt to the password
        def encrypt(string)
            secure_hash("#{salt}#{string}")
        end
        
        # Generate salt using a cryptographic hash function
        def make_salt
            secure_hash("#{Time.now.utc}#{password}")
        end

        def secure_hash(string)
            Digest::SHA2.hexdigest(string)
        end
end
