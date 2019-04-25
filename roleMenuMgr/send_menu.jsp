<%@ page pageEncoding="GBK"%>
<%
	String sub_code = "", code = "";
	if (request.getParameter("sub_code") != null) {
		sub_code = request.getParameter("sub_code");
	}
	if (request.getParameter("code") != null) {
		code = request.getParameter("code");
	}
%>
<html>
	<head>
		<title><bean:message key="str3267"/></title>
		<link href="/style/layout.css" rel="stylesheet" type="text/css">
		<style type="text/css">
		.Tree-Img {
		    background-image:url(/img/org.png) !important;
		}
		.root-Img {
		    background-image:url(/img/home.png) !important;
		}
		</style>
		<link rel="stylesheet" type="text/css" href="../ext/resources/css/ext-all.css" />
		<script type="text/javascript" src="../ext/adapter/ext/ext-base.js"></script>
		<script type="text/javascript" src="../ext/ext-all.js"></script>
		<script type="text/javascript" src="../ext/build/locale/ext-lang-zh_CN.js"></script>
		<script language="javascript" src="/js/prototype.js"></script>
		<script type="text/javascript">
		/*******************************************************************************
		 * ���������װ
		 * 
		 * @B2B���ƽ̨
		 */
		var tree = null;
		Ext.BLANK_IMAGE_URL = "../ext/resources/images/default/s.gif"
		Ext.onReady(function() {
			var sub_code=$F('s_sub_code');       
		    var code=$F('code');
		    var data = Math.round(Math.random() * 10000);
			var resizeable = new Ext.Resizable('tree-send', {
				pinned : true,
				autoWidth : true,
				autoHeight : true,
				handles : 'e',
				widthIncrement : 50,
				minWidth : 50,
				maxWidth : 450,
				dynamic : true
			});
			var Tree = Ext.tree;
			tree = new Tree.TreePanel({
				el : 'tree-send',
				autoScroll : false,
				animate : true,
				enableDD : false,
				width : '35%',
				autoHeight : true,
				containerScroll : true,
				loader : new Tree.TreeLoader({
					  dataUrl:'s_json.jsp?code='+code+'&data='+data+'&sub_code='+sub_code
				}),
				rootVisible : true
			});
			tree.on('checkchange', function(node, checked) {
				node.expand();
				node.attributes.checked = checked;
				if (checked) {
					var org_idx = $F("menu_id");
					if (org_idx.indexOf(node.id) == -1) {
						$("menu_id").value = $F("menu_id") + node.id + "|";
					}
				} else {
					var st = $F("menu_id");
					st = st.replace(node.id + "|", '');
					$("menu_id").value = st;
				}
				node.eachChild(function(child) {
					child.ui.toggleCheck(checked);
					child.attributes.checked = checked;
					child.fireEvent('checkchange', child, checked);
				});
				var obj=tree.getChecked();
				if(obj.length>0){
				   var menu_idex="";
				   for(var i=0;i<obj.length;i++){
				    	menu_idex =menu_idex + obj[i].id + "|";
				   }
				   $("menu_id").value=menu_idex;
				}
			}, tree);
			var root = new Tree.AsyncTreeNode({
				text : '�˵�Ȩ�޽ṹ',
				draggable : false,
				iconCls : 'root-Img',
				depth:0,
				checked:false,
				id : 'root'
			});
			tree.setRootNode(root);
			tree.render();
			root.expand();
			//tree.expandAll();
		});
		</script>
	</head>
	<body>
		<input type="hidden" name="s_menu_id" id="s_menu_id" value="">
		<input type="hidden" name="s_sub_code" id="s_sub_code" value="<%=sub_code%>">
		<input type="hidden" name="code" id="code" value="<%=code%>">
		<div id="tree-send"></div>
	</body>
</html>
