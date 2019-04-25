<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="java.util.*"%>
<%@ page import="com.saas.biz.custMgr.*"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<script language="JavaScript" src="/www/fuction/public.js"></script>
<%
String toreg = "/Newcregister.jsp";
String code = "";
Custinfo cust = new Custinfo();
String cust_name = "";
ArrayList custlist = new ArrayList();
ArrayList fromcustlist = new ArrayList();
if (request.getParameter("code") != null)
{
    code = request.getParameter("code");
    custlist = cust.getCustListByDev(code);
    fromcustlist = cust.getCustListByCode(code);
}  
 
if (fromcustlist != null && fromcustlist.size() > 0)
{
    HashMap map = (HashMap) (fromcustlist.get(0));
    if (map.get("cust_name") != null)
    {
    	cust_name = map.get("cust_name").toString();
    }
}
String menu_idx = "";
    if (request.getParameter("menu_id") != null)
    {
        menu_idx = request.getParameter("menu_id");
    }
toreg = toreg+"?code="+code;
%>
<html>
<head>
    <script language="javascript">
    function redirectit()
    {    
        setTimeout("redirectit1();",  2000);
    }
    function redirectit1()
    { 
        alert("业务受理成功！");         
                
        window.location.href("<%=toreg%>"); 
    }
    </script>
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
.kscxan{
     background: url(../images/kscx.gif) left center no-repeat;
	 width:100px;
	 height:26px;
	 border:0px;
	 }
H1 {
	PADDING-RIGHT: 4px; PADDING-LEFT: 4px; FONT-SIZE: 14px; BACKGROUND: #eee; PADDING-BOTTOM: 4px; MARGIN: 0px; PADDING-TOP: 4px; BORDER-BOTTOM: #84b0c7 1px solid
}
.info {
	BORDER-RIGHT: #84b0c7 1px solid;float:center; text-ALIGN:center;BORDER-TOP: #84b0c7 1px solid; BACKGROUND: #e5eef5; MARGIN: 0px auto; BORDER-LEFT: #84b0c7 1px solid; WIDTH:100%; BORDER-BOTTOM: #84b0c7 1px solid
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
                    if (fromcustlist == null || fromcustlist.size() <= 0)
                    {
                %>
                <H1><font STYLE="color:red;"><bean:message key="str3075"/></font></H1>
                
                <%                       
                    }
                    else
                    {
                    if (custlist != null && custlist.size() > 0)
                    {
                %>     
                <H1><bean:message key="str4094"/><font STYLE="color:red;"><%=cust_name%></font><bean:message key="str4095"/></H1>
                <table width="100%" border="0" cellspacing="0" cellpadding="0" style="background-color:#CCCCCC;"><tr><td>
                <table width="100%" border="0" cellspacing="1" cellpadding="0">
                        <tr>
                        <td bgcolor="#5880E9" style="font-size:13px;text-ALIGN:center;color:#ffffff">
                           <bean:message key="str4096"/>
                        </td>
                        <td bgcolor="#5880E9" style="font-size:13px;text-ALIGN:center;color:#ffffff">
                           <bean:message key="str4097"/>
                        </td>
                        <td bgcolor="#5880E9" style="font-size:13px;text-ALIGN:center;color:#ffffff">
                           <bean:message key="str118"/>
                        </td>
                        <td bgcolor="#5880E9" style="font-size:13px;text-ALIGN:center;color:#ffffff">
                          <bean:message key="str4098"/>
                        </td>
                      </tr>     
                <%                  
		            String cust_names = "";
		            String cust_ids = "";
		            String publish_date = "";
		            String group_contact_phone = "";
		            String email = "";
		            for (Iterator it = custlist.iterator(); it.hasNext();)
		            {
				        HashMap map = (HashMap) it.next();
				        if(map.get("cust_id")!=null) cust_ids=map.get("cust_id").toString();
				        if(map.get("cust_name")!=null) cust_names=map.get("cust_name").toString();
				        if(map.get("publish_date")!=null) publish_date=map.get("publish_date").toString();
				        if(map.get("group_contact_phone")!=null) group_contact_phone=map.get("group_contact_phone").toString();
				        if(map.get("email")!=null) email=map.get("email").toString();
				        	
                %>
				      <tr>
                        <td bgcolor="#ffffff" style="font-size:13px;text-ALIGN:left;">
                           ·<a href="querySvc.jsp?cust_id=<%=cust_ids%>&menu_id=<%=menu_idx%>"><%=cust_names%></a>
                        </td>
                        <td bgcolor="#ffffff" style="font-size:13px;text-ALIGN:left;">
                           <%=email%>
                        </td>
                        <td bgcolor="#ffffff" style="font-size:13px;text-ALIGN:left;">
                           <%=group_contact_phone%>
                        </td>
                        <td bgcolor="#ffffff" style="font-size:13px;text-ALIGN:left;">
                           <%=publish_date%>
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
                   <H1><font STYLE="color:red;"><bean:message key="str4099"/></font></H1>
                   <H1><font STYLE="color:green;"><bean:message key="str4100"/></font></H1><br>
                <input type="text" name=link value="<a href=http://soft.xsaas.com/interface.jsp?code=<%=code%>><img src=http://www.xsaas.com/images/logo.gif border=0></a>" size="50">
                <%
                    }
                    }
                %>
                <H1><font STYLE="color:green;"><bean:message key="str4101"/></font></H1>
               
                <form name="regto" action="" method="post">    
                    <b><font STYLE="color:green;"><bean:message key="str4102"/><input type="input" name="code" value="<%=code%>">                 
                    &nbsp;<input class="kscxan" type="submit" value=""></font></b>
                </form>
                 
            </DIV>
            </td>
        </tr>  
</table> 
      
</body>
</html>