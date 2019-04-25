<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="java.util.*"%>
<%@ page import="com.saas.biz.productMgr.*"%>
<%@ page contentType="text/html;charset=GBK"%>
<jsp:useBean id="bean" class="com.saas.biz.commen.ParamethodMgr" scope="page" />
<jsp:useBean id="orderBean" class="com.saas.biz.salesOrderFormMgr.SalesOrderFormInfo" scope="page" />
<jsp:useBean id="comm" class="com.saas.biz.commen.commMethodMgr" scope="page" />
<html>
<head>
<title><bean:message key="str904"/></title>
<link href="/style/css.css" rel="stylesheet" type="text/css">
<style type="text/css">
.line6 {width:72spx; width:70spx!important;border:#ffcb99 1px solid;  background-color:#fff8ee; text-align:left; padding-left: 20px;padding-top: 10px;padding-bottom: 10px; color:#000000; margin-top:13px;}   /*横栏样式6---- 头部提醒1*/
.line6 .img{width:53px; height:53px; float:left; margin-right:20px;}
.line6 .title {font-size:14px; font-weight:bold; color:#ff5400;}
.line1 {border-left:#ff7300 3px solid; background-color:#e2e2e2; color:#333333;text-align:left; font-size:12px;}  /*横栏样式1*/
</style>
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
    ProductInfo info = new ProductInfo();
    ArrayList tableList =info.getProList(Integer.parseInt(iStart),cust_id);
    int counter=info.getProductList(cust_id);
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
		     <table width=727 border=0 cellpadding=2 cellspacing=1 align=center  bgcolor="#e7e7e7">
		        <tr>
			        <td class="line1" style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="15%"><bean:message key="str936"/></td>
					<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="15%"><bean:message key="str937"/></td>
					<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="25%"><bean:message key="str938"/></td>
					<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="15%"><bean:message key="str939"/></td>
					<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="10%"><bean:message key="str940"/></td>
					<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="10%"><bean:message key="str941"/></td>
		        </tr>
		       <%
		         if(tableList !=null && tableList.size()>0){
		         for(int i=0;i<tableList.size();i++){
		           HashMap map=(HashMap)tableList.get(i);
		           String product_id="",product_name="",product_type="",product_abstract="",product_site="",product_unit="";
		           String product_type1="";
		           if(map.get("product_id")!=null){product_id=map.get("product_id").toString();}
		           if(map.get("product_name")!=null){product_name=map.get("product_name").toString();}
		           if(map.get("product_type")!=null){
		           		product_type=map.get("product_type").toString();
		           		product_type1 = bean.getParaCode2ByParaCode1("84",product_type);
		           	}
		           if(map.get("product_abstract")!=null){product_abstract=map.get("product_abstract").toString();}
		           if(map.get("product_site")!=null){product_site=map.get("product_site").toString();}
		           if(map.get("product_unit")!=null){product_unit=map.get("product_unit").toString();}
		       %>
		        <tr style="background-color:#f9f9f9;"id="changcolor_tr<%=i%>" onmouseover="MM_changeProp('changcolor_tr<%=i%>','','backgroundColor','#ffffff','DIV')" onmouseout="MM_changeProp('changcolor_tr<%=i%>','','backgroundColor','#f9f9f9','DIV')">
	              <td style="color:#000000;" align="left"><%=product_name%></td>
	              <td style="color:#000000;" align="left"><%=product_type1%></td>
	              <td style="color:#000000;" align="left"><%=product_abstract%></td>
	              <td style="color:#000000;" align="left"><%=product_unit%></td>
	              <td style="color:#000000;" align="left"><%=product_site%></td>
	              <td  style=" color:#000000; padding:2px 5px;" align=center><a href="productInList.jsp?menu_id=<%=menu_id%>&product_id=<%=product_id%>" TARGET=appwin onclick="mydefss()"><img src="/img/add.png" border="0"></a></td>
	            </tr>
	            <%}%>
			    
		       <tr>
					<td  align="left" colspan="2" style="font-weight:normal; padding:2px 5px;"><bean:message key="str1027"/><%=counter%><bean:message key="str1028"/> &nbsp;<bean:message key="str1145"/><%=Integer.parseInt(iStart)+1 %><bean:message key="str1146"/>&nbsp;&nbsp;<bean:message key="str1027"/><%=pages%><bean:message key="str1146"/></td>
					<td  align="right" colspan="3"  style=" padding:2px 5px;">
					<a href="productInIndex.jsp?iStart=0"><bean:message key="str1147"/> </a>&nbsp; &nbsp;
					<% 
					if(Integer.parseInt(iStart)>0){
					%>
					<a href="productInIndex.jsp?iStart=<%=pageUp%>"><bean:message key="str1148"/></a> &nbsp;
					<%
					}
					if(Integer.parseInt(iStart)<pages-1){
					%>
					<a href="productInIndex.jsp?iStart=<%=pageDown%>"><bean:message key="str1149"/> </a>&nbsp; 
					<%
					}
					%>
					<a  href="productInIndex.jsp?iStart=<%=pages-1%>"><bean:message key="str1150"/></a></td>
				</tr>
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
