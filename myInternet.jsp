<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ page import="java.util.*"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>

<!--<HTML>
	<HEAD>
		<META http-equiv=Content-Type content="text/html; charset=gb2312">
	</HEAD>
	<BODY>
		    <form action=""  method="post" enctype="" name="" id="" onsubmit="" >                 
            <tr>
              <td width="20%" height="30" align="right"><span class="input2"><font color="#ff0000"></font></span>我的油箱&nbsp;&nbsp;&nbsp;</td>
              <td> 　                                                      
                    <input  type="text"  id=" " maxlength=30 size=17 name=" ">                                 
              	<span class=" ">
              	<td>如果要输入多个邮箱地址，请使用"|"分隔</td>
              	</span>
              </td>
            </tr>                       	
	  </form>
	
  </BODY>
</HTML>
-->

<html>
  <head >
    <title><bean:message key="str3118"/></title>
    <SCRIPT>
      <!--
        function bconfirm(){
           opener.document.all['inboxname'].value=document.form1.inboxname.value;
           opener.opensub();
           window.close();
        }
       
       function bcancel(){
           window.close();
        }
      -->
    </SCRIPT>
  </head>                                
                   
  <body bgcolor=#66CD00>
    <FONT size=5><bean:message key="str3119"/></FONT>
    <FORM method=post name=form1 action="">
      <INPUT type=text name=inboxname size=35><p>
      <INPUT type=button name=inputboxbt value=确定 onclick="bconfirm();">
      <INPUT type=button name=inputboxbs value=取消 onclick="bcancel();">
    </FORM>
   
  </body>
</html>
