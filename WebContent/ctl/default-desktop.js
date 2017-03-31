/**
 * 
 */
function HeadOffKey() {
	function keydown(evt) {
		var ESC = 27, LEFT = 37, UP = 38, RIGHT = 39, DOWN = 40;
		var F1 = 112, F2 = 113, F3 = 114, F4 = 115, F5 = 116, F6 = 117, F8 = 119, F10 = 120, F11 = 121, F11 = 122;
		var BACKSPACE = 8;
		if (evt.altKey && (evt.keyCode == LEFT || evt.keyCode == RIGHT)) {
			evt.returnValue = false;
			return false;
		} else if (evt.keyCode == F5) {
			$.messager.confirm('系统信息', '您确定要刷新页面么?', function(r) {
				if (r) {
					window.location.reload();
				}
			});
			if ($.browser.mozilla) {
				evt.preventDefault();
				evt.stopPropagation();
			} else if ($.browser.msie) {
				window.event.returnValue = false;
				window.event.keyCode = 0;
				window.status = "Refresh is disabled";
			}
			return false;
		} else if (evt.keyCode == F1) {
			evt.preventDefault();
			evt.stopPropagation();
			return false;
		} else if (evt.keyCode == F3) {
			evt.preventDefault();
			evt.stopPropagation();
			return false;
		}
		// else if (evt.keyCode == BACKSPACE) {
		// evt.preventDefault();
		// evt.stopPropagation();
		// return false;
		// }
		else if (evt.keyCode == 82 && evt.ctrlKey) { // Ctrl+R
			evt.preventDefault();
			evt.stopPropagation();
			return false;
		} else {
			return true;
		}
	}
	$(document).bind("keydown", keydown);
}
//动态生成easyui-accordion控件
function InitAccordion(requesturl) {

	//requesturl = requesturl + "/" + Math.random();
	//jQuery.ajax([settings])
	$.ajax({
		url : requesturl,
		//data : {system_module : window.SystemModule},
		data:{"require":"accmenu"},
		type : "post",
		dataType : "json",
		contentType : "application/x-www-form-urlencoded; charset=utf-8",
		success : function(data, status) {
			if (data.success) {
				//alert(JSON.stringify(data.accordions));
				$("#charisma-west").empty();
				var accordionHtml = '<div class="easyui-accordion" fit="true" border="true">';
				$.each(data.accordions,
								/*$(selector).each(function(index,element))
								index - 选择器的 index 位置
							element - 当前的元素（也可使用 "this" 选择器）
								*/
						function(i, n) {
							accordionHtml += '<div title="'
									+ n.accordion.accordion_name
									+ '" data-options="iconCls:\''
									+ n.accordion.icon
									+ '\'" style="overflow: auto; padding: 5px;">';
							accordionHtml += '<ul>';
							$.each(n.accordions,
									function(j, o) {
										accordionHtml += '<li><div><a href="javascript:void(0)" url="'
												+ o.url
												+ '" accordion_id="'
												+ o.accordion_id
												+ '"'
												+ '" icon="'
												+ o.icon
												+ '"><span class="'
												+ o.icon
												+ '" style="width:16px; display:inline-block">&nbsp;</span><span class="accordion_name">'
												+ o.accordion_name
												+ '</span></a></div></li>';
									});
							accordionHtml += '</ul></div>';
						});
				accordionHtml += '</div>';
				$("#charisma-west").append(accordionHtml);

				//按键响应方法
				$('.easyui-accordion li a').click(
						function() {
							var title = $(this).children(
									'.accordion_name').text();
							var url = $(this).attr("url");
							var icon = $(this).attr("icon");
							//选中时显示相应的tab
							AddTab(title, url, icon);
							$('.easyui-accordion li div').removeClass(
									"charisma-accordion-selected");
							$(this).parent().addClass(
									"charisma-accordion-selected");
						}).hover(//$(selector).hover(inFunction,outFunction) == $( selector ).mouseover( handlerIn ).mouseout( handlerOut )
						function() {
							$(this).parent().addClass(
									"charisma-accordion-hover");
						},
						function() {
							$(this).parent().removeClass(
									"charisma-accordion-hover");
						});
				// 导航菜单绑定初始化
				$(".easyui-accordion").accordion();
			} else {
					var message = '网络异常，请重新登录！';
					$.messager.alert('系统信息', message, 'warning',
							//跳转页面至登陆页面
							function() {
								//window.location.replace('../login.html');
							});
				}
			},
			error : function(data, status) {
				var message = '网络异常，请重新登录！';
				$.messager.alert('系统信息', message, 'warning', function() {
					//window.location.replace('../login.html');
				});
			}
		});
}
function AddTab(title, url, icon) {
	AddTabDefalut(title, url, icon, true);
}
function AddTabDefalut(title, url, icon, closable,cusid) {
	//如果tab不存在，则生成tab
	if (!$('#charisma-tabs').tabs('exists', title)) {
		$('#charisma-tabs')
			.tabs('add',
				{
					title : title,
					// href: url,
					content : '<iframe id=frm_'+cusid+' width=100% height=100% frameborder=0 scrolling=no src='
							+ url + '></iframe>',
					closable : closable,
					icon : icon
				});
		var tab = $('#charisma-tabs').tabs('getSelected');
		tab.css("padding", "5px");
		$('#charisma-tabs').tabs('resize');
	} else {////如果tab存在，则激活该tab
		$('#charisma-tabs').tabs('select', title);
	}
}