<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="java.util.*" %> 
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%@ page import="javax.servlet.http.*" %> 
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page import="com.ahbay.commenMgr.*" %>
<html> 
	<head>
		<meta name = "Generator" content = "Easy Struts Xslt generator for Eclipse (http://easystruts.sf.net).">
		<title>Struts Form for paradateForm</title>
		<link href="../../../style/css.css" rel="stylesheet" type="text/css"> 
	</head>
<%
    commMethodMgr commclass=  new commMethodMgr();
    String commodityclass = request.getParameter("class");
    String upClassId = "";
    int class_level=1 ;
    if (!commodityclass.equalsIgnoreCase("1"))
	{ 
		upClassId = request.getParameter("classId");
		
	}
%>
<body> 
    <h5>��������</h5>
<html:form action="doTradeReg.do">   
<table width="100%" border="0" cellpadding="10" cellspacing="1" align="center" bordercolor="#D1D1D1" >
  <tr>    
    <td class="graymn" align="left" width="10%">�ϼ����ࣺ</td>
    <td class="graymn" align="left" > 
		<%
			String upClassName = "";
			if (commodityclass.equalsIgnoreCase("1"))
			{ 
				upClassName = "���ϼ�����";
				upClassId = "NULL";
				class_level=1;
			}
			else
			{	
				 class_level = new Integer(commodityclass).intValue();
				upClassName=commclass.ConvertCodeToName("classname",upClassId);
			}
		%>
		<%=upClassName%>
		<input type=hidden name=class_id value=<%=upClassId%>> 
    </td>
  </tr>
  <tr>    
    <td class="graymn" align="left" width="20%">�������ͣ�</td>
    <td class="graymn" align="left"> 
	     <select name="rsrv_str3">
	   <option value="0">�ı�</option>
	   <option value="1">ѡ��������</option>
	   </select>
    </td>
  </tr>
  <tr>    
    <td class="graymn" align="left" width="20%">�������ƣ�</td>
    <td class="graymn" align="left"> 
	    <input name="attr_name" maxlength="60" size="60"/>
    </td>
  </tr>
   <tr>    
    <td class="graymn" align="left" width="20%">����˳��</td>
    <td class="graymn" align="left"> 
	    <input name="attr_no" maxlength="60" size="60"/>
    </td>
  </tr>
  <tr>    
    <td class="graymn" align="left" width="20%">����������</td>
    <td class="graymn" align="left"> 
	    <input name="attr_desc" maxlength="60" size="60"/>
    </td>
  </tr>
 <tr>    
    <td class="graymn" align="left" width="20%">����Ĭ��ֵ��</td>
    <td class="graymn" align="left"> 
	    <input name="default_value" maxlength="60" size="60"/>
    </td>
  </tr>
  <tr>    
    <td class="graymn" align="left" width="20%">Ĭ�����ԣ�</td>
    <td class="graymn" align="left"> 
	   <select name="default_tag">
	   <option value="0">��Ч</option>
	   <option value="1">��Ч</option>
	   </select>
    </td>
  </tr>
  <tr>    
    <td class="graymn" align="left" width="20%">�Ƿ���Ч��</td>
    <td class="graymn" align="left" > 
    <select  name="enable_tag" >
    <option value="0">��Ч</option>
    <option value="1">��Ч</option>
    </select>
    </td>
  </tr>
	
    <tr>
    <td class="graymn" align="left" colspan=4>
    	<input type="hidden"  name="trade_type_code" value="0703"/>
    	<input type="submit" name="Submit1" value="ȷ������">
    </td>
    </tr>
</table>
 </html:form>
<body>
</html>
