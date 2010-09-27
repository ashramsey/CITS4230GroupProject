The following four files are referenced plugins, the last file contains our own code

jquery-func.js
This jquery is part of the original site template used for the Monkey Talk website.
It is currently used in the index.html page only, for the sliding banner and initialises the carousel pack (below)

jquery.jcarousel.pack.js
This jquery is part of the original site template used for the Monkey Talk website.
It is currently used in the index.html page only, for the sliding banner

jquery.validate.min.js
This jquery is used in all forms to enable form validation. It is initialised in the main.js. Of note, we argue that we did not implement our own javascript validation as this would be reinventing the wheel, and we wanted to try other javascript functions
as listed in the main.js.
It is currently used in all pages for the dropdown login form, the support.html contact us form, and the signup.html sign up form.
The code runs on blur from an input as well as on submiting the form.
(Details of validation described below)

signinDropdown.js
This jquery is used to provide an interactive hidden form at the top of each page to allow a user to login. The functions identify 
elements (the link to login, and the fieldset of the form) using the jquery syntax, and toggles the css display attribute. Tweaking was required for it to work in ie browsers.

main.js
This file houses all the javascript/jquery functionality we have developed.
    getsearch() -
        A simple function to display results from searching google.
    
    chatRoomGen () -
        This function used in the index.html randomly displays the members currently using the chat room. At this stage, the 
        members are pulled from static/hardcoded embedded list of members, but will aim to dynamically draw the members from 
        those logged into a chat room.
    
    chatRoomDisplay() -
        Initaialises the above function and displays them as a block level element.
    
    
    mystyle() -
    
    myfunc() -
    
    Topics Slider -
        This jquery code is used in the support.html and toggles the display of answers/information about support topics. It aims
        for interactive experience and will dynamically pull FAQs from the database using Ruby on Rails
    
    feedback() - 
    	 This function is used in support.html and prints the value
    	 "User Feedback" in the "Subject" field. It also highlights
    	 the field orange.

    donate() -
    	  This function is used in support.html and presents an alert
    	  when the "Make Donation" link is clicked.

    showOtherRes() - 
    	   Used in signup.html. Shows a text field for a user's citizenship that is not
    	   listed in the drop down menu.

    hideOtherRes() -
           Used in signup.html. Hides the text field for a user's
           citizenship.
    
    Form Validation -
        This jquery code initialises the above referenced code for validating all forms used across the site. The code identifies
        the id's of specific form inputs that require validation, and declare a set of rules for which to validate against, and 
        the respective messages to display if the rules are not met.
    
Pages are XHTML 1.1 & CSS 2.1 strict (CSS 3 styles are used).
Browser compatibility: IE7+, Chrome, Opera, Safari, Firefox.
    
