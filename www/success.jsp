<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="java.util.*"%>
<%
String from = request.getHeader("referer");
ArrayList list=(ArrayList)request.getAttribute("backQ");
String trade_type_code="";
String trade_id="";
String menu="menu_id=2J0Vn2mMK0G0X0G85BH&info_type=2";
if(list !=null && list.size()>0){
	for(Iterator it = list.iterator();it.hasNext();)
	{
		HashMap infoMap  = (HashMap)it.next();
	    if(infoMap.get("TRADE_TYPE_CODE")!=null)
	     {
		   trade_type_code = infoMap.get("TRADE_TYPE_CODE").toString();
		 }
		 if(infoMap.get("FORM_ID")!=null)
	     {
		   trade_id = infoMap.get("FORM_ID").toString();
		 }
	}
}
if(trade_type_code=="1076" ||trade_type_code.equals("1076")){
String url="/templateMgr/formListIndex.jsp?trade=0&form_id="+trade_id+"&"+menu;
 from=url;
}
%>
<html>
<head>
    <script language="javascript">
    function redirectit()
    { 
       window.opener.location.href = window.opener.location.href;
      if (window.opener.progressWindow) 
       window.opener.progressWindow.close();
       setTimeout("window.opener=null;window.close();",  2000);
     }
    function redirectit1()
    { 
        alert("Business success!");         

        window.location.href("<%=from%>"); 
    }
    </script>

</head>    
<body onload="redirectit1()">   
    
</body>
</html>