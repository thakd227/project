<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<script type="text/javascript" src="/resources/scripts/jquery-1.11.1.min.js"></script>
	<script type="text/javascript" src="https://www.google.com/jsapi"></script>
	<script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <link rel="stylesheet" href="/resources/jqwidgets/styles/jqx.base.css" type="text/css" />
    <meta name="viewport" content="width=device-width, initial-scale=1 maximum-scale=1 minimum-scale=1" />
    
    <script type="text/javascript" src="/resources/jqwidgets/jqxcore.js"></script>
    <script type="text/javascript" src="/resources/jqwidgets/jqxdata.js"></script> 
    <script type="text/javascript" src="/resources/jqwidgets/jqxbuttons.js"></script>
    <script type="text/javascript" src="/resources/jqwidgets/jqxscrollbar.js"></script>
    <script type="text/javascript" src="/resources/jqwidgets/jqxlistbox.js"></script>
    <script type="text/javascript" src="/resources/jqwidgets/jqxcombobox.js"></script>
    <script type="text/javascript" src="/resources/jqwidgets/jqxdropdownlist.js"></script>
    <script type="text/javascript" src="/resources/jqwidgets/jqxmenu.js"></script>
    <script type="text/javascript" src="/resources/jqwidgets/jqxgrid.js"></script>
    <script type="text/javascript" src="/resources/jqwidgets/jqxgrid.edit.js"></script>  
    <script type="text/javascript" src="/resources/jqwidgets/jqxgrid.pager.js"></script>
    <script type="text/javascript" src="/resources/jqwidgets/jqxgrid.sort.js"></script>
    <script type="text/javascript" src="/resources/jqwidgets/jqxgrid.filter.js"></script>
    <script type="text/javascript" src="/resources/jqwidgets/jqxgrid.columnsresize.js"></script>
    <script type="text/javascript" src="/resources/jqwidgets/jqxgrid.selection.js"></script> 
    <script type="text/javascript" src="/resources/jqwidgets/jqxpanel.js"></script>
    <script type="text/javascript" src="/resources/jqwidgets/jqxcheckbox.js"></script>
    <script type="text/javascript" src="/resources/jqwidgets/jqxcalendar.js"></script>
	<script type="text/javascript" src="/resources/jqwidgets/jqxtree.js"></script>
 	<script type="text/javascript" src="/resources/jqwidgets/jqxwindow.js"></script>
    
    <script type="text/javascript" src="/resources/jqwidgets/jqxformattedinput.js"></script>
    <script type="text/javascript" src="/resources/jqwidgets/jqxnumberinput.js"></script>
    <script type="text/javascript" src="/resources/jqwidgets/jqxdatetimeinput.js"></script> 
    <script type="text/javascript" src="/resources/jqwidgets/globalization/globalize.js"></script>
    <script type="text/javascript" src="/resources/jqwidgets/jqxexpander.js"></script>
    
    <script type="text/javascript" src="/resources/scripts/demos.js"></script>
    <script type="text/javascript" src="/resources/jqwidgets/jqxdata.export.js"></script> 
    <script type="text/javascript" src="/resources/jqwidgets/jqxgrid.export.js"></script> 
	<script type="text/javascript" src="/resources/jqwidgets/jqxexport.js"></script>    
    <script type="text/javascript" src="/sampledata/generatedata.js"></script>
    <script type="text/javascript" src="/resources/scripts/jszip.min.js"></script>
</head>
<body>
	<script type="text/javascript">
		$(document).ready(function() {
			
            var source =
            {

                datatype: "json",       
                datafields:
                [
                    { name: 'LOCA_CD', type: 'string' },
                    { name: 'SENSOR_CD', type: 'string' },
                    { name: 'SENSOR_NM', type: 'string' },     
                    { name: 'SENSOR_TYPE', type: 'string' },     
                    { name: 'ALARM_IMPRT', type: 'string' },     
                    { name: 'ALARM_YN', type: 'string' },     
                    { name: 'FNL_MDFC_DTM', type: 'date' },     
                    { name: 'COORDINATES', type: 'string' },     
                ],
               	async : false,
            };
            
            var dataAdapter2 = new $.jqx.dataAdapter(source);
            var imagerenderer = function (row, datafield, value) {
                return '<img style="margin: 0px;" width="50" src="http://www.jqwidgets.com/jquery-widgets-demo/images/unstoppable.png">';

            }
   	        $("#grid").jqxGrid(
   	                {
   	                     width: '900px',
   	                    /* width: getWidth('Grid'), */
   	                    source: dataAdapter2,
   	                    sortable: true,
   	                    pageable: true,
   	                    pagermode: 'simple',
   	                    autoheight: true,
   	                    columnsresize: true,
   	                    selectionmode: 'checkbox',
   	                    showtoolbar: true,
   	                    altrows: true,
   	                    editmode: 'click',
   	                    columns: [
   	                      { text: '센서코드',  datafield: 'SENSOR_CD', width: 130 },
   	                      { text: '센서명', columntype: 'textbox', datafield: 'SENSOR_NM', width: 170 },
   	                      { text: '센서유형', columntype: 'dropdownlist', datafield: 'SENSOR_TYPE', width: 130 },
   	                      { text: '알람중요도', columntype: 'dropdownlist', datafield: 'ALARM_IMPRT', width: 130 },
   	                      { text: '알람여부', columntype: 'dropdownlist', datafield: 'ALARM_YN', width: 130 },
   	                      { text: '수정일시', columntype: 'datetimeinput', datafield: 'FNL_MDFC_DTM', width: 130, cellsformat : 'yyyy-MM-dd' },
   	                      { text: '이미지', columntype: 'button', datafield: 'IMAGE', width: 50 , cellsrenderer: imagerenderer}
   	                      /* { text: '이미지', columntype: 'Image', datafield: 'IMAGE', width: 50 , cellsrenderer: imagerenderer} */
   	                    ]
   	                }); 
        
			google.charts.load('current', {
				'packages' : [ 'corechart' ]
			});
			google.charts.setOnLoadCallback(drawChart);

			function drawChart() {
				var jsonData = $.ajax({
					url : "/grid/chart2",
					datatype : "json",
					async : false,
					success : function(data) {
						/* alert(data); */
					}
				}).responseText;

				//json 데이터를 데이터 테이블로 변환
				var data = new google.visualization.DataTable(
						jsonData);

				var bar_options = {
					'title' : 'BAR',
					'width' : 800,
					'height' : 300,
					vAxis : {
						title : '개수'
					},
					hAxis : {
						title : '위치',
					}
				}

				var bar_chart = new google.visualization.ColumnChart(
						document.getElementById('barchart_div'));
				bar_chart.draw(data, bar_options);
				google.visualization.events.addListener(
						bar_chart, 'select', function(e) {
							var selectedItem = bar_chart.getSelection()[0];
							if (selectedItem) {
								var loca_cd = data.getValue(selectedItem.row, 0);
								loca_cd = loca_cd.replace(/\n/g, "");//엔터제거

								var array = [];
								array = loca_cd.split("(");
								loca_cd = array[1];
								array = loca_cd.split(")");
								loca_cd = array[0];
								
								
								 var selectData = {}; 
								 selectData.LOCA_CD = loca_cd;
				               	$.ajax({
			 	               		method: "POST", 
				               		url: "/grid/sesnsorDtl",
				               		data: JSON.stringify(selectData),
				               		dataType: "json",
				               		contentType:"application/json; charset=UTF-8",
			                		success: function (data) {
                            			
                                         source.localdata = data;
                                         var dataAdapter = new $.jqx.dataAdapter(source);
                                         $("#grid").jqxGrid({ source: dataAdapter }); 
			                 		},
			                		error: function(xhr, status, error) {
			                			alret("실패");
			                		}  
			            		});
							}
						});
			};
		});
	</script>
	<div id="barchart_div"></div>
	
	<div id="grid"></div>	
</body>
</html>