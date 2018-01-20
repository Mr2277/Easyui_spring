<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商品后台管理主界面</title>
<!-- 导入jquery核心类库 -->
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/admin/jquery-1.8.3.js"></script>
<!-- 导入easyui类库 -->
<link id="easyuiTheme" rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/js/admin/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/js/admin/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/admin/default.css">
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/admin/easyui/jquery.easyui.min.js"></script>
<!-- 导入ztree类库 -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/js/admin/ztree/zTreeStyle.css" type="text/css" />
<script src="${pageContext.request.contextPath }/resources/js/admin/ztree/jquery.ztree.all-3.5.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/resources/js/admin/easyui/locale/easyui-lang-zh_CN.js" type="text/javascript"></script>
<script type="text/javascript">
	/*
	$(function() {
		var setting = {
			data : {
				key : {
					title : "t" 
				},
				simpleData : { 
					enable : true
				}
			},
			callback : {
				onClick : onClick
			}
		};
		
		
		var nodes=[
		   		{ "id":"11", "pId":"0", "name":"管理员信息",  "click":false},
				{ "id":"112", "pId":"11", "name":"管理员列表",  "page":"${pageContext.request.contextPath }/admin/toadminIndex"},
				
				{ "id":"12", "pId":"0", "name":"设计师管理","click":false },
				{ "id":"121", "pId":"12", "name":"设计师列表" ,"page":"${pageContext.request.contextPath }/designer/todesignerIndex"},
				
				{ "id":"13", "pId":"0", "name":"订单管理","click":false },
				{ "id":"131", "pId":"13", "name":"订单列表","page":"${pageContext.request.contextPath }/order/toorderIndex"},
				
				{ "id":"14", "pId":"0" , "name":"成衣管理","click":false },
				{ "id":"141", "pId":"14", "name":"成衣列表" ,"page":"${pageContext.request.contextPath }/product/toproductIndex"},
				{ "id":"142", "pId":"14", "name":"类型列表" ,"page":"${pageContext.request.contextPath }/product/tocategoryIndex"},
				
				{ "id":"15", "pId":"0" , "name":"会员管理","click":false },
				{ "id":"151", "pId":"15", "name":"会员列表" ,"page":"${pageContext.request.contextPath }/user/touserIndex"},
				
				{ "id":"15", "pId":"0" , "name":"款式模型库管理","click":false },
				{ "id":"151", "pId":"15", "name":"款式模型列表" ,"page":"${pageContext.request.contextPath }/styleManage/style_admin"},
				{ "id":"152", "pId":"15", "name":"款式分类列表" ,"page":"${pageContext.request.contextPath }/styleManage/style_admin"},
				{ "id":"153", "pId":"15", "name":"款式分类列表" ,"page":"${pageContext.request.contextPath }/styleManage/style_admin"},


		];
		$.fn.zTree.init($("#treeMenu"), setting, nodes);
		
		var zNodes=[
		    		{ "id":"1001", "pId":"100", "name":"用户管理", "t":"","page":"page_admin_userindex.action"},
		    		{ "id":"1002", "pId":"100", "name":"功能权限管理", "t":"","page":"page_admin_function.action"},
		    		{ "id":"1003", "pId":"100", "name":"角色管理", "t":"","page":"page_admin_role.action"},
		    		{ "id":"1004", "pId":"100", "name":"流程定义管理", "t":"","page":"page_workflow_processdefinition_list.action"},
		    		{ "id":"1005", "pId":"100", "name":"查看正在运行的任务", "t":"","page":"page_workflow_processinstance.action"}
		    ];
		$.fn.zTree.init($("#adminMenu"), setting, zNodes);
		
		var zNodes=[
		    		{ "id":"101", "pId":"100", "name":"浏览量分析", "t":"","page":"${pageContext.request.contextPath }/statistics/browse"},    		
		    		{ "id":"102", "pId":"100", "name":"用户分析", "t":"","page":"${pageContext.request.contextPath }/statistics/user"},    		
		    		{ "id":"103", "pId":"100", "name":"订单分析", "t":"","page":"${pageContext.request.contextPath }/statistics/order"},    		

		    		];
		$.fn.zTree.init($("#systemMenu"), setting, zNodes);
		
		window.setTimeout(function(){
			$.messager.show({
				title:"消息提示",
				msg:'欢迎登录，超级管理员！ <a href="javascript:void" onclick="top.showAbout();">联系管理员</a>',
				timeout:5000
			});
		},3000);
		
		
		$("#btnCancel").click(function(){
			$('#editPwdWindow').window('close');
		});
		
		$("#btnEp").click(function(){
			alert("修改密码成功");
		});
	});

	function onClick(event, treeId, treeNode, clickFlag) {
		if (treeNode.click != false) {
			open(treeNode.name, treeNode.page);
		}
	}

	
	function open(text, url) {
		if ($("#tabs").tabs('exists', text)) {
			$('#tabs').tabs('select', text);
		} else {
			var content = '<div style="width:100%;height:100%;overflow:hidden;">'
					+ '<iframe src="'
					+ url
					+ '" scrolling="auto" style="width:100%;height:100%;border:0;" ></iframe></div>';

			$('#tabs').tabs('add', {
				title : text,
				content : content,
				
				closable : true
			});
		}
	}

	
	changeTheme = function(themeName) {
		var $easyuiTheme = $('#easyuiTheme');
		var url = $easyuiTheme.attr('href');
		var href = url.substring(0, url.indexOf('themes')) + 'themes/'
				+ themeName + '/easyui.css';
		$easyuiTheme.attr('href', href);
		var $iframe = $('iframe');
		if ($iframe.length > 0) {
			for ( var i = 0; i < $iframe.length; i++) {
				var ifr = $iframe[i];
				$(ifr).contents().find('#easyuiTheme').attr('href', href);
			}
		}
	};
	function logoutFun() {
		$.messager
		.confirm('系统提示','您确定要退出本次登录吗?',function(isConfirm) {
			if (isConfirm) {
				location.href = '${pageContext.request.contextPath }/admin/toLogin';
			}
		});
	}
	function editPassword() {
		$('#editPwdWindow').window('open');
	}
	function showAbout(){
		$.messager.alert("在线服装设计 v1.0","设计: 陈晓慧<br/> 管理员邮箱: cxh_only0218@163.com <br/> QQ: 2451582993");
	}
	*/
</script>
</head>
<body class="easyui-layout">
      
	<div data-options="region:'north',border:false"style="height:80px;padding:10px;background:url('${pageContext.request.contextPath }/resources/images/admin/header_bg.png') no-repeat right;">
		<!--    
		<div id="sessionInfoDiv"
			style="position: absolute;right: 5px;top:10px;">
			[<strong>管理员</strong>]，欢迎你！您使用[<strong>192.168.1.100</strong>]IP登录！
		</div>
		<div style="position: absolute; right: 5px; bottom: 10px; ">
			<a href="javascript:void(0);" class="easyui-menubutton"
				data-options="menu:'#layout_north_pfMenu',iconCls:'icon-ok'">更换皮肤</a>
			<a href="javascript:void(0);" class="easyui-menubutton"
				data-options="menu:'#layout_north_kzmbMenu',iconCls:'icon-help'">控制面板</a>
		</div>
		
		<div id="layout_north_pfMenu" style="width: 120px; display: none;">
			<div onclick="changeTheme('default');">default</div>
			<div onclick="changeTheme('gray');">gray</div>
			<div onclick="changeTheme('black');">black</div>
			<div onclick="changeTheme('bootstrap');">bootstrap</div>
			<div onclick="changeTheme('metro');">metro</div>
		</div>
		<div id="layout_north_kzmbMenu" style="width: 100px; display: none;">
			<div onclick="editPassword();">修改密码</div>
			<div onclick="showAbout();">联系管理员</div>
			<div class="menu-sep"></div>
			<div onclick="logoutFun();">退出系统</div>
		</div>
		-->
	</div>
	
	
	  
	<div data-options="region:'west',split:true,title:'菜单导航'"style="width:200px">
	    <!--           
		<div class="easyui-accordion" fit="true" border="false">
		    
			<div title="基本功能" data-options="iconCls:'icon-mini-add'"  style="overflow:auto">
				<ul id="treeMenu" class="ztree"></ul>
			</div>
			<div title="系统管理" data-options="iconCls:'icon-mini-add'"  style="overflow:auto">  
				<ul id="adminMenu" class="ztree"></ul>
			</div>
			<div title="统计管理" data-options="iconCls:'icon-mini-add'" style="overflow:auto">
				<ul id="systemMenu" class="ztree"></ul>
			</div>
		</div>
		-->
	</div>
	
	 
	<div data-options="region:'center'">
		<!--  
		<div id="tabs" fit="true" class="easyui-tabs" border="false">
			<div title="消息中心" id="subWarp"
				style="width:100%;height:100%;overflow:hidden">
				<iframe src="${pageContext.request.contextPath }/admin/home"
					style="width:100%;height:100%;border:0;"></iframe>
				<%--				这里显示公告栏、预警信息和代办事宜--%>
			</div>
		</div>
		-->
	</div>
	
      
	<div data-options="region:'south',border:false"style="height:50px;padding:10px;background:url('${pageContext.request.contextPath }/resources/images/admin/header_bg.png') no-repeat right;">
		<!--  
		<table style="width: 100%;">
			<tbody>
				<tr>
					<td style="width: 300px;">
						<div style="color: #999; font-size: 8pt;">
							 | Powered by <a href="http://www.itcast.cn/">itcast.cn</a>
						</div>
					</td>
					<td style="width: *;" class="co1"><span id="online"
						style="background: url(${pageContext.request.contextPath }/resources/images/admin/online.png) no-repeat left;padding-left:18px;margin-left:3px;font-size:8pt;color:#005590;">在线人数:1</span>
					</td>
				</tr>
			</tbody>
		</table>
		-->
	</div>
	
	<!--修改密码窗口-->
    <div id="editPwdWindow" class="easyui-window" title="修改密码" collapsible="false" minimizable="false" modal="true" closed="true" resizable="false"
        maximizable="false" icon="icon-save"  style="width: 300px; height: 160px; padding: 5px;
        background: #fafafa">
        <div class="easyui-layout" fit="true">
            <div region="center" border="false" style="padding: 10px; background: #fff; border: 1px solid #ccc;">
                <table cellpadding=3 action="${pageContext.request.contextPath }/admin/toEditMy" >
                    <tr>
                        <td>新密码：</td>
                        <td><input id="txtNewPass" type="Password" class="txt01" /></td>
                    </tr>
                    <tr>
                        <td>确认密码：</td>
                        <td><input id="txtRePass" type="Password" class="txt01" /></td>
                    </tr>
                </table>
            </div>
            <div region="south" border="false" style="text-align: right; height: 30px; line-height: 30px;">
                <a id="btnEp" class="easyui-linkbutton" icon="icon-ok" href="javascript:void(0)" >确定</a> 
                <a id="btnCancel" class="easyui-linkbutton" icon="icon-cancel" href="javascript:void(0)">取消</a>
            </div>
        </div>
    </div>
</body>
</html>