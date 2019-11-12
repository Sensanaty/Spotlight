import Chart from 'chart.js';
import ChartDataLabels from 'chartjs-plugin-datalabels';


// ---------------------- GOOGLE CHART 1 ----------------------- //
let googlePieChartDisplay = document.querySelector('#googlePieChart')
let googlePieChartData = JSON.parse(googlePieChartDisplay.dataset.chartdata)
let googlePieChartKeys = []
let googlePieChartValues = []
let googlePieChartcoloursArray = ["rgba(217, 68, 61, 0.7)", "rgba(237, 123, 85,0.7)", "rgba(237, 202, 85,0.7)","rgba(166, 217, 89,0.7)", "rgba(95, 186, 74,0.7)"]

Object.values(googlePieChartData).forEach(function(rating, index) {
  googlePieChartKeys[index]=rating[0]
  googlePieChartValues[index]=rating[1]
});

// Google Reviews Count chart code
let googlePieChart = new Chart(googlePieChartDisplay, {
    type: 'doughnut',
    data: {
        labels: googlePieChartKeys,
        datasets: [{
            label: '# of reviews',
            data: googlePieChartValues,
            backgroundColor: googlePieChartcoloursArray,
        }]
    },
    plugins: [ChartDataLabels],
    options: {
      plugins: {
        datalabels: {
          color: '#fff',
          formatter: function(value, context) {
              return context.chart.data.labels[context.dataIndex];
          },
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

// ------------------- GOOGLE CHART 2 ----------------------- //

let googleBarChartDisplay = document.querySelector('#googleBarChart')
let googleBarChartData = JSON.parse(googleBarChartDisplay.dataset.chartdata)
let googleBarChartcoloursArray = ["rgba(25, 100, 182, 0.5)", "rgba(25, 115, 182,0.5)", "rgba(25, 130, 182,0.5)","rgba(25, 145, 182,0.5)", "rgba(25, 160, 182,0.5)", "rgba(25, 175, 182,0.5)"]

console.log(googleBarChartData);

// Google Reviews Count chart code
let googleBarChart = new Chart(googleBarChartDisplay, {
    type: 'bar',
    data: {
        labels: Object.keys(googleBarChartData),
        datasets: [{
            label: '# of reviews',
            data: Object.values(googleBarChartData),
            backgroundColor: googleBarChartcoloursArray,
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
                // ticks: {
                //   fontSize: 15,
                //   fontColor: 'lightgrey'
                // }
              }],
              yAxes: [{
                gridLines: {
                  display: false,
                },
                ticks: {
                  display: false,
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
