<%@ page contentType="text/html;charset=GBK" %><%@ include file="../fuction/include.jsp"%>
<%@ page import="com.ahbay.commenMgr.*" %>
<html> 
	<head>
		<meta name = "Generator" content = "Easy Struts Xslt generator for Eclipse (http://easystruts.sf.net).">
		<title>Struts Form for paradateForm</title>
		<link href="../../../style/css.css" rel="stylesheet" type="text/css"> 
	</head>
<%
    CommParaMgr commPara = new CommParaMgr();
    commMethodMgr comm=  new commMethodMgr();
    String menuclass = request.getParameter("class");
    String upMenuId = "";
    if (!menuclass.equalsIgnoreCase("1"))
	{ 
		upMenuId = request.getParameter("menuId");
	}
%>
<body> 
   
<html:form action="/addmenu">   
<table width="100%" border="0" cellpadding="10" cellspacing="1" align="center" bordercolor="#D1D1D1" >
<tr>    
    <td class="grayD" align="left" colspan="6">
    &nbsp;&nbsp;&nbsp;�����˵�
    </td>
  </tr>
  <tr>    
    <td class="grayBL" align="left" width="18%">��ϵͳ���룺</td>
    <td class="grayBL" align="left" width="22%"> 
	    <html:text property="subsys_code" maxlength="8" size="8"/>
	    <html:errors property="subsys_code"/>
    </td>
    <td class="grayBL" align="left" width="10%">�˵����ƣ�</td>
    <td class="grayBL" align="left" >
	    <input type="text" name="menu_name" value="" size="30"/>
    </td>
  </tr>
  <tr>    
    <td class="grayBL" align="left" width="10%">�ϼ��˵���</td>
    <td class="grayBL" align="left" > 
		<%
			String upMenuName = "";
			if (menuclass.equalsIgnoreCase("1"))
			{ 
				upMenuName = "���ϼ��˵�";
				upMenuId = "NULL";
			}
			else
			{
				upMenuName=comm.ConvertCodeToName("menuname",upMenuId);;
			}
		%>
		<%=upMenuName%>
		<input type=hidden name=up_menu_id value=<%=upMenuId%>> 
    </td>
    <td class="grayBL" align="left" width="10%">�˵�����</td>
    <td class="grayBL" align="left" >
		<%=menuclass%>��
		<input type=hidden name=menu_class value=<%=menuclass%>> 
    </td>
  </tr>
  <tr>    
    <td class="grayBL" align="left" width="10%">�˵����ͣ�</td>
    <td class="grayBL" align="left" > 
	    <html:select property="menu_type" size="1">
	        <html:option value="0" >0��----��ͨ�˵�---</html:option>
	    </html:select>
	    <html:errors property="menu_type"/>
    </td>
    <td class="grayBL" align="left" width="20%">��Ӧ�ӿ�ģ�飺</td>
    <td class="grayBL" align="left" >
	    <html:select property="module_id" size="1">
	        <%=commPara.GenModuleOption()%> 
	    </html:select>
    </td>
  </tr>
    <tr>    
    <td class="grayBL" align="left" width="10%">�ӿڲ���1��</td>
    <td class="grayBL" align="left" > 
	    <html:text property="in_param_code1" maxlength="30" size="30"/>
	    <html:errors property="in_param_code1"/>
    </td>
    <td class="grayBL" align="left" width="20%">�ӿڲ���ֵ1��</td>
    <td class="grayBL" align="left" >
	    <html:text property="in_param_value1" maxlength="30" size="30"/>
	    <html:errors property="in_param_value1"/>
    </td>
  </tr>
      <tr>    
    <td class="grayBL" align="left" width="10%">�ӿڲ���2��</td>
    <td class="grayBL" align="left" > 
	    <html:text property="in_param_code2" maxlength="30" size="30"/>
	    <html:errors property="in_param_code2"/>
    </td>
    <td class="grayBL" align="left" width="20%">�ӿڲ���ֵ2��</td>
    <td class="grayBL" align="left" >
	    <html:text property="in_param_value2" maxlength="30" size="30"/>
	    <html:errors property="in_param_value2"/>
    </td>
  </tr>
       <tr>    
    <td class="grayBL" align="left" width="10%">�ӿڲ���3��</td>
    <td class="grayBL" align="left" > 
	    <html:text property="in_param_code1" maxlength="30" size="30"/>
	    <html:errors property="in_param_code1"/>
    </td>
    <td class="grayBL" align="left" width="20%">�ӿڲ���ֵ3��</td>
    <td class="grayBL" align="left" >
	    <html:text property="in_param_value3" maxlength="30" size="30"/>
	    <html:errors property="in_param_value3"/>
    </td>
  </tr>
	
    <tr>
    <td class="grayD" align="right" colspan=4>
    	<input type="submit" name="Submit1" value="ȷ������">
    </td>
    </tr>
</table>
 </html:form>
<body>
</html>
