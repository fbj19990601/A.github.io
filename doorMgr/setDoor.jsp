<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"

"http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>

<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>

<%@ page import="java.util.*"%>

<%@ page import="com.saas.biz.goodsMgr.GoodsInfo"%>

<%@ page import="com.saas.biz.commen.ParamethodMgr"%>

<%@ page contentType="text/html;charset=GBK"%>



<html>

<head>

<title><bean:message key="str1208"/></title>
<link href="/style/layout.css" rel="stylesheet" type="text/css">
<script language="javascript" src="/js/Calendar_Ly.js"></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/GoodsInfo.js'></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/engine.js'></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/util.js'></script>
<script type="text/javascript">
	function showSetDoor(val,vag){
		var goods_id=val;
		var goods_name=vag;
		var cust_id=document.getElementById('cust_id').value;
		document.getElementById('doorDiv').style.display='block';
		document.getElementById('goods_id').value=goods_id;
		document.getElementById('goods_name').value=goods_name;
		GoodsInfo.getOneGoods(cust_id,val,setData);
	}
	function setData(Map){
		   	var max_door=Map['max_door'];
		   	var min_door=Map['min_door'];
		   	document.getElementById("max_door").value=max_door;
		    document.getElementById("min_door").value=min_door;
	}
	function check(){
		if(document.getElementById('max_door').value==''){
			alert('请填写最大告警门限!');
			return false;
		}
		if(document.getElementById('min_door').value==''){
			alert('请填写最小告警门限!');
			return false;
		}
		return true;
	}
</script>
<style type="text/css">
	.bord{
		border-style: none;
	}
</style>
</head>

<body>

<%

   HttpSession  logsession = request.getSession(); 
    String cust_id = "";
    String iStart ="0";
    String menu_id="";

    if (request.getParameter("iStart") != null)
    {
        iStart = request.getParameter("iStart");
    }

    if (logsession.getAttribute("SESSION_CUST_ID") != null)
    {
        cust_id = logsession.getAttribute("SESSION_CUST_ID").toString();
    }

    if (request.getParameter("menu_id") != null)
    {
        menu_id = request.getParameter("menu_id");
    }

    
   GoodsInfo door = new GoodsInfo();
   ArrayList actionList =new ArrayList();
   actionList=door.getAllGoods(Integer.valueOf(iStart).intValue(),cust_id);
   int counter=door.getAllGoods(cust_id);
   
    int pages=counter/20+1;
	int pageUp=0,pageDown=0;
	int currenPage=Integer.valueOf(iStart).intValue();
	if(pages>currenPage)
	{
	   if(currenPage>0)
	   {
		pageUp=currenPage-1;
	   }
		pageDown=currenPage+1;
	}
    else if(pages==currenPage)
	{
	   pageUp=currenPage-1;
	   pageDown=currenPage;
	}
%>

	<table width="100%" border="0" cellspacing="0" cellpadding="0">

	  <tr>

	    <td height="13" align="left">

	    </td>

	  </tr>

	  <tr>

	    <td>

		     <table width=100% border=0 cellpadding=2 cellspacing=1 align=center  bgcolor="#e7e7e7">

		        <tr>

			        <td class="line1" style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="33%"><bean:message key="str2391"/></td>
					<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="33%"><bean:message key="str4170"/></td>
					<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="14%"><bean:message key="str4171"/></td>
					<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="20%"><bean:message key="str4724"/></td>
		        </tr>

		       <%	
		            if(actionList != null && actionList.size()>0)
		            {    
		              	 for (int i=0;i<actionList.size();i++)
		                  {
						        HashMap map = (HashMap)actionList.get(i);
						        String goods_id="",goods_name="",goods_no="",now_num="";
						        if(map.get("goods_id")!=null){
						         goods_id=map.get("goods_id").toString();
						        }
						        if(map.get("goods_name")!=null){
						         goods_name=map.get("goods_name").toString();
						        }
						        if(map.get("goods_no")!=null){
						         goods_no=map.get("goods_no").toString();
						        }
						        if(map.get("now_num")!=null){
						         now_num=map.get("now_num").toString();
						        }
						        %>
						        <tr style="background-color:#f9f9f9; " id="changcolor_tr<%=i%>" onmouseover="MM_changeProp('changcolor_tr<%=i%>','','backgroundColor','#ffffff','DIV')" onmouseout="MM_changeProp('changcolor_tr<%=i%>','','backgroundColor','#f9f9f9','DIV')">
					              <td  style=" color:#000; padding:2px 5px;" align=left><%=goods_name%></td>
					              <td  style=" color:#000000; padding:2px 5px;" align="center"><%=goods_no%></td>
					              <td  style=" color:#000000; padding:2px 5px;" align="center"><%=now_num%></td>
					              <td  style=" color:#000000; padding:2px 5px;" align="center"><img src="/img/edit.png" onclick="showSetDoor('<%=goods_id %>','<%=goods_name %>')" style="cursor: hand;"></td>
					            </tr>
						        <%
					     }
					     %>
				         <tr>
							<td  align="left" colspan="1" style="font-weight:normal; padding:2px 5px;"><bean:message key="str3988"/><%=counter%><bean:message key="str611"/>  &nbsp;<bean:message key="str759"/><%=Integer.parseInt(iStart)+1 %><bean:message key="str1029"/>&nbsp;&nbsp;<bean:message key="str3988"/><%=pages%><bean:message key="str1029"/></td>
							<td  align="right" colspan="3"  style=" padding:2px 5px;">
							<a href="setDoor.jsp?iStart=0"><bean:message key="str1030"/>  </a>&nbsp; &nbsp;
							<% 
							if(Integer.parseInt(iStart)>0){
							%>
							<a href="setDoor.jsp?iStart=<%=pageUp%>"><bean:message key="str1031"/></a> &nbsp;
							<%
							}
							if(Integer.parseInt(iStart)<pages-1){
							%>
							<a href="setDoor.jsp?iStart=<%=pageDown%>"><bean:message key="str1032"/>  </a>&nbsp; 
							<%
							}
							%>
							<a  href="setDoor.jsp?iStart=<%=pages-1%>"><bean:message key="str1033"/></a></td>
						</tr>
					 <%}
		        %>
		    </table>
	     </td>
	  </tr>
	  <tr>
	    <td height="13"></td>
	  </tr>
	</table>
	<hr>
	<div id="doorDiv" style="display: none;">
	<form name="doorForm" id="doorForm"	action="/doTradeReg.do" method="post" target="_self">
		 <table width=100% border=0 cellpadding=2 cellspacing=1 align=center  bgcolor="#ffffff">
		 	 <tr>
			    <td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" colspan="4" align="left">
			    	<bean:message key="str1209"/><input type="text" name="goods_name" id="goods_name" style="border:0px none; background-color:#e2e2e2; font-weight: bolder;font-size: large;">
			    </td>
		     </tr>
		 	 <tr>
			    <td  width="15%" align="right" style="background-color:#f9f9f9;"><bean:message key="str1210"/></td>
			    <td align="left" colspan="3"  style="background-color:#f9f9f9;"><input type="text" name="max_door" id="max_door" value="" onkeyup="if(isNaN(this.value))execCommand('undo')"></td>
		     </tr>
		     <tr>
			    <td  align="right" style="background-color:#f9f9f9;"><bean:message key="str1211"/></td>
			    <td align="left" colspan="3" style="background-color:#f9f9f9;"><input type="text" name="min_door" id="min_door" value="" onkeyup="if(isNaN(this.value))execCommand('undo')"></td>
		     </tr>
		     <input type="hidden" name="goods_id" id="goods_id" value="">
		     <input type="hidden" name="cust_id" id="cust_id" value="<%=cust_id %>">
		     <input type="hidden" name="trade_type_code" id="trade_type_code" value="2187">
		     <tr>
		     	<td height="40" colspan="4" bgcolor="#FFFFFF">
					<div align="center">
						<input class="tjan" type="submit" name="Submit" value="" onclick="return check()">
					</div>
				</td>
		     </tr>
		 </table>
	</form>
	</div>
</body>
</html>