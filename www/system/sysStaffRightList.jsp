<%@ page contentType="text/html;charset=GBK" %><%@ include file="/manage_it/fuction/include.jsp"%>
<%@ page import="com.ahbay.RightMgr.*" %>
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
String staffId = request.getParameter("staffId");

%>
<body>  
<h5>Ա��Ȩ�޹���[<%=comm.ConvertCodeToName("staffname",staffId)%>]</h5>  
<table width="100%" border="0" cellpadding="10" cellspacing="1" align="center" bordercolor="#D1D1D1" >

  <tr>    
    <td class="grayE" align="right" colspan="6">
    <%
    	
    %>
    <a href="sysAddRight.jsp?staffId=<%=staffId%>">����Ȩ��</a>

    
    </td>
  </tr>
  <tr>    
    <td class="grayD" align="center" width="8%">���</td>
    <td class="grayD" align="center" width="30%">�˵���</td>
    <td class="grayD" align="center" width="25%">��ʼʱ��</td>
    <td class="grayD" align="center" width="25%">����ʱ��</td>
    <td class="grayD" align="center" width="15%">����</td>
  </tr>
<%
 
    RightinfoMgr RightList = new RightinfoMgr();
 	RightList.setStaff_id(staffId);

    ArrayList rightArray = RightList.GetRightList("SEL_BY_STAFF_SYS");
	RightinfoMgr[] rightinfo = RightList.GetList(rightArray);
	String strRows =  String.valueOf(rightinfo.length);
 	int intBegin=0;                          
    int realcount=rightinfo.length;
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
	for (int i=intBegin;i<rightinfo.length;i++)
    {
    	
    	String menuId = rightinfo[i].getMenu_id();
    	String rightstaffId = rightinfo[i].getStaff_id();
    	String startDate = rightinfo[i].getStart_date().substring(0,10);
        String endDate = rightinfo[i].getEnd_date().substring(0,10);
 
    	
    	HashMap menumap=new HashMap();
  		menumap.put("menuId",menuId);	
  		menumap.put("staffId",rightstaffId);			
  		pageContext.setAttribute("menumap",menumap);
%>
	<tr>
	<td class="grayBL" align="left"><%=String.valueOf(i+1)%></td>
    <td class="grayBL" align="left">
    <%=comm.ConvertCodeToName("menuname",menuId)%></td>
	<td class="grayBL" align="left"><%=startDate%></td>
	<td class="grayBL" align="left"><%=endDate%></td>
	<td class="grayBL" align="left">    
	<html:link action="/delright" name="menumap" onclick="return confirmremove()">
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
			  		indexmap.put("staffId",staffId);							 
			  		pageContext.setAttribute("indexmap",indexmap);
			  	%>
			  		  								
				<html:link href="sysStaffRightList.jsp" name="indexmap">��ҳ</html:link>
			    <%
			    	HashMap upmap=new HashMap();  					
			  		upmap.put("Begin",upBegin); 
			  		upmap.put("staffId",staffId);
			  		pageContext.setAttribute("upmap",upmap);
			  	%>
			  		  								
				<html:link href="sysStaffRightList.jsp" name="upmap">��һҳ</html:link>
			    <%
				    HashMap downmap=new HashMap();  				
				  	downmap.put("Begin",downBegin);
				  	downmap.put("staffId",staffId);
				  	pageContext.setAttribute("downmap",downmap);
			  	%>
			  		  									
				<html:link href="sysStaffRightList.jsp" name="downmap">��һҳ</html:link>
			    <%
				    HashMap endmap=new HashMap();   						
				  	endmap.put("Begin",endBegin);	
				  	endmap.put("staffId",staffId);
				  	pageContext.setAttribute("endmap",endmap);
			  	%>
			  		  					
				<html:link href="sysStaffRightList.jsp" name="endmap">ĩҳ</html:link>
			    </div>
			    </td>
		    </tr>
		    </table>
	    </td>
    </tr>
</table>
	<body>
</html>
