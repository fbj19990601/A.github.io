<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<html>
<head>
  <title><bean:message key="str1402"/></title>
  <meta http-equiv="Content-Type" content="text/html; charset=GB2312" />
  
</head>
 <%
     String job_id="",cust_id="";
     if( request.getParameter( "job_id" ) != null )
     {
     		job_id = request.getParameter( "job_id" );
     }
     if( request.getParameter( "cust_id" ) != null )
     {
     		cust_id = request.getParameter( "cust_id" );
     }   
    out.print( "job_id =" + job_id + "*******cust_id="+ cust_id );    
 %>
  
<body>
<table width="100%" border="0" align="center" cellpadding="10" cellspacing="0">
	<form name="aForm" method="POST" action="/doTradeReg.do" >
  <table width="100%" border="0" align="center" cellpadding="10" cellspacing="0">
    <tr>
      <td valign="top" bgcolor="#FFFFFF">
         
        <table width="100%" border="0" align="right" cellpadding="5" cellspacing="1">
          <tr bgcolor="#E6E6E6">
            <td width="20%" bgcolor="#E6E6E6" align="right">
              <div class="c2">
                <bean:message key="str1403"/>
              </div>
            </td>
            <td width="80%" bgcolor="#F0F0F0" class="zi1"> <input type="text" name="" value=""></td>
          </tr>
          <tr bgcolor="#F0F0F0">
            <td width="20%" bgcolor="#E6E6E6" align="right">
              <div class="c2">
                <bean:message key="str1404"/>
              </div>
            </td>
            <td bgcolor="#F0F0F0" class="zi1"><input type="text" name="" value=""></td>
          </tr>

          <tr bgcolor="#E6E6E6">
            <td width="20%" bgcolor="#E6E6E6" align="right">
              <div class="c2">
                <bean:message key="str1405"/>
              </div>
            </td>
            <td bgcolor="#F0F0F0">
            	<input type="text"  name="title"  size="50"  value="�������/���������ְ">
            </td>
          </tr>

          <tr bgcolor="#F0F0F0">
            <td width="100" valign="top" bgcolor="#E6E6E6" align="right">
              <div class="c2">
                <bean:message key="str3808"/>
              </div>
            </td>
            <td height="50" bgcolor="#F0F0F0">
            	<textarea class="txt" name="content"  cols="50" ></textarea> 
      	    </td>
          </tr>
           <input type="hidden" name="trade_type_code" value="">
  
          <tr bgcolor="#E6E6E6">
            <td bgcolor="#E6E6E6" class="zi1">&nbsp;</td>
            <td bgcolor="#F0F0F0">
              <input type="submit" name="submit"  border="0" width="64" height="22" value="����" /> 
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</form>
</table>
</body>
</html>

 