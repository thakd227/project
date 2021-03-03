<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8">
    <title>Static Image</title>
    <!-- The line below is only needed for old environments like Internet Explorer and Android 4.x -->
    <script src="https://cdn.polyfill.io/v3/polyfill.min.js?features=fetch,requestAnimationFrame,Element.prototype.classList,URL,TextDecoder"></script>
    <link rel="stylesheet" href="styles.css"> 
    <link rel="stylesheet" href="libs/v6.5.0-dist/ol.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js"></script>
    <script src="http://maps.stamen.com/js/tile.stamen.js?v1.3.0"></script>
    <script src="main.js"></script>
    <script src="libs/v6.5.0-dist/ol.js"></script>
	<script type="text/javascript" src="JBMap/JBMap.js"></script>  
    
    
    
    
   <link rel="stylesheet" href="/resources/jqwidgets/styles/jqx.base.css" type="text/css" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1 maximum-scale=1 minimum-scale=1" />
    	<script type="text/javascript" src="/resources/scripts/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="/resources/jqwidgets/jqxcore.js"></script>
    <script type="text/javascript" src="/resources/jqwidgets/jqxdata.js"></script> 
    <script type="text/javascript" src="/resources/jqwidgets/jqxbuttons.js"></script>
    <script type="text/javascript" src="/resources/jqwidgets/jqxscrollbar.js"></script>
    <script type="text/javascript" src="/resources/jqwidgets/jqxlistbox.js"></script>
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

    
    <script type="text/javascript" src="/resources/jqwidgets/jqxnumberinput.js"></script>
    <script type="text/javascript" src="/resources/jqwidgets/jqxdatetimeinput.js"></script> 
    <script type="text/javascript" src="/resources/jqwidgets/globalization/globalize.js"></script>
    
    
    <script type="text/javascript" src="/resources/scripts/demos.js"></script>
    <script type="text/javascript" src="/resources/jqwidgets/jqxdata.export.js"></script> 
    <script type="text/javascript" src="/resources/jqwidgets/jqxgrid.export.js"></script> 
	<script type="text/javascript" src="/resources/jqwidgets/jqxexport.js"></script>    
    <script type="text/javascript" src="/sampledata/generatedata.js"></script>
    <script type="text/javascript" src="/resources/scripts/jszip.min.js"></script>
    
    <script type="text/javascript">
             $(document).ready(function () {
                
                 
                // prepare the data
                var data = generatedata(200);
                var source =
                {
                    localdata: data,
                    datatype: "array",
                    updaterow: function (rowid, rowdata, commit) {
                        // synchronize with the server - send update command
                        // call commit with parameter true if the synchronization with the server is successful 
                        // and with parameter false if the synchronization failder.
                        commit(true);
                    },                    
                    datafields:
                    [
                        { name: 'firstname', type: 'string' },
                        { name: 'lastname', type: 'string' },
                        { name: 'productname', type: 'string' },
                        { name: 'available', type: 'bool' },
                        { name: 'date', type: 'date' },	
                        { name: 'quantity', type: 'number' },
                        { name: 'price', type: 'number' }
                    ],

                    root: "entry",
                    record: "content",
                    id: 'm\\:properties>d\\:OrderID',
                    
                    
                    
                    pager: function (pagenum, pagesize, oldpagenum) {
                        // callback called when a page or page size is changed.
                    },
                    addrow: function (rowid, rowdata, position, commit) {
                        // synchronize with the server - send insert command
                        // call commit with parameter true if the synchronization with the server is successful 
                        //and with parameter false if the synchronization failed.
                        // you can pass additional argument to the commit callback which represents the new ID if it is generated from a DB.
                        commit(true);
                    },
                    deleterow: function (rowid, commit) {
                        // synchronize with the server - send delete command
                        // call commit with parameter true if the synchronization with the server is successful 
                        //and with parameter false if the synchronization failed.
                        commit(true);
                    },
                    updaterow: function (rowid, newdata, commit) {
                        // synchronize with the server - send update command
                        // call commit with parameter true if the synchronization with the server is successful 
                        // and with parameter false if the synchronization failed.
                        commit(true);
                    }
                };
                var dataAdapter = new $.jqx.dataAdapter(source);
                
                $("#grid").jqxGrid(
                {
                    width: getWidth('Grid'),
                    source: dataAdapter,
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
                        $("#addrowbutton").jqxButton();
                        $("#deleterowbutton").jqxButton();
                        $("#excelExport").jqxButton();
                    },
                    altrows: true,
                    editable: true,
                    columns: [
                      { text: 'First Name', columntype: 'textbox', datafield: 'firstname', width: 130 },
                      { text: 'Last Name', columntype: 'textbox', datafield: 'lastname', width: 130 },
                      { text: 'Product', columntype: 'dropdownlist', datafield: 'productname', width: 200 },
                      { text: 'Available', datafield: 'available', columntype: 'checkbox', width: 67, cellsalign: 'center', align: 'center' },
/*                    { text: 'Ship Date', datafield: 'date', width: 120, align: 'right', cellsalign: 'right', cellsformat: 'd' }, */
                      { text: 'Ship Date', datafield: 'date', columntype: 'datetimeinput', width: 110, align: 'right', cellsalign: 'right', cellsformat: 'd'}, 
                      { text: 'Quantity', datafield: 'quantity', columntype: 'numberinput', width: 70, align: 'right', cellsalign: 'right' },
                      { text: 'Price', datafield: 'price', cellsalign: 'right', align: 'right', columntype: 'numberinput', cellsformat: 'c2' }
                    ]
                }); 
                         
                // 추가
                $("#addrowbutton").on('click', function () {
                    var commit = $("#grid").jqxGrid ('addrow', null, {}, 'first');
                });            
                
                
                // 삭제
                $("#deleterowbutton").on('click', function () {
                 	//$('#grid').jqxGrid('refreshdata');
                	//$('#grid').jqxGrid('refresh'); 
                	//$('#grid').jqxGrid('render'); 
                	
                  	var rowindexes = $('#grid').jqxGrid('getselectedrowindexes');
                	var rowIDs = [];
                    for (var i = 0; i < rowindexes.length; i++)
                    {
                	// 선택한 데이터 id값 가져오기
                    	var id = $("#grid").jqxGrid('getrowid', rowindexes[i]);  
    	            	rowIDs.push(id);
                    } 
                	// 선택한 데이터 삭제
                	$("#grid").jqxGrid('deleterow', rowIDs); 

      
                	//$('#grid').jqxGrid('refresh'); 
                	//$('#grid').jqxGrid('render');  
                });
            // 엑셀 익스포트
            $("#excelExport").click(function () {
         	   $("#grid").jqxGrid('exportdata', 'xlsx', 'jqxGrid');           
            });

        });
    </script>


  </head>
  <body>
  
    <div id="map" class="map">
    	<div id="popup">
    	</div>
    </div>
    
    <div>
	    <div id="grid">
	    </div>
  	</div>

  </body>
</html>



