// This is a manifest file that'll be compiled into application.js.
//
// Any JavaScript file within this directory can be referenced here using a relative path.
//
// You're free to add application-wide JavaScript to this file, but it's generally better
// to create separate JavaScript files as needed.
//
//= require jquery-2.2.0.min
//= require bootstrap
//= require sidebar
//= require_tree .
//= require_self

if (typeof jQuery !== 'undefined') {
    (function($) {
        $(document).ajaxStart(function() {
            $('#spinner').fadeIn();
        }).ajaxStop(function() {
            $('#spinner').fadeOut();
        });
    })(jQuery);
}


/*    Main.js       */
    $("#changeAvatar").click(function () {
        $("#inputPhoto").click();
    });
$("#inputPhoto").change(function(){
    //submit the form here
    $("#upload").click();

});
/*      Main.js     */




function userList(id) {
    $(".list-group-item").remove();
    $.getJSON("/post/usersJson/"+id, function (data) {
        var items = [];
        $.each(data, function (item, val) {
            items.push("<a href='person/profile?username="+val.username+"' class='list-group-item list-group-item-action' id='" + val.username + "'>" + val.username + "</a>");
        });

        $("<div />", {
            "class": "list-group",
            html: items.join("")
        }).appendTo("#userList");
    });
}

var durum = 1;

function convertMyDate(date){
    console.log(date);
    var year = date.getFullYear();
    var month = (date.getMonth());
    var day = date.getDate();
    console.log("Date: "+date.getDate());
    var hour = date.getHours();
    var minute = date.getMinutes();

    if(month<10)
        month = "0"+(date.getMonth()+1);
    if(day<10)
        day = "0"+date.getDate();
    if(hour<10)
        hour = "0"+date.getHours();
    if(minute<10)
        minute="0"+date.getMinutes();
    var stringDate =year + "-"+  month+"-"+day+"T"+hour+":"+minute;

    return stringDate;
}

function eventClickFunction(id)
{
    var eventObj = ($("#calendar").fullCalendar( 'clientEvents'))[id];
    console.log(eventObj);
    // alert(""+eventObj.title);
    $("#eventInfoModal").modal("show");
    $("#titleInfo").val(eventObj.title);
    $("#descriptionInfo").val(eventObj.description);
    $("#quotaInfo").val(eventObj.quota);
    $("#numberInfo").val(""+eventObj.number+"/"+eventObj.quota);
    $("#usernameInfo").val(eventObj.username);
    $("#startDateInfo").val(convertMyDate(eventObj.start));
    $("#endDateInfo").val(convertMyDate(eventObj.end));
}


