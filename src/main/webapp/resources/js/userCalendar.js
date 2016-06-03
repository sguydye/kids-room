/**
 * Created by dima- on 12.05.2016.
 */


function selectRoomForUser(id) {
    $('#user-calendar').fullCalendar('destroy');


    var path = "getevents/" + id;

    $.ajax({
        url: path, success: function (result) {

            if (result.length != 0) {
                var objects = [];
                result = result.split(', ');

                result[0] = " " + result[0];

                for (var i = 0; i < result.length; i++) {
                    var string = result[i];
                    var stringToArray = string.split('|');

                    objects[i] = {
                        id: parseInt(stringToArray[3]),
                        title: stringToArray[0],
                        start: stringToArray[1],
                        end: stringToArray[2],
                        rendering: 'background'
                    }
                }
                renderingForUser(objects, id);
            } else {
                $('#user-calendar').fullCalendar('destroy');

                var objects = [{
                    title: "1",
                    start: "1",
                    end: "1"
                }]
                renderingForUser(objects, id);
            }
        }
    });
}

function renderingForUser(objects) {
    $('#user-calendar').fullCalendar({
        minTime: '10:00:00',
        maxTime: '22:00:00',
        eventBackgroundColor: '#068000',
        eventColor: 'transparent',
        eventBorderColor: 'transparent',
        eventTextColor: '#000',
        slotDuration: '00:15:00',

        header: {
            left: 'prev,next today',
            center: 'title',
            right: 'month,agendaWeek,agendaDay'
        },
        defaultDate: $('#user-calendar').fullCalendar('getDate'),

        select: function (start, end) {
            var title = prompt('Event Title:');
            var eventData;
            if (title) {
                eventData = {
                    title: title,
                    start: start,
                    end: end

                };
                $('#user-calendar').fullCalendar('renderEvent', eventData, false);
            }
            $('#user-calendar').fullCalendar('unselect');
        },
        eventRender: function (event, element) {
            if (event.rendering == 'background') {
                element.append(event.title);
                element.css("background-color", "yellow");
                element.css("color", "black");
            }
        },
        editable: false,
        eventLimit: true,
        events: objects

    });
}

