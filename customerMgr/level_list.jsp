<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="java.util.*"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.saas.biz.relationccMgr.RelationCcInfo"%>
<html>
<head>
<title><bean:message key="str1885"/></title>
<link href="/style/css.css" rel="stylesheet" type="text/css">
<style type="text/css">
.line6 {width:72spx; width:70spx!important;border:#ffcb99 1px solid;  background-color:#fff8ee; text-align:left; padding-left: 20px;padding-top: 10px;padding-bottom: 10px; color:#000000; margin-top:13px;}   /*横栏样式6---- 头部提醒1*/
.line6 .img{width:53px; height:53px; float:left; margin-right:20px;}
.line6 .title {font-size:14px; font-weight:bold; color:#ff5400;}
.line1 {border-left:#ff7300 3px solid; background-color:#e2e2e2; color:#333333;text-align:left; font-size:12px;}  /*横栏样式1*/
</style>
<script type="text/javascript">
</script>
</head>
<body>
<%
    HttpSession  logsession = request.getSession(); 
    String cust_id = "",class_id="",start="0";
    if (logsession.getAttribute("SESSION_CUST_ID") != null)
    {
        cust_id = logsession.getAttribute("SESSION_CUST_ID").toString();
    }
    if (request.getParameter("class_id") != null)
    {
        class_id = request.getParameter("class_id");
    }
    if (request.getParameter("start") != null)
    {
        start = request.getParameter("start");
    }
    RelationCcInfo relation=new RelationCcInfo();
    ArrayList relaList =relation.getRelationPageByType(Integer.parseInt(start),cust_id,class_id);
    out.println(relaList);
    int counter=relation.getCustomerLevel(cust_id,class_id,"1");
    int pages=counter/20+1;
	int pageUp=0,pageDown=0;
	int currenPage=Integer.valueOf(start).intValue();
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
			        <td class="line1" style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="25%"><bean:message key="str2320"/></td>
					<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="15%"><bean:message key="str1255"/></td>
		            <td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="25%"><bean:message key="str2321"/></td>
					<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="15%"><bean:message key="str1882"/></td>
		       		<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="15%"><bean:message key="str1886"/></td>
		        </tr>
		       <%
		         if(relaList !=null && relaList.size()>0){
		         for(int i=0;i<relaList.size();i++){
		           HashMap map=(HashMap)relaList.get(i);
		           String cust_name="",obj_cust_id="",phone="",email="",date_time="";
		           if(map.get("obj_cust_id")!=null){obj_cust_id=map.get("obj_cust_id").toString();}
		           if(map.get("cust_name")!=null){cust_name=map.get("cust_name").toString();}
		           if(map.get("group_contact_phone")!=null){phone=map.get("group_contact_phone").toString();}
		           if(map.get("email")!=null){email=map.get("email").toString();}
		           if(map.get("start_date")!=null){
		             date_time=map.get("start_date").toString();
		             if(date_time.length()>10){
		               date_time=date_time.substring(0,10);
		             }
		           }
		           if(i%2==0){
		       %>
		        <tr style="background-color:#efefef;">
		        <%}else{%>
	            <tr style="background-color:#FFFFFF;">
	            <%}%>
	              <td style="color:#000000;" align="left"><a href="/customerMgr/Custinfo.jsp?obj_cust_id=<%=obj_cust_id%>&class_id=<%=class_id%>&user_id=" target="_blank"><%=cust_name%></a></td>
	              <td style="color:#000000;" align="left"><%=phone%></td>
	              <td style="color:#000000;" align="left"><%=email%></td>
	              <td style="color:#000000;" align="left"><%=date_time%></td>
	              <td style="color:#000000;" align="center"><a href="modifyRelation.jsp?obj_cust_id=<%=obj_cust_id%>&level_code=<%=class_id%>" target="_blank"  onClick="return chechIfo()"><img src=/img/edit.gif width=16 height=16 border=0></a></td>
	            </tr>
	            <%}%>
		       <%}else{
		       pages=0;
		       }%>
		        <tr>
					<td align="left" colspan="2" style=" padding:2px 5px;"><bean:message key="str3988"/><%=counter%><bean:message key="str611"/> &nbsp;<bean:message key="str3988"/><%=pages%><bean:message key="str1029"/></td>
					<td align="right" colspan="3" style=" padding:2px 5px;"><a href="javascript:nextPage('0','<%=class_id%>')"><bean:message key="str1030"/> </a>&nbsp; &nbsp;<a href="javascript:nextPage('<%=pageUp%>','<%=class_id%>')"><bean:message key="str1031"/></a> &nbsp;<a href="javascript:nextPage('<%=pageDown%>','<%=class_id%>')"><bean:message key="str1032"/> </a>&nbsp; <a  href="javascript:nextPage('<%=pages%>','<%=class_id%>')"><bean:message key="str1033"/></a></td>
				</tr>
					     
		    </table>
	     </td>
	  </tr>
	  <tr>
	    <td height="13"></td>
	  </tr>
	</table>
</body>
</html>
