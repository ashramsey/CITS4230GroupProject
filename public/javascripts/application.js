
//jQuery.ajaxSetup({
//     'beforeSend': function (xhr) {xhr.setRequestHeader("Accept", "text/javascript")}
//});

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
    if (document.title == "Monkey Talk | Home"){
        var num = chatRoomGen();
        newid = "chatRoomsList"+num;
        document.getElementById(newid).style.display = "block";
    }
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
function accordian() {
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
}
/* -------------------------------------------- END - Support Page - Topics Slider -------------------------*/

/* -------------------------------------------- START - Support Page -------------------------*/
function feedback() {
    document.getElementById("contact-subject").value="User Feedback";
    document.getElementById("contact-subject").style.background="#FF9933";
}

function donate() {
    var str = "Please bank your money into our account:\nBankPerth BSB: 123-4567 ACC: 1234-567-8 Monkey\nThanks for your support!";
    alert(str);
}
/* -------------------------------------------- END - Support Page -------------------------*/

/* -------------------------------------------- START - Signup Page ---------------------------------------*/

function showOtherRes() {
    var memid=document.getElementById("memb");
    if (memid.options[memid.selectedIndex].text=="--Other--"){
        document.getElementById("otherres").style.display="block";
    }
    else {
        hideOtherRes();
    }
}

function hideOtherRes() {
    document.getElementById("otherres").style.display="none";
}

/* -------------------------------------------- END - Signup Page ---------------------------------------*/


/* -------------------------------------------- START - Form Validation ---------------------------------------*/
function validate_forms() {
    // Uses the jQuery validation plug-in 1.7 - (refer to for reference)
    // validate the login form feilds
    $("#signin").validate({
        rules: {
            'session[email]': {
                required: true,
                minlength: 5
            },
            'session[password]': {
                required: true,
                minlength: 5
            }
        },
        messages: {
            username: {
                required:   "Please enter a username",
                minlength:  "Your username must consist of at least 5 characters"
            },
            password: {
                required:   "Please provide a password",
                minlength:  "Your password must be at least 5 characters long"
            }
        }
    });
    // validate the signup form feilds
    $("#new_user").validate({
        rules: {
            "user[name]": {
                required: true,
                minlength: 5
            },
            "user[password]": {
                required: true,
                minlength: 5
            },
            "user[password_confirmation]": {
                required: true,
                minlength: 5,
                equalTo: "#password"
            },
            "user[email]": {
                required: true,
                email: true
            }
        },
        messages: {
            username: {
                required:   "Please enter a username",
                minlength:  "Your username must consist of at least 5 characters"
            },
            email:          "Please enter a valid email address",
            password: {
                required:   "Please provide a password",
                minlength:  "Your password must be at least 5 characters long"
            },
            password_confirm: {
                required:   "Please provide a password",
                minlength:  "Your password must be at least 5 characters long",
                equalTo:    "Please enter the same password as above"
            }
        }
    });
    // validate the comment form feilds
    $("#contact-form").validate({
        rules: {
            name: {
                required: true,
                minlength: 2
            },
            comment: {
                required: true,
                minlength: 5
            },
            email: {
                required: true,
                email: true
            }
        },
        messages: {
            name: {
                required:   "Please enter your name",
                minlength:  "Please enter more than 2 characters"
            },
            email:          "Please enter a valid email address",
            comment: {
                required:   "Please provide a message",
                minlength:  "Your message must be at least 5 characters long"
            }
        }
    });

}
/* -------------------------------------------- END - Form Validation ---------------------------------------*/

/* -------------------------------------------- START - Chatrooms -------------------------------------------*/

function scrollToBottom()
{
    $('#scrolltext').each(function() {
        this.scrollTop = this.scrollHeight;
    });
}

// AJAX call to display new message from current_user
function post_on_enter() {
    //scrollToBottom();
    //$('#comment_form input[type="text"], textarea').focus();
    //post_message();
    $('#message_field').keypress(function(e){
        if(e.which == 13){
            e.preventDefault();
            $('#comment_form').submit();
        }
    });
 }

function post_message()
{
    $('#comment_form').submit(function(event) {
        event.preventDefault();
        var f = $(this);
        f.find('.ajax_message').html('Sending...');
        f.find('input[type="submit"]').attr('disabled', true);
        $.ajax({
            url:      '/entries/create',
            type:     f.attr('method'),
            dataType: 'json',
            data:     f.serialize(),
            complete: function() {
                f.find('.ajax_message').html('&nbsp;');
                f.find('input[type="submit"]').attr('disabled', false);
            },
            success:  function(data, textStatus, xhr) {
                $('.message').append('<li>'+ data.user_name + '</li>' +
                                      '<li>'+ data.message + '</li>' +
                                  '<li id="created_at" style="display: none">'+ data.created_at + '</li>');
                f.find('input[type="text"], textarea').val('');
                f.find('input[type="text"], textarea').focus();
                scrollToBottom();
            },
            error:    function() {
                alert('Please enter a comment.');
            }
        });

    });
}

// AJAX call to poll server for new messages
function poll_server_for_new_messages() {
        var id = $('.message').attr('id');
        var last_update = $('.message #created_at:last-child').html();
        //alert(last_update);
         $.ajax({
                url:      '/chatrooms/' + id,
                type:     'GET',
                dataType: 'json',
                data:       {id:id, last_update:last_update},
                success:  function(data, textStatus, xhr) {
                    var entries = data.entries;
                    if(data.entries.length>0) {
                        $.each(data.entries, function(key, value){
                        var user_name;
                        var message;
                        var date;
                        $.each(value.entry, function(key,value){
                            switch(key){
                                case 'user_name':
                                    user_name = value;
                                    break;
                                case 'message':
                                    message = value;
                                    break;
                                case 'created_at':
                                    date = value;
                                    break
                            }
                        })
                        $('.message').append('<li>'+ user_name + '</li>' +
                                         '<li>'+ message + '</li>' +
                                         '<li id="created_at" style="display: none">'+ date + '</li>');
                    })
                    
                    scrollToBottom();
                    }
                    if(data.users.length>0) {
                        $('.userlist').replaceWith('<div class="userlist"></div>');
                        $.each(data.users, function(key, value){
                             var user_name;
                             var user_id;
                             var avatar_path = 'defaultAvatar.jpg';
                             $.each(value.user, function(key,value){
                                switch(key){
                                case 'name':
                                    user_name = value;
                                    break;
                                
                                case 'id':
                                    user_id = value;
                                    break;

                                case 'avatar_file_name':
                                    if(value!=null)
                                        avatar_path = value;
                                    break;
                                }
                             })
                             //Refresh list of other monkeys
                             $('.userlist').append('<div class="monkeys"><img class="avatar" src="/assets/' + avatar_path + '" alt="Avatar" />' +
                                   '<a href="/users/' + user_id +'" class="username">'+ user_name + '</a></div>');
                        })

                    }

                },
                error:    function() {
                    //alert('Error updating chats');
            }
        })
};
//var holdTheInterval = setInterval(poll_server_for_new_messages, 5000);
// HTML5 Web socket
function chat_stream() {
    if ("WebSocket" in window) {
        var id = $('.message').attr('id');
        var last_update = $('.message #created_at:last-child').html();
        var ws = new WebSocket("ws://127.0.0.1:3045/chatrooms/"+id);
        ws.onopen = function() {
            // Web Socket is connected. You can send data by send() method.
            ws.send({id:id, last_update:last_update});
        };
        ws.onmessage = function (evt) { 
          var received_msg = evt.data;
          received_msg = "hi";
        };
        ws.onclose = function() {  };// websocket is closed.
        } else {
          // the browser doesn't support WebSocket.
          //var holdTheInterval = setInterval(poll_server_for_new_messages, 5000);
    }
}

/* -------------------------------------------- END - Chatrooms -------------------------------------------*/
$(document).ready(function() {
    accordian();
    validate_forms();
    scrollToBottom();
    $('#comment_form input[type="text"], textarea#message_field').focus();
    post_message();
    post_on_enter();
    chatRoomDisplay();
 //   chat_stream();
});