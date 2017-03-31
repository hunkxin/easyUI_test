<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Basic CRUD Application - jQuery EasyUI CRUD Demo</title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/easyUI/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/easyUI/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/easyUI/themes/color.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/easyUI/themes/demo.css">
    <script type="text/javascript" src="<%=request.getContextPath()%>/easyUI/jquery.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/easyUI/jquery.easyui.min.js"></script>
</head>
<body>
	<h2>Basic CRUD Application</h2>
    <p>Click the buttons on datagrid toolbar to do crud actions.</p>
    
    <table id="dg" title="My Accs" class="easyui-datagrid" style="width:100%;height:500px"
            url="update"
            rownumbers="false" fitColumns="true" singleSelect="true">
        <thead>
            <tr>
                <th field="lever" width="10">lever</th>
                <th field="index" width="10">index</th>
                <th field="accordion_id" width="50">accordion_id</th>
                <th field="group" width="50">group</th>
                <th field="accordion_name" width="50">accordion_name</th>
                <th field="icon" width="50">icon</th>
                <th field="system_module" width="50">system_module</th>   
                <th field="url" width="50">url</th>
                <th field="create-time" width="50">create-time</th>
                <th field="modify-time" width="50">modify-time</th>
            </tr>
        </thead>
    </table>
</body>
</html>