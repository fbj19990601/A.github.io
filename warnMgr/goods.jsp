<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>

<%@ page import="java.util.*"%>
<%@ page import="com.saas.biz.goodsMgr.GoodsInfo"%>
<%@ page import="com.saas.biz.commen.ParamethodMgr"%>
<%@ page contentType="text/html;charset=GBK"%>

<html>
<head>
<title><bean:message key="str4168"/></title>
<link href="/style/layout.css" rel="stylesheet" type="text/css">
<script language="javascript" src="/js/Calendar_Ly.js"></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/GoodsInfo.js'></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/engine.js'></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/util.js'></script>
<script type="text/javascript">
	function check(){
    if(document.getElementById("obj_id").value==""){
      alert("请选择一个物料!");
      return false;
    }else{
		window.opener.resumeForm.param_value.value=document.getElementById("obj_id").value+"|g";
		window.close();
		return false;
	}
  }
   function setObjValue(goods_id,name){
    document.getElementById("obj_id").value=goods_id;
    window.opener.resumeForm.type_3.value=name;
  }
</script>
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

	<table width="550" border="0" cellspacing="0" cellpadding="0" align="center">

	  <tr>

	    <td height="13" align="left">

	    </td>

	  </tr>

	  <tr>

	    <td>

		     <table width=100% border=0 cellpadding=2 cellspacing=1 align=center  bgcolor="#e7e7e7">

		        <tr>

			        <td class="line1" style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="33%">物料名称</td>
					<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="33%">物料编码</td>
					<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="14%">当前库存数</td>
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
					              <td  style=" color:#000; padding:2px 5px;" align=left><input type="radio" name="radio_goods" id="<%=goods_id%>" onclick="setObjValue('<%=goods_id%>','<%=goods_name%>')"><%=goods_name%></td>
					              <td  style=" color:#000000; padding:2px 5px;" align="center"><%=goods_no%></td>
					              <td  style=" color:#000000; padding:2px 5px;" align="center"><%=now_num%></td>
					            </tr>
						        <%
					     }
					     %>
					     <tr>
							<td  align="left" colspan="1" style="font-weight:normal; padding:2px 5px;">
							<bean:message key="str3988"/><%=counter%><bean:message key="str5127"/>
							<bean:message key="str3988"/><%=pages%><bean:message key="str5128"/></td>
							<td  align="right" colspan="2" style=" padding:2px 5px;">
							<a href="goods.jsp?iStart=0&menu_id=<%=menu_id%>">
							<bean:message key="首页"/> </a>&nbsp; &nbsp;<a href="goods.jsp?iStart=<%=pageUp%>&menu_id=<%=menu_id%>">
							<bean:message key="str1148"/></a> &nbsp;<a href="goods.jsp?iStart=<%=pageDown%>&menu_id=<%=menu_id%>">
							<bean:message key="str1149"/> </a>&nbsp; <a  href="goods.jsp?iStart=<%=pages%>&menu_id=<%=menu_id%>">
							<bean:message key="str1150"/></a></td>
				         </tr>
				          <tr>
				     	<td height="40" colspan="3" bgcolor="#FFFFFF">
							<div align="center">
								<input class="tjan" type="submit" name="Submit" value="" onclick="return check()">
							</div>
						</td>
				     </tr>
					 <%}
		        %>
		        <input type="hidden" name="obj_id" id="obj_id">
		    </table>
	     </td>
	  </tr>
	  <tr>
	    <td height="13"></td>
	  </tr>
	</table>
</body>
</html>