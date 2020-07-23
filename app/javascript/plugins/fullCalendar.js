import { Calendar } from '@fullcalendar/core';
import dayGridPlugin from '@fullcalendar/daygrid';
import timeGridPlugin from '@fullcalendar/timegrid';
import listPlugin from '@fullcalendar/list';
import interactionPlugin from '@fullcalendar/interaction';
import frLocale from '@fullcalendar/core/locales/fr';

// import css from '@fullcalendar/common/main';


const initCalendar = () => {
  const token = document.getElementsByName("csrf-token")[0].content;

  const calendarEl = document.getElementById('calendardiv');
  const projectId = calendarEl.dataset.project;
  const itemList = document.querySelector("#event-list");

  const calendar = new Calendar(calendarEl, {
    locale: frLocale,
    plugins: [ dayGridPlugin, timeGridPlugin, listPlugin, interactionPlugin ],
    initialView: 'dayGridMonth',
    headerToolbar: {
      left: 'prev,next today',
      center: 'title',
      right: 'dayGridMonth,timeGridWeek,listWeek'
    },
    nowIndicator: true,
    selectable: true,
    editable: true,
    eventSources: [
       {
         url: `/projects/${projectId}/events.json`, // use the `url` property
       }
     ],
    eventDrop: function( info ) {
      const end = info.event._instance.range.end;
      const start = info.event._instance.range.start;

      const id = info.event._def.publicId;

      fetch(`/projects/${projectId}/events/${id}`, {
        method: "PATCH",
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          "X-CSRF-Token": token
        },
        body: JSON.stringify({ end: end, start: start })
      });
    },

    select: function (info) {
      const title = prompt('Enter the title');
      const end = info.end + 1;
      const start = info.start + 1;

      fetch(`/projects/${projectId}/events`, {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          "X-CSRF-Token": token
        },
        body: JSON.stringify({ end: end, start: start, title: title })
      });

      calendar.unselect();

      itemList.insertAdjacentHTML("beforeend", `<div class="d-flex flex-column justify-content-start ml-3 mt-3" ><h4><i class="fa fa-arrow-right mr-2 text-dark" aria-hidden="true"></i>${title}</h4></div>`);
    },
    unselect: function () {
      calendar.refetchEvents();
    }
  });

  calendar.render();
};

export { initCalendar };
