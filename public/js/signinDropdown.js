
/*------------- START - Signup Dropdown Form  ----------------------------*/
/*
 *  REFERENCE: Lam Nguyen, http://aext.net/2009/08/perfect-sign-in-dropdown-box-likes-twitter-with-jquery/
 *
 *
*/

$(document).ready(function() {

    $(".signin").click(function() {
        $("fieldset#signin_menu").toggle();
        $(".signin").toggleClass("menu-open");
    });

    $("fieldset#signin_menu").mouseup(function() {
        return false
    });
    $(document).mouseup(function(e) {
        if($(e.target).parent("a.signin").length==0) {
            $(".signin").removeClass("menu-open");
            $("fieldset#signin_menu").hide();
        }
    });            

});
/*------------- END - Signup Dropdown Form  ----------------------------*/

/*------------- START - Validation of Signup Form   ----------------------------*/

function validate() {
	var name = document.getElementById("user-name");
	var pass = document.getElementById("user-pass");
	
	if (name.value == "" && pass.value == ""){
		alert("Please provide both username and password.");
		name.focus();
		name.select();
		return false;
	}
	else if(name.value == ""){
		alert("Please provide your user name.");
		name.focus();
		name.select();
		return false;
	}
	else if (pass.value == ""){
		alert("Please provide your password.");
		pass.focus();
		pass.select();
		return false;
	}
	return true;
}

function cancel(){
	var name = document.getElementById("user-name");
	var pass = document.getElementById("user-pass");

	name.value = "";
	pass.value = "";		
}

/*------------- END - Validation of Signup Form  ------------------------------*/
