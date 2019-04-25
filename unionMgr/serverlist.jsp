<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="java.util.*"%>
<%@ page import="com.saas.biz.custMgr.*"%>
<%@ page import="com.saas.biz.serverMgr.*"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>

<script language="JavaScript" src="/www/fuction/public.js"></script>
<%

String cust_id = "";
Custinfo cust = new Custinfo();
ServerInfo serverinfo = new ServerInfo();
String cust_name = "";
ArrayList custlist = new ArrayList();
ArrayList serverlist = new ArrayList();

if (request.getParameter("cust_id") != null)
{
    cust_id = request.getParameter("cust_id");
    custlist = cust.getCustInfo(cust_id);
    serverlist = serverinfo.getServersByCustId(cust_id,"0");
}  
 
if (custlist != null && custlist.size() > 0)
{
    HashMap map = (HashMap) (custlist.get(0));
    if (map.get("cust_name") != null)
    {
    	cust_name = map.get("cust_name").toString();
    }
}

%>
<html>
<head>
     
<STYLE type=text/css>BODY {
	BACKGROUND: #fff; MARGIN: 80px auto; FONT: 14px/150% Verdana, Georgia, Sans-Serif; COLOR: #000; TEXT-ALIGN: center
}
A:link {
	COLOR: #2c4c78; TEXT-DECORATION: underline
}
A:visited {
	COLOR: #2c4c78; TEXT-DECORATION: underline 
}
A:hover {
	COLOR: #2c4c78; TEXT-DECORATION: underline 
}
A:active {
	COLOR: #2c4c78; TEXT-DECORATION: underline 
}
H1 {
	PADDING-RIGHT: 4px; PADDING-LEFT: 4px; FONT-SIZE: 14px; BACKGROUND: #eee; PADDING-BOTTOM: 4px; MARGIN: 0px; PADDING-TOP: 4px; BORDER-BOTTOM: #84b0c7 1px solid
}
.info {
	BORDER-RIGHT: #84b0c7 1px solid;float:center; text-ALIGN:center;BORDER-TOP: #84b0c7 1px solid; BACKGROUND: #e5eef5; MARGIN: 0px auto; BORDER-LEFT: #84b0c7 1px solid; BORDER-BOTTOM: #84b0c7 1px solid;
	width:100%;
}
 
P {
	PADDING-RIGHT: 15px; PADDING-LEFT: 15px; PADDING-BOTTOM: 15px; MARGIN: 0px; PADDING-TOP: 15px
}
</STYLE>
 

</head>    
<body>
    <table width="100%" border=0>
        
        <tr>
            <td>
            <DIV class="info">           
                <% 
                    if (serverlist != null && serverlist.size() > 0)
                    {
                %>     
                <H1><bean:message key="str4094"/><font STYLE="color:red;"><%=cust_name%></font><bean:message key="str4125"/></H1>
                <table width="100%" border="0" cellspacing="0" cellpadding="0" style="background-color:#CCCCCC;"><tr><td>
                <table width="100%" border="0" cellspacing="1" cellpadding="0">
                        <tr>
                        <td bgcolor="#5880E9" style="font-size:13px;text-ALIGN:center;color:#ffffff">
                           <bean:message key="str4126"/>
                        </td>
                        <td bgcolor="#5880E9" style="font-size:13px;text-ALIGN:center;color:#ffffff">
                           <bean:message key="str4127"/>
                        </td>
                        <td bgcolor="#5880E9" style="font-size:13px;text-ALIGN:center;color:#ffffff">
                           <bean:message key="str122"/>
                        </td>
                        <td bgcolor="#5880E9" style="font-size:13px;text-ALIGN:center;color:#ffffff">
                          <bean:message key="str123"/>
                        </td>
                        <td bgcolor="#5880E9" style="font-size:13px;text-ALIGN:center;color:#ffffff">
                          <bean:message key="str4128"/>
                        </td>
                        <td bgcolor="#5880E9" style="font-size:13px;text-ALIGN:center;color:#ffffff">
                          <bean:message key="str4129"/>
                        </td>
                      </tr>     
                <%                  
		            String servers_name = "";
		            String state_name = "";
		            String start_date = "";
		            String end_date = "";
		            String buy_date = "";
		            String buy_money = "";
		            for (Iterator it = serverlist.iterator(); it.hasNext();)
		            {
				        HashMap maps = (HashMap) it.next();
				        
				        if(maps.get("server_id")!=null) servers_name=maps.get("server_id").toString();
				        if(maps.get("state_code")!=null) state_name=maps.get("state_code").toString();
				        if(maps.get("start_date")!=null) start_date=maps.get("start_date").toString();
				        if(maps.get("end_date")!=null) end_date=maps.get("end_date").toString();
				        if(maps.get("oper_date")!=null) buy_date=maps.get("oper_date").toString();
				        if(maps.get("remark")!=null) buy_money=maps.get("remark").toString();
				        	
                %>
				      <tr>
                        <td bgcolor="#ffffff" style="font-size:13px;text-ALIGN:left;">
                           <%=servers_name%>
                        </td>
                        <td bgcolor="#ffffff" style="font-size:13px;text-ALIGN:left;">
                           <%=state_name%>
                        </td>
                        <td bgcolor="#ffffff" style="font-size:13px;text-ALIGN:left;">
                           <%=start_date%>
                        </td>
                        <td bgcolor="#ffffff" style="font-size:13px;text-ALIGN:left;">
                           <%=end_date%>
                        </td>
                        <td bgcolor="#ffffff" style="font-size:13px;text-ALIGN:left;">
                           <%=buy_date%>
                        </td>
                        <td bgcolor="#ffffff" style="font-size:13px;text-ALIGN:left;">
                           <%=buy_money%>
                        </td>
                      </tr>       
                <%
				     }
                %>
            </table></td></tr></table>
            
                
                <%
                    }
                    else
                    {
                %>
                   <H1><font STYLE="color:red;"><bean:message key="str4130"/></font></H1>
                    
                <%
                    }                    
                %>
                
            </DIV>
            </td>
        </tr>  
</table> 
      
 
</body>
</html>