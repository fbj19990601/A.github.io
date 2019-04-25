<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="java.util.*"%>
<%@ page import="com.saas.biz.rightMgr.*"%>
<%@ page import="com.saas.biz.commen.*"%>
<%
    ArrayList resultlist = new ArrayList();
    ArrayList interfList = new ArrayList();
    ArrayList queryList = new ArrayList();
    ArrayList specList = new ArrayList();
    TradeInterface commen = new TradeInterface();
    commMethodMgr comMethod=new commMethodMgr();
    resultlist = (ArrayList) request.getAttribute("result");
    Map  QueryMap=(Map) request.getAttribute("query");
    String[]  itradeTypeCodes = (String[]) QueryMap.get("trade_type_code");
    String itradeTypeCode = itradeTypeCodes[0];
    interfList = (ArrayList) resultlist.get(0);
    queryList = (ArrayList) resultlist.get(1);
    specList = (ArrayList) resultlist.get(0);
%>

<html>
	<head>
        <title><bean:message key="system.tittle"/></title>
        <link href="style/css.css" rel="stylesheet" type="text/css"> 
	</head>
<body>
    <table width="818" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="26" background="img/bg-1.gif">&nbsp;</td>
  </tr>
  <tr>
    <td background="img/bg-2.gif">
    <table  width=92% border="0" cellpadding="10" cellspacing="1" align="center">
 <%
    //普通查询处理
    if (interfList != null && queryList != null)
    {
    	 String queryflag ="";
    	 for (Iterator myit = specList.iterator(); myit.hasNext();)
	     {	
	    	HashMap specMap= (HashMap) myit.next();
	    	if(specMap.get("element_label")!=null)
	    	{
	    		String specName = specMap.get("element_label").toString();
	    		if (specName.trim().equalsIgnoreCase("trade_type_code"))
	        	{	                		    	   
	        	   if (specMap.get("rsrv_str1") != null)
	        	   {
	        	        if  (specMap.get("rsrv_str1").toString().equalsIgnoreCase("1")) queryflag = "1";
	        	       break ;	        	        
	        	   }
	        	}
	          }	
	      } 
	      //end     
	      if(queryflag.equals(""))
	      { 
	      		out.print("<tr><td align=left>");
    	 		    out.print("<form action=getQueryInterface.do method=post>");
 				out.print("<table width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" bordercolordark=\"#999999\" bordercolorlight=\"#FFFFFF\">");
 				out.print("<tr>");
 				out.print("<td height=\"35\" align=\"center\" class=grayD>请输入标题关键字：</td>");
				out.print("<td width=\"40%\" align=\"center\" class=grayD><input name=\"query_param\" size=65>");
				out.print("<input  name=\"trade_type_code\" type=hidden value="+itradeTypeCode+"></td>");
				out.print("<td align=\"left\" class=grayD>");
				out.print("<input name=\"query_btn\" value=\"点此查询\" type=\"submit\">");
				out.print("</td></tr></table></form></td></tr>");
          }  
    }
 %>
    </table>
    </td>
  </tr>
  <tr>
    <td height="46" background="img/bg-3.gif"></td>
  </tr>
</table>
    <table width="818" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="26" background="img/bg-1.gif">&nbsp;</td>
  </tr>
  <tr>
    <td background="img/bg-2.gif">
    <table  width=92% border="0" cellpadding="10" cellspacing="1" align="center">
        <%
            if (interfList != null && queryList != null)
            {
                out.print("<tr>"); 
                String querytag = "0";
                for (Iterator iit = interfList.iterator(); iit.hasNext();)
	            {	
		            	HashMap interfMap= (HashMap) iit.next();
		            	String fieldName = interfMap.get("element_label").toString();
		            	if (!interfMap.get("element_view").toString().trim().equalsIgnoreCase("0")
		            	    && !interfMap.get("element_view").toString().trim().equalsIgnoreCase("2"))//不显示的元素
		            	{
	    	            	out.print("<td class=grayBL align=center>");
	    	            	out.print(fieldName);
	    	            	out.print("</td>"); 	
		                }
		                if (fieldName.trim().equalsIgnoreCase("trade_type_code"))
		                {	                		   
		                	   if (interfMap.get("rsrv_str1") != null)
		                	   {
		                	        if  (interfMap.get("rsrv_str1").toString().equalsIgnoreCase("1")) querytag = "1";
		                	   }
		                }
		        }
		        if (!querytag.equalsIgnoreCase("1"))
		        {
	    		        out.print("<td  class=grayBL align=center width=30px >");
	        	        out.print("操作");
	        	        out.print("</td>");
		        }
		        out.print("</tr>"); 
		        String linkrsrv = "?1=1";
		        String link = "?1=1";
                for (Iterator qit = queryList.iterator(); qit.hasNext();)
                {
		                out.print("<tr>");
		                HashMap queryMap= (HashMap) qit.next();
		                for (Iterator iit = interfList.iterator(); iit.hasNext();)
		                {	
		                	HashMap interfMap= (HashMap) iit.next();
		                	String fieldName = interfMap.get("element_name").toString();
		                	if (fieldName.trim().equalsIgnoreCase("trade_type_code"))
		                	{	                		   
		                		   link = link + "&trade_type_code="+interfMap.get("trade_type_code");
	
		                		   if (interfMap.get("rsrv_str1") != null)
		                		   {
		                		        if  (interfMap.get("rsrv_str1").toString().equalsIgnoreCase("1")) querytag = "1";
		                		   }
		                	}
		                	if (queryMap.get(fieldName) != null )
		                	{
		                		if (interfMap.get("element_view").toString().trim().equalsIgnoreCase("2"))//作为链接参数的元素且不显示
	    	                	    {
	    	                		   linkrsrv = linkrsrv + "&" + fieldName + "=" + queryMap.get(fieldName);
	    	                		   link = link + "&" + fieldName + "=" + queryMap.get(fieldName).toString().trim();
	    	                	    }
		                		if (!interfMap.get("element_view").toString().trim().equalsIgnoreCase("0")  && !interfMap.get("element_view").toString().trim().equalsIgnoreCase("2"))
	    	            	        {
		    	                		out.print("<td  class=grayD align=left>");   
		    	                		if (interfMap.get("element_view").toString().trim().equalsIgnoreCase("3"))//作为链接的元素
		    	                		{
		    	                		    linkrsrv = linkrsrv + "&trade_type_code="+interfMap.get("rsrv_str5").toString(); 
		    	                		    out.print("<a href=getInfoInterface.do"+linkrsrv+" target=blank>"+queryMap.get(fieldName)+"</a>");
		    	                		}
		    	                	    else if (interfMap.get("element_view").toString().trim().equalsIgnoreCase("5"))//需要将代码翻译成名称
		    	                	    {
		    	                	         out.print(commen.codeToName(fieldName,queryMap.get(fieldName).toString()));
		    	                	    }
		    	                	     else if (interfMap.get("element_view").toString().trim().equalsIgnoreCase("6"))//需要将代码翻译成姓名
		    	                	    {
		    	                	         out.print(commen.getRealName(queryMap.get(fieldName).toString().trim()));
		    	                	    }
		    	                	   else if(interfMap.get("element_view").toString().trim().equalsIgnoreCase("n"))//将用户id转换为用户名
		    	                	   {
		    	                	     out.print(comMethod.getUserNameByUserId(queryMap.get(fieldName).toString()));
		    	                	   }
		    	                	    else
		    	                	    {    	                		   
		    	                		    out.print(queryMap.get(fieldName));
		    	                		}
		    	                		out.print("</td>");
	    	                	  }
		                	}
		                    else if (queryMap.get(fieldName) == null && !interfMap.get("element_view").toString().trim().equalsIgnoreCase("0") && !interfMap.get("element_view").toString().trim().equalsIgnoreCase("2"))
		                    {
		                        out.print("<td class=grayD></td>");
		                    }
			            }
			            if (!querytag.equalsIgnoreCase("1"))
			            {
	    		             out.print("<td  class=grayD align=center>");
	    		             out.print("<a href=getDoTradeInterface.do"+linkrsrv+" target=blank>");
	                	    out.print("<img src=img/edit.gif width=16 height=16 border=0>");
	                	    out.print("</a></td>");
	            	       }
			            linkrsrv = "?1=1";
			            link = "?1=1";
			            out.print("</tr>");
		       }
           }
        %>
    </table>
    </td>
  </tr>
  <tr>
    <td height="46" background="img/bg-3.gif"></td>
  </tr>
</table>
</body>

</html>