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
    
end

