<%@ page contentType="text/html;charset=GBK" %><%@ include file="../fuction/include.jsp"%>
<%@ page import="com.ahbay.UserMgr.*" %>
<%@ page import="com.ahbay.commenMgr.*" %>
<%@ page import="javax.servlet.http.*" %>


<html> 
	<head>
		<meta name = "Generator" content = "Easy Struts Xslt generator for Eclipse (http://easystruts.sf.net).">

		<title>Struts Form for paradateForm</title>
		<link href="../../../style/css.css" rel="stylesheet" type="text/css"> 
	</head>
<script language="javascript">
function confirmremove()
{
	if(confirm('�Ƿ�ȷ��ע��������¼��')) 
	{
		return true;
	}
	else
	{
		return false;
	}
}

</script>
<%
commMethodMgr comm=  new commMethodMgr();
%>
<body>  
<h5>Ա������</h5>  
<table width="100%" border="0" cellpadding="10" cellspacing="1" align="center" bordercolor="#D1D1D1" >

  <tr>    
    <td class="grayE" align="right" colspan="6">
    <html:link href="sysAddStaff.jsp">����Ա��</html:link></td>
  </tr>
  <tr>    
    <td class="grayD" align="center" width="8%">���</td>
    <td class="grayD" align="center" width="20%">����</td>
    <td class="grayD" align="center" width="30%">����</td>
    <td class="grayD" align="center" width="30%">����</td>
    <td class="grayD" align="center" width="8%">����</td>
  </tr>
<%
 
    StaffMgr userList = new StaffMgr();
    String lawyerId =  session.getAttribute("STAFF_ID").toString();
    userList.setStaff_id(lawyerId);
    ArrayList userArray = userList.GetUserList("SEL_BY_EXP_THIS");
	StaffMgr[] userinfo = userList.GetList(userArray);
	String strRows =  String.valueOf(userinfo.length);
 	int intBegin=0;                          
    int realcount=userinfo.length;
    String Begin="0";
	if (request.getParameter("Begin")==null)
    {
        intBegin=0;        						
    }
    else 
    {
    	intBegin = new Integer(request.getParameter("Begin")).intValue();
    }
    if (intBegin>=realcount) 
    {
    	intBegin=realcount;                      			 
    }
    if (intBegin<=0) 
    {
    	intBegin=0;                      			 
    }
    String upBegin = String.valueOf(new Integer(intBegin).intValue()-15);
    String downBegin= "0";
    String endBegin = String.valueOf(realcount-15);
	int j = 0;
	for (int i=intBegin;i<userinfo.length;i++)
    {
    	
    	String staffId = userinfo[i].getStaff_id();
    	String staffName = userinfo[i].getStaff_name();
    	String departName = comm.ConvertCodeToName("itemowndepart",userinfo[i].getDepart_id());
 
    	
    	HashMap staffmap=new HashMap();
  		staffmap.put("staffId",staffId);					
  		pageContext.setAttribute("staffmap",staffmap);
%>
	<tr>
	<td class="grayBL" align="left"><%=String.valueOf(i+1)%></td>
    <td class="grayBL" align="left">
    <html:link href="sysDisplayStaff.jsp" name="staffmap" target="blank">
    <%=staffId%>
    </html:link></td>
	<td class="grayBL" align="left"><%=staffName%></td>
	<td class="grayBL" align="left"><%=departName%></td>
	<td class="grayBL" align="left">    
	<html:link action="/delstaff" name="staffmap" target="right" onclick="return confirmremove()">
    ɾ��
    </html:link></td>
    </tr>

<%
    	
    	downBegin=String.valueOf(i+1);
    	j++;
    	if (j>=15) break;    
    }

%>
	<tr> 
	    <td colspan=7> 
		    <table width="100%" border="0" cellspacing="1" cellpadding="0">
		    <tr> 
			    <td height="20">��<font color="#990000"><%=strRows%></font> ����Ϣ [ ÿҳ�����ʾ15����Ϣ ] </td>
			    <td width="220"> 
			    <div align="right">
			    <%			                          	
			    	HashMap indexmap=new HashMap();  					
			  		indexmap.put("Begin","0");  							 
			  		pageContext.setAttribute("indexmap",indexmap);
			  	%>
			  		  								
				<html:link href="sysStaffList.jsp" name="indexmap">��ҳ</html:link>
			    <%
			    	HashMap upmap=new HashMap();  					
			  		upmap.put("Begin",upBegin); 							 
			  		pageContext.setAttribute("upmap",upmap);
			  	%>
			  		  								
				<html:link href="sysStaffList.jsp" name="upmap">��һҳ</html:link>
			    <%
				    HashMap downmap=new HashMap();  				
				  	downmap.put("Begin",downBegin);
				  	pageContext.setAttribute("downmap",downmap);
			  	%>
			  		  									
				<html:link href="sysStaffList.jsp" name="downmap">��һҳ</html:link>
			    <%
				    HashMap endmap=new HashMap();   						
				  	endmap.put("Begin",endBegin);	
				  	pageContext.setAttribute("endmap",endmap);
			  	%>
			  		  					
				<html:link href="sysStaffList.jsp" name="endmap">ĩҳ</html:link>
			    </div>
			    </td>
		    </tr>
		    </table>
	    </td>
    </tr>
</table>
	<body>
</html>
