import { Calendar } from '@fullcalendar/core';
import dayGridPlugin from '@fullcalendar/daygrid';
// import css from '@fullcalendar/common/main';


const initCalendar = () => {
  const calendarEl = document.getElementById('calendardiv');

  const calendar = new Calendar(calendarEl, {
    plugins: [ dayGridPlugin ]
  });

  calendar.render();
};

export { initCalendar };
