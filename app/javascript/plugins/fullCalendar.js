import { Calendar } from '@fullcalendar/core';
import dayGridPlugin from '@fullcalendar/daygrid';
import timeGridPlugin from '@fullcalendar/timegrid';
import listPlugin from '@fullcalendar/list';
import interactionPlugin from '@fullcalendar/interaction';
// import css from '@fullcalendar/common/main';


const initCalendar = () => {
  const calendarEl = document.getElementById('calendardiv');

  const calendar = new Calendar(calendarEl, {
    plugins: [ dayGridPlugin, timeGridPlugin ],
    initialView: 'dayGridMonth',
    headerToolbar: {
      left: 'prev,next today',
      center: 'title',
      right: 'dayGridMonth,timeGridWeek,listWeek'
    },
    nowIndicator: true,
    selectable: true,
    editable: true
  });

  calendar.render();
};

export { initCalendar };
