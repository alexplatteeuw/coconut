const adminCharts = () => {

  console.log("je suis à l'interieur")

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

  console.log("je suis à l'exterieur")

//UserBookingData
