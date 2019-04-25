<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="com.saas.biz.advertiseMgr.*"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.saas.biz.enquirytrackMgr.EnquirytrackInfo"%>
<jsp:useBean id="bean" class="com.saas.biz.commen.commMethodMgr" scope="page"/>
<%@ page import="com.saas.biz.commen.commMethodMgr"%>

<%
     String enquiry_id="";
     String trade_id=bean.GenTradeId();
     String enquiry_content="";
         
 	commMethodMgr commen = new commMethodMgr();
 	String idx = commen.GenTradeId();
     
     if(request.getParameter("trade_id")!=null)
     {
        enquiry_id=request.getParameter("trade_id");
        EnquirytrackInfo enquiry=new EnquirytrackInfo();
	    ArrayList enquiryList=enquiry.getEnquiryInfoByTradeId(enquiry_id);
	   if(enquiryList !=null && enquiryList.size()>0)
	   {
	     HashMap map=(HashMap)enquiryList.get(0);
	     if(map.get("enquiry_content")!= null)
	     {
	       enquiry_content=map.get("enquiry_content").toString();
	     }
	   }
     }
%>

<html>
<head>
<title>E-commerce Platform</title>
<link href="/style/css.css" rel="stylesheet" type="text/css">

<script src="/www/fuction/calendar.js" type="text/javascript"></script>
<script language="JavaScript" src="/www/fuction/public.js"></script>
<script language="JavaScript">
    function Check_Value()
	{
		if (content.getText()=="" || document.reposForm.content.value == null) 
		{                                                                                         
			alert("The reply content can not be empty£¡");                                                             
			document.reposForm.content.focus();                                                    
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
    function confirmsub( formobj )
    {
    	 if(window.confirm('Are you sure to submit£¿')) 
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
<table width="820" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td height="26" background="/img/bg-1.gif">&nbsp;</td>
  </tr>
  <tr>
    <td background="/img/bg-2.gif">
    <table width=93% border=0 cellpadding=5 cellspacing=1 align=center  bgcolor="#dddddd">
        <form name=reposForm action=/doTradeReg.do method= post>
          <input name="trade_type_code" type="hidden" value="0238">
          <tr>
            <td class=graymn width="12%" align=right style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;">Types of treatment £º</td>
            <td class=grayD width="88%" align=left bgcolor="#FFFFFF">
            	 <select name=deal_tag>
	               <option value="1">Treatment </option>
	               <option value="2">Spam messages</option>
              </select>
            </td>
          </tr>
          <tr>
            <td class=graymn style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>content£º</td>
            <td class=grayD align=left bgcolor="#FFFFFF">
            	 <%=enquiry_content%>
            </td>
          </tr>
          <tr>
            <td class=graymn align=right style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" >reply content£º</td>
            <td class=grayD align=left bgcolor="#FFFFFF">
            <textarea name="content" style=display:none bgcolor="#FFFFFF"></textarea>
              <iframe ID=content src=/www/ewebeditor/ewebeditor.htm?id=content&style=coolblue&root_id=<%=trade_id%>  frameborder=0 scrolling=no width=600 HEIGHT=350></iframe></td>
          </tr>
          
          <tr>

			<td  style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
			   		Annex£º
		    </td>

		     <td bgcolor="#FFFFFF">

			  <div class="ping1">

				  <input name="path" id="path" type="hidden" size=40 value="<%=idx%>">

				  <iframe id="saveImag" name="saveImag" style="margin-top:2px" frameborder="0" scrolling="no" hspace="0" WIDTH="330" HEIGHT="25" src="/inc/saveImage.jsp?root_id=<%=idx%>"></iframe>

			  </div>

			 </td>

			</tr>
				    
		  <input type="hidden"name="idx" value="<%=idx%>">
          
          <input name = "trade_id" type="hidden" value=<%=trade_id%>>
          <input name = "enquiry_id" type="hidden" value=<%=enquiry_id%>>
          <tr>
            <td class=graymn style="background-color:#ffffff; color:#000000;  font-size:12px;" colspan=2 align="center">
            <INPUT name="advshow" type="checkbox" value="0" onclick="check_none(reposForm)">
              The above information is correct ¡£
            <td>
          </tr>
          <tr>
            
            <td class="graymn" style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px; padding-top:10px;padding-bottom:10px;" align="center" colspan=2>
            <input name="submit1" type="button" value="submit" disabled ="true"  onclick="confirmsub(reposForm)">
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
