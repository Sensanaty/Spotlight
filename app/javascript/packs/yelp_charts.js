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
let yelpBarChartReviewCountData = JSON.parse(yelpBarChartDisplay.dataset.reviewcountdata)
let yelpBarChartReviewAverageData = JSON.parse(yelpBarChartDisplay.dataset.reviewaveragedata)
let yelpBarChartcoloursArray = []

yelpBarChartReviewAverageData.forEach(function(rating, index) {
  if (rating > 4 && rating <= 5) {
    yelpBarChartcoloursArray[index] = "rgba(95, 186, 74,0.7)"
  } else if (rating > 3 && rating <= 4) {
    yelpBarChartcoloursArray[index] = "rgba(166, 217, 89,0.7)"
  } else if (rating > 2 && rating <= 3) {
    yelpBarChartcoloursArray[index] = "rgba(237, 202, 85,0.7)"
  } else if (rating > 1 && rating <= 2) {
    yelpBarChartcoloursArray[index] = "rgba(237, 123, 85,0.7)"
  } else if (rating > 0 && rating <= 1) {
    yelpBarChartcoloursArray[index] = "rgba(217, 68, 61, 0.7)"
  }
});

// yelp Reviews Count chart code
let yelpBarChart = new Chart(yelpBarChartDisplay, {
    type: 'bar',
    data: {
        labels: Object.keys(yelpBarChartReviewCountData),
        datasets: [
          {
            label: 'Average review rating',
            data: Object.values(yelpBarChartReviewAverageData),
            backgroundColor: yelpBarChartcoloursArray,
            options: { barThickness: 40 },
            yAxisID: 'right-y-axis'
          },
          {
            label: 'Number of reviews',
            data: Object.values(yelpBarChartReviewCountData),
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
              }]
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
