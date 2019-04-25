<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="com.saas.biz.advertiseMgr.*"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.saas.biz.commen.ParamethodMgr"%>
<jsp:useBean id="bean" class="com.saas.biz.commen.commMethodMgr" scope="page"/>
<%@ page import="com.saas.biz.repositoryMgr.RepositoryInfo"%>
<%@ page import="com.saas.biz.commen.commMethodMgr"%>

<%
    commMethodMgr commen = new commMethodMgr();
 		String idx = commen.GenTradeId();
     String repository_id="";
     String title="",content="",repository_type="";
      if (request.getParameter("repository_id") != null)
      {
        repository_id = request.getParameter("repository_id");
        RepositoryInfo repository=new RepositoryInfo();
        ArrayList reposList=repository.getRepositoryIdx(repository_id);
        if(reposList != null && reposList.size()>0)
        {
           HashMap map=(HashMap)reposList.get(0);
           if(map.get("title") !=null)
           {
             title=map.get("title").toString();
           }
           if(map.get("content") !=null)
           {
             content=map.get("content").toString();
           }
           if(map.get("repository_type") !=null)
           {
             repository_type=map.get("repository_type").toString();
           }
        }
      }
   //   out.print(repository_type);
	String fbtime=new SimpleDateFormat("yyyy-MM-dd").format(new Date());
  ParamethodMgr paramCom=new ParamethodMgr();
	ArrayList reposeTypeList=paramCom.getCompareInfoByCode1("B2B","repository_type",repository_type);
	//out.print(reposeTypeList);
%>

<html>
<head>
<title><bean:message key="str116"/></title>
<link href="/style/css.css" rel="stylesheet" type="text/css">
<style type="text/css">
.line6 {width:72spx; width:70spx!important;border:#ffcb99 1px solid;  background-color:#fff8ee; text-align:left; padding-left: 20px;padding-top: 10px;padding-bottom: 10px; color:#000000; margin-top:13px; margin-bottom:13px;}   /*横栏样式6---- 头部提醒1*/
.line6 .img{width:53px; height:53px; float:left; margin-right:20px;}
.line6 .title {font-size:14px; font-weight:bold; color:#ff5400;}
.line1 {border-left:#ff7300 3px solid; background-color:#e2e2e2; color:#333333;text-align:left; font-size:13px; font-weight:bold; padding-left: 20px; padding-top: 5px;padding-bottom: 5px; }  /*横栏样式1*/
</style>
<script src="/www/fuction/calendar.js" type="text/javascript"></script>
<script language="JavaScript" src="/www/fuction/public.js"></script>
 
  
</head>

<body>
<table width="818" border="0" cellspacing="0" cellpadding="0" align=center>
  <tr>
    <td height="26" >&nbsp;</td>
  </tr>
  <tr>
     
			<table width=93% border=0 cellpadding=5 cellspacing=1 align=center  bgcolor="#dddddd">
          <tr>
		     		<td class="line1" align="left" colspan="2"><bean:message key="str2672"/></td>
	      	</tr>
		 		  <tr>
           		 <td width="12%" align=right style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;"><bean:message key="str2665"/></td>
           		 <td width="88%" align=left bgcolor="#FFFFFF">
								<div class="ping1">
             <%
						if( reposeTypeList != null && reposeTypeList.size() > 0 )
						{
							 
								HashMap map=(HashMap)reposeTypeList.get(0);
								String value=map.get("para_code1").toString();
								String name=map.get("para_code2").toString();
					%>
	           <!--   <input name=repository_type type=text readonly="readonly" value="<%= name %>"> -->
			   <%= name %>
	         <%
							}
						  %>
               
						</div>
            </td>
          </tr>
          <tr>
            <td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right><bean:message key="str2666"/></td>
            <td align=left bgcolor="#FFFFFF"><div class="ping1">
            	<%=title%></div>
            </td>
          </tr>
          <tr>
            <td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right><bean:message key="str2667"/></td>
            <td align=left bgcolor="#FFFFFF">
			 			 <div class="ping1">
					    <%=content%>
						</div>
						</td>
          </tr>  
      </table> 
  </tr>
  <tr>
    <td height="46" background="/img/bg-3.gif">&nbsp;</td>
  </tr>
</table>
</body>
</html>

