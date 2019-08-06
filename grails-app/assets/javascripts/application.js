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


