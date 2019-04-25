<%@ page pageEncoding="GBK"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<jsp:useBean id="bean" class="com.saas.biz.organizeMgr.OrganizeInfo" scope="page" />
<jsp:useBean id="comm" class="com.saas.biz.commen.ParamethodMgr" scope="page" />
<%
	HttpSession htSe = request.getSession();
	String cust_id = (String) htSe.getAttribute("SESSION_CUST_ID");
	String type = "",type_name="";
	if (request.getParameter("type") != null) {
		type = request.getParameter("type");
		type_name=comm.getParamNameByValue("46",type);
	}
%>
<html>
	<head>
		<title><bean:message key="str1846"/></title>
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
		   var type=$F("type");
		   var resizeable = new Ext.Resizable('class-tree', {
		            pinned:true,
		            autoWidth:true,
		            autoHeight:true,
		            handles: 'e',
		            widthIncrement:50,
		            minWidth: 50,
					maxWidth:450,
		            dynamic: true
		        });
		 var data = Math.round(Math.random() * 10000);
		    var tree = null;   
		        var Tree = Ext.tree;   
		        tree = new Tree.TreePanel({   
		            el:'class-tree',   
		            autoScroll:false,   
		            animate:true,   
		            enableDD:true,  
		            autoWidth:true,
		            autoHeight:true,
		            containerScroll: true,    
		            loader: new Tree.TreeLoader({   
		                dataUrl:'json_class.jsp?type='+type+"&data="+data   
		            }),   
		            rootVisible: true   
		        });  
		        tree.on('checkchange', function(node, checked) {   
			            node.expand();   
			            node.attributes.checked = checked;  
			            if(checked){
			              var org_idx=$F("type_group");
			              if(org_idx.indexOf(node.id)==-1){
			              	 $("type_group").value=$F("type_group")+node.id+"|";
			              }
		        	    }else{
		        	      var st=$F("type_group");
		        	      st=st.replace(node.id+"|",'');
		        	      $("type_group").value=st;	
		        	    }
			            node.eachChild(function(child) {  
				                child.ui.toggleCheck(checked);   
				                child.attributes.checked = checked;   
				                child.fireEvent('checkchange', child, checked);   
		                    });   
		                }, tree);   
		                var name=$F("type_name")+"·ÖÀà";
		                var root = new Tree.AsyncTreeNode({   
		                    text: name,   
				            draggable:false,
				            iconCls:'root-Img',
				            id:'000000000000000'   
		                });   
		                tree.setRootNode(root);   
		                tree.render();   
		                root.expand();   
		   	           // tree.expandAll();	
		});
		</script>
	</head>
	<body>
	<input type="hidden" name="type_name" id="type_name" value="<%=type_name%>">
	<input type="hidden" name="type" id="type" value="<%=type%>">
	<input type="hidden" name="cust_id" id="cust_id" value="<%=cust_id%>">
	<div id="class-tree"></div>
	</body>
</html>
