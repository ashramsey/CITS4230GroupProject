# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
    # Return a title on a per-page basis.
    def title
        base_title = "Monkey Talk"
        if @title.nil?
            base_title
        else
            # using h to escape the HTML (stop cross-site scripting attacks)
            "#{base_title} | #{h(@title)}"
        end
    end

		def logo
		    image_tag("monkeyLogo.png", :alt => "Monkey Talk", :class => "round")
	  end

end
