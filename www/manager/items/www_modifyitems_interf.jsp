<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!-------------------------------------------------------------------
                          ��׼JavaScript������
--------------------------------------------------------------------->
<script language="JavaScript" src="public.js"></script>
<!--------------------------------------------------------------------
   ��ǰҳ��JavaScript�������֣������ύ��֤��ҳ�涯��������Ŀ��ȴ���
---------------------------------------------------------------------->
<script language="JavaScript">	 
	function Check_Value(current_obj)
	{
		if(!current_obj.lmmc.value && current_obj.lmmc.value == "")
		{
			alert("��������Ŀ���ƣ�");
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
<html>
<head>
<title><bean:message key="str4348"/>��վ��̨�ۺϹ���ϵͳ</title>
<link href="style/css.css" rel="stylesheet" type="text/css"> 
</head>
<body> 
<logic:notEmpty name="result" scope="request">
    <logic:iterate id="result1" name="result" scope="request">		
        <bean:define id="itemId" name="result1" property="lmbs"  type="java.lang.String"/>
              
        <bean:define id="itemClass" name="result1" property="lmjb"  type="java.lang.String"/>
 <html:form action="/modifyItemInfo" enctype="multipart/form-data">
    <table width="100%" border="5" cellpadding="10" cellspacing="1" align="center" bordercolor="#D1D1D1" >
      <tr> 
        <td width="18%" class=grayD><font size="2"><bean:message key="str4354"/>��Ŀ���ƣ�</font></td>
        <td class=grayD>
            <html:text property="lmmc" size="35" />
            <bean:write name="result1" property="lmmc" filter="false"/>
        </td>
      </tr>
      <tr> 
        <td width="18%" class=grayD><font size="2"><bean:message key="str4345"/>����ģ�壺</font></td>
        <td class=grayD> 
            <html:file property="modelfile"/>
            <bean:write name="result1" property="mbwjm" filter="false"/>
          <font size="2" color=red>*</font><bean:message key="str4344"/>[��վ��Ҫչʾ��ҳ��]</td>
      </tr>
      <tr> 
        <td width="18%"class=grayD><font size="2"><bean:message key="str4343"/>��ҳ��Ŀ��</font></td>
        <td class=grayD>
          	    
        	<logic:equal name="result1" property="bz"  value="0"> 
              	<html:select property="showfirst" size="1" value="0">          	           
          			<html:option value="0"><bean:message key="str4320"/>0��������ҳ��ʾ </html:option>
          			<html:option value= "1"><bean:message key="str4321"/>1������ҳ��ʾ(��ʽһ)</html:option>
          			<html:option value= "2"><bean:message key="str4322"/>2������ҳ��ʾ(��ʽ��)</html:option>
          			<html:option value= "3"><bean:message key="str4323"/>3������ҳ��ʾ(��ʽ��)</html:option>
          			<html:option value= "4"><bean:message key="str4324"/>4������ҳ��ʾ(��ʽ��)</html:option>
          			<html:option value= "5"><bean:message key="str4325"/>5������ҳ��ʾ(��ʽ��)</html:option>
          		</html:select>
      		</logic:equal>
        	<logic:equal name="result1" property="bz"  value="1"> 
              	<html:select property="showfirst" size="1" value="1">          	           
          			<html:option value="0"><bean:message key="str4320"/>0��������ҳ��ʾ </html:option>
          			<html:option value= "1"><bean:message key="str4321"/>1������ҳ��ʾ(��ʽһ)</html:option>
          			<html:option value= "2"><bean:message key="str4322"/>2������ҳ��ʾ(��ʽ��)</html:option>
          			<html:option value= "3"><bean:message key="str4323"/>3������ҳ��ʾ(��ʽ��)</html:option>
          			<html:option value= "4"><bean:message key="str4324"/>4������ҳ��ʾ(��ʽ��)</html:option>
          			<html:option value= "5"><bean:message key="str4325"/>5������ҳ��ʾ(��ʽ��)</html:option>
          		</html:select>
      		</logic:equal>
        	<logic:equal name="result1" property="bz"  value="2"> 
              	<html:select property="showfirst" size="1" value="2">          	           
          			<html:option value="0"><bean:message key="str4320"/>0��������ҳ��ʾ </html:option>
          			<html:option value= "1"><bean:message key="str4321"/>1������ҳ��ʾ(��ʽһ)</html:option>
          			<html:option value= "2"><bean:message key="str4322"/>2������ҳ��ʾ(��ʽ��)</html:option>
          			<html:option value= "3"><bean:message key="str4323"/>3������ҳ��ʾ(��ʽ��)</html:option>
          			<html:option value= "4"><bean:message key="str4324"/>4������ҳ��ʾ(��ʽ��)</html:option>
          			<html:option value= "5"><bean:message key="str4325"/>5������ҳ��ʾ(��ʽ��)</html:option>
          		</html:select>
      		</logic:equal>
      		              	
        	<logic:equal name="result1" property="bz"  value="3"> 
              	<html:select property="showfirst" size="1" value="3">          	           
          			<html:option value="0"><bean:message key="str4320"/>0��������ҳ��ʾ </html:option>
          			<html:option value= "1"><bean:message key="str4321"/>1������ҳ��ʾ(��ʽһ)</html:option>
          			<html:option value= "2"><bean:message key="str4322"/>2������ҳ��ʾ(��ʽ��)</html:option>
          			<html:option value= "3"><bean:message key="str4323"/>3������ҳ��ʾ(��ʽ��)</html:option>
          			<html:option value= "4"><bean:message key="str4324"/>4������ҳ��ʾ(��ʽ��)</html:option>
          			<html:option value= "5"><bean:message key="str4325"/>5������ҳ��ʾ(��ʽ��)</html:option>
          		</html:select>
      		</logic:equal>
      		              	
        	<logic:equal name="result1" property="bz"  value="4"> 
              	<html:select property="showfirst" size="1" value="4">          	           
          			<html:option value="0"><bean:message key="str4320"/>0��������ҳ��ʾ </html:option>
          			<html:option value= "1"><bean:message key="str4321"/>1������ҳ��ʾ(��ʽһ)</html:option>
          			<html:option value= "2"><bean:message key="str4322"/>2������ҳ��ʾ(��ʽ��)</html:option>
          			<html:option value= "3"><bean:message key="str4323"/>3������ҳ��ʾ(��ʽ��)</html:option>
          			<html:option value= "4"><bean:message key="str4324"/>4������ҳ��ʾ(��ʽ��)</html:option>
          			<html:option value= "5"><bean:message key="str4325"/>5������ҳ��ʾ(��ʽ��)</html:option>
          		</html:select>
      		</logic:equal>
      		              	
        	<logic:equal name="result1" property="bz"  value="5"> 
              	<html:select property="showfirst" size="1" value="5">          	           
          			<html:option value="0"><bean:message key="str4320"/>0��������ҳ��ʾ </html:option>
          			<html:option value= "1"><bean:message key="str4321"/>1������ҳ��ʾ(��ʽһ)</html:option>
          			<html:option value= "2"><bean:message key="str4322"/>2������ҳ��ʾ(��ʽ��)</html:option>
          			<html:option value= "3"><bean:message key="str4323"/>3������ҳ��ʾ(��ʽ��)</html:option>
          			<html:option value= "4"><bean:message key="str4324"/>4������ҳ��ʾ(��ʽ��)</html:option>
          			<html:option value= "5"><bean:message key="str4325"/>5������ҳ��ʾ(��ʽ��)</html:option>
          		</html:select>
      		</logic:equal>
         
          </td>
      </tr>
      <tr> 
        <td width="18%" class=grayD><font size="2"><bean:message key="str4033"/>��ʾ˳��</font></td>
        <td class=grayD> <font size="2">
        <logic:equal name="result1" property="xssx"  value="1">  
          	<html:select property="displayrage" size="1"  value="1">
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
         </logic:equal> 
        <logic:equal name="result1" property="xssx"  value="2">  
          	<html:select property="displayrage" size="1"  value="2">
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
         </logic:equal> 
        <logic:equal name="result1" property="xssx"  value="3">  
          	<html:select property="displayrage" size="1"  value="3">
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
         </logic:equal> 
        <logic:equal name="result1" property="xssx"  value="4">  
          	<html:select property="displayrage" size="1"  value="4">
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
         </logic:equal> 
        <logic:equal name="result1" property="xssx"  value="5">  
          	<html:select property="displayrage" size="1"  value="5">
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
         </logic:equal> 
        <logic:equal name="result1" property="xssx"  value="6">  
          	<html:select property="displayrage" size="1"  value="6">
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
         </logic:equal> 
        <logic:equal name="result1" property="xssx"  value="7">  
          	<html:select property="displayrage" size="1"  value="7">
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
         </logic:equal> 
        <logic:equal name="result1" property="xssx"  value="8">  
          	<html:select property="displayrage" size="1"  value="8">
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
         </logic:equal> 
        <logic:equal name="result1" property="xssx"  value="9">  
          	<html:select property="displayrage" size="1"  value="9">
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
         </logic:equal> 
        <logic:equal name="result1" property="xssx"  value="10">  
          	<html:select property="displayrage" size="1"  value="10">
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
         </logic:equal> 
          
          </font><bean:message key="str4332"/>[��ҳ��������ʾ˳��]</td>
      </tr>      
      <tr> 
        <td width="18%" class=grayD><font size="2"><bean:message key="str4350"/>��Ŀ����</font></td>
        <td class=grayD> 
            ��Ŀ����<bean:message key="str4350"/>
            <bean:write name="result1" property="lmjb" filter="false"/>
            ��<bean:message key="str4351"/>
            <input type=hidden name=lmjb value=<%=itemClass%>>
            <input type=hidden name=lmbs value=<%=itemId%>>
            <logic:equal name="result1" property="lmjb"  value="1">
                <input type=hidden name=sjlmbs value="">
            </logic:equal>
            <logic:greaterThan name="result1" property="lmjb"  value="1">
                 <bean:define id="UpitemId" name="result1" property="sjlmbs"  type="java.lang.String"/>
                 <input type=hidden name=sjlmbs value=<%=UpitemId%>>
            </logic:greaterThan> 
           </td>
      </tr>

     
   <tr> 
    <td class="grayE" colspan=2>
        <INPUT id=advcheck name=advshow type=checkbox value=0 onclick="check_none(this.form);">
        ����������ȷ����
	<td>
   </tr>
      <tr>
        <td colspan=2 class=grayD align="right"> 
            <input type="button" name="Submit1" value="ȷ���޸���Ŀ" onclick="Check_Value(this.form)"  disabled=true>
        </td>
      </tr>
    </table>
        <input type=hidden name="trade_type_code" value="0115">
</html:form>
</logic:iterate>
</logic:notEmpty>
</body>
</html>