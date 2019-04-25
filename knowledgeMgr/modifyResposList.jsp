<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="java.util.*"%>
<%@ page import="com.saas.biz.repositoryMgr.RepositoryInfo"%>
<%@ page import="com.saas.biz.commen.ParamethodMgr"%>
<%@ page contentType="text/html;charset=GBK"%>
<%
   HttpSession  logsession = request.getSession(); 
    String cust_id = "";
    String iStart ="1";
    String meun_idx="";
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
        logsession.setAttribute("menu_id",meun_idx);
    }
    if( logsession.getAttribute("menu_id")!= null)
    {
       meun_idx=(String)logsession.getAttribute("menu_id");
    }
  RepositoryInfo reposObj=new RepositoryInfo();
  ArrayList newsList =new ArrayList();
  try
  {  
   newsList=reposObj.getRepositoryByCustId(Integer.valueOf(iStart).intValue(),cust_id);
  }
  catch(Exception ex)
  {
    out.print(ex.getMessage());
  }
  ParamethodMgr paramObj=new ParamethodMgr();
  HashMap typeMap=paramObj.getCompareInfoByCode("CRM","repository_type");
  int counter=reposObj.getReposityNumber(cust_id);
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
<title><bean:message key="str116"/></title>
<link href="/style/css.css" rel="stylesheet" type="text/css">
<SCRIPT>WinLIKEerrorpage='/winlike/winman/hlp-error.html';</SCRIPT>
		<SCRIPT SRC="/winlike/winman/wininit.js"></SCRIPT>
		<SCRIPT SRC="/winlike/winman/winman.js"></SCRIPT>
		<SCRIPT>
      WinLIKE.definewindows=mydefss;
      function mydefss() {
      	var j=new WinLIKE.window('', 100, 100, '90%', 'WinLIKE.browsersize().Height -Top-30', 2);
      	j.Vis=false;
      	j.Nam='appwin';
      	WinLIKE.addwindow(j);
      };
    </SCRIPT>
</head>
<body>
	<table width="727" border="0" cellspacing="0" cellpadding="0">
	  <tr>
	    <td height="13"></td>
	  </tr>
	  <tr>
	    <td>
		     <table width=727 border=0 cellpadding=2 cellspacing=1 align=center bgcolor="#e7e7e7">
		        <tr>
			        <td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="30%"><bean:message key="str2668"/></td>
							<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;"  align=center width="25%"><bean:message key="str2669"/></td>
							<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;"  align=center width="25%"><bean:message key="str2671"/></td>
							<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;"  align=center width="10%" ><bean:message key="str156"/></td>
							<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;"  align=center width="10%" ><bean:message key="str157"/></td>
		        </tr>
		        <%
		            if(newsList != null && newsList.size()>0)
		            {    int i=0;
		              	 for (Iterator it = newsList.iterator(); it.hasNext();)
		                  {
								        HashMap map = (HashMap) it.next();
								        String repository_id=map.get("repository_id").toString();
								        String title="";
								        String repository_type="";
								        String content="";
								        String publish_date="";
								        if(map.get("title") != null)
								        {
								           title=map.get("title").toString();
								           title=title.replaceAll("<[^<>]+>","");
									      if(title.length()>12)
									      {
									        title=title.substring(0,12)+"...";
									      }
								        }
								        if(map.get("repository_type") != null)
								        {
								           repository_type=map.get("repository_type").toString();
								           repository_type=paramObj.getParamNameByValue("77",repository_type);
								        }
								        if(map.get("publish_date") != null)
								        {
								           publish_date=map.get("publish_date").toString();
								           if(publish_date.length()>10)
								           {
								             publish_date=publish_date.substring(0,10);
								           }
								        }
						        %>
						        <tr style="background-color:#f9f9f9; ">
					              <td  style=" color:#000000; padding:2px 5px;"  align=left><a href="viewReposeInfo.jsp?repository_id=<%=repository_id%>" title=<%=title%>><%=title%></a></td>
					              <td  style=" color:#000000;"  align=center><%=repository_type%></td>
					              <td  style=" color:#000000;"  align=center><%=publish_date%></td>
					              <td  style=" color:#000000;"  align=center><a href=modifyReposeInfo.jsp?repository_id=<%=repository_id%> TARGET=appwin onclick="mydefss()"><img src=/img/edit.gif width=16 height=16 border=0 alt="修改知识内容"></a></td>
								  <td  style=" color:#000000;" align=center>
										<a href=/doTradeReg.do?repository_id=<%=repository_id%>&trade_type_code=0275 target="_self"  onClick="return chechIfo()"><img src=/img/del.gif width=16 height=16 border=0 alt="删除知识内容"></a></td>
					            </tr>
						        <%i++;
					     }
					     %>
					     <tr>
							<td  align="left" colspan="2" style="font-weight:normal; padding:2px 5px;"><bean:message key="str3988"/><%=counter%><bean:message key="str611"/>  &nbsp;<bean:message key="str3988"/><%=pages%><bean:message key="str1029"/></td>
							<td  align="right" colspan="3" style=" padding:2px 5px;"><a href="modifyResposIndex.jsp?iStart=0&meun_id=<%=meun_idx%>"><bean:message key="str1030"/>  </a>&nbsp; &nbsp;<a href="modifyResposIndex.jsp?iStart=<%=pageUp%>&meun_id=<%=meun_idx%>"><bean:message key="str1031"/></a> &nbsp;<a href="modifyResposIndex.jsp?iStart=<%=pageDown%>&meun_id=<%=meun_idx%>"><bean:message key="str1032"/>  </a>&nbsp; <a  href="modifyResposIndex.jsp?iStart=<%=pages%>&meun_id=<%=meun_idx%>"><bean:message key="str1033"/></a></td>
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