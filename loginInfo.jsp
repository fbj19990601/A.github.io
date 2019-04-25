<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%@ page import="java.util.*"%>
<%@ page import="com.saas.biz.custMgr.*"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<HTML>
    <HEAD>
        <title><bean:message key="str2882"/></title>
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
		document.regform.submit();
	}
	
</script>
</HEAD>
<%
		 ArrayList resultlist = (ArrayList) request.getAttribute("backQ");
		 String backInfo = "";
		 String errocodes = "";
		 String user_name = "";
		 String cust_name = "";
		 String email = "";
		 String contact_phone = "";
		 ArrayList custlist = new  ArrayList();
		 for (Iterator it = resultlist.iterator(); it.hasNext();)
	     {
	        HashMap infoMaps = (HashMap)it.next();
	        if (infoMaps.get("RESULT_INFO")!= null)
	        {
	            backInfo = backInfo + infoMaps.get("RESULT_INFO").toString()+"\n";
	        }
	        if (infoMaps.get("RESULT_LOGIN_CODE")!= null)
	        {
	            errocodes = infoMaps.get("RESULT_LOGIN_CODE").toString();
	        }
	     }
	     if (errocodes.equals("10"))
         {
               Tcustinfo tcust = new Tcustinfo();
               custlist = tcust.gettCustInfo(backInfo.trim());
               if (custlist != null && custlist.size() != 0)
        	   {
        	   	Iterator it = custlist.iterator(); it.hasNext();
        	       HashMap custListMap = (HashMap) it.next();
        	       user_name= custListMap.get("user_name").toString();
        	       cust_name= custListMap.get("cust_name").toString();
        	       email= custListMap.get("email").toString();
        	       contact_phone= custListMap.get("contact_phone").toString();
        	   }      
         }
%>
 
<BODY style="TABLE-LAYOUT: fixed; WORD-BREAK: break-all" topMargin=5 
marginwidth="10" marginheight="10">
<form name="regform" action="/Newcregister.jsp" method="post">
    <input type=hidden name="cust_name"  value="<%=cust_name%>">
    <input type=hidden name="email"  value="<%=email%>">
    <input type=hidden name="contact_phone"  value="<%=contact_phone%>">
    <input type=hidden name="user_name"  value="<%=user_name%>">
</form>
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
          <TD align=middle bgColor=#eeeeee colSpan=5 height=50><P><strong><br>
            <%
                if (errocodes.equals("10"))
                {
             %>
               <P style="font-SIZE:13px;COLOR:red"> <bean:message key="str5007"/>[<%=cust_name%>] <br> <bean:message key="str3101"/></P>
             <%   
                }
                else
                {                 
            %>
                <bean:message key="str3102"/> 
            <%
                }
            %>
                 
              
            </strong></P></TD>
          <TD align=left background="/images/rbox_6.gif" 
          rowSpan=2></TD></TR>
        <TR>
          <TD align=left colSpan=5 height=80>
            <P align=center>
            
            <UL><br>
                <%
                if (errocodes.equals("10"))
                {
             %>
                <P style="font-SIZE:13px;COLOR:gray"><strong>
                    <bean:message key="str3103"/><br></strong></P>
                <P style="font-SIZE:13px;COLOR:red"><strong>
                    ->2、<a href="#" onclick="closeit();" style="font-SIZE:13px;COLOR:red"><bean:message key="str3104"/></a><br></strong></P>
                <P style="font-SIZE:13px;COLOR:gray"><strong>
                    <bean:message key="str3105"/><br></strong></P>
             <%   
                }
                else
                {                 
            %>
             <P style="font-SIZE:13px;COLOR:red"><strong><%=backInfo%><br></strong></P>
             
             <LI id=list1><bean:message key="str3106"/><a  href="javascript:history.go(-1)">返回</a><bean:message key="str3108"/><br><bean:message key="str3109"/>  </LI><br>
            <%
                 }
            %>
             </UL>
            <DIV align=right><BR>
             <bean:message key="str3110"/></DIV></TD></TR>
        <TR>
          <TD align=left background="/images/rbox_7.gif" 
          height=20></TD>
          <TD align=left background="/images/rbox_8.gif" colSpan=5 
          height=20></TD>
          <TD align=left background="/images/rbox_9.gif" 
          height=20></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></BODY></HTML>
 