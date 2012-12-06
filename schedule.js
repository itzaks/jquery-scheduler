// Generated by CoffeeScript 1.4.0
(function(){(function(e){var t,n;Number.prototype.padZero=function(e){var t,n;e==null&&(e=2);n=String(this);t="0";while(n.length<e)n=t+n;return n};Date.prototype.getFullMinutes=function(){return this.getHours()*60+this.getMinutes()};n={init:function(t){var n;n=e.extend({events:[],startTime:6,endTime:20,pixelRatio:2,contentClass:"",lectionClass:"",dayClass:"",minuteInterval:15},t);return this.each(function(){var t,r;t=e(this);t.data("sc-settings",n);t.addClass("scheduler").html("          <div class='sc-content "+n.contentClass+"'>            <ul class=sc-event-list></ul>          </div>        ");r=t.find(".sc-event-list");r.on("click","li",function(){return e(this).toggleClass("active")});t.scheduler("appendEvents",n.events);return t.scheduler("setViewLayout","day")})},appendEvents:function(n){var r,i,s,o,u,a,f,l,c,h,p,d,v,m,g,y,b,w,E,S;n==null&&(n=[]);i=e(this);s=i.find(".sc-event-list");y=i.data("sc-settings");S=[];for(d in n){u=n[d];o=u.day;f=t(o.getDay());a=o.getDate();g=o.getMonth();l=f.toLowerCase();v=u.label||""+f+" - "+a+"/"+g;s.append("<li class='sc-event-label "+y.dayClass+"'>"+v+"</li>");S.push(function(){var t,n;t=u.list;n=[];for(E in t){m=t[E];b=m.start.getHours().padZero()+":"+m.start.getMinutes().padZero();p=m.end.getHours().padZero()+":"+m.end.getMinutes().padZero();w=m.title;c=m.description||"";h=c?"sc-has-description":"";r=e("            <li class='sc-event "+y.lectionClass+" sc-event-"+l+" "+h+"'>              <div class=sc-event-time>                <div class='sc-event-time-start'>"+b+"</div>                <div class='sc-event-time-end'>"+p+"</div>              </div>              <div class='sc-event-content'>                <strong>"+w+"</strong>                <div class='sc-event-extra'>                  <p>"+c+"</p>                </div>              </div>            </li>          ");r.data("sc-event",m);n.push(s.append(r))}return n}())}return S},setViewLayout:function(t){var n;t==null&&(t="day");n=this.data("sc-settings");this.data("sc-time-axis")||this.scheduler("generateTimeAxis");switch(t){case"week":return this.removeClass("is-dayview").addClass("is-weekview").find(".sc-event").each(function(){var t,r,i,s,o,u;t=e(this);i=t.data("sc-event");o=i.start.getFullMinutes();s=i.end.getFullMinutes();r=n.startTime*60;u=(o-r)*n.pixelRatio;return t.css({top:u,height:(s-o)*n.pixelRatio})});default:return this.removeClass("is-weekview").addClass("is-dayview").find(".sc-event").each(function(){return e(this).css({top:0,height:"auto"})})}},generateTimeAxis:function(){var t,n,r,i,s,o,u,a,f,l;a=this.data("sc-settings");this.data("sc-time-axis",!0);console.log(a);r=a.endTime*60;f=a.startTime*60;l=r-f;console.log(l,f,r,a.startTime);o=l/a.minuteInterval;u=a.minuteInterval*a.pixelRatio;n=function(){var n,r;r=[];for(t=n=0;n<=o;t=n+=1){i=Math.floor((f+t*a.minuteInterval)/60).padZero();s=((f+t*a.minuteInterval)%60).padZero();console.log(t,i);r.push(e("<li class=sc-time-axis-row>"+i+":"+s+"</li>").css("height",u))}return r}();return e("<ul class=sc-time-axis>").append(n).prependTo(this)}};t=function(e){var t;t=["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"];return t[e-1]};return e.fn.scheduler=function(t){return n[t]?n[t].apply(this,Array.prototype.slice.call(arguments,1)):typeof t=="object"||!t?n.init.apply(this,arguments):e.error("Method "+t+" does not exist on jQuery.scheduler")}})(jQuery)}).call(this);