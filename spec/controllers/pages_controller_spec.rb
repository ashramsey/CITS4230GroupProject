require 'spec_helper'

describe PagesController do
    integrate_views

    before(:each) do
        @base_title = "Monkey Talk"
    end
    
    describe "GET 'home'" do
        it "should be successful" do
            get 'home'
            response.should be_success
        end
    end

    it "should have the right title" do
        get 'home'
        response.should have_tag("title",
                                "Monkey Talk | Home")
    end
    
    describe "GET 'tour'" do
        it "should be successful" do
            get 'tour'
            response.should be_success
        end
    end
  
    it "should have the right title" do
      get 'tour'
      response.should have_tag("title",
                               "Monkey Talk | Tour")
    end

    describe "GET 'aboutus'" do
      it "should be successful" do
        get 'aboutus'
        response.should be_success
      end
    end

    it "should have the right title" do
      get 'aboutus'
      response.should have_tag("title",
                               "Monkey Talk | About Us")
    end

    describe "GET 'support'" do
      it "should be successful" do
        get 'support'
        response.should be_success
      end
    end

    it "should have the right title" do
      get 'support'
      response.should have_tag("title",
                               "Monkey Talk | Support")
    end
    
    describe "GET 'sitemap'" do
        it "should be successful" do
            get 'sitemap'
            response.should be_success
        end
    end
  
    it "should have the right title" do
      get 'sitemap'
      response.should have_tag("title",
                               "Monkey Talk | Site Map")
    end

end
