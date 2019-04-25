<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="java.util.*"%>
<%@ page import="com.saas.biz.custMgr.Custinfo"%>
<%@ page import="com.saas.biz.quoteMgr.QuoteInfo"%>
<%@ page import="com.saas.biz.goodsMgr.GoodsInfo"%>
<%@ page contentType="text/html;charset=GBK"%>
<jsp:useBean id="orderBean" class="com.saas.biz.salesOrderFormMgr.SalesOrderFormInfo" scope="page" />
<jsp:useBean id="comm" class="com.saas.biz.commen.commMethodMgr" scope="page" />
<%@ page import="com.saas.biz.commen.ParamethodMgr"%>
<html>
<head>
<title><bean:message key="str1328"/></title>
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
    String menu_id="",query_id="";
   
    if (request.getParameter("iStart") != null)
    {
        iStart = request.getParameter("iStart");
    }
    if (request.getParameter("query_id") != null)
    {
        query_id = request.getParameter("query_id");
    }
    if (logsession.getAttribute("SESSION_CUST_ID") != null)
    {
        cust_id = logsession.getAttribute("SESSION_CUST_ID").toString();
    }
    if (request.getParameter("menu_id") != null)
    {
        menu_id = request.getParameter("menu_id");
    }
    QuoteInfo info = new QuoteInfo();
    ArrayList tableList =info.getQuoteList(Integer.parseInt(iStart),cust_id,query_id);
    int counter=info.getQuoteList(cust_id,query_id);
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
	<table width="725" border="0" cellspacing="0" cellpadding="0">
	  <tr>
	    <td height="13" align="left">
	    </td>
	  </tr>
	  <tr>
	    <td>
		     <table width=725 border=0 cellpadding=2 cellspacing=1 align=center  bgcolor="#e7e7e7">
		        <tr>
			        <td class="line1" style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="20%"><bean:message key="str3186"/></td>
					<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="20%"><bean:message key="str3187"/></td>
					<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="20%"><bean:message key="str3188"/></td>
					<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="10%"><bean:message key="str156"/></td>
					<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="10%"><bean:message key="str157"/></td>
		        </tr>
		        <%
		        	if(tableList ==null || tableList.size()==0){
		        %>
		        	<tr>
		        	<td colspan="5" style="background-color:#ffffff; color:#000000;  font-weight:bold; font-size:13px;" align=center >
		        		<bean:message key="str3219"/>
		        	</td>
		        	</tr>
		        <%
		        	}	
		        %>
		       <%
		         if(tableList !=null && tableList.size()>0){
		         for(int i=0;i<tableList.size();i++){
		           HashMap map=(HashMap)tableList.get(i);
		           String form_id="",prep_id="",prep_name="",obj_cust_id="",prep_obj_id="",goods_name="",cust_name="";
		           if(map.get("form_id")!=null){form_id=map.get("form_id").toString();}
		           if(map.get("prep_id")!=null){prep_id=map.get("prep_id").toString();}
		           if(map.get("prep_name")!=null){prep_name=map.get("prep_name").toString();}
		           if(map.get("obj_cust_id")!=null){
		           		obj_cust_id=map.get("obj_cust_id").toString();
		           		Custinfo cust = new Custinfo();
		           		ArrayList custList = new ArrayList();
		           		custList = cust.genSpecCustInfo(obj_cust_id);
		           		if(custList!=null && custList.size()>0){
		           			HashMap mapp1 = (HashMap)custList.get(0);
							cust_name = mapp1.get("cust_name").toString();		           			
		           		}
		           	}
		           if(map.get("prep_obj_id")!=null){
		           		prep_obj_id=map.get("prep_obj_id").toString();
		           		GoodsInfo goods = new GoodsInfo();
		           		HashMap mapp = goods.getOneGoods(cust_id,prep_obj_id);
		           		goods_name = mapp.get("goods_name").toString();
		           }
		       %>
		        <tr style="background-color:#f9f9f9;"id="changcolor_tr<%=i%>" onmouseover="MM_changeProp('changcolor_tr<%=i%>','','backgroundColor','#ffffff','DIV')" onmouseout="MM_changeProp('changcolor_tr<%=i%>','','backgroundColor','#f9f9f9','DIV')">
	              <td style="color:#000000;" align="left"><a href="displayQuote.jsp?prep_id=<%=prep_id %>&form_id=<%=form_id %>" TARGET=appwin onclick="mydefss()" title="查看报价单信息"><%=prep_name%></a></td>
	              <td style="color:#000000;" align="left"><%=cust_name%></td>
	              <td style="color:#000000;" align="left"><%=goods_name%></td>
	              <td  style=" color:#000000; padding:2px 5px;" align=center><a href="updateQuote.jsp?prep_id=<%=prep_id %>&form_id=<%=form_id %>" TARGET=appwin onclick="mydefss()"><img src="/img/edit.png" border="0"></a></td>
	              <td  style=" color:#000000; padding:2px 5px;" align="center"><a href="/doTradeReg.do?trade_type_code=7755&prep_id=<%=prep_id%>" TARGET="_self"><img src="/img/del.gif" border="0"></a></td>
	            </tr>
	            <%}%>
			    <tr>
				   <td  align="left" colspan="2"><bean:message key="str3988"/><%=counter%><bean:message key="str611"/> &nbsp;<bean:message key="str3988"/><%=pages%><bean:message key="str612"/></td>
				   <td  align="right" colspan="4"><a href="quoteMgrExp.jsp?iStart=1&menu_id=<%=menu_id%>&query_id=<%=query_id %>"><bean:message key="str613"/> </a>&nbsp; &nbsp;<a href="quoteMgrExp.jsp?iStart=<%=pageUp%>&menu_id=<%=menu_id%>&query_id=<%=query_id %>"><bean:message key="str614"/></a> &nbsp;<a href="quoteMgrExp.jsp?iStart=<%=pageDown%>&menu_id=<%=menu_id%>&query_id=<%=query_id %>"><bean:message key="str615"/> </a>&nbsp; <a  href="quoteMgrExp.jsp?iStart=<%=pages%>&menu_id=<%=menu_id%>&query_id=<%=query_id %>"><bean:message key="str616"/></a></td>
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
