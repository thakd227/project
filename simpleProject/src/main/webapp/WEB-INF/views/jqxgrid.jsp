<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.*"%>
<%@ page import="com.google.gson.*"%>
<html>
<head>


    <title id='Description'>This example shows how to enable the paging feature of the Grid.</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <link rel="stylesheet" href="/resources/jqwidgets/styles/jqx.base.css" type="text/css" />
    <meta name="viewport" content="width=device-width, initial-scale=1 maximum-scale=1 minimum-scale=1" />
    
	<script type="text/javascript" src="/resources/scripts/jquery-1.11.1.min.js"></script>
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


<script type="text/javascript">
             $(document).ready(function () {
                 // Create jqxTree
                 var sourced = {
                         datatype: "json",
                         datafields: [
                             {name: 'ARYL_ORD'},
                             {name: 'UP_LOCA_CD'},
                             {name: 'LOCA_CD'},
                             {name: 'LOCA_NM'}
                         ],
                         id: 'CliocaID',
                         url: '/grid/clioca',
                         async: false
                     };
                 
                     var dataAdapter1 = new $.jqx.dataAdapter(sourced);
                     dataAdapter1.dataBind();
                     var records = dataAdapter1.getRecordsHierarchy('LOCA_CD', 'UP_LOCA_CD', 'items',
                    		 [{
                    		   name : 'LOCA_NM', 
                    		   map : 'label' 
                    		 },
                    		 {
                    		   name: 'LOCA_CD',
                    		   map : 'id'
                    		 }]);
                     $('#jqxTree').jqxTree({
                         source: records,
                         /* width: '20%', */
                         height: '500px',
                         submitCheckedItems: true,
                         checkboxes: true
                     });          		
                     $('#ExpandAll').jqxButton({ height: '25px', width: '100px'});
                     $('#CollapseAll').jqxButton({ height: '25px', width: '100px'});
                               
                     
                 // Add 
                 $('#Add').click(function () {
                     var selectedItem = $('#jqxTree').jqxTree('selectedItem');
                     if (selectedItem != null) {
                         var name = "nCliocaScreen";
                         var option = "width = 800, height = 600, top = 100, left = 200";
     					 var selectData = {}; 
    					 
    					 selectData.LOCA_CD = selectedItem.id;
    		
    					 window.open("/grid/nCliocaScreen?LOCA_CD=" + selectedItem.id , name, option);
    					 /* window.open("/grid/selectClioca?LOCA_CD=" + selectData.LOCA_CD  , name, option); */
                     }
                     else {

                     }
                 });
                 
                 // Add 
                 $('#AddAfter').click(function () {
                     var selectedItem = $('#jqxTree').jqxTree('selectedItem');
                     if (selectedItem != null) {
                         var name = "aNewCliocaScreen";
                         var option = "width = 800, height = 600, top = 100, left = 200";
     					 var selectData = {}; 
    					 
    					 selectData.LOCA_CD = selectedItem.id;
    		
    					 window.open("/grid/aNewCliocaScreen" , name, option);
    					 /* window.open("/grid/selectClioca?LOCA_CD=" + selectData.LOCA_CD  , name, option); */
                     }
                     else {

                     }
                 });

                 // Update
                 $('#Update').click(function () {
                	// 선택한 아이템 PK값
                     var selectedItem = $("#jqxTree").jqxTree('getSelectedItem');
                     var name = "mClilocaScreen";
                     var option = "width = 800, height = 600, top = 100, left = 200";
 					 var selectData = {}; 
					 
					 selectData.LOCA_CD = selectedItem.id;
					 
					 window.open("/grid/mClilocaScreen?LOCA_CD=" + selectData.LOCA_CD  , name, option);
/*                  	// ajax process
                	$.ajax({
                		method: "POST",
                		url: "/grid/cliocaDtl",
                		data: JSON.stringify(selectData),
                		dataType: "json",
                		contentType:"application/json; charset=UTF-8",
                	    success: eventSuccess, 
                 		error: function(xhr, status, error) {alert(error);}  
                	});

                  	function eventSuccess(data)
                	{
                   		// GET으로 값 넘겨주기
                		var w = window.open("/grid/selectClioca?LOCA_CD=" + data.LOCA_CD + "&LOCA_NM=" + data.LOCA_NM + "&ARYL_ORD=" + data.ARYL_ORD + "&USE_YN=" + data.USE_YN
                				, name, option);  
                	}      */
                 });
                 
                 // Remove 
                 $('#Remove').click(function () {
                     var items = $('#jqxTree').jqxTree('getCheckedItems');
                     param = {};
                     var result = confirm("하위 목록까지 삭제하시겠습니까?");
                     if(result){
                         for (var i = 0; i < items.length; i++) {
                         	var item = items[i];
                            param.LOCA_CD = item.id;
         	               	$.ajax({
         	               		method: "POST", 
        	               		url: "/grid/deleteCliloca",
        	               		datatype: "json",
                        		data: JSON.stringify(param),
                        		contentType:"application/json; charset=UTF-8",
                        		success: function (data){
	                       			 console.log(data);
	                       			 
	                                 delete sourced.url;
	                                 sourced.id = "deleteCliloca";
	                                 sourced.localdata = data;
	                                 var dataAdapter1 = new $.jqx.dataAdapter(sourced);
	                                 dataAdapter1.dataBind();
	                                 var records = dataAdapter1.getRecordsHierarchy('LOCA_CD', 'UP_LOCA_CD', 'items',
	                                		 [{
	                                		   name : 'LOCA_NM', 
	                                		   map : 'label' 
	                                		 },
	                                		 {
	                                		   name: 'LOCA_CD',
	                                		   map : 'id'
	                                		 }]);
	                                 $('#jqxTree').jqxTree({
	                                     source: records,
	                                     /* width: '20%', */
	                                     height: '500px',
	                                     submitCheckedItems: true,
	                                     checkboxes: true
	                                 });          		
                        		}
         	               	});
                         };
                         alert("삭제되었습니다.");
                         $('#jqxTree').jqxTree("refresh");
                     }else{
                    	alert("취소되었습니다.");
                     };

                 });
                 // Expand All
                 $('#ExpandAll').click(function () {
                     $('#jqxTree').jqxTree('expandAll');
                 });
                 // Collapse All
                 $('#CollapseAll').click(function () {
                     $('#jqxTree').jqxTree('collapseAll');
                 });
                 $('#jqxTree').jqxTree('selectItem', $("#jqxTree").find('li:first')[0]);
                 $('#jqxTree').css('visibility', 'visible');
        
                 
                 /* 그리드 */
                 
                 
                 
                var sources = [
           				"zzz",
           				"ddd"
		        ];
                 
                
                var sensorListUrl = "/grid/sensor";
                // prepare the data
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
                   	async : true,
                    id: 'sensorId',
                    url: sensorListUrl,
                   /*  type: 'POST', */
                };
                
                var imagerenderer = function (row, datafield, value) {
                    return '<img style="margin: 0px;" width="50" src="http://www.jqwidgets.com/jquery-widgets-demo/images/unstoppable.png">';

                }
                
                
                var dataAdapter2 = new $.jqx.dataAdapter(source);

                
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
                    rendertoolbar: function (toolbar) {
                        var me = this;
                        var container = $("<div style='margin: 5px;'></div>");
                        toolbar.append(container);
                        container.append('<input id="addrowbutton" type="button" value="Add New Row" />');
                        container.append('<input style="margin-left: 5px;" id="deleterowbutton" type="button" value="Delete Selected Row" />');
                        container.append('<input style="margin-left: 5px;" id="excelExport" type="button" value="Excel Export" />');
                        container.append('<input style="float: right;" id="save" type="button" value="Save" />');
                        $("#addrowbutton").jqxButton();
                        $("#deleterowbutton").jqxButton();
                        $("#excelExport").jqxButton();
                        $("#save").jqxButton();
                        
                        // 삭제
                        $("#deleterowbutton").on('click', function () {
                            var selectedItem = $("#jqxTree").jqxTree('getSelectedItem');
                          	var rowindexes = $('#grid').jqxGrid('getselectedrowindexes');
                        	var rowIDs = {};
                        	 
                            for (var i = 0; i < rowindexes.length; i++)
                            {
                            	var id = $("#grid").jqxGrid('getrowdata', rowindexes[i]);  
            	            	//rowIDs.push(id.SENSOR_CD);
            	            	rowIDs.LOCA_CD = id.LOCA_CD;
            	            	rowIDs.UP_LOCA_CD = selectedItem.id;
	                             	$.ajax({
	                            		dataType: 'json',
	                            		type: 'POST',
	                            		url: 'grid/delete',
	                            		data: JSON.stringify(rowIDs),
	                            		contentType:"application/json; charset=UTF-8",
	                            		success: function (data) {
 	                                          delete source.url;
	                                          source.id = "deleteSensor";
	                                          source.localdata = data;
	                                          var dataAdapter = new $.jqx.dataAdapter(source);
	                                          $("#grid").jqxGrid({ source: dataAdapter }); 
	                                          $('#grid').jqxGrid('clearselection');
	                            		}
	                             	});
                            };  
                        });      

                        // ¿¢¼¿ ÀÍ½ºÆ÷Æ®
                        $("#excelExport").click(function () {
                     	   $("#grid").jqxGrid('exportdata', 'xlsx', 'jqxGrid');           
                        });
             
                        // Ãß°¡
                        $("#addrowbutton").on('click', function () {
	                     	
	                        var selectedItem = $("#jqxTree").jqxTree('getSelectedItem');
	       					var selectData = {}; 
	       					selectData.LOCA_CD = selectedItem.id;
       	                	// ajax process
	       	               	$.ajax({
        	               		method: "POST", 
	       	               		url: "/grid/insertSensor",
	       	               		data: JSON.stringify(selectData),
	       	               		dataType: "json",
	       	               		contentType:"application/json; charset=UTF-8",
	                       		success: function (data) {
	                       			 console.log(data);
		                             delete source.url;
		                             source.id = "addSesnsor";
		                             source.localdata = data;
		                             
		                             
		                             var dataAdapter = new $.jqx.dataAdapter(source);
		                             $("#grid").jqxGrid({ source: dataAdapter });
		                             $('#grid').jqxGrid({ selectedrowindex: 0});
	                       		},
	                       		error: function(xhr, status, error) {
	                       			alert(error);
	                       		}  
	                   		});
                    	});
                        
                        $("#save").on('click', function (e) {
                            var selectedItem = $("#jqxTree").jqxTree('getSelectedItem');
                           
                          	var rowindexes = $('#grid').jqxGrid('getselectedrowindexes');
                        	var rowIDs = {};
            				if (rowindexes.length === 0){
            					alert("체크된 데이터가 없습니다")
            				}else{
                            	for (var i = 0; i < rowindexes.length; i++)
                                {
                                	var id = $("#grid").jqxGrid('getrowdata', rowindexes[i]);  
                	            	//rowIDs.push(id.SENSOR_CD);
                	            	
                 	            	rowIDs.SENSOR_CD = id.SENSOR_CD;
                	            	rowIDs.SENSOR_NM = id.SENSOR_NM;
                	            	rowIDs.SENSOR_TYPE = id.SENSOR_TYPE;
                	            	rowIDs.ALARM_IMPRT = id.ALARM_IMPRT;
                	            	rowIDs.ALARM_YN = id.ALARM_YN;
                	            	rowIDs.LOCA_CD = id.LOCA_CD;
                	            	rowIDs.FNL_MDFC_DTM = id.FNL_MDFC_DTM;
                	            	rowIDs.UP_LOCA_CD = selectedItem.id; 
              	            	
                                  	$.ajax({
    	                           		dataType: 'json',
    	                           		type: 'POST',
    	                           		url: 'grid/updateSensor',
    	                           		data: JSON.stringify(rowIDs),
    	                           		contentType:"application/json; charset=UTF-8",
    	                           		success: function (data) {
                                             delete source.url;
                                             source.id = "updateSensor";
                                             source.localdata = data;
                                             var dataAdapter = new $.jqx.dataAdapter(source);
                                             $("#grid").jqxGrid({ source: dataAdapter }); 
                                             $('#grid').jqxGrid('clearselection');
    	                           		},
    	                           		error: function(error){
    	                           			alert("빈 값이 존재합니다.");
    	                           		}
                                	});  
                                };
            				}

                        });            
                    },
                    altrows: true,
                    editable: true,
                    editmode: 'click',
                    columns: [
                      { text: '센서코드',  datafield: 'SENSOR_CD', width: 130 },
                      { text: '센서명', columntype: 'textbox', datafield: 'SENSOR_NM', width: 170},
                      { text: '센서유형', columntype: 'dropdownlist', datafield: 'SENSOR_TYPE', width: 130 },
                      { text: '알람중요도', columntype: 'dropdownlist', datafield: 'ALARM_IMPRT', width: 130 },
                      { text: '알람여부', columntype: 'dropdownlist', datafield: 'ALARM_YN', width: 130 },
                      { text: '수정일시', columntype: 'datetimeinput', datafield: 'FNL_MDFC_DTM', width: 130, cellsformat : 'yyyy-MM-dd' },
                      { text: '이미지', columntype: 'button', datafield: 'IMAGE', width: 50 , cellsrenderer: imagerenderer}
                    ]
                }); 



                // 항목 클릭
                $('#jqxTree').on('itemClick',function (event) {
                	// 선택한 아이템 PK값
                     var selectedItem = $("#jqxTree").jqxTree('getSelectedItem');
					 var selectData = {}; 
					 selectData.LOCA_CD = selectedItem.id;
	                	// ajax process
	               	$.ajax({
 	               		method: "POST", 
	               		url: "/grid/sesnsorDtl",
	               		data: JSON.stringify(selectData),
	               		dataType: "json",
	               		contentType:"application/json; charset=UTF-8",
                		success: function (data) {

                            delete source.url;
                            source.id = "sesnsorDtl";
                            source.localdata = data;
                            
                            var dataAdapter = new $.jqx.dataAdapter(source);
                            $("#grid").jqxGrid({ source: dataAdapter });
                 		},
                		error: function(xhr, status, error) {
                			alert(error);
                		}  
            		});
	                	
	                	
				
           		 });
                
       	        
       	     	$('#grid').on('cellclick', function (event) {
       	     		
       	     		console.log(event.args.row.bounddata);
       	     			var LOCA_CD = event.args.row.bounddata.LOCA_CD;
       	     			var coordinates = event.args.row.bounddata.COORDINATES;
       	     			var alram_Yn = event.args.row.bounddata.ALARM_YN; 
                        var name = "coordinates";
                        var option = "width = 800, height = 600, top = 100, left = 200";
    					var selectData = {}; 
       	     		if (event.args.datafield == 'IMAGE'){
   					 window.open("/grid/coordinates?LOCA_CD=" + LOCA_CD , name, option);

       	     		}
/*              else if(event.args.datafield == 'IMAGE'  &&  coordinates == null  && coordinates == ''){
            	 // 좌표 등록
            	 window.open("/grid/coordinates?sensor_Cd=" + sensor_Cd , name, option);
            	 
            	 alert("값 전달 후 " + $("#test").val());
             } */
       	 	 });
                
                $("#chart").click(function (){
                    var url = "/grid/chart";
                    var name = "chart";
                    var option = "width = 800, height = 900, top = 100, left = 200"
                    window.open(url, name, option);
                });
 

                
                // 모드
                $("#modes").jqxDropDownList({width: 150, autoDropDownHeight: true, selectedIndex: 1, height: 25, source: ['Default', 'Simple'] });
                $("#modes").on('select', function (event) {
                    if (event.args.index === 0) {
                        $("#grid").jqxGrid({ pagermode: 'default' });
                    }
                    else {
                        $("#grid").jqxGrid({ pagermode: 'simple' });
                    }
                });                
});      

      
    </script>
</head>
<body class='default'>

	<div style='width: 20%; float: left;'>
		<div>
	       <input type="button" id='ExpandAll' value="Expand All" />
	       <input type="button" id='CollapseAll' value="Collapse All" />
        </div>
		위치 정보 <img id="chart" src="/images/chart.jpg" width="20" height="15" />
		<input type="button" id='Update' value="update" /> 
		<input type="button" id='AddAfter' value="addAfter" /> 
		<input type="button" id='Add' value="+" /> 
		<input type="button" id='Remove' value="-" />
		
		<div id="jqxTree"></div>
		<div style="margin-top: 5px;">
			<div>
				Pager Settings:
				<div id="modes"></div>
			</div>
		</div>
	</div>

	<div id="jqxGrid" style='width: 70%; float: right; margin-top: 40px;'>
		<div id="grid"></div>
	</div>
	
	<form id="testval" method="post"></form>
	
	<input type="hidden" id="addRow" name="addRow">
</body>
</html>

