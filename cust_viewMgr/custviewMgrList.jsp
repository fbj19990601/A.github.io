<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="java.util.*"%>
<%@ page import="com.saas.biz.levelMgr.LevelInfo"%>
<%@ page import="com.saas.biz.relationccMgr.RelationCcInfo"%>
<%@ page import="com.saas.biz.commen.ParamethodMgr"%>
<%@ page contentType="text/html;charset=GBK"%>

<html>
<head>
<title><bean:message key="str1845"/></title>
<link href="/style/layout.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="/ext/adapter/ext/ext-base.js"></script>
<script type="text/javascript" src="/ext/ext-all.js"></script>
<link rel="stylesheet" type="text/css" href="/ext/resources/css/ext-all.css"/>
<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/UserInfo.js'></script> 
<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/engine.js'></script>  
<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/util.js'></script> 
<style type="text/css">
.line6 {width:72spx; width:70spx!important;border:#ffcb99 1px solid;  background-color:#fff8ee; text-align:left; padding-left: 20px;padding-top: 10px;padding-bottom: 10px; color:#000000; margin-top:13px;}   /*横栏样式6---- 头部提醒1*/
.line6 .img{width:53px; height:53px; float:left; margin-right:20px;}
.line6 .title {font-size:14px; font-weight:bold; color:#ff5400;}
.line1 {border-left:#ff7300 3px solid; background-color:#e2e2e2; color:#333333;text-align:left; font-size:12px;}  /*横栏样式1*/
</style>
<script language="javascript">
  function chechIfo(obj_id)
  {
    var result=new Boolean(false);
	if(confirm('是否确认要执行本操作？')) 
	{
	    return true;
	}
	else
	{
		return false;
	}
  }
  function checkRaleType(type){
    if(type!="0"){
      document.getElementById("code").value="2";
      sumbimtData();
    }
  }
 
  function sumbimtData(){
    document.relationForm.submit();
  }
  
</script>
</head>
<body>
<%
   HttpSession  logsession = request.getSession(); 
    String cust_id = "";
    String iStart ="0";
    String meun_idx="";
   // String code="0";
   String keyword="",type_code="";
  // if (request.getParameter("code") != null)
  // {
     //  code = request.getParameter("code");
  // }
   if (request.getParameter("cust_name") != null)
   {
       keyword = request.getParameter("cust_name");
       keyword=new String(keyword.getBytes("ISO-8859-1"),"GBK");  
   }
   if (request.getParameter("relation_type_code") != null)
   {
       type_code = request.getParameter("relation_type_code");
   }
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
       meun_idx = request.getParameter("menu_id");
    }
  RelationCcInfo relation=new RelationCcInfo();
  ArrayList relationList =new ArrayList();
  int counter=0;
  try
  {  
	    
	     relationList=relation.getRelationPageByType(Integer.valueOf(iStart).intValue(),cust_id,"1");

  }
  catch(Exception ex)
  {
    out.print("");
  }
   ParamethodMgr paramObj=new ParamethodMgr();
   ArrayList custLevel = new LevelInfo().getLevelListByCustEntity(cust_id, "0");

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
	    <td>
		     <table width=100% border=0 cellpadding=2 cellspacing=1 align=center  bgcolor="#e7e7e7">
		        <tr>
			        <td class="line1" style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="35%"><bean:message key="str2320"/></td>
					<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="15%"><bean:message key="str371"/></td>
					<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="15%"><bean:message key="str372"/></td>
					<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="15%"><bean:message key="str1141"/></td>
		        </tr>
		        <%
		           if(relationList != null && relationList.size()>0)
		            {    
		              	 for (int i=0;i<relationList.size();i++)
		                  {
						        HashMap map = (HashMap)relationList.get(i);
						        String obj_cust_id=map.get("obj_cust_id").toString();
						        String cust_name="";
						        String relation_type_code="";
						        String group_contact_phone="";
						        String start_date="",level_name = "";
						        String remark="";
						        String cust_code="";
						        if(map.get("remark") != null)
						        {
						           remark=map.get("remark").toString();
						        }
						      	if(map.get("level_name") != null)
						        {
						           level_name=map.get("level_name").toString();
						        }
						        if(map.get("develope_man") != null)
						        {
						           cust_code=map.get("develope_man").toString();
						        }
						        if(map.get("cust_name") != null)
						        {
						           cust_name=map.get("cust_name").toString();
						        }
						        if(map.get("group_contact_phone") != null)
						        {
						           group_contact_phone=map.get("group_contact_phone").toString();
						        }
						        if(map.get("start_date") != null)
						        {
						           start_date=map.get("start_date").toString();
						           if(start_date.length()>10)
						           {
						             start_date=start_date.substring(0,10);
						           }
						        }
						        %>
						        
						        <tr style="background-color:#f9f9f9; " id="changcolor_tr<%=i%>" onmouseover="MM_changeProp('changcolor_tr<%=i%>','','backgroundColor','#ffffff','DIV')" onmouseout="MM_changeProp('changcolor_tr<%=i%>','','backgroundColor','#f9f9f9','DIV')">
						          <td  style=" color:#000000; padding:2px 5px;" align=left><a href="/customerMgr/Custinfo.jsp?obj_cust_id=<%=obj_cust_id%>&user_id=" target="_blank"><%=cust_name%></a></td>
					              <td  style=" color:#000000;" align=center><%=level_name%></td>
					              <td  style=" color:#000000; padding:2px 5px;" align=left><%=group_contact_phone%></td>
					              <td  style=" color:#000000;" align=center><%=start_date%></td>
					           
					            </tr>
						        
						        <%
					     }
					     
					     %>
					     
					     <tr>
							<td  align="left" colspan="2" style=" padding:2px 5px;"><bean:message key="str1143"/><%=counter%><bean:message key="str1144"/> &nbsp;<bean:message key="str1143"/><%=pages%><bean:message key="str1146"/></td>
							<td  align="left" colspan="4" style=" padding:2px 5px;"><a href="index.jsp?iStart=0&menu_id=<%=meun_idx%>"><bean:message key="str1147"/>  </a>&nbsp; &nbsp;<a href="index.jsp?iStart=<%=pageUp%>&menu_id=<%=meun_idx%>"><bean:message key="str1148"/></a> &nbsp;<a href="index.jsp?iStart=<%=pageDown%>&menu_id=<%=meun_idx%>"><bean:message key="str1149"/> </a>&nbsp; <a  href="index.jsp?iStart=<%=pages%>&menu_id=<%=meun_idx%>"><bean:message key="str1150"/></a></td>
				         </tr>
					     
					     <%
		            }
		        %>
		    </table>
	     </td>
	  </tr>
	  <tr>
	    <td height="13"></td>
	  </tr>
	</table>
</body>
</html>