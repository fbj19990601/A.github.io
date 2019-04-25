<%@ page pageEncoding="GBK"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%
	String sub_code = "CRM";
	if (request.getParameter("sub_code") != null) {
		sub_code = request.getParameter("sub_code");
	}
%>
<html>
	<head>
		<title><bean:message key="str116"/></title>
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
	 Ext.onReady(
	 function() {
	  var data = Math.round(Math.random() * 10000);
      var resizeable1 = new Ext.Resizable('tree-send', {
            pinned:true,
            autoWidth:true,
            autoHeight:true,
            handles: 'e',
            widthIncrement:50,
            minWidth: 50,
			maxWidth:450,
            dynamic: true
        });
    var sub_code=$F('sub_code');
    var s_tree = new Ext.tree.TreePanel({   
   	el:"tree-send",   
       autoScroll:false,
       animate:true,
       autoWidth:true,
       height:'300px',
       enableDD:false,
       rootVisible:true,
       containerScroll: true, 
       loader: new Ext.tree.TreeLoader({
           dataUrl:'s_json.jsp?data='+data+'&sub_code='+sub_code
       })
   });
	s_tree.on("click",function(node,event){
	 document.getElementById("s_menu_id").value=node.id;
   });
    var s_root = new Ext.tree.AsyncTreeNode({
        text: '����˵�Ȩ��',
        draggable:false,
        iconCls:'root-Img',
        id:'000000000000000'
    });
    s_tree.setRootNode(s_root);
   	s_tree.render();
   	s_root.expand();
   //tree.expandAll();
   });
		</script>
	</head>
	<body>
	<input type="hidden" name="sub_code" id="sub_code" value="<%=sub_code%>">
	<input type="text" name="s_menu_id" id="s_menu_id" value="">
	<div id="tree-send"></div>
	</body>
</html>
