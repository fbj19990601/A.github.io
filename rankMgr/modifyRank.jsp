<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="java.util.*" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="com.saas.biz.commen.ParamethodMgr"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%
  String date = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
   String cust_name="",cust_id="";
    if (request.getParameter("cust_name") != null)
    {
        cust_name = request.getParameter("cust_name");
    }
    if (request.getParameter("cust_id") != null)
    {
        cust_id = request.getParameter("cust_id");
    }
	ParamethodMgr comparList=new ParamethodMgr();
	HashMap compMap=comparList.getCompareInfoByCode("CRM","cust_type");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title><bean:message key="str4086"/></title>
<link href="/style/layout.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="/www/fuction/public.js"></script>
<script language="javascript" src="/js/Calendar_Ly.js"></script>
<script language="JavaScript">
 function Check_Value()
{
    if (cTrim(document.form1.cust_class.value,0) == "" || document.form1.cust_class.value == null) 
	{                                                                                         
		alert("客户级别不可以为空！");                                                             
		document.form1.cust_class.focus();                                                    
		return false;                                                                            
	}
	if (cTrim(document.form1.start_date.value,0) == "" || document.form1.start_date.value == null) 
	{                                                                                         
		alert("有效开始时间不可以为空！");                                                             
		document.form1.start_date.focus();                                                    
		return false;                                                                            
	}                                                                                        
	if (cTrim(document.form1.end_date.value,0) == "" || document.form1.end_date.value == null) 
	{                                                                                         
		alert("有效截止时间不可以为空！");                                                             
		document.form1.end_date.focus();                                                    
		return false;                                                                            
	}                                                                                      
	if (cTrim(document.form1.remark.value,0) == "" || document.form1.remark.value == null) 
	{                                                                                         
		alert("操作说明不可以为空！");                                                             
		document.form1.remark.focus();                                                    
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
<br><br><br>
<table  width=700 border="0" cellpadding="2" cellspacing="1" align="center" bgcolor="#dddddd">
  <tr>    
    <td  class="line1" align="left" colspan="2" ><bean:message key="str1160"/>
    </td>
  </tr>
  <form name=form1 action=/doTradeReg.do method="post">
    <tr>
      <td width="163" align=right  style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;"><bean:message key="str3227"/></td>
      <td width="526" align=left  style="background-color:#ffffff; color:#000000;  font-size:12px;" class="ping1"><%=cust_name%></td>
    </tr>
    <tr>
      <td  style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;" align=right><bean:message key="str3228"/></td>
      <td  style="background-color:#ffffff; color:#000000;  font-size:12px;" class="ping1" align=left><select name=cust_class>
          <%
           if (compMap != null && compMap.size() > 0) 
           {
	            Iterator it = compMap.entrySet().iterator();
	            while (it.hasNext())
	             {
	                Map.Entry entry = (Map.Entry) it.next();
	                String keys =entry.getKey().toString();
	                String values =entry.getValue().toString();
	                %>
	                 <option value=<%=keys%>><%=values%></option>
	                <%
	               }
             }
          %>          
        </select>
      </td>
    </tr>
    <tr>
      <td  style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;" align=right><bean:message key="str3229"/></td>
      <td style="background-color:#ffffff; color:#000000;  font-size:12px;" class="ping" align=left>
          <input name="start_date" type="text" size=15 maxlength=7 class="input1" id="start_date"   onfocus="setday(this);">(yyyy-MM-dd)
      </td>
    </tr>
    <tr>
      <td  style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;" align=right><bean:message key="str3230"/></td>
      <td style="background-color:#ffffff; color:#000000;  font-size:12px;" class="ping" align=left>
      	<input name="end_date" type="text" size=15 maxlength=7 class="input1" id="end_date" onfocus="setday(this);">(yyyy-MM-dd)
      </td>
    </tr>
    <tr>
      <td  style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;" align=right><bean:message key="str3231"/></td>
      <td  style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left class="ping"><input type="text" name="remark"></td>
    </tr>

      <input type="hidden" name="trade_type_code" value=0315>
      <input type="hidden" name="cust_id" value="<%=cust_id%>">

    <tr>
      <input type=hidden name=rsrv_num1 value=0>
      <td  style="background-color:#ffffff; color:#000000;  font-size:12px;" colspan=2 align="center"><INPUT id=advcheck name=advshow type=checkbox value=0 onclick=check_none(form1)>
        <bean:message key="str3232"/>
      </td>
    </tr>
    <tr>
      <td  style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;padding-top:10px;padding-bottom:10px;" align=center colspan=2><input name=submit1 class="tjan" type=button value="" disabled=true onclick=confirmsub(form1)>
        <input name=button1 class="qxan" type=button value="" onclick=exit()></td>
    </tr>
  </form>
</table>
</body>
</html>
