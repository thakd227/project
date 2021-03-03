<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <title id='Description'>This example shows how to enable the paging feature of the Grid.</title>
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
 	<script type="text/javascript" src="/resources/jqwidgets/jqxwindow.js"></script>
    
    <script type="text/javascript" src="/resources/jqwidgets/jqxformattedinput.js"></script>
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
                 
                 // Create jqxTree
                 $('#jqxTree').jqxTree({ height: '400px', hasThreeStates: true, checkboxes: true, width: '330px'});
                 
/*                  $('#jqxTree').bind('select', function (event) {
                     var selItem = $('#jqxTree').jqxTree('getSelectedItem');
                     $("body").append(selItem.label + "<br />");
                 }); */
                 
                 // Add 
                 $('#Add').click(function () {
                     var selectedItem = $('#jqxTree').jqxTree('selectedItem');
                     if (selectedItem != null) {
                         // adds an item with label: 'item' as a child of the selected item. The last parameter determines whether to refresh the Tree or not.
                         // If you want to use the 'addTo' method in a loop, set the last parameter to false and call the 'render' method after the loop.
                         $('#jqxTree').jqxTree('addTo', { label: 'New Label' }, selectedItem.element, false);
                         // update the tree.
                         $('#jqxTree').jqxTree('render');
                     }
                     else {
                         $('#jqxTree').jqxTree('addTo', { label: 'New Label' }, null, false);
                         // update the tree.
                         $('#jqxTree').jqxTree('render');
                     }
                 });
                 // Add Before
                 $('#AddBefore').click(function () {
                     var selectedItem = $('#jqxTree').jqxTree('selectedItem');
                     if (selectedItem != null) {
                         $('#jqxTree').jqxTree('addBefore', { label: 'New Label' }, selectedItem.element, false);
                         // update the tree.
                         $('#jqxTree').jqxTree('render');
                     }
                 });
                 // Add After
                 $('#AddAfter').click(function () {
                     var selectedItem = $('#jqxTree').jqxTree('selectedItem');
                     if (selectedItem != null) {
                         $('#jqxTree').jqxTree('addAfter', { label: 'New Label' }, selectedItem.element, false);
                         // update the tree.
                         $('#jqxTree').jqxTree('render');
                     }
                 });
                 // Update
                 $('#Update').click(function () {
                     $('#jqxTree').jqxTree('getSelectedItem').label = $("#itemName").val();
                     var selectedElement = $("#jqxTree").jqxTree('getSelectedItem').element;
                     
                     if ($('#itemName').val() != ''){
                     	$("#" + selectedElement.id + " .jqx-tree-item:first").text($("#itemName").val());
                     }
                     
                     $('#itemName').val('');
                 });
                 // Remove 
                 $('#Remove').click(function () {
                     var items = $('#jqxTree').jqxTree('getCheckedItems');
                     for (var i = 0; i < items.length; i++) {
                         var item = items[i];
                         $('#jqxTree').jqxTree('removeItem', item.element, false);
                         // update the tree.
                         $('#jqxTree').jqxTree('render');
                     }
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
                 

                 
                 
                // prepare the data
                var data = generatedata(200); 
                var source =
                {
                    /* localdata: data, */     
                    datafields:
                    [
/*                         { name: 'SENSOR_CD', type: 'string' },
                        { name: 'SENSOR_NM', type: 'string' }    */
                        { name: 'firstname', type: 'string' },
                        { name: 'lastname', type: 'string' },
                        { name: 'productname', type: 'string' },
                        { name: 'available', type: 'bool' },
                        { name: 'date', type: 'date' },	
                        { name: 'quantity', type: 'number' },
                        { name: 'price', type: 'number' } 
                    ],
                   
                    datatype: "array",
                    
                    
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
                   /*  width: getWidth('Grid'), */
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
/*                       { text: 'Sensor Cd', columntype: 'textbox', datafield: 'SENSOR_CD', width: 130 },
                      { text: 'Sensor Nm', columntype: 'textbox', datafield: 'SENSOR_NM', width: 130 }, */
                      
                      
                      { text: 'First Name', columntype: 'textbox', datafield: 'firstname', width: 130 },
                      { text: 'Last Name', columntype: 'textbox', datafield: 'lastname', width: 130 },
                      { text: 'Product', columntype: 'dropdownlist', datafield: 'productname', width: 200 },
                      { text: 'Available', datafield: 'available', columntype: 'checkbox', width: 67, cellsalign: 'center', align: 'center' },
                      { text: 'Ship Date', datafield: 'date', columntype: 'datetimeinput', width: 110, align: 'right', cellsalign: 'right', cellsformat: 'd'}, 
                      { text: 'Quantity', datafield: 'quantity', columntype: 'numberinput', width: 70, align: 'right', cellsalign: 'right' },
                      { text: 'Price', datafield: 'price', cellsalign: 'right', align: 'right', columntype: 'numberinput', cellsformat: 'c2' } 
                    ]
                }); 
                
                
                
                $("#grid").on('celldoubleclick', function (event) {
                    // open the popup window when the user clicks a button.
                    editrow = event.args.rowindex;
                    var offset = $("#grid").offset();
                    $("#popupWindow").jqxWindow({ position: { x: parseInt(offset.left) + 300, y: parseInt(offset.top) + 300} });
                    // get the clicked row's data and initialize the input fields.
                    var dataRecord = $("#grid").jqxGrid('getrowdata', editrow);
                    
                    var firstName = dataRecord.firstname;  
                    var lastName = dataRecord.lastName;  
                    var product = dataRecord.product;  
                    var available = dataRecord.available; 
                    var date = dataRecord.date;  
                    var quantity = dataRecord.quantity; 
                    var price = dataRecord.price;   
                    

                    console.log(dataRecord.price);
                    console.log(dataRecord.available);
                    
                    $("#firstName").val(dataRecord.firstname);
                    $("#lastName").val(dataRecord.lastname);
                    $("#product").val(dataRecord.productname);
                    if (available == "true"){
                    	$("#available").prop("checked", true);
                    }
                    
                    $("#date").jqxDateTimeInput(dataRecord.date);
                    $("#quantity").jqxFormattedInput({ width: 250, height: 25,  value: dataRecord.quantity, spinButtons: true, dropDown: true });
                    $("#price").jqxFormattedInput({ width: 250, height: 25, value: dataRecord.price, spinButtons: true, dropDown: true }); 
                    
/*                     $("input[name='ipName']").val(firstName);  
                    $("input[name='ipAge']").val(lastName);  
                    $("input[name='ipAddress']").val(product);  
                    $("input[name='ipPhone']").val(available);  
                    $("input[name='ipBirthday']").val(date);  
                    $("input[name='ipAllowance']").val(quantity);  
                    $("input[name='ipGender']").val(price);   */

                    
                    // show the popup window.
                    $("#popupWindow").jqxWindow('open');
                });
                
                // initialize the popup window and buttons.
                $("#popupWindow").jqxWindow({
                    width: 500, height: 350, resizable: false,  isModal: true, autoOpen: false, cancelButton: $("#Cancel"), modalOpacity: 0.01
                });


                $("#Cancel").jqxButton({ theme: theme });

                
                
                // initialize the popup window and buttons.
                //$("#popupWindow").jqxWindow({ width: 250, resizable: false, theme: theme, isModal: true, autoOpen: false, cancelButton: $("#Cancel"), modalOpacity: 0.01 });
                
 
                
                // ÆäÀÌÁö
                $("#modes").jqxDropDownList({width: 150, autoDropDownHeight: true, selectedIndex: 1, height: 25, source: ['Default', 'Simple'] });
                $("#modes").on('select', function (event) {
                    if (event.args.index === 0) {
                        $("#grid").jqxGrid({ pagermode: 'default' });
                    }
                    else {
                        $("#grid").jqxGrid({ pagermode: 'simple' });
                    }
                });                
                
            // ¿¢¼¿ ÀÍ½ºÆ÷Æ®
            $("#excelExport").click(function () {
         	   $("#grid").jqxGrid('exportdata', 'xlsx', 'jqxGrid');           
            });
 
            
/*             $("#jqxGrid").hide();    
            $("#button").hide();    
            
            $("#jqxTree").click(function (){
             	$("#jqxGrid").show();
	    	    $("#button").show(); 
	    	    
	    	    // ÀüÃ¼ µ¥ÀÌÅÍ ¼ö °¡Á®¿À±â
	    	    var rowscount = $("#grid").jqxGrid('getdatainformation').rowscount;            	
                source.localdata = generatedata(rowscount);
                // passing "cells" to the 'updatebounddata' method will refresh only the cells values when the new rows count is equal to the previous rows count.
                $("#grid").jqxGrid('updatebounddata', 'cells');
       	    });  */
            
            // Ãß°¡
            $("#addrowbutton").on('click', function () {
                var commit = $("#grid").jqxGrid ('addrow', null, {}, 'first');
            });            
            
            
            // »èÁ¦
            $("#deleterowbutton").on('click', function () {
            	
              	var rowindexes = $('#grid').jqxGrid('getselectedrowindexes');
            	var rowIDs = [];
                for (var i = 0; i < rowindexes.length; i++)
                {
            		// ¼±ÅÃÇÑ µ¥ÀÌÅÍ id°ª °¡Á®¿À±â
                	var id = $("#grid").jqxGrid('getrowid', rowindexes[i]);  
	            	rowIDs.push(id);
                } 
            	// ¼±ÅÃÇÑ µ¥ÀÌÅÍ »èÁ¦
            	$("#grid").jqxGrid('deleterow', rowIDs); 
            });
        });
    </script>
</head>
<body class='default'>
    <div>
        	업데이트 :
        <input type = "text" id = "itemName" />
    </div>
	<div id='jqxWidget'>
		<div style='float: left; width: 100%;'>
			<div id='jqxTree'
				style='visibility: hidden; float: left; margin-left: 20px;'>
				<ul>
					<li id='home' item-selected='true'>Home</li>
					<li item-expanded='true'>Solutions
						<ul>
							<li>Education</li>
							<li>Financial services</li>
							<li>Government</li>
							<li>Manufacturing</li>
							<li>Solutions
								<ul>
									<li>Consumer photo and video</li>
									<li>Mobile</li>
									<li>Rich Internet applications</li>
									<li>Technical communication</li>
									<li>Training and eLearning</li>
									<li>Web conferencing</li>
								</ul>
							</li>
							<li>All industries and solutions</li>
						</ul>
					</li>
					<li>Products
						<ul>
							<li>PC products</li>
							<li>Mobile products</li>
							<li>All products</li>
						</ul>
					</li>
					<li>Support
						<ul>
							<li>Support home</li>
							<li>Customer Service</li>
							<li>Knowledge base</li>
							<li>Books</li>
							<li>Training and certification</li>
							<li>Support programs</li>
							<li>Forums</li>
							<li>Documentation</li>
							<li>Updates</li>
						</ul>
					</li>
					<li>Communities
						<ul>
							<li>Designers</li>
							<li>Developers</li>
							<li>Educators and students</li>
							<li>Partners</li>
							<li>By resource
								<ul>
									<li>Labs</li>
									<li>TV</li>
									<li>Forums</li>
									<li>Exchange</li>
									<li>Blogs</li>
									<li>Experience Design</li>
								</ul>
							</li>
						</ul>
					</li>
					<li>Company
						<ul>
							<li>About Us</li>
							<li>Press</li>
							<li>Investor Relations</li>
							<li>Corporate Affairs</li>
							<li>Careers</li>
							<li>Showcase</li>
							<li>Events</li>
							<li>Contact Us</li>
							<li>Become an affiliate</li>
						</ul>
					</li>
				</ul>
			</div>
			<div style='margin-left: 10px; float: left;'>
				<div style='margin-top: 10px;'>
					<input type="button" id='Add' value="Add" />
				</div>
				<div style='margin-top: 10px;'>
					<input type="button" id='AddAfter' value="Add After" />
				</div>
				<div style='margin-top: 10px;'>
					<input type="button" id='AddBefore' value="Add Before" />
				</div>
				<div style='margin-top: 10px;'>
					<input type="button" id='Update' value="Update" />
				</div>
				<div style='margin-top: 10px;'>
					<input type="button" id='Remove' value="Remove" />
				</div>
				<div style='margin-top: 10px;'>
					<input type="button" id='ExpandAll' value="Expand All" />
				</div>
				<div style='margin-top: 10px;'>
					<input type="button" id='CollapseAll' value="Collapse All" />
				</div>
			</div>
		</div>

		<div id="jqxGrid">
			<div id="grid">
			</div>
			
			      <div id="popupWindow">
            <div>Edit</div>
            <div style="overflow: hidden;">
                <table>
                    <tr>
                        <td align="right">First Name:</td>
                        <td align="left"><input id="firstName" /></td>
                    </tr>
                    <tr>
                        <td align="right">Last Name:</td>
                        <td align="left"><input id="lastName" /></td>
                    </tr>
                    <tr>
                        <td align="right">productname:</td>
                        <td align="left"><input id="product" /></td>
                    </tr>
                    <tr>
                    
                        <td align="right">available:</td>
                        <td align="left"><input id="available" /></td>
                    </tr>
                    <tr>
                        <td align="right">date:</td>
                        <td align="left"><input id="date" /></td>
                    </tr>
                    <tr>
                        <td align="right">Quantity:</td>
                        <td align="left">
                        	<div id="quantity">
                        		<input type="text" />
                        	<div>
        					</div>
    						</div>
    					</td>
                    </tr>
                    <tr>
                        <td align="right">Price:</td>
                        <td align="left"><div id="price">
                        		<input type="text" />
                        	<div>
        					</div>
    						</div>
    					</td>
                    </tr>
                    <tr>
                        <td align="right"></td>
                        <td style="padding-top: 10px;" align="right"><input id="Cancel" type="button" value="Cancel" /></td>
                    </tr>
                </table>
            </div>
       </div>
			
			
			<div style="margin-top: 5px;">
				<div>
					Pager Settings:
					<div id="modes"></div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>

 
 <!-- 
 <!DOCTYPE html>
<html lang="en">
<head>
    <title id='Description'>jQuery Tree Sample</title>
    <link rel="stylesheet" href="/resources/jqwidgets/styles/jqx.base.css" type="text/css" />
	<script type="text/javascript" src="/resources/scripts/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="/resources/jqwidgets/jqxcore.js"></script>
    <script type="text/javascript" src="/resources/jqwidgets/jqxbuttons.js"></script>
    <script type="text/javascript" src="/resources/jqwidgets/jqxscrollbar.js"></script>
    <script type="text/javascript" src="/resources/jqwidgets/jqxpanel.js"></script>
    <script type="text/javascript" src="/resources/jqwidgets/jqxtree.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            // Create jqxTree
            $('#jqxTree').jqxTree({ height: '300px', width: '300px' });
            $('#jqxTree').bind('select', function (event) {
                var selItem = $('#jqxTree').jqxTree('getSelectedItem');
                $("body").append(selItem.label + "<br />");
            });
            $("#itemName").focusout(function () {
                $('#jqxTree').jqxTree('getSelectedItem').label = $("#itemName").val();
                var selectedElement = $("#jqxTree").jqxTree('getSelectedItem').element;
                $("#" + selectedElement.id + " .jqx-tree-item:first").text($("#itemName").val());
            });
        });
    </script>
</head>
<body class='default'>
    <div>
        Update selected node:
        <input type="text" id="itemName" />
    </div>
    <div id='jqxTree'>
        <ul>
            <li item-selected='true'>Home</li>
            <li item-expanded='true'>Solutions
                <ul>
                    <li>Education</li>
                    <li>Financial services</li>
                    <li>Government</li>
                    <li>Manufacturing</li>
                    <li>Solutions
                        <ul>
                            <li>Consumer photo and video</li>
                            <li>Mobile</li>
                            <li>Rich Internet applications</li>
                            <li>Technical communication</li>
                            <li>Training and eLearning</li>
                            <li>Web conferencing</li>
                        </ul>
                    </li>
                    <li>All industries and solutions</li>
                </ul>
            </li>
        </ul>
    </div>
</body>
</html> -->