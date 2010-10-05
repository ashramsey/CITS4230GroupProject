class PagesController < ApplicationController
    def home
        @title = "Home"
    end

    def tour
        @title = "Tour"
    end

    def aboutus
        @title = "About Us"
    end

    def support
        @title = "Support"
    end
    
    def sitemap
        @title = "Site Map"
    end
end
