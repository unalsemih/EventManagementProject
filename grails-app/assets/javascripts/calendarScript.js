
$(document).ready(function() {



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





/*getJson*/
    var postList=[];
    var eventList = [];
    $.getJSON("/post/postsJson/", function (data) {
        var items = [];
        $.each(data, function (item, val) {

            postList.push(val);
            console.log(postList.length);
        });

        //Converting...

        for (var i=0; i<postList.length; i++)
        {
            eventList.push({eventId: i ,title:postList[i].title,start:new Date(postList[i].startDate),end:new Date(postList[i].endDate),allDay:true,className:"important",allDay:true,url:"www.google.com",reelId:postList[i].id,username:postList[i].username,description:postList[i].description,quota:postList[i].quota,number:postList[i].number});
        }
        console.log(eventList);







///////////////////////////////////////////////
    var date = new Date();
    var d = date.getDate();
    var m = date.getMonth();
    var y = date.getFullYear();
    console.log(date.getDate());




    /*  className colors

    className: default(transparent), important(red), chill(pink), success(green), info(blue)

    */


    /* initialize the external events
    -----------------------------------------------------------------*/

    $('#external-events div.external-event').each(function() {

        // create an Event Object (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
        // it doesn't need to have a start or end
        var eventObject = {
            title: $.trim($(this).text()) // use the element's text as the event title
        };

        // store the Event Object in the DOM element so we can get to it later
        $(this).data('eventObject', eventObject);

        // make the event draggable using jQuery UI
        $(this).draggable({
            zIndex: 999,
            revert: true,      // will cause the event to go back to its
            revertDuration: 0  //  original position after the drag
        });

    });


    /* initialize the calendar
    -----------------------------------------------------------------*/

    var calendar =  $('#calendar').fullCalendar({
        header: {
            left: 'title',
            center: 'agendaDay,agendaWeek,month',
            right: 'prev,next today'
        },
        editable: false,
        firstDay: 1, //  1(Monday) this can be changed to 0(Sunday) for the USA system
        selectable: true,
        defaultView: 'month',

        axisFormat: 'h:mm',
        columnFormat: {
            month: 'ddd',    // Mon
            week: 'ddd d', // Mon 7
            day: 'dddd M/d',  // Monday 9/7
            agendaDay: 'dddd d'
        },
        titleFormat: {
            month: 'MMMM yyyy', // September 2009
            week: "MMMM yyyy", // September 2009
            day: 'MMMM yyyy'                  // Tuesday, Sep 8, 2009
        },
        allDaySlot: false,
        selectHelper: true,
        select: function(start, end, allDay) {
            //takvimden tarihler seçildiğinde....
            if(start>new Date())
            $.getJSON("/person/getUserRole", function (data) {

                if(data[0]==="ROLE_ADMIN"){
                    $('#eventCreateModal').modal('show');
                }

            });
            else
                alert("Önceki tarihe etkinlik oluşturulamaz!")
            $("#startDateCalendar").val(convertMyDate(start));
            $("#endDateCalendar").val(convertMyDate(end));
            var title = "";//prompt('Event Title:');
            if (title) {
                calendar.fullCalendar('renderEvent',
                    {
                        title: title,
                        start: start,
                        end: end,
                        allDay: allDay
                    },
                    true // make the event "stick"
                );
            }
            calendar.fullCalendar('unselect');
        },
        droppable: true, // this allows things to be dropped onto the calendar !!!
        drop: function(date, allDay) { // this function is called when something is dropped

            // retrieve the dropped element's stored Event Object
            var originalEventObject = $(this).data('eventObject');

            // we need to copy it, so that multiple events don't have a reference to the same object
            var copiedEventObject = $.extend({}, originalEventObject);

            // assign it the date that was reported
            copiedEventObject.start = date;
            copiedEventObject.allDay = allDay;

            // render the event on the calendar
            // the last `true` argument determines if the event "sticks" (http://arshaw.com/fullcalendar/docs/event_rendering/renderEvent/)
            $('#calendar').fullCalendar('renderEvent', copiedEventObject, true);

            // is the "remove after drop" checkbox checked?
            if ($('#drop-remove').is(':checked')) {
                // if so, remove the element from the "Draggable Events" list
                $(this).remove();
            }

        },

        events: eventList

    });

        calendar.fullCalendar('updateEvent',
            {
                title: "123",
                start: new Date("Tue Jul 30 2019 00:00:00"),
                end: new Date("Sat Aug 10 2019 13:25:00"),
                allDay: true
            },
            true // make the event "stick"
        );

        console.log(calendar);
        console.log("deneme");

    });



});
