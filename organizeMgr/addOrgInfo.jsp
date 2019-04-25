<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"

"http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>

<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>

<%@ page import="java.util.*"%>

<%@ page contentType="text/html;charset=GBK"%>

<jsp:useBean id="bean" class="com.saas.biz.organizeMgr.OrganizeInfo" scope="page" />

<jsp:useBean id="comm" class="com.saas.biz.commen.commMethodMgr" scope="page" />

<%

    HttpSession htSe=request.getSession();

    String cust_id=(String)htSe.getAttribute("SESSION_CUST_ID");

    String org_id=comm.GenShortTradeId();

	ArrayList list=bean.getOrganizeByUpIdList(cust_id,"000000000000000");

	String org_idx="";

	if(list !=null && list.size()>0){

	  HashMap map=(HashMap)list.get(0);

	  org_idx=map.get("org_id").toString();

	}

	String cust_name=bean.getCustNameById(cust_id);

%>

<html>

	<head>

		<title><bean:message key="str2831"/></title>

		<link href="/style/css.css" rel="stylesheet" type="text/css">

		<style type="text/css" media="screen">

form {padding:0px; margin:0px;}

.line6 {width:72spx; width:70spx!important;border:#ffcb99 1px solid;  background-color:#fff8ee; text-align:left; padding-left: 20px;padding-top: 10px;padding-bottom: 10px; color:#000000; margin-top:13px; margin-bottom:13px;}   /*横栏样式6---- 头部提醒1*/

.line6 .img{width:53px; height:53px; float:left; margin-right:20px;}

.line6 .title {font-size:14px; font-weight:bold; color:#ff5400;}

.line1 {border-left:#ff7300 3px solid; background-color:#e2e2e2; color:#333333;text-align:left; font-size:12px;}  /*横栏样式1*/
.tjan{
     background: url(../images/tj.gif) left center no-repeat;
	 width:70px;
	 height:26px;
	 border:0px;
	 }
.Tree-Img {
    background-image:url(/img/org.png) !important;
}

.root-Img {
    background-image:url(/img/home.png) !important;
}
</style>
	<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/OrganizeInfo.js'></script>
	<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/engine.js'></script>
	<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/util.js'></script>
	<link rel="stylesheet" type="text/css" href="../ext/resources/css/ext-all.css" />
	<script type="text/javascript" src="../ext/adapter/ext/ext-base.js"></script>
	<script type="text/javascript" src="../ext/ext-all.js"></script>
	<script language="JavaScript">
    function Check_Value()
	{
	    if(document.getElementById("up_org_id").value==""){
	      alert("请选择上级组织！");
	      return false;
	    }

	    if(document.getElementById("org_name").value==""){
	      alert("组织名称不能为空！");
	      document.getElementById("org_name").focus();
	      return false;
	    }

	    if(document.getElementById("org_desc").value==""){
	      alert("组织描述不能为空！");
	      document.getElementById("org_desc").focus();
	      return false;
	    }
 	    return true;
	}
    function check_none(current_obj)
    {
        if (current_obj.advshow.checked)
        {
      	    current_obj.submit1.disabled=false;        	     
      	}
      	else
      	{
      	    current_obj.submit1.disabled=true;
      	}
  	 }
    	function confirmsub(formobj)
    	{
    	    if(window.confirm('你确定要提交吗？')) 
    	    {  	    	
    	        if (Check_Value())
    	        {
    	            formobj.submit();   	
    	        }
    	    }
    	    else
    	    {
    	        return;
    	    }
    	}
    Ext.onReady(function(){ 
      var resizeable = new Ext.Resizable('tree-div', {
            pinned:true,
            autoWidth:true,
            autoHeight:true,
            handles: 'e',
            widthIncrement:50,
            minWidth: 50,
			maxWidth:450,
            dynamic: true
        });
        
    var tree = new Ext.tree.TreePanel({   
   	el:"tree-div",   
       autoScroll:false,
       animate:true,
       width:'30%',
       height:'300px',
       enableDD:false,
       containerScroll: true, 
       loader: new Ext.tree.TreeLoader({
           dataUrl:'/tree/json_data.jsp'            
       })
   });
    var cust=document.getElementById("cust_id").value;
    var org_idx=document.getElementById("org_idx").value;
    var root_name=document.getElementById("cust_name").value;
	tree.on("click",function(node,event){document.getElementById("up_org_id").value=node.id;});
    var root = new Ext.tree.AsyncTreeNode({
        text: root_name,
        draggable:false,
        iconCls:'root-Img',
        id:'000000000000000'
    });
    tree.setRootNode(root);
   	tree.render();
   	root.expand();
   	tree.expandAll();
   });
</script>

	</head>

	<body>

		<form name=resumeForm action=/doTradeReg.do method=post target="_self">

			<table width="100%" border="0" cellspacing="0" cellpadding="0">

				<tr>

					<td height="2">

						<input name="tr_name" id="tr_name" type="hidden" value="">

						<input name="tr_id" id="tr_id" type="hidden" value="">

					</td>

				</tr>

				<tr>

					<td valign="top">

						<table width=100% border=0 cellpadding=5 cellspacing=1 align=center bgcolor="#dddddd">

							<tr>

								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;text-align:right" align=right>
									<bean:message key="str2832"/>
								</td>

								<td align="left" bgcolor="#FFFFFF">

									<div class="ping">

										<div id="tree-div" style="display:inline;float:left;"></div>

									</div>
								</td>
							</tr>

							<tr>

								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;text-align:right" align=right width=15%>

									<bean:message key="str2833"/>
								</td>

								<td width=85% align=left bgcolor="#FFFFFF">
									<div class="ping">
										<input name="org_name" type="text" id="org_name" size=30 maxlength=50>
									</div>
								</td>
							</tr>

							<input name="org_id" id="org_id" type="hidden" value="<%=org_id%>">

							<input name="org_idx" id="org_idx" type="hidden" value="<%=org_idx%>">

							<input name="org_type" id="org_type" type="hidden" value="">

							<input name="org_class" id="org_class" type="hidden" value="">

							<input name="up_org_id" id="up_org_id" type="hidden" value="">

							<input name="t_node" id="t_node" type="hidden" value="">

							<input name="cust_id" id="cust_id" type="hidden" value="<%=cust_id%>">

							<input name="cust_name" id="cust_name" type="hidden" value="<%=cust_name%>">

							<tr>

								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;text-align:right" align=right>

									<bean:message key="str2834"/>
								</td>

								<td align=left bgcolor="#FFFFFF">
									<div class="ping">
										<textarea name="org_desc" id="org_desc" cols="50" rows="6"></textarea>
									</div>
								</td>
							</tr>

							<tr>

								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;text-align:right" align=right>

									<bean:message key="str2835"/>
								</td>

								<td align=left bgcolor="#FFFFFF">
									<div class="ping1">
										<input name="remark" id="remark" type="text" size=52 maxlength="50" />
									</div>
								</td>
							</tr>

							<input name="trade_type_code" type="hidden" value="1035" />

							<tr>

								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;padding-top:10px;padding-bottom:10px;text-align:center;" align="center" colspan=2>

									<input class="tjan" name="submit1" type="button" value=""  onclick="confirmsub(resumeForm)">
								</td>
							</tr>
						</table>

					</td>

				</tr>

				<tr>

					<td height="13"></td>

				</tr>

			</table>

		</form>

	</body>

</html>

