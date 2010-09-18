
/* -------------------------------------------- START - Search Bar -------------------------*/
//function for every page to open a new page of serach result
function getsearch()
{
	var srtxt = document.getElementById("searchtxt").value;
	window.open("http://www.google.com/search?forid=1&ie=utf-8&oe=UTF-8&hl=EN&q="+srtxt);
}
/* -------------------------------------------- END - Search Bar -------------------------*/

/* -------------------------------------------- START - Index.html - Top Room List -------------------------*/
numOfChatRooms = 5;
// Auto generated chatRoom
function chatRoomGen (){
	var now = new Date();
	var sec = now.getSeconds();
	var rand1 = Math.random(sec); // to generate it everytime with different time.
	var randUse = Math.floor(rand1 * (numOfChatRooms));
	if(randUse == numOfChatRooms) randUse = 0; // to avoid getting more than array specified
	return randUse;
}

function chatRoomDisplay(){
	var num = chatRoomGen();
	newid = "chatRoomsList"+num;
	document.getElementById(newid).style.display = "block";		
}
/* -------------------------------------------- END - Index.html - Top Room List -------------------------*/

/* -------------------------------------------- START - AboutUs.html -  -------------------------*/
//function for aboutus.html to display text of special style

function mystyle()
{
	var d=document.getElementById("talkfont");
	var colours = new Array();
	colours[0] = 'aqua';
	colours[1] = 'black';
	colours[2] = 'blue';
	colours[3] = 'fuchsia';
	colours[4] = 'gray';
	colours[5] = 'green';
	colours[6] = 'lime';
	colours[7] = 'maroon';
	colours[8] = 'navy';
	colours[9] = 'olive';
	colours[10] = 'orange';
	colours[11] = 'purple';
	colours[12] = 'red';
	colours[13] = 'silver';
	colours[14] = 'teal';
	colours[15] = 'white';
	colours[16] = 'yellow';

	var rand = parseInt((Math.random()*(16))+0);
	d.style.color = colours[rand];    
}
function myfunc()
{
    mystyle();
    setInterval(mystyle,300);
	
}
	
/* -------------------------------------------- END - AboutUs.html -  -------------------------*/

/* -------------------------------------------- START - Support Page - Topics Slider -------------------------*/
$(document).ready(function() {
    //Set default open/close settings
  $('.acc_container').hide(); //Hide/close all containers
  $('.acc_trigger:first').addClass('active').next().show(); //Add "active" class to first trigger, then show/open the immediate next container

  //On Click
  $('.acc_trigger').click(function(){
  	if( $(this).next().is(':hidden') ) { //If immediate next container is closed...
  		$('.acc_trigger').removeClass('active').next().slideUp(); //Remove all "active" state and slide up the immediate next container
  		$(this).toggleClass('active').next().slideDown(); //Add "active" state to clicked trigger and slide down the immediate next container
  	}
  	return false; //Prevent the browser jump to the link anchor
  });
  
});
/* -------------------------------------------- END - Support Page - Topics Slider -------------------------*/



