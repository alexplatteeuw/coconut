import { Calendar } from '@fullcalendar/core';
import dayGridPlugin from '@fullcalendar/daygrid';
import timeGridPlugin from '@fullcalendar/timegrid';
import listPlugin from '@fullcalendar/list';
import interactionPlugin from '@fullcalendar/interaction';
// import css from '@fullcalendar/common/main';


const initCalendar = () => {
  const token = document.getElementsByName("csrf-token")[0].content;

  const calendarEl = document.getElementById('calendardiv');
  const projectId = calendarEl.dataset.project;

  const calendar = new Calendar(calendarEl, {
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
    events: `/projects/${projectId}/events.json`,
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
      })
        .then(data => console.log(data))
        .then((data) => {
        });
    }
  });

  calendar.render();
};

export { initCalendar };
