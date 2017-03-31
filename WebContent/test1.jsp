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
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/ctl/default-common.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/ctl/default-desktop.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/easyUI/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/easyUI/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/ctl/default-desktop.js"></script>
<style>
/*.panel-body {
  background-color: #ffffff;
  color: #000000;
  font-size: 12px;
}*/
</style>
<script type="text/javascript">
$().ready(function() {
	//HeadOffKey();
	//alert("ready?");
	InitAccordion('GetAccMenu?ispbx=false');
 	//InitRemindVoice();

	AddTabDefalut('我的工作台', 'test5.jsp', 'icon-house', false);
	//window.RemindUrl='http://paas.xunnew.com/index.php/tx_remind_c/Remind';
	//window.RemindAccStatusUrl='http://paas.xunnew.com/index.php/tx_remind_c/RemindAccStatus';
	//window.LoginUrl='http://paas.xunnew.com/index.php/login/logoff';
	//window.AccMoneyRemindUrl='http://paas.xunnew.com/index.php/tx_acc_ratelist_c/PromptSet';
	//window.AccCalleridUrl='http://paas.xunnew.com/index.php/tx_account_c/CalleridSet';
	//window.RemindVoice='http://paas.xunnew.com/resource/default/images///remind.mp3';
	//window.CheckCNumber = 0;

	//window.onRemind = window.setInterval(TaskMessage, 5000);
	//window.onTaskAccStatus = window.setInterval(TaskAccStatus, 5000);
	//window.NextRemindTime = new Date();
	//window.ifremindplay=true;
	//window.getcompanyinfourl="http://paas.xunnew.com/index.php/tx_account_c/getAccUserinfo";
});
</script>
</head>
<body class="easyui-layout" >
	<div data-options="region:'north',border:false, collapsible:false, title:''" style="height: 50px;">
		<div title="" style="text-align:center;">
		freeSWITCH云系统管理平台	
		</div>
	</div>
	<div id="charisma-west" data-options="region:'west',split:true,border:false, title:'导航菜单'" style="width: 195px;">
	
	</div>
	
	<div data-options="region:'center',border:false">
			<div id="charisma-tabs" class="easyui-tabs " data-options="fit:true,border:false,plain:false,pill:false,justified:false,showHeader:true" >
			</div>
	</div>
	<div data-options="region:'south',border:false, collapsible:false" style="height: 25px;">
		<div title="" style="text-align:center;">
		©2016-2017&nbsp;freeSWITCH云系统管理平台	
		</div>
	</div>
</body>
</html>