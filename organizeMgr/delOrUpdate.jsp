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
		<title><bean:message key="str2837"/></title>
		<link rel="stylesheet" type="text/css" href="../ext/resources/css/ext-all.css" />
		<script type="text/javascript" src="../ext/adapter/ext/ext-base.js"></script>
		<script type="text/javascript" src="../ext/ext-all.js"></script>
		<style type="text/css">
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
		
		<script language="JavaScript">
    function Check_Value()
	{
	    if(document.getElementById("up_org_id").value=="0"){
	      alert("请选择上级组织！");
	      document.getElementById("up_org_id").focus();
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

    

   	function update(formobj)
   	{
   	    if(window.confirm('你确定要提交吗？')) 
   	    {  	    	
   	        if (Check_Value())
   	        {
   	            document.getElementById("trade_type_code").value="1036";
   	            formobj.submit();   	
   	        }
   	    }
   	    else
   	    {
   	        return;
   	    }
   	}
   	function delet(formobj)
    	{
    	    if(window.confirm('你确定要删除吗？')) 
    	    {  	    
    	       if(Check_Value()){
	    	        if(checkChildren())
	    	        {
	    	        }
    	        }
    	    }
    	    else
    	    {
    	        return;
    	    }
    	}

   

   //设置详细信息
   function setInfo(id){
     if(id!="" && id!="0"){
       OrganizeInfo.getOrganizeByOrgId(id,setOrgName);
     }else{
        document.getElementById("org_name").value="";
        document.getElementById("org_desc").value="";
        document.getElementById("remark").value="";
        document.getElementById("org_id").value="1";
     }
   }
   function setOrgName(orgMap){
    var o_org=orgMap['org_id'];
    var o_Name=orgMap['org_name'];
    var o_desc=orgMap['org_desc'];
    var o_remark=orgMap['remark'];
    document.getElementById("org_name").value=o_Name;
    document.getElementById("org_desc").value=o_desc;
    document.getElementById("remark").value=o_remark;
    document.getElementById("org_id").value=o_org;
   }
   function createSelect(num,id){
     setInfo(id);
     var div="next"+num;
     var next=parseInt(1)+parseInt(num);
     var nextDiv="next"+num;
     var cust=document.getElementById("cust_id").value;
     document.getElementById(nextDiv).innerHTML="<select name=org"+num+" id=org"+num+" onclick=createSelect("+next+",this.value)></select><div id=next"+next+"></div>"; 
     document.getElementById("active").value=num;
     OrganizeInfo.getOrganizeByUpId(cust,id,setActiveDown);
   }
   function setActiveDown(data){
      var obj="org"+document.getElementById("active").value;
      var objDiv="next"+document.getElementById("active").value;
      DWRUtil.removeAllOptions(obj);
	  DWRUtil.addOptions(obj,data);
	   var item=document.getElementById(obj).length;
	    if(item==0)
	    {
	    	document.getElementById(objDiv).style.display="none"; 
	    }
	     else
	   	{
	   		document.getElementById(objDiv).style.display="block";
	   	}
   }
   function checkChildren(){
     var cust=document.getElementById("cust_id").value;
     var org_id=document.getElementById("org_id").value;
     OrganizeInfo.checkChildren(cust,org_id,hasChildren);
   }

   function hasChildren(data){
    document.getElementById("del").value=data;
	 if(document.getElementById("del").value=="0"){
        document.getElementById("trade_type_code").value="1037";
	   document.resumeForm.submit();   	
     }else{
       alert("不能删除该组织，如果要删除，请先删除下级组织！");
       return false;
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
	tree.on("click",function(node,event){
	 document.getElementById("up_org_id").value=node.id;
	 setInfo(node.id);
	}
	);
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
					<td height="2"></td>
				</tr>
				<tr>
					<td valign="top">
						<table width=100% border=0 cellpadding=5 cellspacing=1 align=center bgcolor="#dddddd">
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;text-align:right" align=right>
									<bean:message key="str2838"/>
								</td>
								<td style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left>
									<div id="tree-div"></div>
								</td>
							</tr>
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;text-align:right" align=right width=15%>
									<bean:message key="str2839"/>
								</td>
								<td style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left width=85%>
									<div class="ping">
										<input name="org_name" type="text" id="org_name" size=30 maxlength=50>
									</div>
								</td>
							</tr>
							<input name="org_id" id="org_id" type="hidden" value="">
							<input name="org_idx" id="org_idx" type="hidden" value="<%=org_idx%>">
							<input name="org_type" id="org_type" type="hidden" value="">
							<input name="org_class" id="org_class" type="hidden" value="">
							<input name="cust_id" id="cust_id" type="hidden" value="<%=cust_id%>">
							<input name="up_org_id" id="up_org_id" type="hidden" value="">
							<input name="del" id="del" type="hidden" value="0">
							<input name="cust_name" id="cust_name" type="hidden" value="<%=cust_name%>">
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;text-align:right" align=right>
									<bean:message key="str2840"/>
								</td>
								<td align="left" bgcolor="#FFFFFF">
									<div class="ping">
										<textarea name="org_desc" id="org_desc" cols="50" rows="6"></textarea>
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;text-align:right" align=right>
									<bean:message key="str164"/>
								</td>
								<td align="left" bgcolor="#FFFFFF">
									<div class="ping1">
										<input name="remark" id="remark" type="text" size=52 maxlength="50" />
									</div>
								</td>
							</tr>
							<input name="trade_type_code" id="trade_type_code" type="hidden" value="" />
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;padding-top:10px;padding-bottom:10px;text-align:center;" align="center" colspan=2>
									<input class="xgan" name="submit1" type="button" value="" onclick="update(resumeForm)">
									&nbsp;&nbsp;
									<input class="scan" name="submit1" type="button" value="" onclick="delet(resumeForm)">
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
