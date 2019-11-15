import Chart from 'chart.js';
import ChartDataLabels from 'chartjs-plugin-datalabels';

// ---------------------- tripadvisor CHART 1 ----------------------- //
let tripadvisorPieChartDisplay = document.querySelector('#tripadvisorPieChart')
let tripadvisorPieChartData = JSON.parse(tripadvisorPieChartDisplay.dataset.chartdata)
let tripadvisorPieChartKeys = []
let tripadvisorPieChartValues = []
let tripadvisorPieChartcoloursArray = ["rgba(217, 68, 61, 0.7)", "rgba(237, 123, 85,0.7)", "rgba(237, 202, 85,0.7)","rgba(166, 217, 89,0.7)", "rgba(95, 186, 74,0.7)"]

Object.values(tripadvisorPieChartData).forEach(function(rating, index) {
  tripadvisorPieChartKeys[index]=rating[0]
  tripadvisorPieChartValues[index]=rating[1]
});

// tripadvisor Reviews Count chart code
let tripadvisorPieChart = new Chart(tripadvisorPieChartDisplay, {
    type: 'doughnut',
    data: {
        labels: tripadvisorPieChartKeys,
        datasets: [{
            label: '# of reviews',
            data: tripadvisorPieChartValues,
            backgroundColor: tripadvisorPieChartcoloursArray,
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

// ------------------- tripadvisor CHART 2 ----------------------- //

let tripadvisorBarChartDisplay = document.querySelector('#tripadvisorBarChart')
let tripadvisorBarChartReviewCountData = JSON.parse(tripadvisorBarChartDisplay.dataset.reviewcountdata)
let tripadvisorBarChartReviewAverageData = JSON.parse(tripadvisorBarChartDisplay.dataset.reviewaveragedata)
let tripadvisorBarChartcoloursArray = []

tripadvisorBarChartReviewAverageData.forEach(function(rating, index) {
  if (rating > 4 && rating <= 5) {
    tripadvisorBarChartcoloursArray[index] = "rgba(95, 186, 74,0.7)"
  } else if (rating > 3 && rating <= 4) {
    tripadvisorBarChartcoloursArray[index] = "rgba(166, 217, 89,0.7)"
  } else if (rating > 2 && rating <= 3) {
    tripadvisorBarChartcoloursArray[index] = "rgba(237, 202, 85,0.7)"
  } else if (rating > 1 && rating <= 2) {
    tripadvisorBarChartcoloursArray[index] = "rgba(237, 123, 85,0.7)"
  } else if (rating > 0 && rating <= 1) {
    tripadvisorBarChartcoloursArray[index] = "rgba(217, 68, 61, 0.7)"
  }
});

// tripadvisor Reviews Count chart code
let tripadvisorBarChart = new Chart(tripadvisorBarChartDisplay, {
    type: 'bar',
    data: {
        labels: Object.keys(tripadvisorBarChartReviewCountData),
        datasets: [
          {
            label: 'Average review rating',
            data: Object.values(tripadvisorBarChartReviewAverageData),
            backgroundColor: tripadvisorBarChartcoloursArray,
            options: { barThickness: 40 },
            yAxisID: 'right-y-axis'
          },
          {
            label: 'Number of reviews',
            data: Object.values(tripadvisorBarChartReviewCountData),
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
