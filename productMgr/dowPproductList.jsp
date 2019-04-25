<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="java.util.*"%>
<%@ page import="com.saas.biz.commodityMgr.CommodityInfo"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.saas.biz.commen.ParamethodMgr"%>
<%
   ParamethodMgr comparList=new ParamethodMgr();
   HashMap compMap=comparList.getCompareInfoByCode("CRM","commodity_type");
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
    if (request.getParameter("menu_id") != null)
    {
        meun_idx = request.getParameter("menu_id");
        logsession.setAttribute("menu_id",meun_idx);
    }
    if( logsession.getAttribute("menu_id")!= null)
    {
       meun_idx=(String)logsession.getAttribute("menu_id");
    }

  CommodityInfo commObj=new CommodityInfo();
  ArrayList commList =commObj.genCustgoodsList(Integer.valueOf(iStart).intValue(),cust_id);
     int counter=commObj.getCommodityNumer(cust_id);
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
<script language="javascript">
  function chechIfo()
  {
	   if(confirm('Records confirm write-off ��')) 
	{
		return true;
	}
	else
	{
		return false;
	}
  }
</script>
</head>
<body>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
	  <tr>
	    <td height="13">&nbsp;</td>
	  </tr>
	  <tr>
	    <td>
		     <table width="100%" border=0 cellpadding=2 cellspacing=1 align=center bgcolor="#e7e7e7">
		        <tr>
					<td  class="line1" style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="16%"><bean:message key="str761"/></td>
					<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="24%"><bean:message key="str2453"/></td>
					<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="10%"><bean:message key="str2454"/></td>
					<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="15%"><bean:message key="str2455"/></td>
					<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="15%"><bean:message key="str2456"/></td>
					<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="15%"><bean:message key="str2457"/></td>
					<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="5%"><bean:message key="str2458"/></td>
		        </tr>
		        <%
		            if(commList != null && commList.size()>0 )
		            {
		              	 for (Iterator it = commList.iterator(); it.hasNext();)
		                  {
						        HashMap map = (HashMap) it.next();
						        String commodity_id=map.get("commodity_id").toString();
						        String commodity_name="";
						        String commodity_type="";
						        String commodity_brand="";
						        String commodity_price="";
						        String sale_market="";
						        String publish_date="";
						        String commodity_unit="";
						        if(map.get("commodity_name") != null)
						        {
						           commodity_name=map.get("commodity_name").toString();
						        }
						        if(map.get("commodity_brand") != null)
						        {
						           commodity_brand=map.get("commodity_brand").toString();
						           commodity_brand=commodity_brand.replaceAll("<[^<>]+>","");
							      if(commodity_brand.length()>25)
							      {
							        commodity_brand=commodity_brand.substring(0,25)+"...";
							      }
						        }
						        if(map.get("commodity_type") != null)
						        {
						           commodity_type=map.get("commodity_type").toString();
						           if(compMap.get(commodity_type) != null)
						           {
						             commodity_type=compMap.get(commodity_type).toString();
						           }
						        }
						        if(map.get("sale_market") != null)
						        {
						           sale_market=map.get("sale_market").toString();
						        }
						        if(map.get("commodity_price") != null)
						        {
						           commodity_price=map.get("commodity_price").toString();
						        }
						         if(map.get("commodity_unit") != null)
						        {
						           commodity_unit=map.get("commodity_unit").toString();
						           commodity_price=commodity_price+"("+commodity_unit+")";
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
						        
						        <tr style="background-color:#f9f9f9; " id="changcolor_tr<%=commodity_id%>" onmouseover="MM_changeProp('changcolor_tr<%=commodity_id%>','','backgroundColor','#ffffff','DIV')" onmouseout="MM_changeProp('changcolor_tr<%=commodity_id%>','','backgroundColor','#f9f9f9','DIV')">
					              <td  style=" color:#000000;" class="ping1"  align=left><%=commodity_name%></td>
					              <td  style=" color:#000000;"  class="ping1" align=left><%=commodity_brand%></td>
					              <td  style=" color:#000000;"  class="ping1" align=center><%=commodity_type%></td>
					              <td  style=" color:#000000;" class="ping1"  align=left><%=commodity_price%></td>
					              <td  style=" color:#000000;"  align=center><%=publish_date%></td>
					              <td  style=" color:#000000;" class="ping1"  align=left><%=sale_market%></td>
					              <td  style=" color:#000000;"  align=center><a href=/doTradeReg.do?commodity_id=<%=commodity_id%>&trade_type_code=0276 target="_self"  onClick="return chechIfo()"><img src=/img/del.gif width=16 height=16 border=0></a></td>
					            </tr>
						        
						        <%
					     }
					     %>
					     
					     <tr>
							<td  align="left" colspan="3"  class="ping1" style="font-weight:normal;"><bean:message key="str3988"/><%=counter%><bean:message key="str611"/> &nbsp;<bean:message key="str3988"/><%=pages%><bean:message key="str612"/></td>
							<td  align="right" class="ping1" colspan="4"><a href="downProductIndex.jsp?iStart=0&meun_id=<%=meun_idx%>"><bean:message key="str613"/> </a>&nbsp; &nbsp;<a href="downProductIndex.jsp?iStart=<%=pageUp%>&meun_id=<%=meun_idx%>"><bean:message key="str614"/></a> &nbsp;<a href="downProductIndex.jsp?iStart=<%=pageDown%>&meun_id=<%=meun_idx%>"><bean:message key="str615"/> </a>&nbsp; <a  href="downProductIndex.jsp?iStart=<%=pages%>&meun_id=<%=meun_idx%>"><bean:message key="str616"/></a></td>
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