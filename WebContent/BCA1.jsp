<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="panel-fit">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>My ACCs Manage Demo</title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/easyUI/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/easyUI/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/easyUI/themes/color.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/easyUI/themes/demo.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/ctl/default-common.css">
    <script type="text/javascript" src="<%=request.getContextPath()%>/easyUI/jquery.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/easyUI/jquery.easyui.min.js"></script>
    <script type="text/javascript">
	    var url;
	    function newACC(){
	        $('#dlg').dialog('open').dialog('center').dialog('setTitle','New ACC');
	        //$('#fm').form('clear');
	        var row = null;
	        initform(row);
	        url = 'add';
	    }
	    function editACC(){
	        var row = $('#dg').datagrid('getSelected');
	        if (row){
	            $('#dlg').dialog('open').dialog('center').dialog('setTitle','Edit ACC');
	            //$('#fm').form('load',row);
	            initform(row);
	            url = 'update?accordion_id='+row.accordion_id;
	            //alert(url);
	        }
	    }
	    function saveACC(){
	    	/*for(var i =0;i<$("#createmem").find(".passwd").length;i++){
				var callname = $("#createmem").find(".caller").eq(i).val();
				if(callname==null||callname==""){
					alert("用户名称不能为空！");
					$("#createmem").find(".caller").eq(i).focus();
					return false;
				}
			}*/
			if(confirm("确认提交？")){
				//var url = url;
				//alert(url);
				//alert(confupdate);
				var args = {"accordion_name":$("input[name='accordion_name']").val(),
						"level":$("input[name='level']").val(),
						"index":$("input[name='index']").val(),
						"group":$("#group").textbox('getText'),
						"icon":$("#icon").textbox('getText'),
						"system_module":$("#system_module").textbox('getText'),
						"url":$("#url").textbox('getText'),
						"status":$("input[name='status']").val(),
						"creator":"admin"};
				
				//alert(JSON.stringify(args));
				
				$.post(url,args,function(data){
					//alert("FFFFFFFFFF");
					$('#dlg').dialog('close');        // close the dialog
	            	$('#dg').datagrid('reload');    // reload the user data
				},"json")
			}else
				return false;
	    }
	    function destroyACC(){
	        var row = $('#dg').datagrid('getSelected');
	        if (row){
	            $.messager.confirm('Confirm','Are you sure you want to destroy this accordion content?',function(r){
	                if (r){
	                	//alert(row.conference_id);
	                    $.post('delete',{'accordion_id':row.accordion_id},function(result){
	                        if (result.success){
	                            $('#dg').datagrid('reload');    // reload the user data
	                        } else {
	                            $.messager.show({    // show error message
	                                title: 'Error',
	                                msg: result.errorMsg
	                            });
	                        }
	                    },'json');
	                }
	            });
	        }
	    }
	    function initform(row){
	    	if(0){
	    		alert(JSON.stringify(row));
	    	}
	    	/*
    		$("input[name='accordion_name']").attr("value",row==null?'':row.accordion_name);
    		$("input[name='level']").attr("value",row==null?'0':row.level);
    		$("input[name='index']").attr("value",row==null?'0':row.index);
    		$("input[name='group']").attr("value",row==null?'':row.group);
    		$("input[name='icon']").attr("value",row==null?'':row.icon);
    		$("input[name='system_module']").attr("value",row==null?'':row.system_module);
    		$("input[name='url']").attr("value",row==null?'':row.url);
    		*/
    		$("input[name='accordion_name']").val(row==null?'':row.accordion_name);
    		$('#level').numberbox('setValue', row==null?'0':row.level);
    		$('#index').numberbox('setValue', row==null?'0':row.index);
    		$('#group').textbox('setText',row==null?'':row.group);
    		$('#icon').textbox('setText',row==null?'':row.icon);
    		$('#system_module').textbox('setText',row==null?'':row.system_module);
    		$('#url').textbox('setText',row==null?'':row.url);
    		$('#status').numberbox('setValue',row==null?'1':row.status);
    		//$('#creator').textbox('setText',row==null?'':row.creator);
	    }
	  //返回当前页面高度 
	    function pageHeight(){ 
    	    if($.browser&&$.browser.msie){ 
    	       return document.compatMode == "CSS1Compat"?  document.documentElement.clientHeight : 
    	    	   document.body.clientHeight; 
    	    }else{ 
    	      return self.innerHeight; 
    	   } 
    	}
	  //返回当前页面宽度 
  	  	function pageWidth(){ 
	  	    if($.browser&&$.browser.msie){ 
	  	      return document.compatMode == "CSS1Compat"? document.documentElement.clientWidth : 
	  	    	  document.body.clientWidth; 
	  	    }else{ 
	  	      return self.innerWidth; 
	  	    } 
  		}
	    function setbody(body){
    		//获取页面高度和宽度
    	  	//var page_width = pageWidth();
    	  	//var page_height = pageHeight();
    	  	var page_height = ($(document).height())*0.93;
    	  	//var dg_height = pageHeight()*0.9;
	    	
	    	//设置table高度
	    	//body.attr('width',page_width);
	    	//$("body").css('height',page_height+'px');
	    	//$("#dg").attr('height',dg_height+'px');
	    	//alert(page_height);
	    	//alert($(document).height());
	    }
    </script>
</head>
<body onload="setbody(this)">  
    <table id="dg" title="" class="easyui-datagrid" style="width:100%;height:100%"
            url="Dbservlet" 
            toolbar="#toolbar"
            rownumbers="false" fitColumns="true" singleSelect="true">
        <thead>
            <tr>
                <th field="level" >level</th>
                <th field="index" >index</th>
                <th field="accordion_id" >accordion_id</th>
                <th field="group" >group</th>
                <th field="accordion_name" >accordion_name</th>
                <th field="icon" >icon</th>
                <th field="system_module" >system_module</th>   
                <th field="url" >url</th>
                <th field="status" >status</th>
                <th field="creator" >creator</th>
                <th field="create_time" >create-time</th>
                <th field="modify_time" >modify-time</th>
            </tr>
        </thead>
    </table>
    <div id="toolbar">
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newACC()">New Acc</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editACC()">Edit Acc</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyACC()">Remove Acc</a>
    </div>
    
    <div id="dlg" class="easyui-dialog" style="width:300px;height:350px;padding:2px"
		closed="true" buttons="#dlg-buttons">
        
           <div style="margin-bottom:2px;font-size:14px;border-bottom:1px solid #ccc">Acc Information</div>
           <table style="width:100%">
			  <tr>
			    <td><label>accordion_name:</label>
			    <input type="text" id="accordion_name" name="accordion_name" class="easyui-validatebox" required="true"></td>
			  </tr>
			  <tr>
			    <td><label style="width:25%">level:</label>
			    <input type="text" id="level" name="level" class="easyui-numberbox" data-options="value:0,min:0,max:100" style="width:8%">
			    <label style="width:25%">index:</label>
			    <input type="text" id="index" name="index" class="easyui-numberbox" data-options="value:0,min:0,max:100" style="width:8%">
			    <label style="width:25%">status:</label>
			    <input type="text" id="status" name="status" class="easyui-numberbox" data-options="value:1,min:0,max:1" style="width:8%"></td>
			  </tr>
			  <tr >
			    <td><input type="text" id="group" name="group" class="easyui-textbox" label="group:" style="width:100%"></td>
			  </tr>
			  <tr >
			    <td><input type="text" id="icon" name="icon" class="easyui-textbox" label="icon:" style="width:100%"></td>
			  </tr>
			  <tr >
			    <td><input type="text" id="system_module" name="system_module" class="easyui-textbox" data-options="label:'system_module:',labelWidth:120" style="width:100%"></td>
			  </tr>
			  <tr >
			    <td><input type="text" id="url" name="url" class="easyui-textbox" label="url:" style="width:100%"></td>
			  </tr>
			</table>        
    </div>
    <div id="dlg-buttons">
        <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="saveACC()" style="width:90px">Save</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')" style="width:90px">Cancel</a>
    </div>
    
</body>
</html>