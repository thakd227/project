<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title id='Description'>This example shows how to enable the
	paging feature of the Grid.</title>
<link rel="stylesheet" href="/resources/jqwidgets/styles/jqx.base.css"
	type="text/css" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="viewport"
	content="width=device-width, initial-scale=1 maximum-scale=1 minimum-scale=1" />

<script type="text/javascript"
	src="/resources/scripts/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="/resources/jqwidgets/jqxcore.js"></script>
<script type="text/javascript" src="/resources/jqwidgets/jqxdata.js"></script>
<script type="text/javascript" src="/resources/jqwidgets/jqxbuttons.js"></script>
<script type="text/javascript"
	src="/resources/jqwidgets/jqxscrollbar.js"></script>
<script type="text/javascript" src="/resources/jqwidgets/jqxlistbox.js"></script>
<script type="text/javascript"
	src="/resources/jqwidgets/jqxdropdownlist.js"></script>
<script type="text/javascript" src="/resources/jqwidgets/jqxmenu.js"></script>
<script type="text/javascript" src="/resources/jqwidgets/jqxgrid.js"></script>
<script type="text/javascript"
	src="/resources/jqwidgets/jqxgrid.edit.js"></script>
<script type="text/javascript"
	src="/resources/jqwidgets/jqxgrid.pager.js"></script>
<script type="text/javascript"
	src="/resources/jqwidgets/jqxgrid.sort.js"></script>
<script type="text/javascript"
	src="/resources/jqwidgets/jqxgrid.filter.js"></script>
<script type="text/javascript"
	src="/resources/jqwidgets/jqxgrid.columnsresize.js"></script>
<script type="text/javascript"
	src="/resources/jqwidgets/jqxgrid.selection.js"></script>
<script type="text/javascript" src="/resources/jqwidgets/jqxpanel.js"></script>
<script type="text/javascript" src="/resources/jqwidgets/jqxcheckbox.js"></script>
<script type="text/javascript" src="/resources/jqwidgets/jqxcalendar.js"></script>
<script type="text/javascript" src="/resources/jqwidgets/jqxtree.js"></script>
<script type="text/javascript" src="/resources/jqwidgets/jqxwindow.js"></script>

<script type="text/javascript"
	src="/resources/jqwidgets/jqxformattedinput.js"></script>
<script type="text/javascript"
	src="/resources/jqwidgets/jqxnumberinput.js"></script>
<script type="text/javascript"
	src="/resources/jqwidgets/jqxdatetimeinput.js"></script>
<script type="text/javascript"
	src="/resources/jqwidgets/globalization/globalize.js"></script>


<script type="text/javascript" src="/resources/scripts/demos.js"></script>
<script type="text/javascript"
	src="/resources/jqwidgets/jqxdata.export.js"></script>
<script type="text/javascript"
	src="/resources/jqwidgets/jqxgrid.export.js"></script>
<script type="text/javascript" src="/resources/jqwidgets/jqxexport.js"></script>
<script type="text/javascript" src="/sampledata/generatedata.js"></script>
<script type="text/javascript" src="/resources/scripts/jszip.min.js"></script>
<script type="text/javascript">
        $(document).ready(function() {
            var source = {
                datatype: 'json',
                datafields: [{
                    name: 'firstName',
                    type: 'string'
                }, {
                    name: 'lastName',
                    type: 'string'
                }, {
                    name: 'title',
                    type: 'string'
                }, {
                    name: 'birthDate',
                    type: 'date'
                }],
                id: 'employeeId',
                url: '${pageContext.request.contextPath}/grid/sensor',
                type: 'POST',
                async: true
            };

            var dataAdapter = new $.jqx.dataAdapter(source);

            $('#jqxgrid').jqxGrid({
            	theme: 'arctic',
                width: 550,
                autoheight: true,
                source: dataAdapter,
                columns: [{
                    text: 'First Name',
                    datafield: 'firstName',
                    width: 100
                }, {
                    text: 'Last Name',
                    datafield: 'lastName',
                    width: 100
                }, {
                    text: 'Title',
                    datafield: 'title',
                    width: 180
                }, {
                    text: 'Birth Date',
                    datafield: 'birthDate',
                    cellsformat: 'd',
                    align: 'right',
                    cellsalign: 'right'
                }]
            });
        });
    </script>
</head>
<body>
	<div id="jqxgrid"></div>
</body>
</html>