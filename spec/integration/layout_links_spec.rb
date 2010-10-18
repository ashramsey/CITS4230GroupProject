require 'spec_helper'

describe "LayoutLinks" do
    
    it "should have a Home page at '/'" do
      get '/'
      response.should render_template('pages/home')
    end
    
    it "should have a Tour page at '/tour'" do
      get '/tour'
      response.should render_template('pages/tour')
    end
    
    it "should have an About page at '/aboutus'" do
      get '/aboutus'
      response.should render_template('pages/aboutus')
    end
    
    it "should have a Help page at '/support'" do
      get '/support'
      response.should render_template('pages/support')
    end
    
      it "should have a Signup page at '/signup'" do
      get '/signup'
      response.should render_template('users/signup')
    end
    
    it "should have a SiteMap page at '/sitemap'" do
      get '/sitemap'
      response.should render_template('pages/sitemap')
    end

		describe "when not signed in" do
		    it "should have a signin link" do
		      visit root_path
		      response.should have_tag("a[href=?]", signin_path, "Sign in")
		    end
	 	end
   	
	 	describe "when signed in" do
   	
	 	  before(:each) do
	 	    @attr = { :name => "New User", :email => "user@example1.com",
            :password => "foobar", :password_confirmation => "foobar" }
        # Use Factory Girl to simulate a saved user
        @user = Factory(:user, @attr)
	 	    visit signin_path
	 	    fill_in :Email,    :with => @user.email
	 	    fill_in :Password, :with => @user.password
	 	    click_button
	 	  end
   	
	 	  it "should have a signout link" do
	 	    visit root_path
	 	    response.should have_tag("a[href=?]", signout_path, "Sign out")
	 	  end
   	
	 	  it "should have a profile link" do
				visit root_path
				response.should have_tag("a[href=?]", user_path(@user), "Profile")
			end
			
	 	end

    
end

