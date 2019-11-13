import Chart from 'chart.js';
import ChartDataLabels from 'chartjs-plugin-datalabels';

// Query the chart canvas elements on the page:
// let googleReviewsCountChartDisplay = document.querySelector('#googleReviewsCountChart')
// let googleReviewsRatingsChartDisplay = document.querySelector('#googleReviewsRatingsChart')
// let googleReviewsCountChartDisplay2 = document.querySelector('#googleReviewsCountChart2')

let googlePieChartDisplay = document.querySelector('#googlePieChart')
let googlePieChartData = googlePieChartDisplay.dataset.chartdata

console.log(typeof(googlePieChartData));
console.log(googlePieChartData);
console.log(googlePieChartData[1.0]);



// Google Reviews Count chart code
let googlePieChart = new Chart(googlePieChartDisplay, {
    type: 'doughnut',
    data: {
        labels: ['Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sept'],
        datasets: [{
            label: '# of reviews',
            data: [6, 8, 10, 7, 14, 12],
            backgroundColor: [
                'rgba(255, 99, 132)',
                'rgba(54, 162, 235)',
                'rgba(255, 206, 86)',
                'rgba(75, 192, 192)',
                'rgba(153, 102, 255)',
                'rgba(255, 159, 64)'
            ],
        }]
    },
    plugins: [ChartDataLabels],
    options: {
      plugins: {
        datalabels: {
            formatter: function(value, context) {
                return context.chart.data.labels[context.dataIndex];
            }
        }
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



// Google Reviews Count chart code
// let googleReviewsCountChart = new Chart(googleReviewsCountChartDisplay, {
//     type: 'horizontalBar',
//     data: {
//         labels: ['Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sept'],
//         datasets: [{
//             label: '# of reviews',
//             data: [6, 8, 10, 7, 14, 12],
//             backgroundColor: [
//                 'rgba(255, 99, 132)',
//                 'rgba(54, 162, 235)',
//                 'rgba(255, 206, 86)',
//                 'rgba(75, 192, 192)',
//                 'rgba(153, 102, 255)',
//                 'rgba(255, 159, 64)'
//             ],
//         }]
//     },
//     options: {
//       scales: {
//           xAxes: [{
//               ticks: {
//                   beginAtZero: true
//               }
//           }]
//       },
//       title: {
//         display: false,
//         text: "New Google reviews (previous 6 months)"
//       },
//       legend: {
//         display: false,
//       },
//     },
// });

// // Google Reviews Count chart code
// let googleReviewsCountChart2 = new Chart(googleReviewsCountChartDisplay2, {
//     type: 'horizontalBar',
//     data: {
//         labels: ['Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sept'],
//         datasets: [{
//             label: '# of reviews',
//             data: [6, 8, 10, 7, 14, 12],
//             backgroundColor: [
//                 'rgba(255, 99, 132)',
//                 'rgba(54, 162, 235)',
//                 'rgba(255, 206, 86)',
//                 'rgba(75, 192, 192)',
//                 'rgba(153, 102, 255)',
//                 'rgba(255, 159, 64)'
//             ],
//         }]
//     },
//     options: {
//       scales: {
//           xAxes: [{
//               ticks: {
//                   beginAtZero: true
//               }
//           }]
//       },
//       title: {
//         display: false,
//         text: "New Google reviews (previous 6 months)"
//       },
//       legend: {
//         display: false,
//       },
//     },
// });


// // Google Reviews Ratings chart code
// let googleReviewsRatingsChart = new Chart(googleReviewsRatingsChartDisplay, {
//     type: 'doughnut',
//     data: {
//         labels: ['1 star', '2 stars', '3 stars', '4 stars', '5 stars'],
//         datasets: [{
//             data: [6, 10, 13, 34, 10],
//             backgroundColor: [
//                 'rgba(245, 66, 66)',
//                 'rgba(245, 105, 66)',
//                 'rgba(245, 200, 66)',
//                 'rgba(118, 207, 83)',
//                 'rgba(54, 171, 48)'
//             ],
//         }]
//     },
//     options: {
//       title: {
//         display: false,
//         text: "Google Ratings"
//       },
//     },
// });


// ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sept', 'Oct', 'Nov', 'Dec']
