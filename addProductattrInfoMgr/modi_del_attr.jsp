<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="java.util.*"%>
<%@ page contentType="text/html;charset=GBK"%>
<jsp:useBean id="orderBean" class="com.saas.biz.formStateMgr.FormStateInfo" scope="page" />
<jsp:useBean id="comParam" class="com.saas.biz.commen.ParamethodMgr" scope="page"/>
<jsp:useBean id="comm" class="com.saas.biz.commen.commMethodMgr" scope="page" />
<%@ page import="com.saas.biz.addproductattrMgr.*"%>
<html>
<head>
<title><bean:message key="str432"/></title>
<link href="/style/css.css" rel="stylesheet" type="text/css">
<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/AddProductAttrInfo.js'></script>
<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/engine.js'></script>  
<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/util.js'></script>
<style type="text/css">
.line6 {width:72spx; width:70spx!important;border:#ffcb99 1px solid;  background-color:#fff8ee; text-align:left; padding-left: 20px;padding-top: 10px;padding-bottom: 10px; color:#000000; margin-top:13px;}   /*横栏样式6---- 头部提醒1*/
.line6 .img{width:53px; height:53px; float:left; margin-right:20px;}
.line6 .title {font-size:14px; font-weight:bold; color:#ff5400;}
.line1 {border-left:#ff7300 3px solid; background-color:#e2e2e2; color:#333333;text-align:left; font-size:12px;}  /*横栏样式1*/
</style>
</head>
<body>
<%
    HttpSession  logsession = request.getSession(); 
    String cust_id = "",class_id="";
    if (logsession.getAttribute("SESSION_CUST_ID") != null)
    {
        cust_id = logsession.getAttribute("SESSION_CUST_ID").toString();
    }
    if (request.getParameter("class_id") != null)
    {
        class_id = request.getParameter("class_id");
    }
    AddProductAttrInfo group=new AddProductAttrInfo();
    ArrayList tableList =group.getProductById(cust_id,class_id);
%>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
	  <tr>
	    <td height="13" align="left">
	    </td>
	  </tr>
	  <tr>
	    <td>
		     <table width=727 border=0 cellpadding=2 cellspacing=1 align=center  bgcolor="#e7e7e7">
		        <tr>
			        <td class="line1" style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="10%"><bean:message key="str0991"/></td>
					<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="10%"><bean:message key="str0992"/></td>
					<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="10%"><bean:message key="str1292"/></td>
					<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="20%"><bean:message key="str4648"/></td>
					<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="20%"><bean:message key="str365"/></td>
					<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="10%"><bean:message key="str754"/></td>
					<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="10%"><bean:message key="str0996"/></td>
		        </tr>
		       <%
		         if(tableList !=null && tableList.size()>0){
		         for(int i=0;i<tableList.size();i++){
		           HashMap map=(HashMap)tableList.get(i);
		           String describe="",attr_name="",attr_no="",attr_id="",
		           attr_desc="",default_value="",remark="";
		           if(map.get("class_id")!=null){
		             class_id=map.get("class_id").toString();
		           }
		           if(map.get("attr_id")!=null){
		             attr_id=map.get("attr_id").toString();
		           }
		           if(map.get("attr_name")!=null){
		             attr_name=map.get("attr_name").toString();
		           }
		           if(map.get("attr_no")!=null){
		             attr_no=map.get("attr_no").toString();
		           }
		            if(map.get("default_value")!=null){
		             default_value=map.get("default_value").toString();
		           }
		            if(map.get("attr_desc")!=null){
		             attr_desc=map.get("attr_desc").toString();
		           }
		           if(map.get("remark")!=null){
		             remark=map.get("remark").toString();
		           }
		       %>
		        <tr style="background-color:#f9f9f9;"id="changcolor_tr<%=i%>" onmouseover="MM_changeProp('changcolor_tr<%=i%>','','backgroundColor','#ffffff','DIV')" onmouseout="MM_changeProp('changcolor_tr<%=i%>','','backgroundColor','#f9f9f9','DIV')">
	              <td style="color:#000000;" align="left"><%=attr_name%></td>
	              <td style="color:#000000;" align="center"><%=attr_no%></td>
	              <td style="color:#000000;" align="center"><%=default_value%></td>
	              <td style="color:#000000;" align="center"><%=attr_desc%></td>
	              <td style="color:#000000;" align="center"><%=remark%></td>
	              <td style="color:#000000;" align="center"><a href="modiattr.jsp?class_id=<%=class_id%>&attr_id=<%=attr_id%>" target="_blank"><img src=/img/edit.gif width=16 height=16 border=0 alt="Amendments to the product attributes"></a></td>
	              <td style="color:#000000;" align="center"><a href="/doTradeReg.do?trade_type_code=1225&attr_id=<%=attr_id%>" target="_self"><img src=/img/del.gif width=16 height=16 border=0 alt="Delete product attributes"></a></td>
	            </tr>
	            <%}%>
			    
		       <%}%>
		    </table>
	     </td>
	  </tr>
	  <tr>
	    <td height="13"></td>
	  </tr>
	</table>
</body>
</html>
