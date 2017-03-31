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
    <script type="text/javascript" src="<%=request.getContextPath()%>/easyUI/jquery.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/easyUI/jquery.easyui.min.js"></script>
    <script type="text/javascript">
	    var url;
	    var editingId;
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
	    function saveNMenu(){
	    	if(confirm("确认提交？")){
				var args = {"accordion_name":$("input[name='accordion_name']").val(),
						"level":$("input[name='level']").val(),
						"index":$("input[name='index']").val(),
						"group":$("#group").textbox('getText'),
						"iconCls":$("#icon").textbox('getText'),
						"system_module":$("#system_module").textbox('getText'),
						"url":$("#url").textbox('getText'),
						"status":$("input[name='status']").val(),
						"lastmodifier":"admin",
						"creator":"admin"};
				//alert(JSON.stringify(args));
				$.post(url,args,function(data){
					$('#dlg').dialog('close');        // close the dialog
	            	$('#tt').treegrid('reload');    // reload the user data
				},"json")
			}else
				return false;
	    }
	    function saveEACC(row){
			var args = {"accordion_name":row.accordion_name,
					"level":row.level,
					"index":row.index,
					"group":row.group,
					"iconCls":row.iconCls,
					"system_module":row.system_module,
					"url":row.url,
					"status":row.status,
					"lastmodifier":"admin",
					"creator":"admin"};
			
			//alert(JSON.stringify(args));
			$.post(url,args,function(data){
				editingId = undefined;
				//alert(JSON.stringify(data));
            	$('#tt').treegrid('reload');    // reload the user data
			},"json");
	    }
	    function destroyACC(nodes){
	        if (nodes){
	        	var nodenb = nodes.length;
	        	if(nodenb<1){
	        		alert("请勾选至少一个目录！");
	        		return false;
	        	}
	            $.messager.confirm('Confirm','删除所选的目录?',function(r){
	                if (r){
	                	var menuids = new Array();
	                	//alert(JSON.stringify(rows));
	                	for(var i=0;i<nodenb;i++){
	                		var row = nodes[i];
	                		var menuid = {"accordion_id":row.accordion_id,"group":row.group};
	                		//alert(row.accordion_id);
	                		menuids.push(menuid);
	                		$('#tt').treegrid('uncheckNode',row.accordion_id);
	                	}
	                	//alert(JSON.stringify(menuids));
	                    $.post('delete',{'menuids':menuids},function(result){
	                        if (result.success){
	                            $('#tt').treegrid('reload');    // reload the user data
	                            
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
	    function initform(row,isappend,isbefore){
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
    		var roots = $('#tt').treegrid('getRoots');
    		//alert(roots.length);
    		var rootnames = new Array();
    		rootnames.push({"id":"0","name":"根目录"})
			for(var i=0;i<roots.length;i++){
				var rootname = {"id":roots[i].index,"name":roots[i].accordion_name};
				rootnames.push(rootname);
			}
    		$('#group').combobox('loadData',rootnames);
    		
    		$("input[name='accordion_name']").val('新目录');
    		$('#level').numberbox('setValue', isappend?(parseInt(row.level)+1):row.level);
    		$('#index').numberbox('setValue', isappend?($('#tt').treegrid('getChildren',row.accordion_id).length+1):
				(isbefore?parseInt(row.index):(parseInt(row.index)+1)));
    		//$('#group').textbox('setText',isappend?row.accordion_id:row.group);
    		$('#group').combobox('select',isedit?row.index:"0");
    		$('#icon').textbox('setText',row.iconCls);
    		$('#system_module').textbox('setText',row.system_module);
    		$('#url').textbox('setText','');
    		$('#status').numberbox('setValue',row.status);
    		//$('#creator').textbox('setText',row==null?'':row.creator);
	    }
	    function onContextMenu(e,row){
			if (row){
				e.preventDefault();
				$(this).treegrid('select', row.accordion_id);
				$('#mm').menu('show',{
					left: e.pageX,
					top: e.pageY
				});				
			}
		}
	    function insertup(){
			var node = $('#tt').treegrid('getSelected');
			if(node){
				$('#dlg').dialog('open').dialog('center').dialog('setTitle','New Menu');
				initform(node,false,true);
				url = "add";
			}
	    }
	    function insertdown(){
			var node = $('#tt').treegrid('getSelected');
			if(node){
				$('#dlg').dialog('open').dialog('center').dialog('setTitle','New Menu');
				initform(node,false,false);
				url = "add";
			}
	    }
		function append(){
			var node = $('#tt').treegrid('getSelected');
			if(node){
				//alert($('#tt').treegrid('getChildren',node.accordion_id).length);
				if(parseInt(node.level)>1){
					alert("对不起，只能支持两级目录！");
					return false;
				}
				$('#dlg').dialog('open').dialog('center').dialog('setTitle','New Menu');
				initform(node,true,false);
				url = "add";
			}
		}
		function edit(){
			if (editingId != undefined){
				$('#tt').treegrid('select', editingId);
				return;
			}
			var row = $('#tt').treegrid('getSelected');
			if (row){
				editingId = row.accordion_id;
				$('#tt').treegrid('beginEdit', editingId);
			}
		}
		function save(){
			if (editingId != undefined){
				if(confirm("确认提交？")){
					var row = $('#tt').treegrid('find',editingId);
					$('#tt').treegrid('endEdit', editingId);
					url = 'update?accordion_id='+row.accordion_id;
					saveEACC(row);
				}
			}
		}
		function cancel(){
			if (editingId != undefined){
				$('#tt').treegrid('cancelEdit', editingId);
				editingId = undefined;
			}
		}
		function removesl(){
			var nodes = $('#tt').treegrid('getCheckedNodes');
			destroyACC(nodes);
		}
		function removeIt(){
			var node = $('#tt').treegrid('getSelected');
			if(node){
				var nodes = new Array();
				nodes.push(node);
				destroyACC(nodes);
			}
		}
		function collapseAll(){
			$('#tt').treegrid('collapseAll');
		}
		function expandAll(){
			$('#tt').treegrid('expandAll');
		}
    </script>
</head>
<body onload="setbody(this)">
    
    <table id="tt" title="" class="easyui-treegrid" style="width:100%;height:100%"
    		data-options="
				iconCls: 'easyUI/themes/icon/icon-ok',
				rownumbers: true,
				animate: false,
				checkbox: true,
				collapsible: false,
				fitColumns: true,
				url: 'GetEMenu',
				method: 'post',
				loadMessage:'加载中...',
				loadMsg:'正在加载...',
				idField: 'accordion_id',
				treeField: 'accordion_name',
				toolbar: '#toolbar',
				onContextMenu: onContextMenu
			">
        <thead>
            <tr>
            	<th field="accordion_name" editor="text">accordion_name</th>
                <th field="level" >level</th>
                <th field="index" editor="text">index</th>
                <th field="accordion_id">accordion_id</th>
                <th field="group" >group</th>
                <th field="iconCls" editor="text">icon</th>
                <th field="system_module" editor="text">system_module</th>   
                <th field="url" editor="text">url</th>
                <th field="status" editor="text">status</th>
                <th field="lastmodifier" editor="text">lastmodifier</th>
                <th field="creator" >creator</th>
                <th field="create_time" >create-time</th>
                <th field="modify_time" >modify-time</th>
            </tr>
        </thead>
    </table>
    <div id="toolbar">
      	<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="" plain="true" onclick="expandAll()">全部展开</a>
    	<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="" plain="true" onclick="collapseAll()">全部折叠</a>
    	<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="insertup()">新建目录（上）</a>
    	<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="insertdown()">新建目录（下）</a>
    	<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="append()">新建子目录</a>
    	<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="edit()">编辑</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="" plain="true" onclick="save()">保存编辑</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="" plain="true" onclick="cancel()">取消编辑</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="removesl()">删除目录</a>
    </div>
    
    <div id="mm" class="easyui-menu" style="width:120px;">
    	
    	<div onclick="insertup()" data-options="iconCls:'icon-add'">新建目录（上）</div>
    	<div onclick="insertdown()" data-options="iconCls:'icon-add'">新建目录（下）</div>
		<div onclick="append()" data-options="iconCls:'icon-add'">新建子目录</div>
		<div onclick="removeIt()" data-options="iconCls:'icon-remove'">删除该目录</div>
		<div class="menu-sep"></div>
		<div onclick="edit()" data-options="iconCls:'icon-edit'">编辑该目录</div>
	</div>
    
    <div id="dlg" class="easyui-dialog" style="width:300px;height:350px;padding:2px"
		data-options="
			closed:true,
			modal:true
		" buttons="#dlg-buttons">
        
           <div style="margin-bottom:2px;font-size:14px;border-bottom:1px solid #ccc">Acc Information</div>
           <table style="width:100%">
			  <tr>
			    <td><label>accordion_name:</label>
			    <input type="text" id="accordion_name" name="accordion_name" class="easyui-validatebox" required="true"></td>
			  </tr>
			  <tr>
			    <td>
			    <!-- <label style="width:25%">level:</label>
			    <input type="text" id="level" name="level" class="easyui-numberbox" data-options="value:0,min:0,max:100" style="width:8%"> -->
			    <label style="width:25%">index:</label>
			    <input type="text" id="index" name="index" class="easyui-numberbox" data-options="value:0,min:0,max:100" style="width:8%">
			    <label style="width:25%">status:</label>
			    <input type="text" id="status" name="status" class="easyui-numberbox" data-options="value:1,min:0,max:1" style="width:8%">
			    </td>
			  </tr>
			  <tr >
			    <!-- <td><input type="text" id="group" name="group" class="easyui-combobox" label="group:" style="width:100%"></td> -->
			    <td><input class="easyui-combobox" id="group" name="group" style="width:100%;" data-options="
					valueField: 'id',
					textField: 'name',
					label: '上级菜单:',
					labelPosition: 'left'
					"></td>
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
        <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="saveNMenu()" style="width:90px">Save</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')" style="width:90px">Cancel</a>
    </div>
    
</body>
</html>