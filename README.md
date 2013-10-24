#jQuery Scheduler

Lightweight schedule with vertical and horizontal format.
Easily customizable. 

Demo at: http://itzaks.github.io/jquery-scheduler/

##Example
    var events = [
      {
        day: new Date("2012-10-01"),
        label: function() { return "Custom label " + this.day.getDate() + "/" + this.day.getMonth()},
        list: [{
          title: "English",
          description: "Speak the language",
          start: "10:00",
          end: "12:00"
        }, {
          title: "Math",
          description: "Learn about numbers ad infinitum",
          start: "13:45",
          end: "14:45"
        }, {
          title: "Math",
          description: "What is a sine wave really?",
          start: "14:30",
          end: "15:00"
        }, {
          title: "Geometry",
          description: "Spheres spheres spheres. And spirals.",
          start: "15:30",
          end: "17:00"
        }]
      },
      {
        day: new Date("2012-10-02"),
        list: [{
          title: "History",
          description: "This is only his story.",
          start: "08:00",
          end: "09:20"
        }, {
          title: "Math",
          description: "See you at noon.",
          start: "12:45",
          end: "14:00"
        }, {
          title: "Philosophy",
          description: "Get inspired. Think for yourself.",
          start: "16:30",
          end: "17:00"
        }]
      }
    }]

    $(document).ready(function() {
      $("#schedule").scheduler({ events: events });
    });

##Settings
    events: [],
    startTime: 6,
    endTime: 20,
    pixelRatio: 2,
    contentClass: '',
    lectionClass: '',
    dayClass: '',
    minuteInterval: 15