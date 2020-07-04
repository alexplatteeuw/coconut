const adminCharts = () => {

  console.log("je suis à l'interieur")

      const UserChartTarget = document.getElementById('UserChart');

      const UserChart = new Chart(UserChartTarget, {
        type: 'doughnut',
        data: {
          datasets: [{
              data: [10, 20, 30],
              backgroundColor: ["red","blue","green"]
          }],

          // These labels appear in the legend and in the tooltips when hovering different arcs
          labels: [
              'Red',
              'Yellow',
              'Blue'
          ]
        },

        options: {
          maintainAspectRatio: false,
          aspectRatio: 1,
        }
      });

}
export { adminCharts };

  console.log("je suis à l'exterieur")

//UserBookingData
