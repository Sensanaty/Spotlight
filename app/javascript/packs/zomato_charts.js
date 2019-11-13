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
let zomatoBarChartReviewCountData = JSON.parse(zomatoBarChartDisplay.dataset.reviewcountdata)
let zomatoBarChartReviewAverageData = JSON.parse(zomatoBarChartDisplay.dataset.reviewaveragedata)
let zomatoBarChartcoloursArray = []

zomatoBarChartReviewAverageData.forEach(function(rating, index) {
  if (rating > 4 && rating <= 5) {
    zomatoBarChartcoloursArray[index] = "rgba(95, 186, 74,0.7)"
  } else if (rating > 3 && rating <= 4) {
    zomatoBarChartcoloursArray[index] = "rgba(166, 217, 89,0.7)"
  } else if (rating > 2 && rating <= 3) {
    zomatoBarChartcoloursArray[index] = "rgba(237, 202, 85,0.7)"
  } else if (rating > 1 && rating <= 2) {
    zomatoBarChartcoloursArray[index] = "rgba(237, 123, 85,0.7)"
  } else if (rating > 0 && rating <= 1) {
    zomatoBarChartcoloursArray[index] = "rgba(217, 68, 61, 0.7)"
  }
});

// zomato Reviews Count chart code
let zomatoBarChart = new Chart(zomatoBarChartDisplay, {
    type: 'bar',
    data: {
        labels: Object.keys(zomatoBarChartReviewCountData),
        datasets: [
          {
            label: 'Average review rating',
            data: Object.values(zomatoBarChartReviewAverageData),
            backgroundColor: zomatoBarChartcoloursArray,
            options: { barThickness: 40 }
          },
          {
            label: 'Number of reviews',
            data: Object.values(zomatoBarChartReviewCountData),
            type: 'line',
            fill: false,
            borderWidth: 2,
            borderColor: '#000',
            yAxisID: 'left-y-axis',
            datalabels: {
              display: false,
              labels: {

                }
            }
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
                  labelString: "Number of reviews (line)",
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
