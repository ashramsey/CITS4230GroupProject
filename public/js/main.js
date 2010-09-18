//function for every page to open a new page of serach result
function getsearch()
{
	var srtxt = document.getElementById("searchtxt").value;
	window.open("http://www.google.com/search?forid=1&ie=utf-8&oe=UTF-8&hl=EN&q="+srtxt);
}

//function for aboutus.html to display text of special style
function myfunc()
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
	setInterval(myfunc,300);

