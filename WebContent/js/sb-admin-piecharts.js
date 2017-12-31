// -- Pie Chart Example
var ctx = document.getElementById("myPieChart");
var myPieChart = new Chart(ctx, {
  type: 'pie',
  data: {
    labels: ["LTC++1", "LTC++2", "LTC++3", "LTC++4","LTC++5","LTC++6"],
    datasets: [{
      data: [12.21, 15.58, 11.25, 8.32,3.5,4.9],
      backgroundColor: ['#007bff', '#dc3545', '#ffc107', '#28a745','#270606','#2e5e8e'],
    }],
  },
});
// -- Pie Chart Example Autocad
var ctx = document.getElementById("myPieChartAutocad");
var myPieChart = new Chart(ctx, {
  type: 'pie',
  data: {
    labels: ["ATC1", "ATC2", "ATC3", "ATC4","ATC5"],
    datasets: [{
      data: [12.21, 15.58, 11.25, 8.32,3.5],
      backgroundColor: ['#007bff', '#dc3545', '#ffc107', '#28a745','#2e5e8e'],
    }],
  },
});