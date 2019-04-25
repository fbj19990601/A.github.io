<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="java.util.*"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.saas.biz.ProcessMgr.ProcessInfo"%>
<jsp:useBean id="bean" class="com.saas.biz.commen.ParamethodMgr" scope="page" />
<%
   HttpSession  logsession = request.getSession(); 
    String cust_id = "";
    String iStart ="0";
    String meun_idx="";
    if (request.getParameter("iStart") != null)
    {
        iStart = request.getParameter("iStart");
    }
    if (logsession.getAttribute("SESSION_CUST_ID") != null)
    {
        cust_id = logsession.getAttribute("SESSION_CUST_ID").toString();
    }
  ProcessInfo processObj=new ProcessInfo();
  ArrayList processList = processObj.gentProcessByCust_id(Integer.valueOf(iStart).intValue(),cust_id);
     int counter=processObj.getProcessListNumber(cust_id);
     int pages=counter/30+1;
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
<html>
	<head>
		<title>B2B EC-platform</title>
		<link href="/style/layout.css" rel="stylesheet" type="text/css">
	</head>
	<body>
		<table width="100%" border="0" cellpadding="2" cellspacing="1" align=center bgcolor="#e7e7e7" style="margin-top: 13px">
			<tr>
				<td class="line1" style="background-color: #e2e2e2; color: #000000; font-weight: bold; font-size: 13px;" align=center width="35%">
					<bean:message key="str319"/>
				</td>
				<td style="background-color: #e2e2e2; color: #000000; font-weight: bold; font-size: 13px;" align=center width="10%">
					<bean:message key="str320"/>
				</td>
				<td style="background-color: #e2e2e2; color: #000000; font-weight: bold; font-size: 13px;" align=center width="20%">
					<bean:message key="str707"/>
				</td>
				<td style="background-color: #e2e2e2; color: #000000; font-weight: bold; font-size: 13px;" align=center width="15%">
					<bean:message key="str330"/>
				</td>
				<td style="background-color: #e2e2e2; color: #000000; font-weight: bold; font-size: 13px;" align=center width="15%">
					<bean:message key="str331"/>
				</td>
				<td style="background-color: #e2e2e2; color: #000000; font-weight: bold; font-size: 13px;" align=center width="10%">
					<bean:message key="str156"/>
				</td>
				<td style="background-color: #e2e2e2; color: #000000; font-weight: bold; font-size: 13px;" align=center width="10%">
					<bean:message key="str157"/>
				</td>
			</tr>
			<%
	              if(processList != null && processList.size()>0)
	              {
	                 for (Iterator it = processList.iterator(); it.hasNext();)
	                 {
							        HashMap map = (HashMap) it.next();
							        cust_id = map.get( "cust_id" ).toString();
								    String category_id=map.get("category_id").toString();
								    String category_title="";
								    String category_abstract="";
								    String category_addr="";
									String start_date="";
								    String end_date="";
								    String category_type="";
								    if(map.get("category_title") != null)
								    {
								       category_title=map.get("category_title").toString();
								    }
								    if(map.get("category_abstract") !=null)
								    {
								      category_abstract=map.get("category_abstract").toString();
								      category_abstract=category_abstract.replaceAll("<[^<>]+>","");
								      if(category_abstract.length()>30)
								      {
								        category_abstract=category_abstract.substring(0,30)+"...";
								      }
								    }
								    if(map.get("category_addr") != null)
								    { 
								      category_addr=map.get("category_addr").toString();
								    }
									if (map.get("start_date") != null) 
									{
										start_date = map.get("start_date").toString();
										if (start_date.length() > 10)
										{
											start_date = start_date.substring(0, 10);
										}
									}
							       if(map.get("category_type") != null)
								    {
								       category_type=map.get("category_type").toString();
								       category_type=bean.getParamNameByValue("105",category_type);
								    }
									if (map.get("end_date") != null)
									{
								         end_date = map.get("end_date").toString();
										if (end_date.length() > 10) 
										{
											end_date = end_date.substring(0, 10);
										}
									}

	             %>
			<tr style="background-color: #f9f9f9;">
				<td style="color: #000000; padding: 3px 5px;" align=left>
					<a href="viewsaleinfo1.jsp?category_id=<%=category_id%>" title=<%=category_title%> target="_self"><%=category_title%></a>
				</td>
				<td style="color: #000000; padding: 3px 5px;" align=center><%=category_type%></td>
				<td style="color: #000000; padding: 3px 5px;" align=left><%=category_addr%></td>
				<td style="color: #000000; padding: 3px 5px;" align=center><%=start_date%></td>
				<td style="color: #000000; padding: 3px 5px;" align=center><%=end_date%></td>
				<td style="color: #000000;" align=center>
					<a href="modifyProcessInfo.jsp?cust_id=<%=cust_id%>&category_id=<%=category_id%>"><img src=/img/edit.gif width=16 height=16 border=0 alt="修改产品信息">
					</a>
				</td>
				<td style="color: #000000;" align=center>
					<a href="/doTradeReg.do?cust_id=<%=cust_id%>&category_id=<%=category_id%>&trade_type_code=0997" target="_self" onClick="return chechIfo()"><img src=/img/del.gif width=16 height=16 border=0 alt="删除产品信息">
					</a>
				</td>
			</tr>
			<%}
	            }%>
			<tr>
				<td align="left" colspan="2" class="line1" style="font-weight: normal;">
					<bean:message key="str610"/><%=counter%><bean:message key="str611"/> &nbsp;<bean:message key="str610"/><%=pages%><bean:message key="str612"/>
				</td>
				<td align="left" colspan="2" style="background-color: #e2e2e2;">
					<a href="modifyProcessList.jsp?iStart=1"><bean:message key="str613"/> </a>&nbsp; &nbsp;
					<a href="modifyProcessList.jsp?iStart=<%=pageUp%>"><bean:message key="str614"/></a> &nbsp;
					<a href="modifyProcessList.jsp?iStart=<%=pageDown%>"><bean:message key="str615"/> </a>&nbsp;
					<a href="modifyProcessList.jsp?iStart=<%=pages%>"><bean:message key="str616"/></a>
				</td>
			</tr>
		</table>
	</body>
</html>
