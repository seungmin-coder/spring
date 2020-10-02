

var chartDrowFun = {
 
    chartDrow : function(){
        //var chartData = '';
 
        //날짜형식 변경하고 싶으시면 이 부분 수정하세요.
        var chartDateformat = 'yyyy-MM-dd';
        //라인차트의 라인 수
        var chartLineCount = 10;
        //컨트롤러 바 차트의 라인 수
        var controlLineCount = 10;
 
       
        function drawDashboard() {
        	var jsonData = $.ajax({
        		url : "InbodyController.do",
        		method : "post",
        		data : {"command":"inbody", "mb_no":"1"},
        		//dataType : "json",
        		async: false  // 동기식
        	});
        	
          var data = new google.visualization.DataTable();
          console.log(jsonData);
        
       // Declare columns
          data.addColumn('string', 'Employee Name');
          data.addColumn('datetime', 'Hire Date');

          // Add data.
          data.addRows([
            ['Mike', {v:new Date(2008,1,28), f:'February 28, 2008'}], // Example of specifying actual and formatted values.
            ['Bob', new Date(2007,5,1)],                              // More typically this would be done using a
            ['Alice', new Date(2006,7,16)],                           // formatter.
            ['Frank', new Date(2007,11,28)],
            ['Floyd', new Date(2005,3,13)],
            ['Fritz', new Date(2011,6,1)]
          ]);

 
 
            var chart = new google.visualization.ChartWrapper({
              chartType   : 'LineChart',
              containerId : 'lineChartArea', //라인 차트 생성할 영역
              options     : {
                              isStacked   : 'percent',
                              focusTarget : 'category',
                              height          : 500,
                              width              : '100%',
                              legend          : { position: "top", textStyle: {fontSize: 13}},
                              pointSize        : 5,
                              tooltip          : {textStyle : {fontSize:12}, showColorCode : true,trigger: 'both'},
                              hAxis              : {format: chartDateformat, gridlines:{count:chartLineCount,units: {
                                                                  years : {format: ['yyyy년']},
                                                                  months: {format: ['MM월']},
                                                                  days  : {format: ['dd일']}    
                                                                  
                                                                },textStyle: {fontSize:12}},
                vAxis              : {minValue: 100,viewWindow:{min:0},gridlines:{count:-1},textStyle:{fontSize:12}},
                animation        : {startup: true,duration: 1000,easing: 'in' },
                annotations    : {pattern: chartDateformat,
                                textStyle: {
                                fontSize: 15,
                                bold: true,
                                italic: true,
                                color: '#871b47',
                                auraColor: '#d799ae',
                                opacity: 0.8,
                                pattern: chartDateformat
                                }
                			}	
                     }
              }
            });
 
            var control = new google.visualization.ControlWrapper({
              controlType: 'ChartRangeFilter',
              containerId: 'controlsArea',  //control bar를 생성할 영역
              options: {
                  ui:{
                        chartType: 'LineChart',
                        chartOptions: {
                        chartArea: {'width': '60%','height' : 80},
                          hAxis: {'baselineColor': 'none', format: chartDateformat, textStyle: {fontSize:12},
                            gridlines:{count:controlLineCount,units: {
                                  years : {format: ['yyyy년']},
                                  months: {format: ['MM월']},
                                  days  : {format: ['dd일']}
                                  
                            }}
                        }
                  },
                    filterColumnIndex: 0
                }
              }
            });
 
            var date_formatter = new google.visualization.DateFormat({ pattern: chartDateformat});
            date_formatter.format(data, 0);
 
            var dashboard = new google.visualization.Dashboard(document.getElementById('Line_Controls_Chart'));
            window.addEventListener('resize', function() { dashboard.draw(data); }, false); //화면 크기에 따라 그래프 크기 변경
            dashboard.bind([control], [chart]);
            dashboard.draw(data);
 
        }
          google.charts.setOnLoadCallback(drawDashboard);
 
      }
    }
 
$(document).ready(function(){
  google.charts.load('current', {'packages':['line','controls']});
  chartDrowFun.chartDrow(); //chartDrow() 실행
});