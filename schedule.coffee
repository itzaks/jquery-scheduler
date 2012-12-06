#scheduleJS
(($) ->

  #patch Number with zero-padding
  Number.prototype.padZero = (len = 2) ->
    s = String(this)
    c = '0'

    while s.length < len
      s = c + s

    return s

  Date.prototype.getFullMinutes = () ->
    return (this.getHours() * 60) + this.getMinutes()

  methods = 
    init: (options) ->
      settings = $.extend(
        events: [],
        startTime: 8,
        endTime: 20,
        pixelRatio: 1,
        minuteInterval: 30
      , options)
      
      @each ->
        $this = $(this)
        $this.data("sc-settings", settings)
        $this.addClass("scheduler").html("
          <div class=sc-content>
            <ul class=sc-event-list></ul>
          </div>
        ")
        $this.prepend("<button class=btn-change-view>Toggle view</button>")
        $this.on "click", ".btn-change-view", ->
          view = if $(this).data("view") is "day" then "week" else "day"

          $(this).data("view", view)
          $this.scheduler("setViewLayout", view)

        $ul = $this.find(".sc-event-list")
        $ul.on "click", "li", ->
          $(this).toggleClass("active")

        for index, day of settings.events
          $ul.append("<li class='sc-event-label'>#{index}</li>")

          for _index, lesson of day
            startDate = lesson.start.getHours().padZero() + ":" + lesson.start.getMinutes().padZero()
            endDate = lesson.end.getHours().padZero() + ":" + lesson.end.getMinutes().padZero()
            title = lesson.title
            description = lesson.description

            $event = $("
              <li class='sc-event sc-event-#{index}'>
                <div class=sc-event-time>
                  <div class='sc-event-time-start'>#{startDate}</div>
                  <div class='sc-event-time-end'>#{endDate}</div>
                </div>
                <div class='sc-event-content'>
                  <strong>#{title}</strong>
                  <div class='sc-event-extra'>
                    <p>#{startDate} - #{endDate}</p>
                    <p>#{description}</p>
                  </div>
                </div>
              </li>
            ")

            $event.data("sc-event", lesson)

            $ul.append($event)

        $this.scheduler("setViewLayout", "week")

    #setViewLayout
    setViewLayout : (view = "day") ->
      settings = this.data("sc-settings")

      unless this.data("sc-time-axis") then this.scheduler("generateTimeAxis")

      switch view
        when "week"
          this.removeClass("is-dayview").addClass("is-weekview").find(".sc-event").each(->
            $this = $(this)
            event = $this.data("sc-event")

            eventStart = event.start.getFullMinutes()
            eventEnd = event.end.getFullMinutes()

            dayStart = settings.startTime * 60

            console.log dayStart, eventStart

            #get top placement (schedule start time - event start time) * minute to pixel-ratio
            topPlacement = (eventStart - dayStart) * settings.pixelRatio

            $this.css(
              top: topPlacement
              height: (eventEnd - eventStart) * settings.pixelRatio
            )
          )
        else 
          this.removeClass("is-weekview").addClass("is-dayview").find(".sc-event").each(->
            $(this).css(
              top: 0
              height: "auto"
            )
          )



    #generate sidemenu timeaxis
    generateTimeAxis : () ->
      settings = this.data("sc-settings")

      this.data('sc-time-axis', true)

      console.log settings

      #how many minutes do we display?
      endTime = settings.endTime * 60
      startTime = settings.startTime * 60

      #timespan 
      timespan = endTime - startTime

      console.log timespan, startTime, endTime, settings.startTime

        #720 minutes span

      #divide it to time-rows
      numberOfRows = timespan / settings.minuteInterval

        #24 rows with 30m minuteInterval

      #30 px height
      rowHeight = settings.minuteInterval * settings.pixelRatio

      #generate DOM, iterate startTime 0 -> 24
      dom = for currentRow in [0..numberOfRows] by 1
        #generate time
        hour = Math.floor((startTime + currentRow * settings.minuteInterval) / 60).padZero()
        minute = ((startTime + currentRow * settings.minuteInterval) % 60).padZero()

        console.log currentRow, hour

        $("<li class=sc-time-axis-row>#{hour}:#{minute}</li>").css("height", rowHeight)


      $("<ul class=sc-time-axis>").append(dom).prependTo(this)









  $.fn.scheduler = (method) ->
    
    # Method calling logic
    if methods[method]
      methods[method].apply this, Array::slice.call(arguments, 1)
    else if typeof method is "object" or not method
      methods.init.apply this, arguments
    else
      $.error "Method " + method + " does not exist on jQuery.scheduler"
) jQuery
