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
<%@ page import="com.saas.biz.biddingMgr.Biddinginfo"%>
<jsp:useBean id="bean" class="com.saas.biz.commen.commMethodMgr" scope="page"/>
	<%
	String bidding_id="",title="",content="";
	if(request.getParameter("bidding_id")!=null)
	{
	  bidding_id=request.getParameter("bidding_id");
	  Biddinginfo bidingObj=new Biddinginfo();
	  ArrayList bindList=bidingObj.genPKBidding(bidding_id);
	  if(bindList !=null && bindList.size()>0)
	  {
	     HashMap map=(HashMap)bindList.get(0);
	     if(map.get("title") !=null)
	     {
	       title=map.get("title").toString();
	     }
	     if(map.get("content")!=null)
	     {
	       content=map.get("content").toString();
	     }
	  }
	}
	%>
<html>
<head>
<title><bean:message key="str4666"/></title>
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
	if (hit_content.getText()=="" || document.bidForm.hit_content.value == null) 
	{                                                                                         
		alert("�б깫�����ݲ�����Ϊ�գ�");                                                             
		document.bidForm.hit_content.focus();                                                    
		return false;                                                                            
	}                                                                                       
	if (document.bidForm.hit_custname.value== "" || document.bidForm.hit_custname.value == null) 
	{                                                                                         
		alert("�б굥λ���Ʋ�����Ϊ�գ�");                                                             
		document.bidForm.hit_custname.focus();                                                    
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
    if(window.confirm('��ȷ��Ҫ�ύ��')) 
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
<table width="818" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td height="26" background="/img/bg-1.gif">&nbsp;</td>
  </tr>
  <tr>
    <td background="/img/bg-2.gif">
	<table width=93% border=0 cellpadding=5 cellspacing=1 align=center bgcolor="#dddddd" >
        <form name=bidForm action=/doTradeReg.do method=post>
           <tr>
		     <td class="line1" align="left" colspan="2"><bean:message key="str4677"/></td>
	      </tr>
          <tr>
            <td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right width="15%"><bean:message key="str4672"/></td>
            <td style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left width="85%"><%=title%>
            </td>
          </tr>
          <input name="bidding_id" type="hidden" value=<%=bidding_id%>>
          <tr>
            <td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right><bean:message key="str4678"/></td>
            <td style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left>
            	<bean:define id="contents" value="<%=content%>" />
            	<bean:write name="contents" filter="false"/>
            </td>
          </tr>
          <tr>
            <td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right valign="top"><bean:message key="str4679"/></td>
            <td style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left><div class="ping"><textarea name="hit_content" style=display:none></textarea>
            <iframe ID=hit_content src=/www/ewebeditor/ewebeditor.htm?id=hit_content&style=coolblue&root_id=<%=bidding_id%> frameborder=0 scrolling=no width=600 HEIGHT=350></iframe></div></td>
          </tr>
          <tr>
            <td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right><bean:message key="str4680"/></td>
            <td style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left><div class="ping"><input name="hit_custname" type="text" size=50 maxlength=50></div>
            </td>
          </tr>
          <input name="trade_type_code" type="hidden" value="0235">
          <input name="attach_tag" type="hidden" value="0">
          <tr>
            <td  style="background-color:#ffffff; color:#000000;  font-size:12px;" colspan=2 align="center"><INPUT name="advshow" type="checkbox" value="0" onclick="check_none(bidForm)">
              &nbsp;<bean:message key="str354"/>
            </td>
          </tr>
          <tr>
            <td  style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px; padding-top:10px;padding-bottom:10px;"  colspan=2  align=center><input name="submit1" type="button" value="�ύ" disabled="true" onclick="confirmsub(bidForm)">
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
