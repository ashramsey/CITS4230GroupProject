require 'spec_helper'

describe UsersController do
    integrate_views


    describe "GET 'signup'" do
        it "should be successful" do
            get :signup
            response.should be_success
        end

        it "should have the right title" do
            get :signup
            response.should have_tag("title", /Sign Up/)
        end
    end

    # Use Factory Girl Gem to create test user for testing the show page
    describe "GET 'show'" do

        before(:each) do
            @user = Factory(:user)
            # Arrange for User.find(params[:id]) to find the factory user
            # (no hits to the database).
            User.stub!(:find, @user.id).and_return(@user)
        end

        it "should be successful" do
            get :show, :id => @user # same as @user.id
            response.should be_success
        end

        it "should have the right title" do
            get :show, :id => @user
            response.should have_tag("title", /#{@user.name}/)
        end

        it "should include the user's name" do
            get :show, :id => @user
            response.should have_tag("h2", /#{@user.name}/)
        end

        it "should have a profile image" do
            get :show, :id => @user
            response.should have_tag("h2>img", :class => "gravatar")
        end
    end

    # Tests for user signup form
    describe "POST 'create'" do

        # Tests for failed user signup
        describe "failure" do
            # Verify that the create action attempts to save the user
            before(:each) do
                # Use Factory Girl to build a new user based on a 
                # particular attributes hash
                @attr = { :name => "", :email => "", :password => "", 
                    :password_confirmation => "" }
                    @user = Factory.build(:user, @attr)
                    # Use an RSpec stub to ensure that call to User.new 
                    # returns our factory user
                    User.stub!(:new).and_return(@user)
                    @user.should_receive(:save).and_return(false)
                end

                # Check the title is correct
                it "should have the right title" do
                    post :create, :user => @attr
                    response.should have_tag("title", /sign up/i)
                end

                # Reload the signup page ('signup')
                it "should render the 'new' page" do
                    post :create, :user => @attr
                    response.should render_template('signup')
                end
            end

            # Tests for successful user signup
            describe "success" do
                before(:each) do
                    @attr = { :name => "New User", :email => "user@example1.com",
                        :password => "foobar", :password_confirmation => "foobar" }
                        # Use Factory Girl to simulate a saved user
                        @user = Factory(:user, @attr)
                        User.stub!(:new).and_return(@user)
                        @user.should_receive(:save).and_return(true)
                    end

                    it "should redirect to the user show page" do
                        post :create, :user => @attr
                        response.should redirect_to(user_path(@user))
                    end

                    it "should have a welcome message" do
                        post :create, :user => @attr
                        flash[:success].should =~ /welcome to the sample app/i
                    end
										
										# Testing that newly signed-up users are signed in
										it "should sign the user in" do
											post :create, :user => @attr
											controller.should be_signed_in
										end
										
                end
            end
        end
