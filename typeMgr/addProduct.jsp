<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"


"http://www.w3.org/TR/html4/loose.dtd">


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>


<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="java.util.*"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="com.saas.biz.commen.ParamethodMgr"%>
<%@ page import="com.saas.biz.productattrMgr.productattr"%>
<jsp:useBean id="bean" class="com.saas.biz.commen.commMethodMgr" scope="page"/>
	<%
	String product_id=bean.GenTradeId();
	ParamethodMgr paramCom=new ParamethodMgr();
	ArrayList  webList =paramCom.getCompareInfo("CRM","web_id");
	String sort1="",sort2="",sort3="",product_name="",class_id="",product_property="",propertySize="0";
	if(request.getParameter("product_name")!=null)
	{
	   product_name=new String(request.getParameter("product_name").getBytes("ISO8859_1")); 
//	   product_name=request.getParameter("product_name");
	}
	if(request.getParameter("sort1")!=null)
	{
	   sort1=request.getParameter("sort1");
	   class_id=sort1;
	}
	if(request.getParameter("sort2")!=null)
	{
	   sort2=request.getParameter("sort2");
	   class_id=sort2;
	}
	if(request.getParameter("sort3")!=null)
	{
	   sort3=request.getParameter("sort3");
	   class_id=sort3;
	}
	//out.print(sort1+"==="+sort2+"==="+sort3+"==="+product_name+"==="+class_id);
	if(class_id!=null&& !class_id.equals(""))
	{


	   productattr attrObj=new productattr();


	   ArrayList attrList=attrObj.getProductAttrByClassId(class_id);


	   if(attrList !=null && attrList.size()>0)


	   {


	      propertySize=String.valueOf(attrList.size());


	      for(int i=0;i<attrList.size();i++)


	      {


	         HashMap attrMap=(HashMap)attrList.get(i);


              String attr_name="";


              String default_value="";


              String attr_id=attrMap.get("attr_id").toString();


              if(attrMap.get("attr_name") !=null)


              {


                 attr_name=attrMap.get("attr_name").toString();


              }


              if(attrMap.get("default_value") !=null)


              {


                 default_value=attrMap.get("default_value").toString();


              }


              product_property=product_property+"<tr><td  class=graymn align=right>"+attr_name+"：</td>"


              +"<td  class=graymn align=left><input type=text name=rsrv_str"+i+" value="+default_value+"><input type=hidden name=rsrv_idx"+i+" value="+attr_id+"></td></tr>";


	      }


	   }


	}


	%>


<html>


<head>


<title><bean:message key="str334"/>(http://soft.xsaas.com)</title>


<link href="/style/layout.css" rel="stylesheet" type="text/css">




<script language="javascript" src="/js/calendar.js"></script>


<script language="javascript">


  var cdr = new Calendar("cdr");


  document.write(cdr);


  cdr.showMoreDay = true;


</script>


<script language="JavaScript">


function Check_Value()


{


	if(product_abstract.getText()== "" || document.bidForm.product_abstract.value == null)


	{


		alert("产品简介不可以为空！");                                                             


		return false;     


	}


	if(product_desc.getText()== "" || document.bidForm.product_desc.value == null)


	{


		alert("产品描述不可以为空！");                                                             


		return false;     


	}


	if (document.bidForm.product_site.value == "" || document.bidForm.product_site.value == null) 


	{                                                                                         


		alert("生产地不可以为空！");                                                             


		document.bidForm.product_site.focus();                                                    


		return false;                                                                            


	}                 


	if (document.bidForm.product_unit.value== "" || document.bidForm.product_unit.value == null) 


	{                                                                                         


		alert("产品单位不可以为空！");                                                             


		document.bidForm.product_unit.focus();                                                    


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


	<table width=93% border=0 cellpadding=5 cellspacing=1 align=center  bgcolor="#dddddd">


        <form name=bidForm action=/doTradeReg.do method=post>


		   <tr>


		     <td class="line1" align="left" colspan="2"><bean:message key="str2057"/></td>


	      </tr>


          <tr>


			 <td height="30" align="right"  style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;"><bean:message key="str2661"/> </td>


               <td align="left"  style="background-color:#ffffff; color:#000000;  font-size:12px;">


                <select name="web_id"  maxlength="25">


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


          <tr>


            <td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;" align=right  valign=top><bean:message key="str3257"/></td>


            <td style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left><textarea name="product_abstract" style=display:none></textarea>


              <iframe ID=product_abstract src=/www/ewebeditor/ewebeditor.htm?id=product_abstract&style=coolblue&root_id=<%=product_id%> frameborder=0 scrolling=no width=600 HEIGHT=350></iframe></td>


          </tr>


          <tr>


            <td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;" align=right  valign=top><bean:message key="str3279"/></td>


            <td style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left><textarea name="product_desc" style=display:none></textarea>


              <iframe ID=product_desc src=/www/ewebeditor/ewebeditor.htm?id=product_desc&style=coolblue&root_id=<%=product_id%> frameborder=0 scrolling=no width=600 HEIGHT=350></iframe></td>


          </tr>


         <tr>


            <td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;" align=right><bean:message key="str4395"/></td>


            <td style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left><input name="product_site" type="text" size=50 maxlength=50>


            </td>


          </tr>


          <tr>


            <td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;" align=right><bean:message key="str4396"/></td>


            <td style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left><input name="product_unit" type="text" size=25 maxlength=25>


            </td>


          </tr>


          <input name="trade_type_code" type="hidden" value="0205">


          <input name="product_name" type="hidden" value="<%=product_name%>">


          <input name="sort1" type="hidden" value="<%=sort1%>">


          <input name="sort2" type="hidden" value="<%=sort2%>">


          <input name="sort3" type="hidden" value="<%=sort3%>">


          <input name="root_id" type="hidden" value="<%=product_id%>">


           <input name="product_id" type="hidden" value="<%=product_id%>">


          <input type=hidden name=rsrv_num1 value=<%=propertySize%>>


          <%


            if(product_property !=null && !product_property.equals(""))


            {%>


            <input name="enable_tag" type="hidden" value="0">


            <%}


          else{


          %>


          <input name="enable_tag" type="hidden" value="1">


          <%}%>


          <%=product_property%>


          <tr>


            <td style="background-color:#ffffff; color:#000000;  font-size:12px;" colspan=2 align="center"><INPUT name="advshow" type="checkbox" value="0" onclick="check_none(bidForm)">


              &nbsp;<bean:message key="str5132"/>


            </td>


          </tr>


          <tr>


            <td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px; padding-top:10px;padding-bottom:10px;" align=center  colspan=2><input class="tjan" name="submit1" type="button" value="" disabled="true" onclick="confirmsub(bidForm)">


            </td>


          </tr>


        </form>


      </table></td>


         </tr>


  <tr>


    <td height="46" background="/img/bg-3.gif">&nbsp;</td>


  </tr>


</table>


</body>


</html>


