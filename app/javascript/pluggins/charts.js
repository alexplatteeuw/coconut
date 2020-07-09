const userChart = () => {
  const userChartTarget = document.getElementById('user-chart');
  const data = JSON.parse(userChartTarget.dataset.userChart);
  new Chart(userChartTarget, {
    type: 'doughnut',
    data: data,
    options: {
      maintainAspectRatio: false,
      aspectRatio: 1,
    }
  });
}

const skillsChart = () => {
  const skillsChartTarget = document.getElementById('skills-chart');
  const data = JSON.parse(skillsChartTarget.dataset.skillsChart);
  new Chart(skillsChartTarget, {
    type: 'pie',
    data: data,
    options: {
      maintainAspectRatio: false,
      aspectRatio: 1,
    }
  });
}

const projectsStatusChart = () => {
  const projectsStatusChartTarget = document.getElementById('projects-status-chart');
  const data = JSON.parse(projectsStatusChartTarget.dataset.projectsStatusChart);
  new Chart(projectsStatusChartTarget, {
    type: 'bar',
    data: data,
    options: {
      maintainAspectRatio: false,
      aspectRatio: 1,
    }
  });
}

const adminCharts = () => {
  if (document.getElementById('user-chart')) { userChart() }
  if (document.getElementById('skills-chart')) { skillsChart() }
  if (document.getElementById('projects-status-chart')) { projectsStatusChart() }
}

export { adminCharts };

