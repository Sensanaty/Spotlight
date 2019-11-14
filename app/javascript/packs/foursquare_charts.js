import Chart from 'chart.js';
import ChartDataLabels from 'chartjs-plugin-datalabels';

// ------------------- foursquare CHART 1 ----------------------- //

let foursquareBarChartDisplay = document.querySelector('#foursquareBarChart')
let foursquareBarChartReviewCountData = JSON.parse(foursquareBarChartDisplay.dataset.reviewcountdata)
let foursquareBarChartcoloursArray = []

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
