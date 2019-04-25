<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"

"http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>

<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>

<%@ page import="java.util.*"%>

<%@ page import="java.text.SimpleDateFormat"%>

<%@ page contentType="text/html;charset=GBK"%>

<%@ page import="com.saas.biz.productMgr.ProductInfo"%>

<%@ page import="com.saas.biz.objectattrMgr.Objectattrinfo"%>

<%

String product_id="",product_name="",product_site="",product_desc="",product_unit="",product_abstract="";

String product_property="",propertySize="0";//产品的属性

 if (request.getParameter("product_id") != null)

  {

      product_id = request.getParameter("product_id");

      ProductInfo productOjb=new ProductInfo();

       ArrayList productList=productOjb.getProductInfo(product_id);

       //产品信息设置

       if(productList !=null && productList.size()>0)

       {

           HashMap map=(HashMap)productList.get(0);

           if(map.get("product_name") != null)

	        {

	           product_name=map.get("product_name").toString();

	        }

	        if(map.get("product_site") != null)

	        {

	           product_site=map.get("product_site").toString();

	        }

	         if(map.get("product_desc") != null)

	        {

	           product_desc=map.get("product_desc").toString();

	        }

	         if(map.get("product_abstract") != null)

	        {

	           product_abstract=map.get("product_abstract").toString();

	        }

	         if(map.get("product_unit") != null)

	        {

	           product_unit=map.get("product_unit").toString();

	        }

       }

       //产品属性设置

       Objectattrinfo attrObj=new Objectattrinfo();

       ArrayList attrList=attrObj.getProductProperty(product_id);

       if(attrList !=null && attrList.size()>0)

       {

           propertySize=String.valueOf(attrList.size());

           for(int i=0;i<attrList.size();i++)

           {

              HashMap attrMap=(HashMap)attrList.get(i);

              String attr_name="";

              String attr_value="";

              String attr_id=attrMap.get("attr_id").toString();

              if(attrMap.get("attr_name") !=null)

              {

                 attr_name=attrMap.get("attr_name").toString();

              }

              if(attrMap.get("attr_value") !=null)

              {

                 attr_value=attrMap.get("attr_value").toString();

              }

              product_property=product_property+"<tr><td  class=grayD align=left>"+attr_name+"</td>"

              +"<td  class=grayD align=left><input type=text name=rsrv_str"+i+" value="+attr_value+"><input type=hidden name=rsrv_idx"+i+" value="+attr_id+"></td></tr>";

           }

       }

  }

%>

<html>

<head>

<title><bean:message key="str4086"/></title>

<link href="/style/layout.css" rel="stylesheet" type="text/css">


<script language="JavaScript" src="/www/fuction/public.js"></script>

<script src="/www/fuction/calendar.js" type="text/javascript"></script>

<script language="JavaScript">

    function Check_Value()

	{

		if (cTrim(document.form1.product_name.value,0) == "" || document.form1.product_name.value == null) 

	{                                                                                         

		alert("产品名称不可以为空！");                                                             

		document.form1.product_name.focus();                                                    

		return false;                                                                            

	}                                                                                        

	if (product_abstract.getText()=="" || document.form1.product_abstract.value == null) 

	{                                                                                         

		alert("产品简介不可以为空！");                                                             

		document.form1.product_abstract.focus();                                                    

		return false;                                                                            

	}                                                                                  

	if (product_desc.getText()=="" || document.form1.product_desc.value == null) 

	{                                                                                         

		alert("产品描述不可以为空！");                                                             

		document.form1.product_desc.focus();                                                    

		return false;                                                                            

	}                                                                                      

	if (cTrim(document.form1.product_site.value,0) == "" || document.form1.product_site.value == null) 

	{                                                                                         

		alert("产地不可以为空！");                                                             

		document.form1.product_site.focus();                                                    

		return false;                                                                            

	}                                                                                   

	if (cTrim(document.form1.product_unit.value,0) == "" || document.form1.product_unit.value == null) 

	{                                                                                         

		alert("产品单位不可以为空！");                                                             

		document.form1.product_unit.focus();                                                    

		return false;                                                                            

	}                             

 	    return true;

	}

       function check_none(current_obj)

       {

            if (current_obj.advshow.checked)

            {

        	    current_obj.submit1.disabled=false;        	     

        	   }

        	else

        	{

        	    current_obj.submit1.disabled=true;

        	}

    	}

    	function exit()

    	{

    	    window.close();

    	}

    	function confirmsub(formobj)

    	{

    	    if(window.confirm('你确定要提交吗？')) 

    	    {

    	        if (!Check_Value())

    	        {

    	             return;

    	        }    	            	           

    	        formobj.submit();    	         

    	    }

    	    else

    	    {

    	        return;

    	    }

    	}

  </script>

</head>

<body>

<table width="818" border="0" cellspacing="0" cellpadding="0" align="center">

<tr>

	    <td height="26" background="/img/bg-1.gif">&nbsp;</td>

	  </tr>

	  <tr>

	    <td background="/img/bg-2.gif">

         <table  width="93%" border="0" cellpadding="5" cellspacing="1" align="center" bgcolor="#dddddd">

          <form name=form1 action=/doTradeReg.do method=post target="blank">

		  <tr>    

             <td  class="line1" align="left" colspan="2"><bean:message key="str4399"/>

             <input type=hidden name=trade_type_code value=0358>

             <input type=hidden name=product_id value=<%=product_id%>>

             </td>

          </tr>

          <tr>

           <td width="14%" align="right"  style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;"><bean:message key="str942"/></td>

           <td width="86%" align=left  style="background-color:#ffffff; color:#000000;  font-size:12px;"><input type=text name=product_name value=<%=product_name%> maxlength=70 size=70></td>

          </tr>

          <tr>

           <td  style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align="right"><bean:message key="str945"/></td>

           <td  style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left><textarea name=product_abstract style=display:none><%=product_abstract%></textarea>

            <iframe ID=product_abstract src=/www/ewebeditor/ewebeditor.htm?id=product_abstract&style=coolblue&root_id=<%=product_id%> frameborder=0 scrolling=no width=600 HEIGHT=350></iframe></td>

         </tr>

         <tr>

          <td  style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align="right"><bean:message key="str946"/></td>

          <td  style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left><textarea name=product_desc style=display:none><%=product_desc%> </textarea>

        <iframe ID=product_desc src=/www/ewebeditor/ewebeditor.htm?id=product_desc&style=coolblue&root_id=<%=product_id%> frameborder=0 scrolling=no width=600 HEIGHT=350></iframe></td>

         </tr>

         <tr>

          <td  style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align="right"><bean:message key="str947"/></td>

          <td  style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left><input type=text name=product_site value=<%=product_site%> maxlength=70 size=70></td>

         </tr>

         <tr>

          <td  style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align="right"><bean:message key="str4091"/></td>

          <td  style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left><input type=text name=product_unit value=<%=product_unit%>></td>

    </tr>

    <%=product_property%>

    <tr>

      <input type=hidden name=rsrv_num1 value=<%=propertySize%>>

      <td style="background-color:#ffffff; color:#000000;  font-size:12px;" colspan=2 align="center"><INPUT id=advcheck name=advshow type=checkbox value=0 onclick=check_none(form1)>

        <bean:message key="str4308"/>

      </td>

    </tr>

    <tr>

      <td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;padding-top:10px;padding-bottom:10px;" align="center" colspan=2><input name=submit1 type=button value=确定 disabled=true onclick=confirmsub(form1)>

        <input name=button1 type=button value=取消 onclick=exit()></td>

    </tr>

  </form>

</table>

	     </td>

	  </tr>

	  <tr>

	    <td height="46" background="/img/bg-3.gif">&nbsp;</td>

	  </tr>

	  </form>

	</table>

</body>

</html>

