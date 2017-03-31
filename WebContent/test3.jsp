<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/ctl/default-desktop.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/easyUI/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/easyUI/themes/icon.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/easyUI/themes/color.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/easyUI/themes/demo.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/easyUI/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/easyUI/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/ctl/default-desktop.js"></script>
<script type="text/javascript">
$().ready(function() {
	alert("ready?");
});
</script>
</head>
<body class="easyui-layout">
	<div data-options="region:'north',title:'',border:false, collapsible:false" style="height:50px">
		
	</div>
	<div data-options="region:'south',title:'',border:false, collapsible:false" style="height:25px;"></div>
	<!-- <div data-options="region:'east',title:'East',split:true" style="width:100px;"></div> -->
	<div data-options="region:'west',title:'导航菜单',split:true" style="width:100px;">
		
	</div>
	<div data-options="region:'center',title:''" style="padding:5px;background:#eee;"></div>
</body>
</html>