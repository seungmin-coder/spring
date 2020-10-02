const colors = ['red','yellow','blue','#c3e6cb','#dc3545','#6c757d'];

var ctx = document.getElementById('myChart');
var ctx = document.getElementsByClassName("myChart");

var chartData = {
  labels: ["S", "M", "T", "W", "T", "F", "S"],
  datasets: [{
	  label : 'Line Dataset',
    data: [589, 445, 483, 503, 689, 692, 634],
    backgroundColor: 'transparent',
    borderColor: colors[2],
    borderWidth: 3,
    pointBackgroundColor: colors[0]
  },
  {
	  label : 'Line Dataset',
    data: [346, 503, 609, 503, 589, 483, 445],
    backgroundColor: colors[1],
    borderColor: colors[0],
    borderWidth: 3,
    pointBackgroundColor: colors[0]
  }
  ]
};

var myChart = new Chart(ctx, {
    // 챠트 종류를 선택
    type: 'line',

    // 챠트를 그릴 데이타
    data: chartData,

    // 옵션
    options: {
      legend: {
        display: true
      }
    }
});

