const userChart = () => {
  const UserChartTarget = document.getElementById('user-chart');
  const data = JSON.parse(UserChartTarget.dataset.userChart);
  new Chart(UserChartTarget, {
    type: 'doughnut',
    data: data,
    options: {
      maintainAspectRatio: false,
      aspectRatio: 1,
    }
  });
}

const skillsChart = () => {
  const SkillsChartTarget = document.getElementById('skills-chart');
  const data = JSON.parse(SkillsChartTarget.dataset.skillsChart);
  new Chart(SkillsChartTarget, {
    type: 'pie',
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
}

export { adminCharts };
