<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"

"http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>

<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>

<%@ page import="java.util.*"%>

<%@ page import="com.saas.biz.productMgr.ProductInfo"%>

<%@ page contentType="text/html;charset=GBK"%>

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

    if (request.getParameter("menu_id") != null)

    {

        meun_idx = request.getParameter("menu_id");

        logsession.setAttribute("menu_id",meun_idx);

    }

    if( logsession.getAttribute("menu_id")!= null)

    {

       meun_idx=(String)logsession.getAttribute("menu_id");

    }

  ProductInfo productObj=new ProductInfo();

  ArrayList productList =productObj.getproductListByCust(Integer.valueOf(iStart).intValue(),cust_id);

     int counter=productObj.getProductNumber(cust_id);

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

<title><bean:message key="str4086"/></title>


<script language="javascript">

  function chechIfo()

  {

	   if(confirm('是否确认删除本条记录？')) 

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

		     <table width=100% border=0 cellpadding=2 cellspacing=1 align=center bgcolor="#e7e7e7">

		        <tr>

			        	<td class="line1" style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="20%"><bean:message key="str779"/></td>

					<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="40%"><bean:message key="str780"/></td>

					<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="10%"><bean:message key="str781"/></td>

					<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="20%"><bean:message key="str782"/></td>

					<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="10%"><bean:message key="str0996"/></td>

		        </tr>

		        <%

		            if(productList != null && productList.size()>0)

		            {

		              	 for (Iterator it = productList.iterator(); it.hasNext();)

		                  {

						        HashMap map = (HashMap) it.next();

						        String product_id=map.get("product_id").toString();

						        String product_name="";

						        String product_desc="";

						        String product_unit="";

						        String product_site="";

						        if(map.get("product_name") != null)

						        {

						           product_name=map.get("product_name").toString();

						        }

						        if(map.get("product_desc") != null)

						        {

						           product_desc=map.get("product_desc").toString();

						           product_desc=product_desc.replaceAll("<[^<>]+>","");

							      if(product_desc.length()>25)

							      {

							        product_desc=product_desc.substring(0,25)+"...";

							      }

						        }

						        if(map.get("product_unit") != null)

						        {

						           product_unit=map.get("product_unit").toString();

						        }

						        if(map.get("product_site") != null)

						        {

						           product_site=map.get("product_site").toString();

						        }

						        %>

						        

						        <tr style="background-color:#f9f9f9; " id="changcolor_tr<%=product_id%>" onmouseover="MM_changeProp('changcolor_tr<%=product_id%>','','backgroundColor','#ffffff','DIV')" onmouseout="MM_changeProp('changcolor_tr<%=product_id%>','','backgroundColor','#f9f9f9','DIV')">

					              <td  style=" color:#000000; padding:2px 5px;" align=left><%=product_name%></td>

					              <td  style=" color:#000000; padding:2px 5px;"align=left><%=product_desc%></td>

					              <td  style=" color:#000000; padding:2px 5px;" align=left><%=product_unit%></td>

					              <td  style=" color:#000000; padding:2px 5px;" align=left><%=product_site%></td>

					                <td  style=" color:#000000;" align=center><a href=/doTradeReg.do?product_id=<%=product_id%>&trade_type_code=0351 target="_self"  onClick="return chechIfo()"><img src=/img/del.gif width=16 height=16 border=0></a></td>

					            </tr>

						        

						        <%

					     }

					     %>

					     

					     <tr>

							<td  align="left" colspan="2" class="line1" style="font-weight:normal; padding:2px 5px;"><bean:message key="str1027"/><%=counter%><bean:message key="str1028"/> &nbsp;<bean:message key="str1027"/><%=pages%><bean:message key="str1029"/></td>

							<td  align="right" colspan="3" style=" padding:2px 5px;"><a href="deleteProductIndex.jsp?iStart=0&meun_id=<%=meun_idx%>"><bean:message key="str1030"/></a>&nbsp; &nbsp;<a href="deleteProductIndex.jsp?iStart=<%=pageUp%>&meun_id=<%=meun_idx%>"><bean:message key="str1031"/></a> &nbsp;<a href="deleteProductIndex.jsp?iStart=<%=pageDown%>&meun_id=<%=meun_idx%>"> <bean:message key="str1032"/></a>&nbsp; <a  href="deleteProductIndex.jsp?iStart=<%=pages%>&meun_id=<%=meun_idx%>"><bean:message key="str1033"/></a></td>

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