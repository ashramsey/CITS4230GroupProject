$(document).ready(function() {

    $(".signin").click(function(e) {
        e.preventDefault();
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

/*------------- Validating Start  ----------------------------*/

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

/*------------- Validating End  ------------------------------*/
