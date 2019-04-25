<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"

"http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>

<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>

<%@ page import="java.util.*"%>

<%@ page contentType="text/html;charset=GBK"%>

<jsp:useBean id="bean" class="com.saas.biz.commen.commMethodMgr" scope="page"/>

<%@ page import="com.saas.biz.commen.ParamethodMgr"%>

<%

  String product_id=bean.GenTradeId();

  ParamethodMgr paramCom=new ParamethodMgr();

  ArrayList  webList =paramCom.getCompareInfo("CRM","web_id");

%>

<html>

<head>

<title><bean:message key="str4086"/></title>

<link href="style/css.css" rel="stylesheet" type="text/css">

<script src="www/fuction/calendar.js" type="text/javascript"></script>

<script language="JavaScript" src="/www/fuction/public.js"></script>

<script src="/js/UrlEncode.js" language="jscript" type="text/jscript"></script>

<script src="/js/classInfo.js" language="jscript" type="text/jscript"></script>

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

 

    	function confirmsub(formobj)

    	{

    	    if(window.confirm('你确定要提交吗？')) 

    	    {  	    	

    	        if (!Check_Value())

    	        {

    	             return;

    	        }

    	     	addparm(formobj);

    	         formobj.submit();   	         

    	    }

    	    else

    	    {

    	        return;

    	    }

    	}

       function  addparm(formobj)

       {

        if(formobj.str_attr)

        {

       		var attr_str="";

       		formobj.str_attr.value="";

			for(var i=0;i<formobj.length;i++)

			{

				if(formobj[i].getAttribute("name").substring(0,4)=="attr")

				{

			 	  attr_str =attr_str + formobj[i].getAttribute("name").substring(4, formobj[i].getAttribute("name").length)+":";

			 	  attr_str = attr_str +formobj[i].getAttribute("value")+"|";

				}

			}

			formobj.str_attr.value=attr_str;

		 }

        }    		

</script>

</head>

<body>

<table width="818" border="0" cellspacing="0" cellpadding="0">

  <tr>

    <td height="26" background="img/bg-1.gif">&nbsp;</td>

  </tr>

  <tr>

    <td background="img/bg-2.gif"><table width=95% border=0 cellpadding=10 cellspacing=1 align=center bordercolor=#000000>

        <form name=form1 action=doTradeReg.do method=post >

          <tr>

            <td align=right bgcolor="#efefef" class=graymn><bean:message key="str4087"/></td>

            <td class=graymn align=left><select name=web_id>

                <%

					if(webList != null && webList.size()>0)

					{

						for(int i=0;i<webList.size();i++)

						{

							HashMap map=(HashMap)webList.get(i);

							String value=map.get("para_code1").toString();

							String name=map.get("para_code2").toString();

							%>

                               <option value="<%= value %>"><%= name %></option>

                               <%

						}

					} %>

              </select>

            </td>

          </tr>

          <input name="product_id" type="hidden" value=<%=product_id%>>

          <input name="str_attr" type="hidden"  ><!--产品的属性-->

          <input name="root_id" type="hidden" value=<%=product_id%>>

          <tr>

            <td align=right bgcolor="#efefef" class=graymn><bean:message key="str942"/></td>

            <td class=graymn align=left><input name="product_name" type="text" size=50 maxlength=50>

            </td>

          </tr>

          <tr>

            <td align=right bgcolor="#efefef" class=graymn><bean:message key="str945"/></td>

            <td class=graymn align=left><textarea name="product_abstract" style=display:none></textarea>

              <iframe ID=product_abstract src=/www/ewebeditor/ewebeditor.htm?id=product_abstract&style=coolblue&root_id=<%=product_id%> frameborder=0 scrolling=no width=500 HEIGHT=350></iframe></td>

          </tr>

          <tr>

            <td align=right bgcolor="#efefef" class=graymn><bean:message key="str946"/></td>

            <td class=graymn align=left><textarea name="product_desc" style=display:none></textarea>

              <iframe ID=product_desc src=/www/ewebeditor/ewebeditor.htm?id=product_desc&style=coolblue&root_id=<%=product_id%> frameborder=0 scrolling=no width=500 HEIGHT=350></iframe></td>

          </tr>

            <tr>

		  <td height="30" align="right" bgcolor="#efefef"  class=graymn><bean:message key="str2283"/></td>

              <td colspan="2" align="left"  class=graymn>

                <table>

                  <tr>

                    <td  class=graymn><select name="bigsort" style="display:none">

                      <option selected value="0"><bean:message key="str2655"/></option>

                    </select></td>

                    <td  class=graymn><select name="sort1" size="10" onChange="this.form.sort2.options.length=0;this.form.sort3.options.length=0;getSubitems(this.form.sort2, this.value)">

                      <option selected value="0"><bean:message key="str2655"/></option>

                    </select></td>

                    <td  class=graymn><select name="sort2" size="10" onChange="this.form.sort3.options.length=0;getSubitems(this.form.sort3, this.value)">

                      <option value="0"><bean:message key="str2655"/></option>

                    </select></td>

                    <td  class=graymn><select name="sort3" size="10">

                      <option value="0"><bean:message key="str2655"/></option>

                    </select></td>

                  </tr>

                </table>

              </td>

		</tr>

          <tr>

            <td align=right bgcolor="#efefef" class=graymn><bean:message key="str4090"/></td>

            <td class=graymn align=left><input name="product_site" type="text" size=50 maxlength=50>

            </td>

          </tr>

          <input name="trade_type_code" type="hidden" value="0205">

          <tr>

            <td align=right bgcolor="#efefef" class=graymn><bean:message key="str4091"/></td>

            <td class=graymn align=left><input name="product_unit" type="text" size=10 maxlength=10>

            </td>

          </tr>

          <tr>

            <td align=right bgcolor="#efefef" class=graymn><bean:message key="str4390"/></td>

            <td class=graymn align=left><input  name= attrn1re1 type="text" >

            </td>

          </tr>

          <tr>

            <td class="grayE" colspan=5><INPUT name="advshow" type="checkbox" value="0" onclick="check_none(form1)">

              <bean:message key="str5132"/>

            <td>

          </tr>

          <tr>

            <td class="graymn" align=right></td>

            <td class="graymn" align=right><input name="submit1" type="button" value="提交" disabled="true" onclick="confirmsub(form1)">

            </td>

          </tr>

        </form>

      </table></td>

  </tr>

  <tr>

    <td height="46" background="img/bg-3.gif">&nbsp;</td>

  </tr>

</table>

<script language="jscript" type="text/jscript">

	getSubitems(document.classForm.bigsort, "", "请选择...", "");

	getSubitems(document.classForm.sort1, "");

</script>

</body>

</html>

