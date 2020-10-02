var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
var options = { //지도를 생성할 때 필요한 기본 옵션
  	center: new kakao.maps.LatLng(37.54699, 127.09598), //지도의 중심좌표.
  	level: 5 //지도의 레벨(확대, 축소 정도)
};

  var map = new kakao.maps.Map(container, options); //지도 생성
  
  var clusterer = new kakao.maps.MarkerClusterer({
	  map:map,
	  averageCenter: true,
	  minLevel: 5
  });
   	

////////////////////////////////// 
// 공공체육시설 api 가져오기
 $(document).ready(function(){
	 
	 //본인 공공체육시설api 키 값
	 var myKey = "66557161716d696e34377069644d6b";
	 
	 $.ajax({
		 //json파일 연동
		 url : "resources/서울시 공공체육시설 현황(2019).json",
		 //GET방식으로 가져온다.
		 type: "GET",
		 dataType: "json",
		 success : function(data){
			 //제이슨과 연동해서 마커 표시하기 (위도,경도 불러와서)
			 //json파일에서, DATA부분을 쓸거다.
			 var markers = $(data.DATA).map(function(i, position){
				 var marker = new kakao.maps.Marker({
					 //json파일에서, ycode:위도   xcode:경도
					 position: new kakao.maps.LatLng(position.ycode, position.xcode),
					 //(클릭 가능 여부) true : 마커를 클릭했을때, 지도의 클릭 이벤트가 발생하지 않도록 막아준다.
					 clickable: true
				 });
				 
				 //띄울 인포윈도우 정의
				 var ivContent = '<div style="padding:3px; width:250px;">'
					 //보여주고 싶은 부분만 가져온다.
					 + position.nm + '<br>'
					 + position.addr + '<br>'
					 + position.tel
					 + '</div>'
					 //removeable속성을 true로 설정하면 인포윈도우를 닫을 수 있다.(닫힘버튼 생김)
					 //ivRemoveable = true;  
				 
				 //인포윈도우 생성
				 var infowindow = new kakao.maps.InfoWindow({
					 content : ivContent
					// removable: ivRemoveable
				 });
				 
				 //마커에 마우스 올리면, 인포윈도우 열림
				 kakao.maps.event.addListener(marker, 'mouseover', function(){
					 infowindow.open(map, marker);
				 });
				 
				 //마커에 마우스 내리면, 인포윈도우 닫힘
				 kakao.maps.event.addListener(marker, 'mouseout', function(){
					 infowindow.close();
				 })
				 return marker;
			 });
			 
			 //클러스터 클릭하면
			 kakao.maps.event.addListener(clusterer, 'clusterclick', function(cluster){
				 //레벨이 하나씩 줄어듬
				 var level = map.getLevel()-1;
				 map.setLevel(level, {anchor: cluster.getCenter()});
			 });
			 //클러스터에 마커를 더한다.
			clusterer.addMarkers(markers);
		 },
		 error: function(){
			 alert("통신실패 ㅠ")
		 }
	 });
 });
   	
   