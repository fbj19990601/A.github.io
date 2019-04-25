<%@ page contentType="text/html;charset=GBK" language="java" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title><bean:message key="str116"/></title>
<link href="/style/style.css" rel="stylesheet" type="text/css">
</head>

<style type="text/css">
<!--
body {
margin-left: 0px;
margin-top: 0px;
margin-right: 0px;
margin-bottom: 0px;
}
--> 
</style>
<body>
<table width="90%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#666666">
<tr>
<td bgcolor="#FFFFFF"><table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
<tr>
<td height="25" colspan="2" align="center" bgcolor="efefef"><bean:message key="str3943"/></td>
</tr>
</table></td>
</tr>
</table>
<br>
<table width="90%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#666666">
<tr>
<td bgcolor="#FFFFFF">
<table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
<form name="form" method="post" action="buildHtml.jsp?action=do" target="_blank">
<tr align="center" bgcolor="f3f3f3">
<td height="22" colspan="2"><bean:message key="str3944"/></td>
</tr>
<tr>
<td width="11%" height="22" align="right"><bean:message key="str3945"/></td>
<td width="89%" height="22"><bean:message key="str3946"/></td>
</tr>
<tr>
<td height="22" align="right"><bean:message key="str3947"/></td>
<td height="22"><a href="buildHtml.jsp?action=productlist" target="_blank"><bean:message key="str3948"/></a> <a href="buildHtml.jsp?action=productlist" target="_blank"></a> <a href="buildHtml.jsp?action=productlist" target="_blank"><bean:message key="str3950"/></a> <a href="buildHtml.jsp?action=productlist" target="_blank"><bean:message key="str3951"/></a>    <bean:message key="str3952"/></td>
</tr>
<tr>
<td height="22" align="right"><bean:message key="str3953"/></td>
<td height="22"><bean:message key="str3954"/>
<input name="product" type="text" id="product" value="100">          </td>
</tr>
<tr>
<td height="22" align="right">&nbsp;</td>
<td height="22"><bean:message key="str3601"/>
<input name="enterprise" type="text" id="enterprise" value="100"></td>
</tr>
<tr>
<td height="22" align="right">&nbsp;</td>
<td height="22"><bean:message key="str2738"/>
<input name="supply" type="text" id="supply" value="100"></td>
</tr>
<tr>
<td height="22" align="right">&nbsp;</td>
<td height="22"><bean:message key="str3961"/>
<input name="stock" type="text" id="stock" value="100"></td>
</tr>
<tr>
<td height="22" align="right">&nbsp;</td>
<td height="22"><bean:message key="str3955"/>
<input name="bidding" type="text" id="bidding" value="100"></td>
</tr>
<tr>
<td height="22" align="right">&nbsp;</td>
<td height="22"><bean:message key="str3957"/>
<input name="job" type="text" id="job" value="100"></td>
</tr>
<tr>
<td height="22" align="right">&nbsp;</td>
<td height="22"><bean:message key="str3956"/>
<input name="zp" type="text" id="zp" value="100"></td>
</tr>
<tr>
<td height="22" align="right">&nbsp;</td>
<td height="22"><bean:message key="str4519"/>
<input name="news" type="text" id="news" value="100"></td>
</tr>
<tr>
<td height="22" align="right">&nbsp;</td>
<td height="22"><bean:message key="str3958"/>
<input name="school" type="text" id="school" value="100"></td>
</tr>
<tr>
<td height="22" align="right">&nbsp;</td>
<td height="22"><bean:message key="str3959"/></td>
</tr>
<tr>
<td height="30" align="right">&nbsp;</td>
<td height="30"><input type="submit" name="Submit" value=" 提 交 "></td>
</tr>
</form>
</table></td>
</tr>
</table>
<br>
<table width="90%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#666666">
  <tr>
    <td bgcolor="#FFFFFF">
      <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
        <form name="form1" method="post" action="buildHtml.jsp?action=product" target="_blank">
          <tr align="center" bgcolor="f3f3f3">
            <td height="22" colspan="2"><bean:message key="str3944"/></td>
          </tr>
          <tr>
            <td width="11%" height="22" align="right"><bean:message key="str3953"/></td>
            <td width="89%" height="22"><bean:message key="str3954"/>
              <input name="product" type="text" id="product" value="100"></td>
          </tr>
          <tr>
            <td height="30" align="right">&nbsp;</td>
            <td height="30"><input type="submit" name="Submit22" value=" 提 交 "></td>
          </tr>
        </form>
    </table></td>
  </tr>
</table>
<br>
<table width="90%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#666666">
  <tr>
    <td bgcolor="#FFFFFF">
      <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
        <form name="form2" method="post" action="buildHtml.jsp?action=enterprise" target="_blank">
          <tr align="center" bgcolor="f3f3f3">
            <td height="22" colspan="2"><bean:message key="str3944"/></td>
          </tr>
          <tr>
            <td width="11%" height="22" align="right"><bean:message key="str3953"/></td>
            <td width="89%" height="22"><bean:message key="str3601"/>
              <input name="enterprise" type="text" id="enterprise" value="100"></td></tr>
          <tr>
            <td height="30" align="right">&nbsp;</td>
            <td height="30"><input type="submit" name="Submit23" value=" 提 交 "></td>
          </tr>
        </form>
    </table></td>
  </tr>
</table>
<br>
<table width="90%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#666666">
  <tr>
    <td bgcolor="#FFFFFF">
      <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
        <form name="form3" method="post" action="buildHtml.jsp?action=supply" target="_blank">
          <tr align="center" bgcolor="f3f3f3">
            <td height="22" colspan="2"><bean:message key="str3944"/></td>
          </tr>
          <tr>
            <td width="11%" height="22" align="right"><bean:message key="str3953"/></td>
            <td width="89%" height="22"><bean:message key="str2738"/>
              <input name="supply" type="text" id="supply" value="100"></td></tr>
          <tr>
            <td height="30" align="right">&nbsp;</td>
            <td height="30"><input type="submit" name="Submit24" value=" 提 交 "></td>
          </tr>
        </form>
    </table></td>
  </tr>
</table>
<br>
<table width="90%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#666666">
  <tr>
    <td bgcolor="#FFFFFF">
      <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
        <form name="form4" method="post" action="buildHtml.jsp?action=stock" target="_blank">
          <tr align="center" bgcolor="f3f3f3">
            <td height="22" colspan="2"><bean:message key="str3944"/></td>
          </tr>
          <tr>
            <td width="11%" height="22" align="right"><bean:message key="str3953"/></td>
            <td width="89%" height="22"><bean:message key="str3961"/>
              <input name="stock" type="text" id="stock" value="100"></td></tr>
          <tr>
            <td height="30" align="right">&nbsp;</td>
            <td height="30"><input type="submit" name="Submit25" value=" 提 交 "></td>
          </tr>
        </form>
    </table></td>
  </tr>
</table>
<br>
<table width="90%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#666666">
  <tr>
    <td bgcolor="#FFFFFF">
      <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
        <form name="form5" method="post" action="buildHtml.jsp?action=bidding" target="_blank">
          <tr align="center" bgcolor="f3f3f3">
            <td height="22" colspan="2"><bean:message key="str3944"/></td>
          </tr>
          <tr>
            <td width="11%" height="22" align="right"><bean:message key="str3953"/></td>
            <td width="89%" height="22"><bean:message key="str3955"/>
              <input name="bidding" type="text" id="bidding" value="100"></td></tr>
          <tr>
            <td height="30" align="right">&nbsp;</td>
            <td height="30"><input type="submit" name="Submit26" value=" 提 交 "></td>
          </tr>
        </form>
    </table></td>
  </tr>
</table>
<br>
<table width="90%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#666666">
  <tr>
    <td bgcolor="#FFFFFF">
      <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
        <form name="form6" method="post" action="buildHtml.jsp?action=job" target="_blank">
          <tr align="center" bgcolor="f3f3f3">
            <td height="22" colspan="2"><bean:message key="str3944"/></td>
          </tr>
          <tr>
            <td width="11%" height="22" align="right"><bean:message key="str3953"/></td>
            <td width="89%" height="22"><bean:message key="str3957"/>
              <input name="job" type="text" id="job" value="100"></td></tr>
          <tr>
            <td height="30" align="right">&nbsp;</td>
            <td height="30"><input type="submit" name="Submit27" value=" 提 交 "></td>
          </tr>
        </form>
    </table></td>
  </tr>
</table>
<br>
<table width="90%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#666666">
  <tr>
    <td bgcolor="#FFFFFF">
      <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
        <form name="form7" method="post" action="buildHtml.jsp?action=zp" target="_blank">
          <tr align="center" bgcolor="f3f3f3">
            <td height="22" colspan="2"><bean:message key="str3944"/></td>
          </tr>
          <tr>
            <td width="11%" height="22" align="right"><bean:message key="str3953"/></td>
            <td width="89%" height="22"><bean:message key="str3956"/>
              <input name="zp" type="text" id="zp" value="100"></td></tr>
          <tr>
            <td height="30" align="right">&nbsp;</td>
            <td height="30"><input type="submit" name="Submit28" value=" 提 交 "></td>
          </tr>
        </form>
    </table></td>
  </tr>
</table>
<br>
<table width="90%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#666666">
  <tr>
    <td bgcolor="#FFFFFF">
      <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
        <form name="form8" method="post" action="buildHtml.jsp?action=news" target="_blank"> 
          <tr align="center" bgcolor="f3f3f3">
            <td height="22" colspan="2"><bean:message key="str3944"/></td>
          </tr>
          <tr>
            <td width="11%" height="22" align="right"><bean:message key="str3953"/></td>
            <td width="89%" height="22"><bean:message key="str4519"/>
                <input name="news" type="text" id="news" value="100"></td>
          </tr>
          <tr>
            <td height="30" align="right">&nbsp;</td>
            <td height="30"><input type="submit" name="Submit29" value=" 提 交 "></td>
          </tr>
        </form>
    </table></td>
  </tr>
</table>
<br>
<table width="90%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#666666">
  <tr>
    <td bgcolor="#FFFFFF">
      <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
        <form name="form9" method="post" action="buildHtml.jsp?action=school" target="_blank">
          <tr align="center" bgcolor="f3f3f3">
            <td height="22" colspan="2"><bean:message key="str3944"/></td>
          </tr>
          <tr>
            <td width="11%" height="22" align="right"><bean:message key="str3953"/></td>
            <td width="89%" height="22"><bean:message key="str3958"/>
              <input name="school" type="text" id="school" value="100"></td></tr>
          <tr>
            <td height="30" align="right">&nbsp;</td>
            <td height="30"><input type="submit" name="Submit2" value=" 提 交 "></td>
          </tr>
        </form>
    </table></td>
  </tr>
</table>
<br>
<table width="90%"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#666666">
  <tr>
    <td bgcolor="#FFFFFF">
      <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
        <form name="form9" method="post" action="buildHtml.jsp?action=school" target="_blank">
          <tr align="center" bgcolor="f3f3f3">
            <td height="22"><bean:message key="str3944"/></td>
          </tr>
          <tr>
            <td width="11%" height="22" align="center"><a href="buildHtml.jsp?action=js" target="_blank"><bean:message key="str3962"/></a></td>
         </tr>
        </form>
    </table></td>
  </tr>
</table>
<p>&nbsp;</p>
</body>
</html>
