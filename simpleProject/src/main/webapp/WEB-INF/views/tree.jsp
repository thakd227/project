<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<%@ page import="java.sql.*"%>
<%@ page import="com.google.gson.*"%>
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
                 $('#jqxTree').jqxTree({ height: '400px', hasThreeStates: true, checkboxes: true, width: '330px'});
                 
                 var sourced = {
                         datatype: "json",
                         datafields: [{
                        	 name: 'UP_LOCA_CD',
                        	 name: 'LOCA_CD',
                             name: 'LOCA_NM',
                         }],
                         id: 'CliocaID',
                         /* url: '/grid/clioca', */
                         url: '/grid/clioca',
                         /* type: 'GET', */
                         async: false
                     };
                 
                 
                     var dataAdapter = new $.jqx.dataAdapter(sourced);
                     dataAdapter.dataBind();
                     var records = dataAdapter.getRecordsHierarchy( 'LOCA_CD', 'UP_LOCA_CD', 'items',
                    		 [{
                    		   name : 'LOCA_NM', 
                    		   map : 'label' 
                    		  }]);
                     $('#jqxTree').jqxTree({
                         source: records,
                         width: '200px',
                         height: '300px',
                         submitCheckedItems: true,
                         checkboxes: true
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
	<div>
	<img id="chart" src="/image/chart.jpg" width="30" height="30"/>
	</div>
		<div style='float: left; width: 100%;'>
			<div id='jqxTree'>
			</div>

		<div id="jqxGrid">
			<div id="grid">
			</div>
			
			      <div id="popupWindow">
            <div>Edit</div>
            <div style="overflow: hidden;">
                <table>
                    <tr>
                        <td align="right">센서 코드:</td>
                        <td align="left"><input id="SENSOR_CD" /></td>
                    </tr>
                    <tr>
                        <td align="right">센서 이름:</td>
                        <td align="left"><input id="SENSOR_NM" /></td>
                    </tr>
                    <tr>
                        <td align="right">센서 유형:</td>
                        <td align="left"><div id='SENSOR_TYPE'></div></td>
                    </tr>
                    <tr>
                    
                        <td align="right">알람 중요도:</td>
                        <td align="left"><div id='ALARM_IMPRT'></div></td>
                    </tr>
                    <tr>
                        <td align="right">알람여부:</td>
                        <td align="left"><div id='ALARM_YN'></div></td>
                    </tr>
                    <tr>
                        <td align="right">좌표:</td>
                        <td align="left">
                        	<div id="COORDINATES">
                        		<input type="text" />
        					</div>
    					</td>
                    </tr>
                    <tr>
                        <td align="right"></td>
                        <td style="padding-top: 10px;" align="right"><input style="margin-right: 5px;" type="button" id="Save" value="Save" /><input id="Cancel" type="button" value="Cancel" /></td>
                    </tr>
                </table>
                                                
                </div>
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

 