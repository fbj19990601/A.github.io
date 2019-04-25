<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"

"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page contentType="text/html;charset=GBK"%>

<%

	HttpSession  logsession = request.getSession(); 

	String menu_id = "";

	String cust_id="",user_id="";

	if(request.getParameter("menu_id") != null) {

		menu_id = request.getParameter("menu_id");

	}

	if (logsession.getAttribute("SESSION_CUST_ID") != null)

    {

        cust_id = logsession.getAttribute("SESSION_CUST_ID").toString();

    }

	if (logsession.getAttribute("SESSION_USER_ID") != null)

    {

        user_id = logsession.getAttribute("SESSION_USER_ID").toString();

    }

  %>

<html>

	<head>

		<title><bean:message key="str4144"/></title>


		<link href="/style/layout.css" rel="stylesheet" type="text/css">


		<script language="javascript" src="/js/Calendar_Ly.js"></script>

		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/GroupInfo.js'></script> 

		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/OrganizeInfo.js'></script>

		<script type='text/javascript'src='<%=request.getContextPath()%>/dwr/interface/EntityClassInfo.js'></script>

        <script type='text/javascript' src='<%=request.getContextPath()%>/dwr/engine.js'></script>  

        <script type='text/javascript' src='<%=request.getContextPath()%>/dwr/util.js'></script> 

        <link rel="stylesheet" type="text/css" href="../ext/resources/css/ext-all.css" />

		<script type="text/javascript" src="../ext/adapter/ext/ext-base.js"></script>

		<script type="text/javascript" src="../ext/ext-all.js"></script>

		<style type="text/css">

		 .Tree-Img {

           background-image:url(/img/resume.png) !important;

         }

        .root-Img {

           background-image:url(/img/customer.png) !important;

         }

		</style>

        <script type="text/javascript">

		function check()

		{

		   if(window.confirm('你确定要删除吗？')){

			if(document.getElementById("class_id").value=="" || document.getElementById("class_id").value=="000000000000000")

			{

				alert("请选择客户群组！");

				return false;

			}

			if(document.getElementById("user_id").value=="")

			{

				alert("选择客户！");

				return false;

			}

			return true;

			}else{

			  return false;

			}

		}

		

		//生成树形组织结构

		var tree = new Ext.tree.TreePanel({   

	    	el:"tree-div",   

	        autoScroll:true,

	        animate:true,

	        width:'35%',

	        height:'300px',

	        enableDD:true,

	        containerScroll: true, 

	        loader: new Ext.tree.TreeLoader({

	            dataUrl:'region.ejf?cmd=getRegion'            

	        })

        });

   function createTree(){

    var cust=document.getElementById("cust_id").value;

    var org_idx="000000000000000";

    var root_name="客户群组";

	tree.on("click",function(node,event){

	   document.getElementById("class_id").value=node.id;document.getElementById("class_name").value=node.text;

	   var cust=document.getElementById("cust_id").value;

	   var own=document.getElementById("own_id").value;

	   var type='0';

	   GroupInfo.getGroupCustByClass(cust,own,node.id,type,function(data){

	     DWRUtil.removeAllOptions("user_idx");

	     DWRUtil.addOptions("user_idx",data);

	   });

	});

    var root = new Ext.tree.AsyncTreeNode({

        text: root_name,

        draggable:false,

        iconCls:'root-Img',

        id:org_idx

    });

    tree.setRootNode(root);

   	var id=root.id;

   	var type="6";

   	EntityClassInfo.getEntityByUpClassMap(cust,id,type,function(data){

			for(var j=0;j<data.length;j++){ 

                            var obj=data[j];

                             callBackFunction(obj,tree.getNodeById(id));

                          }

   	});

   	tree.render();

   	root.expand();

   	tree.expandAll();

   }

   

   //三级节点

   function callBackFunction(obj,node){

      var cust=document.getElementById("cust_id").value;

      var type="6";

			for(var org_id in obj){ 

			if(org_id!='extend'){

		         var org_name=obj[org_id];

		         var nodex = new Ext.tree.TreeNode({text:org_name,draggable:false,iconCls:'Tree-Img',id:org_id});

		         node.appendChild(nodex);

		         EntityClassInfo.getEntityByUpClassMap(cust,org_id,type,function(data){

			      for(var i=0;i<data.length;i++){ 

					var objx=data[i];

					for(var orgid in objx){ 

				         var orgname=objx[orgid];

				         if(orgid!='extend'){

				         var tree_nodex= new Ext.tree.TreeNode({text:orgname,draggable:false,iconCls:'Tree-Img',id:orgid});

				         nodex.appendChild(tree_nodex);

				         EntityClassInfo.getEntityByUpClassMap(cust,orgid,type,function(data){

				          for(var i=0;i<data.length;i++){ 

                            var obj=data[i];

                             callBackFunction(obj,tree_nodex);

                          }

				         });

				         }

			         }

			      }

			   });

		     }

		     }

   }

   function setUserInfo(idx){

     document.getElementById("user_id").value=idx;

   }

    </script>

	</head>

	<body onload="createTree()">

		<table width="100%" border="0" cellpadding="0" cellspacing="0">

			<jsp:include page="/inc/top.jsp" />

			<tr>

				<!-- 中间 -->

				<td align="center">

					<div id="manager_body">

						<!--左边菜单-->

						<div id="manager_body_left">

							<jsp:include page="/inc/left.jsp" />

						</div>

						<div id="manager_body_right">

							<table width="740" border="0" cellspacing="0" cellpadding="0">

								<tr>

									<td>

										<div id="righttop">

											<jsp:include page="/inc/menu.jsp">

												<jsp:param name="menu_id" value="<%=menu_id%>" />

											</jsp:include>

										</div>

									</td>

								</tr>

							</table>

							<table width="100%;" border="0" cellspacing="0" cellpadding="0">

								<tr>

									<td align="center">

								


													<form name="departForm" id="departForm"

														action="/doTradeReg.do" method="post" target="_blank">


															<div class="lb1">

																<table width="100%" border="0" cellspacing="1"

																	cellpadding="0">

																	<tr>

																		<td width="14%" bgcolor="#efefef">

																			<div style="text-align:right; font-weight:bold;">

																				<bean:message key="str1369"/>

																			</div>

																	  </td>

																		<td width="86%" bgcolor="#FFFFFF">

																			<div class="ping">

																			  <div id="tree-div"></div>

																			  <div style="float: left;display:inline"><a href="/entitypropMgr/classIndex.jsp?menu_id=2EpTKLTyXdV2R8LVx8S1&info_type=0"><bean:message key="str1370"/></a></div>

																		  </div>

																	  </td>

																	</tr>

																	<tr>

																		<td width="14%" bgcolor="#efefef">

																			<div style="text-align:right; font-weight:bold;">

																				<bean:message key="str1371"/>

																			</div>

																	  </td>

																		<td width="86%" bgcolor="#FFFFFF">

																			<div class="ping">

																				<select id="user_idx" name="user_idx" size="10" onchange="setUserInfo(this.value);" style="width:120px">
</select>

																			</div>

																	  </td>

																	</tr>

																	

																	<input type="hidden" name="trade_type_code" value="1054">

																	<input name="cust_id" id="cust_id" type="hidden" value="<%=cust_id%>">

																	<input name="class_id" id="class_id" type="hidden" value="">

																	<input name="class_name" id="class_name" type="hidden" value="">

																	<input name="user_id" id="user_id" type="hidden" value="">

																	<input name="group_type" id="group_type" type="hidden" value="0">

																	<input name="own_id" id="own_id" type="hidden" value="<%=user_id%>">

																	<input name="entity_type" id="entity_type" type="hidden" value="0">

																	<tr>

																		<td height="40" bgcolor="#FFFFFF" align="center" colspan="2">

																			<input type="submit" name="Submit" value="删 除" onclick="return check()">

																	  </td>

																	</tr>

															  </table>

															</div>

														

													</form>

											

									

									</td>

								</tr>

							</table>

						</div>

					</div>

				</td>

			</tr>

			<tr>

				<td align="center">

					<div class="bottom_admin">

						<%@ include file="../../bottom.jsp"%>

					</div>

				</td>

			</tr>

		</table>

	</body>

</html>

