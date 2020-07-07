const adminCharts = () => {

  const UserChartTarget = document.getElementById('UserChart');
  const data = JSON.parse(UserChartTarget.dataset.userChart);
  const UserChart = new Chart(UserChartTarget, {
    type: 'doughnut',
    data: data,
    options: {
      maintainAspectRatio: false,
      aspectRatio: 1,
    }
  });
}

export { adminCharts };
