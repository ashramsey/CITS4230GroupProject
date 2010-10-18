# An integration test for signing up users. A combination of RSpec and Webrat gems
require 'spec_helper'

describe "Users" do
  
  describe "signup" do
    
    describe "failure" do
    
      it "should not make a new user" do
        lambda do
          visit signup_path
          click_button
          response.should render_template('signup')
          response.should have_tag("div#errorExplanation")
				# Verify that User.count doesn't change on signup failure
        end.should_not change(User, :count)
      end
    end

		describe "success" do

			it "should make a new user" do
			  lambda do
			    visit signup_path
					#Fill in form fields with labels with example data
			    fill_in "user[name]",    :with => "Example User"
			    fill_in "user[email]",        :with => "user@example.com"
			    fill_in "user[password]",     :with => "foobar"
			    fill_in "user[password_confirmation]", :with => "foobar"
			    click_button
			    response.should render_template('users/show')
				# Test that the signup created a user in the database.
			  end.should change(User, :count).by(1)
			end
		end
  end

	describe "sign in/out" do
  
	  describe "failure" do
	    it "should not sign a user in" do
	      visit signin_path
	      fill_in :email,    :with => ""
	      fill_in :password, :with => ""
	      click_button
	      response.should render_template('sessions/new')
	      response.should have_tag("div.flash.error", /invalid/i)
	    end
	  end
  
	  describe "success" do
	    it "should sign a user in and out" do
	      user = Factory(:user)
	      visit signin_path
	      fill_in :email,    :with => user.email
	      fill_in :password, :with => user.password
	      click_button
	      controller.should be_signed_in
	      click_link "Sign out"
	      controller.should_not be_signed_in
	    end
	  end
	end

end
