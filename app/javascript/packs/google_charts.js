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
let googleBarChartReviewCountData = JSON.parse(googleBarChartDisplay.dataset.reviewcountdata)
let googleBarChartReviewAverageData = JSON.parse(googleBarChartDisplay.dataset.reviewaveragedata)
let googleBarChartcoloursArray = []

googleBarChartReviewAverageData.forEach(function(rating, index) {
  if (rating > 4 && rating <= 5) {
    googleBarChartcoloursArray[index] = "rgba(95, 186, 74,0.7)"
  } else if (rating > 3 && rating <= 4) {
    googleBarChartcoloursArray[index] = "rgba(166, 217, 89,0.7)"
  } else if (rating > 2 && rating <= 3) {
    googleBarChartcoloursArray[index] = "rgba(237, 202, 85,0.7)"
  } else if (rating > 1 && rating <= 2) {
    googleBarChartcoloursArray[index] = "rgba(237, 123, 85,0.7)"
  } else if (rating > 0 && rating <= 1) {
    googleBarChartcoloursArray[index] = "rgba(217, 68, 61, 0.7)"
  }
});

// Google Reviews Count chart code
let googleBarChart = new Chart(googleBarChartDisplay, {
    type: 'bar',
    data: {
        labels: Object.keys(googleBarChartReviewCountData),
        datasets: [
          {
            label: 'Average review rating',
            data: Object.values(googleBarChartReviewAverageData),
            backgroundColor: googleBarChartcoloursArray,
            options: { barThickness: 40 },
            yAxisID: 'right-y-axis'
          },
          {
            label: 'Number of reviews',
            data: Object.values(googleBarChartReviewCountData),
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
              yAxes: [
              {
                position: 'left',
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
              },
              {
                position: 'right',
                scaleLabel: {
                  labelString: "Average rating (bars)",
                  display: false,
                },
                id: 'right-y-axis',
                gridLines: {
                  display: false,
                },
                ticks: {
                  display: false,
                  min: 0
                }
              }
              ],
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
