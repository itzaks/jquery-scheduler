#jQuery Scheduler

???¿¿¿ READ
!!!¡¡¡ ME

##Example
		var events = [{
		  	day: new Date("2012-10-01"),
		  	label: "CUSTOM MONDAY",
		  	list: [{
		      title: "English",
		      description: "etc. etc",
		      start: new Date("2012-10-01 10:00"),
		      end: new Date("2012-10-01 12:00")
		    }, {
		      title: "Math",
		      description: "LEARN IT",
		      start: new Date("2012-10-01 13:45"),
		      end: new Date("2012-10-02 14:45")
		    }, {
		      title: "Lunch",
		      description: "MMMmmm",
		      start: new Date("2012-10-01 14:30"),
		      end: new Date("2012-10-02 15:00")
		    }, {
		      title: "Code",
		      description: "etc. etc",
		      start: new Date("2012-10-01 15:30"),
		      end: new Date("2012-10-02 17:00")
		    }]
		  },
		  {
		  	day: new Date("2012-10-02"),
		  	list: [{
		      title: "Hack",
		      description: "See things",
		      start: new Date("2012-10-01 08:00"),
		      end: new Date("2012-10-01 09:20")
		    }, {
		      title: "Your",
		      description: "Cometh!",
		      start: new Date("2012-10-01 12:45"),
		      end: new Date("2012-10-02 14:00")
		    }, {
		      title: "Homework",
		      description: null,
		      start: new Date("2012-10-01 16:30"),
		      end: new Date("2012-10-02 17:00")
		    }]
		  }
		]

		$(document).ready(function() {
			$("#schedule").scheduler({
				events: events
			});
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