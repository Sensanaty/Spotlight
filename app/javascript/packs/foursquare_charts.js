import Chart from 'chart.js';
import ChartDataLabels from 'chartjs-plugin-datalabels';

// ------------------- foursquare CHART 1 ----------------------- //

let foursquareBarChartDisplay = document.querySelector('#foursquareBarChart')
let foursquareBarChartReviewCountData = JSON.parse(foursquareBarChartDisplay.dataset.reviewcountdata)
let foursquareBarChartcoloursArray = ['rgba(30, 90, 130,0.6), rgba(23, 85, 140,0.6)', 'rgba(27, 105, 133,0.6)', 'rgba(34, 88, 128,0.6)', 'rgba(29, 79, 137,0.6)', 'rgba(38, 83, 132,0.6)', 'rgba(41, 74, 128,0.6)']

// foursquare Reviews Count chart code
let foursquareBarChart = new Chart(foursquareBarChartDisplay, {
    type: 'bar',
    data: {
        labels: Object.keys(foursquareBarChartReviewCountData),
        datasets: [
          {
            label: 'Number of reviews',
            data: Object.values(foursquareBarChartReviewCountData),
            yAxisID: 'left-y-axis',
            backgroundColor: foursquareBarChartcoloursArray,
          }]
    },
    plugins: [ChartDataLabels],

    options: {
      plugins: {
        datalabels: {
          color: '#fff',
          labels: {
            title: {
              font: {
                weight: 'bold',
                size: '14',
              },
            },
          },
        },
      },
      scales: {
              xAxes: [{
                gridLines: {
                  display: false,
                },
              }],
              yAxes: [{
                scaleLabel: {
                  display: true,
                },
                id: 'left-y-axis',
                gridLines: {
                  display: true,
                },
                ticks: {
                  display: true,
                  stepSize: 1,
                  min: 0
                }
              }],
            },
      title: {
        display: false,
      },
      legend: {
        display: false,
      },
      background: {
        display: false,
      }
    },
});
