<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/easyUI/themes/default/easyui.css">
   	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/easyUI/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/easyUI/themes/color.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/easyUI/themes/demo.css">
    <script type="text/javascript" src="<%=request.getContextPath()%>/easyUI/jquery.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/easyUI/jquery.easyui.min.js"></script>
</head>
<body>
	<div style="margin-bottom:10px, height:5%">
    	<a href="#" class="easyui-linkbutton" onclick="addTab('baidu','http://www.baidu.com')">baidu</a>
    	<a href="#" class="easyui-linkbutton" onclick="addTab('jquery','http://jquery.com/')">jquery</a>
    	<a href="#" class="easyui-linkbutton" onclick="addTab('easyui','http://jeasyui.com/')">easyui</a>
    </div>
    
    <div id="tt" class="easyui-tabs" data-options="" style="height:100%;">
    	<div title="Home">
    	</div>
    </div>
    
   	<script type="text/javascript">
        function addTab(title, url){
    	if ($('#tt').tabs('exists', title)){
    		$('#tt').tabs('select', title);
    	} else {
    		var content = '<iframe scrolling="auto" frameborder="0"  src="'+url+'" style="width:100%;height:100%;"></iframe>';
    		$('#tt').tabs('add',{
    			title:title,
    			content:content,
    			
    			closable:true
    		});
    	}
    }
   	</script>      
</body>
</html>