<%@ page contentType="text/html;charset=8859_1" %>
<%@ page import="java.util.*"%>
<jsp:useBean id="comm" scope="page" class="com.saas.biz.commen.commMethodMgr"></jsp:useBean>
<%
ArrayList bq = (ArrayList)request.getAttribute("backQ");
String   v_amount ="";
String 	 v_oid ="";
String 	 v_orderemail ="";
String   v_rcvemail="";
String   strnamegrp="";
String   stridgrp="";
for(Iterator it = bq.iterator();it.hasNext();)
{
	HashMap infoMap  = (HashMap)it.next();
    if(infoMap.get("V_AMOUNT")!=null)
     {
	   v_amount = infoMap.get("V_AMOUNT").toString();
	 }
	if(infoMap.get("V_RCVEMAIL")!=null)
    {
	 v_rcvemail = infoMap.get("V_RCVEMAIL").toString();
	}
	if(infoMap.get("GRP_NAME")!=null)
    {
	 strnamegrp = infoMap.get("GRP_NAME").toString();
	}
	if(infoMap.get("V_ORDEREMAIL")!=null)
    {
	 v_orderemail = infoMap.get("V_ORDEREMAIL").toString();
	}
	if(infoMap.get("V_OID")!=null)
    {
	 v_oid = infoMap.get("V_OID").toString();
	}
}	 
 %>
<html>
    <head>
<script language="javascript">
function autoSubmit(){   
        var form = document.forms[0];   
        form.method = 'post';    
        form.submit();   
    } 
</script>
</head>
    
<body onload="autoSubmit()">
<FORM name="formbill" action="/chinabank/Send.jsp" method=post>
	<input name ="v_amount" type="hidden" value="<%=v_amount%>"/>
	<input name ="v_oid" type="hidden" value="<%=v_oid%>"/>
	<input name ="v_orderemail" type="hidden" value="<%=v_orderemail%>"/>
	<input name ="v_rcvemail" type="hidden" value="<%=v_rcvemail%>"/>
	<input name ="strnamegrp" type="hidden" value="<%=strnamegrp%>"/>
	<input name ="stridgrp" type="hidden" value="<%=stridgrp%>"/>
 </form>
</body>
</html>