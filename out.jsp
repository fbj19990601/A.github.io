<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%
    Cookie[] cookies=request.getCookies();   
  		//cookies不为空，则清除   
      if(cookies!=null){   
          for(int i=0;i<cookies.length;i++){   
              String   tempuid_1=cookies[i].getName();   
              //查找用户名   
              if(tempuid_1.equals("SESSION_USER_ID")){   
                  cookies[i].setMaxAge(0);   
                  response.addCookie(cookies[i]);   
              }     
           }   
      }   
  
%>
<HTML>
    <HEAD>
        <title><bean:message key="str4500"/></title>
        <META http-equiv=Content-Type content="text/html; charset=gb2312">
        <STYLE type=text/css>BODY {
        	FONT-SIZE: 12px; FONT-FAMILY: Tahoma
        }
        TD {
        	FONT-SIZE: 12px; FONT-FAMILY: Tahoma
        }
        A:link {
        	COLOR: #636363; TEXT-DECORATION: none
        }
        A:visited {
        	COLOR: #838383; TEXT-DECORATION: none
        }
        A:hover {
        	COLOR: #a3a3a3; TEXT-DECORATION: underline
        }
        BODY {
        	BACKGROUND-COLOR: #cccccc
        }
        </STYLE>

    <META content="MSHTML 6.00.2900.2523" name=GENERATOR>
    <script language="javascript">
	function closeit() 
	{ 
		window.close();
	}
	
</script>
</HEAD>   
 

<BODY style="TABLE-LAYOUT: fixed; WORD-BREAK: break-all" topMargin=5 
marginwidth="10" marginheight="10">
<TABLE height="40%" cellSpacing=0 cellPadding=0 width="100%" align=center 
border=0>
  <TBODY>
  <TR vAlign=center align=middle>
    <TD>
      <TABLE cellSpacing=0 cellPadding=0 width=468 bgColor=#ffffff border=0>
        <TBODY>
        <TR>
          <TD width=20 background="/images/rbox_1.gif" 
height=20></TD>
          <TD width=108 background="/images/rbox_2.gif" 
          height=20></TD>
          <TD width=56><IMG height=20 src="/images/rbox_ring.gif" 
            width=56></TD>
          <TD width=100 background="/images/rbox_2.gif"></TD>
          <TD width=56><IMG height=20 src="/images/rbox_ring.gif" 
            width=56></TD>
          <TD width=108 background="/images/rbox_2.gif"></TD>
          <TD width=20 background="/images/rbox_3.gif" 
        height=20></TD></TR>
        <TR>
          <TD align=left background="/images/rbox_4.gif" 
          rowSpan=2></TD>
          <TD align=middle bgColor=#eeeeee colSpan=5 height=50>
            <P style="font-SIZE:13px;COLOR:red"><strong><bean:message key="str3120"/>
              <br>
            </strong></P></TD>
          <TD align=left background="/images/rbox_6.gif" 
          rowSpan=2></TD></TR>
        <TR>
          <TD align=left colSpan=5 height=80>
            <P align=center>
            
            <UL>
             <P style="font-SIZE:13px;COLOR:red"><strong> <br></strong></P>
             <LI id=list1> <a href="/index.jsp" style="font-SIZE:13px"><bean:message key="str3121"/></a> </LI><br>
             <LI id=list1> <a href="#" onclick="closeit()" style="font-SIZE:13px">	<bean:message key="str3122"/></a> </LI><br>
          
            
             </UL>
            <DIV align=right><BR>
            <bean:message key="str3123"/></DIV></TD></TR>
        <TR>
          <TD align=left background="/images/rbox_7.gif" 
          height=20></TD>
          <TD align=left background="/images/rbox_8.gif" colSpan=5 
          height=20></TD>
          <TD align=left background="/images/rbox_9.gif" 
          height=20></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></BODY></HTML>
 