<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="java.util.*"%>
<%@ page import="com.saas.biz.storeformOutMgr.StoreformOutInfo"%>
<%@ page import="com.saas.biz.shopneedMgr.ShopneedInfo"%>
<%@ page contentType="text/html;charset=GBK"%>
<jsp:useBean id="bean" class="com.saas.biz.commen.ParamethodMgr" scope="page" />
<jsp:useBean id="orderBean" class="com.saas.biz.salesOrderFormMgr.SalesOrderFormInfo" scope="page" />
<jsp:useBean id="comm" class="com.saas.biz.commen.commMethodMgr" scope="page" />
<html>
<head>
<title><bean:message key="str4431"/></title>
<link href="/style/layout.css" rel="stylesheet" type="text/css">
<link href="/style/css.css" rel="stylesheet" type="text/css">
<style type="text/css">
.line6 {width:72spx; width:70spx!important;border:#ffcb99 1px solid;  background-color:#fff8ee; text-align:left; padding-left: 20px;padding-top: 10px;padding-bottom: 10px; color:#000000; margin-top:13px;}   /*横栏样式6---- 头部提醒1*/
.line6 .img{width:53px; height:53px; float:left; margin-right:20px;}
.line6 .title {font-size:14px; font-weight:bold; color:#ff5400;}
.line1 {border-left:#ff7300 3px solid; background-color:#e2e2e2; color:#333333;text-align:left; font-size:12px;}  /*横栏样式1*/
</style>
<script type="text/javascript">
function delet(){
 if(window.confirm('确定要删除本条记录？')){
   return true;
 }else{
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
    ShopneedInfo info = new ShopneedInfo();
    ArrayList tableList =info.getAllShopneddByCustId(cust_id,Integer.parseInt(iStart));
    int counter=info.getAllShopneddByCustId(cust_id);
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
	    <td height="20" align="left" colspan="2"></td>
	  </tr>
	  <tr>
	    <td>
		     <table width=727 border=0 cellpadding=2 cellspacing=1 align=center  bgcolor="#e7e7e7">
				 
		        <tr>
			        <td class="line1" style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="20%"><bean:message key="str4432"/></td>
					<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="20%"><bean:message key="str4433"/></td>
					<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="20%"><bean:message key="str4434"/></td>
					<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="15%"><bean:message key="str156"/></td>
					<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="15%"><bean:message key="str157"/></td>
		        </tr>
		       <%
		         if(tableList !=null && tableList.size()>0){
		         for(int i=0;i<tableList.size();i++){
		           HashMap map=(HashMap)tableList.get(i);
		           String need_id="",need_title="",need_no="",need_num="",unit="",unit1="",quo_id="";
		           if(map.get("need_id")!=null){need_id=map.get("need_id").toString();}
		           if(map.get("need_title")!=null){need_title=map.get("need_title").toString();}
		           if(map.get("need_no")!=null){need_no=map.get("need_no").toString();}
		           if(map.get("need_num")!=null){need_num=map.get("need_num").toString();}
		           if(map.get("quo_id")!=null){quo_id=map.get("quo_id").toString();}
		           if(map.get("unit")!=null){
		           		unit=map.get("unit").toString();
		           		unit1 = bean.getParaCode2ByParaCode1("91",unit);
		           }
		       %>
		        <tr style="background-color:#f9f9f9;"id="changcolor_tr<%=i%>" onmouseover="MM_changeProp('changcolor_tr<%=i%>','','backgroundColor','#ffffff','DIV')" onmouseout="MM_changeProp('changcolor_tr<%=i%>','','backgroundColor','#f9f9f9','DIV')">
	              <td style="color:#000000;" align="left"><a href="disShopneedInfo.jsp?need_id=<%=need_id%>" TARGET=appwin onclick="mydefss()"><%=need_title %></a></td>
	              <td style="color:#000000;" align="left"><%=need_no%></td>
	              <td style="color:#000000;" align="left"><%=need_num%><%=unit1 %></td>
	              <td  style=" color:#000000; padding:2px 5px;" align=center><a href="updateShopneedInfo.jsp?need_id=<%=need_id%>&quo_id=<%=quo_id %>" TARGET=appwin onclick="mydefss()"><img src="/img/add.png" border="0"></a></td>
	             <td  style=" color:#000000;"  align=center><a href=/doTradeReg.do?trade_type_code=1258&need_id=<%=need_id %> target="_self"><img src=/img/del.gif width=16 height=16 border=0></a></td>
	            </tr>
	            <%}%>
			    <tr>
				   <td  align="left" colspan="3"><bean:message key="str610"/><%=counter%><bean:message key="str611"/> &nbsp;<bean:message key="str610"/><%=pages%><bean:message key="str612"/></td>
				   <td  align="right" colspan="2"><a href="shopneedMgr.jsp?iStart=1&menu_id=<%=menu_id%>"> <bean:message key="str613"/></a>&nbsp; &nbsp;<a href="shopneedMgr.jsp?iStart=<%=pageUp%>&menu_id=<%=menu_id%>"><bean:message key="str614"/></a> &nbsp;<a href="shopneedMgr.jsp?iStart=<%=pageDown%>&menu_id=<%=menu_id%>"><bean:message key="str615"/> </a>&nbsp; <a  href="shopneedMgr.jsp?iStart=<%=pages%>&menu_id=<%=menu_id%>"><bean:message key="str616"/></a></td>
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
