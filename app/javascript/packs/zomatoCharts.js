import Chart from 'chart.js';
import ChartDataLabels from 'chartjs-plugin-datalabels';


// ---------------------- zomato CHART 1 ----------------------- //
let zomatoPieChartDisplay = document.querySelector('#zomatoPieChart')
let zomatoPieChartData = JSON.parse(zomatoPieChartDisplay.dataset.chartdata)
let zomatoPieChartKeys = []
let zomatoPieChartValues = []
let zomatoPieChartcoloursArray = ["rgba(217, 68, 61, 0.7)", "rgba(237, 123, 85,0.7)", "rgba(237, 202, 85,0.7)","rgba(166, 217, 89,0.7)", "rgba(95, 186, 74,0.7)"]

Object.values(zomatoPieChartData).forEach(function(rating, index) {
  zomatoPieChartKeys[index]=rating[0]
  zomatoPieChartValues[index]=rating[1]
});

// zomato Reviews Count chart code
let zomatoPieChart = new Chart(zomatoPieChartDisplay, {
    type: 'doughnut',
    data: {
        labels: zomatoPieChartKeys,
        datasets: [{
            label: '# of reviews',
            data: zomatoPieChartValues,
            backgroundColor: zomatoPieChartcoloursArray,
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

// ------------------- zomato CHART 2 ----------------------- //

let zomatoBarChartDisplay = document.querySelector('#zomatoBarChart')
let zomatoBarChartData = JSON.parse(zomatoBarChartDisplay.dataset.chartdata)
let zomatoBarChartcoloursArray = ["rgba(25, 100, 182, 0.5)", "rgba(25, 115, 182,0.5)", "rgba(25, 130, 182,0.5)","rgba(25, 145, 182,0.5)", "rgba(25, 160, 182,0.5)", "rgba(25, 175, 182,0.5)"]

console.log(zomatoBarChartData);

// zomato Reviews Count chart code
let zomatoBarChart = new Chart(zomatoBarChartDisplay, {
    type: 'bar',
    data: {
        labels: Object.keys(zomatoBarChartData),
        datasets: [{
            label: '# of reviews',
            data: Object.values(zomatoBarChartData),
            backgroundColor: zomatoBarChartcoloursArray,
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
