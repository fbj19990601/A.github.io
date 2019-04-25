<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!-------------------------------------------------------------------
                          标准JavaScript库引用
--------------------------------------------------------------------->
<script language="JavaScript" src="public.js"></script>
<!--------------------------------------------------------------------
   当前页面JavaScript函数部分，包括提交验证，页面动作，具体目标等代码
---------------------------------------------------------------------->
<script language="JavaScript">	 
	function Check_Value(current_obj)
	{
		if(!current_obj.lmmc.value && current_obj.lmmc.value == "")
		{
			alert("请输入栏目名称！");
		}
		else if (!current_obj.modelfile.value && current_obj.modelfile.value == "")
		{
			alert("请选择模版文件！");
		}
		else
		{
			current_obj.submit();
		}
		} 
	function check_none(current_obj)
    {
    	if (current_obj.advshow.checked)
        {
        	current_obj.Submit1.disabled=false;        	     
        }
        else
        {
           current_obj.Submit1.disabled=true;
        }
    }
</script> 

<!--------------------------------------------------------------------
                          页面HTML表现部分    
---------------------------------------------------------------------->
 
<html>
<head>
<title><bean:message key="str4381"/></title>
<link href="style/css.css" rel="stylesheet" type="text/css"> 
</head>
<body> 
<logic:notEmpty name="result" scope="request">
    <logic:iterate id="result1" name="result" scope="request">		
        <bean:define id="upItemId" name="result1" property="sjlmbs"  type="java.lang.String"/>
        <bean:define id="itemClass" name="result1" property="lmjb"  type="java.lang.String"/>
 <html:form action="/addItemInfo" enctype="multipart/form-data">
    <table width="100%" border="5" cellpadding="10" cellspacing="1" align="center" bordercolor="#D1D1D1" >
      <tr> 
        <td width="18%" class=grayD><font size="2"><bean:message key="str4385"/></font></td>
        <td class=grayD> <font size="2"> 
          <html:text property="lmmc" size="35" />
       
          </font><font size="2" color=red>*</font></td>
      </tr>
      <tr> 
        <td width="18%" class=grayD><font size="2"><bean:message key="str4345"/></font></td>
        <td class=grayD><font size="2"> 
          <html:file property="modelfile"/>
        
           </font><font size="2" color=red>*</font><bean:message key="str4344"/></td>
      </tr>
      <tr> 
        <td width="18%"class=grayD><font size="2"><bean:message key="str4343"/></font></td>
        <td class=grayD><font size="2"> 
          	<html:select property="showfirst" size="1">
  			<html:option value="0" ><bean:message key="str4320"/></html:option>
  			<html:option value= "1"><bean:message key="str4321"/></html:option>
  			<html:option value= "2"><bean:message key="str4322"/></html:option>
  			<html:option value= "3"><bean:message key="str4323"/></html:option>
  			<html:option value= "4"><bean:message key="str4324"/></html:option>
  			<html:option value= "5"><bean:message key="str4325"/></html:option>
 			</html:select>
          
          
          </font><bean:message key="str4326"/></td>
      </tr>
       
      <tr> 
        <td width="18%" class=grayD><font size="2"><bean:message key="str4327"/></font></td>
        <td class=grayD> 
            <bean:message key="str4328"/>
            <bean:write name="result1" property="lmjb" filter="false"/>
            <bean:message key="str4329"/>
            <input type=hidden name=lmjb value=<%=itemClass%>>
           </td>
      </tr>
      <logic:greaterThan name="result1" property="lmjb"  value="1">
            <tr>
                <td width=18% class=grayD><bean:message key="str4330"/></td>
                <td class=grayD>
        			<input name=sjlmbs type=hidden value=<%=upItemId%>>
    			    <bean:write name="result1" property="sjlmmc" filter="false"/>
      		    </td>
      		</tr> 
      </logic:greaterThan>
      <tr> 
        <td width="18%" class=grayD><font size="2"><bean:message key="str4331"/></font></td>
        <td class=grayD> <font size="2"> 
          <html:select property="displayrage" size="1">
  	 
  			<html:option value= "1">1</html:option>
  			<html:option value= "2">2</html:option>
  			<html:option value= "3">3</html:option>
  			<html:option value= "4">4</html:option>
  			<html:option value= "5">5</html:option>
  			<html:option value= "6">6</html:option>
  			<html:option value= "7">7</html:option>
  			<html:option value= "8">8</html:option>
  			<html:option value= "9">9</html:option>
  			<html:option value= "10">10</html:option>
 			</html:select>
          
          
          </font><bean:message key="str4332"/></td>
      </tr>
   <tr> 
    <td class="grayE" colspan=2>
        <INPUT id=advcheck name=advshow type=checkbox value=0 onclick="check_none(this.form);">
        <bean:message key="str4308"/>
	<td>
   </tr>
      <tr>
        <td colspan=2 class=grayD align="right"> 
            <input type="button" name="Submit1" value="确定新增栏目" onclick="Check_Value(this.form)"  disabled=true>
        </td>
      </tr>
    </table>
        <input type=hidden name="trade_type_code" value="0117">
</html:form>
</logic:iterate>
</logic:notEmpty>
<logic:empty  name="result" scope="request">
     <html:form action="/addItemInfo" enctype="multipart/form-data">
    <table width="100%" border="5" cellpadding="10" cellspacing="1" align="center" bordercolor="#D1D1D1" >
      <tr> 
        <td width="18%" class=grayD><font size="2"><bean:message key="str661"/></font></td>
        <td class=grayD> <font size="2"> 
          <html:text property="lmmc" size="35" />
       
          </font><font size="2" color=red>*</font></td>
      </tr>
      <tr> 
        <td width="18%" class=grayD><font size="2"><bean:message key="str4317"/></font></td>
        <td class=grayD><font size="2"> 
          <html:file property="modelfile"/>
        
           </font><font size="2" color=red>*</font><bean:message key="str4318"/></td>
      </tr>
      <tr> 
        <td width="18%"class=grayD><font size="2"><bean:message key="str4319"/></font></td>
        <td class=grayD><font size="2"> 
          	<html:select property="showfirst" size="1">
  			<html:option value="0" ><bean:message key="str4320"/></html:option>
  			<html:option value= "1"><bean:message key="str4321"/></html:option>
  			<html:option value= "2"><bean:message key="str4322"/></html:option>
  			<html:option value= "3"><bean:message key="str4323"/></html:option>
  			<html:option value= "4"><bean:message key="str4324"/></html:option>
  			<html:option value= "5"><bean:message key="str4325"/></html:option>
 			</html:select>
          
          
          </font><bean:message key="str4326"/></td>
      </tr>
       
      <tr> 
        <td width="18%" class=grayD><font size="2"><bean:message key="str4327"/></font></td>
        <td class=grayD> 
            <bean:message key="str4328"/>
            <input type=hidden name=lmjb value="1">
           </td>
      </tr>
      
       
      <tr>
           <td width=18% class=grayD><bean:message key="str4330"/></td>
           <td class=grayD>
      		<h4><bean:message key="str4339"/></4>
          </td>
      </tr> 
      <input name=sjlmbs type=hidden>
 
      <tr> 
        <td width="18%" class=grayD><font size="2"><bean:message key="str4340"/></font></td>
        <td class=grayD> <font size="2"> 
          <html:select property="displayrage" size="1">
  	 
  			<html:option value= "1">1</html:option>
  			<html:option value= "2">2</html:option>
  			<html:option value= "3">3</html:option>
  			<html:option value= "4">4</html:option>
  			<html:option value= "5">5</html:option>
  			<html:option value= "6">6</html:option>
  			<html:option value= "7">7</html:option>
  			<html:option value= "8">8</html:option>
  			<html:option value= "9">9</html:option>
  			<html:option value= "10">10</html:option>
 			</html:select>
          
          
          </font><bean:message key="str4341"/></td>
      </tr>
   <tr> 
    <td class="grayE" colspan=2>
        <INPUT id=advcheck name=advshow type=checkbox value=0 onclick="check_none(this.form);">
       <bean:message key="str4308"/>
	<td>
   </tr>
      <tr>
        <td colspan=2 class=grayD align="right"> 
            <input type="button" name="Submit1" value="确定新增栏目" onclick="Check_Value(this.form)"  disabled=true>
        </td>
      </tr>
    </table>
    <input type=hidden name="trade_type_code" value="0117">
</html:form>
</logic:empty>
</body>
</html>