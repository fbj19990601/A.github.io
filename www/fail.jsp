<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%@ page import="java.util.*"%>
<HTML>
    <HEAD>
        <title>XSaaS(http://soft.xsaas.com)Integrated Enterprise Information Service Platform orm</title>
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
		setTimeout("window.opener=null;window.close();",   2000);   
	}
	
</script>
</HEAD>
<%
		 ArrayList resultlist = (ArrayList) request.getAttribute("backQ");
		 String backInfo = "";
		 for (Iterator it = resultlist.iterator(); it.hasNext();)
	     {
	        HashMap infoMaps = (HashMap)it.next();
	        if (infoMaps.get("RESULT_INFO")!= null)
	        {
	            backInfo = backInfo + infoMaps.get("RESULT_INFO").toString()+"\n";
	        }
	     }
%>
<BODY style="TABLE-LAYOUT: fixed; WORD-BREAK: break-all" topMargin=5 
marginwidth="10" marginheight="10" onload="closeit()">
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
            <P><strong>Sorry, your action is wrong!<br>
              <br>
            </strong></P></TD>
          <TD align=left background="/images/rbox_6.gif" 
          rowSpan=2></TD></TR>
        <TR>
          <TD align=left colSpan=5 height=80>
            <P align=center>
            
            <UL>
             <P style="font-SIZE:13px;COLOR:red"><strong><%=backInfo%><br></strong></P>
                
             <LI id=list1>Your actions are wrong, please carefully read the wrong message,<a  href="javascript:history.go(-1)">return</a>Re-operation.<br>We can also contact the customer service��http://bbs.bolibaba.com Phone:0551��7132559��  </LI><br>
            
             </UL>
            <DIV align=right><BR>
            If you have any questions, please contact our customer service��http://bbs.bolibaba.com Phone:0551��7132559 </DIV></TD></TR>
        <TR>
          <TD align=left background="/images/rbox_7.gif" 
          height=20></TD>
          <TD align=left background="/images/rbox_8.gif" colSpan=5 
          height=20></TD>
          <TD align=left background="/images/rbox_9.gif" 
          height=20></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></BODY></HTML>
 