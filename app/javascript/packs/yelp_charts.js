import Chart from 'chart.js';
import ChartDataLabels from 'chartjs-plugin-datalabels';


// ---------------------- yelp CHART 1 ----------------------- //
let yelpPieChartDisplay = document.querySelector('#yelpPieChart')
let yelpPieChartData = JSON.parse(yelpPieChartDisplay.dataset.chartdata)
let yelpPieChartKeys = []
let yelpPieChartValues = []
let yelpPieChartcoloursArray = ["rgba(217, 68, 61, 0.7)", "rgba(237, 123, 85,0.7)", "rgba(237, 202, 85,0.7)","rgba(166, 217, 89,0.7)", "rgba(95, 186, 74,0.7)"]

Object.values(yelpPieChartData).forEach(function(rating, index) {
  yelpPieChartKeys[index]=rating[0]
  yelpPieChartValues[index]=rating[1]
});

// yelp Reviews Count chart code
let yelpPieChart = new Chart(yelpPieChartDisplay, {
    type: 'doughnut',
    data: {
        labels: yelpPieChartKeys,
        datasets: [{
            label: '# of reviews',
            data: yelpPieChartValues,
            backgroundColor: yelpPieChartcoloursArray,
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

// ------------------- yelp CHART 2 ----------------------- //

let yelpBarChartDisplay = document.querySelector('#yelpBarChart')
let yelpBarChartData = JSON.parse(yelpBarChartDisplay.dataset.chartdata)
let yelpBarChartcoloursArray = ["rgba(25, 100, 182, 0.5)", "rgba(25, 115, 182,0.5)", "rgba(25, 130, 182,0.5)","rgba(25, 145, 182,0.5)", "rgba(25, 160, 182,0.5)", "rgba(25, 175, 182,0.5)"]

console.log(yelpBarChartData);

// yelp Reviews Count chart code
let yelpBarChart = new Chart(yelpBarChartDisplay, {
    type: 'bar',
    data: {
        labels: Object.keys(yelpBarChartData),
        datasets: [{
            label: '# of reviews',
            data: Object.values(yelpBarChartData),
            backgroundColor: yelpBarChartcoloursArray,
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
