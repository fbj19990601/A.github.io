<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="com.saas.biz.creditMgr.*" %>
<%@ page import="com.ahbay.commenMgr.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="java.util.*" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="com.saas.biz.commen.ParamethodMgr"%>
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
      ParamethodMgr comparList=new ParamethodMgr();
	 HashMap compMap=comparList.getCompareInfoByCode("CRM","credit_type");
	 /*****************************************/
	 CreditInfo  creditObj=new CreditInfo();
	 ArrayList linkArray = creditObj.getCustCredit(Integer.valueOf(iStart).intValue(),cust_id);
	 int counter=creditObj.getCreditNumber(cust_id);
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
<meta name = "Generator" content = "Easy Struts Xslt generator for Eclipse (http://easystruts.sf.net).">
<title><bean:message key="str3333"/></title>
<link href="/style/css.css" rel="stylesheet" type="text/css"> 
<style type="text/css">
.line6 {width:72spx; width:70spx!important;border:#ffcb99 1px solid;  background-color:#fff8ee; text-align:left; padding-left: 20px;padding-top: 10px;padding-bottom: 10px; color:#000000; margin-top:13px;}   /*横栏样式6---- 头部提醒1*/
.line6 .img{width:53px; height:53px; float:left; margin-right:20px;}
.line6 .title {font-size:14px; font-weight:bold; color:#ff5400;}
.line1 {border-left:#ff7300 3px solid; background-color:#e2e2e2; color:#333333;text-align:left; font-size:12px;}  /*横栏样式1*/
</style>
		<script language="javascript">
		  function chechIfo()
		  {
			   if(confirm('Records confirm write-off？')) 
			{
				return true;
			}
			else
			{
				return false;
			}
		  }
		</script>
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
			         <td class="line1" style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align="center" width="25%"><bean:message key="str3336"/></td>
					<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align="center" width="20%"><bean:message key="str3334"/></td>
					<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align="center" width="20%"><bean:message key="str3820"/></td>
					<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align="center" width="20%"><bean:message key="str3821"/></td>
					<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align="center"  width="15%" ><bean:message key="str609"/></td>
		        </tr>
		        <%
					if(linkArray != null  && linkArray.size()>0)
					{
						int i=0;
						for (Iterator inIt = linkArray.iterator(); inIt.hasNext();)
					    {
						    HashMap map = (HashMap) inIt.next();
						    String  credit_title="";
							String credit_id= map.get("credit_id").toString();
							String credit_type="";
							
							String credit_end_date="",credit_start_date="";
							if(map.get("credit_title")!=null)
							{
							   credit_title=map.get("credit_title").toString();
							}
							if(map.get("credit_type")!= null)
							{
							    credit_type=map.get("credit_type").toString();
							    if(compMap.get(credit_type) != null)
							    {
							       credit_type=compMap.get(credit_type).toString();
							    }
							}
							if(map.get("credit_start_date")!= null)
							{
							    credit_start_date=map.get("credit_start_date").toString();
							    if(credit_start_date.length()>10)
							    { 
							      credit_start_date=credit_start_date.substring(0,10);
							    }
							}
							if(map.get("credit_end_date")!= null)
							{
							    credit_end_date=map.get("credit_end_date").toString();
							    if(credit_end_date.length()>10)
							    { 
							      credit_end_date=credit_end_date.substring(0,10);
							    }
							}
							%>
							<tr style="background-color:#f9f9f9; ">
			        			<td style=" color:#000000;" align="left"><a href="CreditInfo.jsp?credit_id=<%=credit_id%>" TARGET=appwin onclick="mydefss()"><%=credit_title%></a></td>
								<td style=" color:#000000;" align="center" ><%=credit_type%></td>
								<td style=" color:#000000;" align="center" ><%=credit_start_date%></td>
								<td style=" color:#000000;" align="center" ><%=credit_end_date%></td>
								<td style=" color:#000000;" align=center><a href=/doTradeReg.do?credit_id=<%=credit_id%>&trade_type_code=0296 target="_self"  onClick="return chechIfo()"><img src=/img/del.gif width=16 height=16 border=0></a></td>
					        </tr>
							<%i++;
						}
						%>
						<tr>
							<td  align="left" colspan="2"  class="line1" style="font-weight:normal;"><bean:message key="str1027"/><%=counter%><bean:message key="str1028"/> &nbsp;<bean:message key="str1027"/><%=pages%><bean:message key="str1029"/></td>
							<td  align="right" colspan="3"><a href="modifyCreditIndex.jsp?iStart=1&meun_id=<%=meun_idx%>"><bean:message key="str1030"/> </a>&nbsp; &nbsp;<a href="modifyCreditIndex.jsp?iStart=<%=pageUp%>&meun_id=<%=meun_idx%>"><bean:message key="str1031"/></a> &nbsp;<a href="modifyCreditIndex.jsp?iStart=<%=pageDown%>&meun_id=<%=meun_idx%>"><bean:message key="str1032"/> </a>&nbsp; <a  href="modifyCreditIndex.jsp?iStart=<%=pages%>&meun_id=<%=meun_idx%>"><bean:message key="str1033"/></a></td>
				         </tr>
						<%
					}
		        %>
		    </table>
	     </td>
	  </tr>
	  <tr>
	    <td height="13">&nbsp;</td>
	  </tr>
	</table>
</body>
</html>