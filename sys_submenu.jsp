<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ page import="java.util.*" %> 
<TABLE height="26"  border=0 cellPadding=0 cellSpacing=0   valign=right>
    <TBODY>        	    	    
    <logic:notEmpty name="result" scope="request">
    <tr>
    <logic:iterate id="result1" name="result" scope="request">
 
    	<td width="103" align=center valign="bottom" background="img/menu_2.jpg" >
    	<logic:notEmpty name="result1" property="var">
    		<bean:define id="menuId" name="result1" property="var"/>
    		<%
    			HashMap menumap=new HashMap();
                menumap.put("menu_id",menuId);
                menumap.put("trade_type_code","0120");
                request.setAttribute("menumap",menumap);  
    		%>
    		<html:link action="/gettradeinterface" name="menumap" target="right">	
    			<bean:write name="result1" property="text" filter="false"/>
    		</html:link>
    	 </logic:notEmpty>
    	 <logic:empty name="result1" property="var">
    	 	<bean:write name="result1" property="text" filter="false"/>
    	 </logic:empty>
    	</td> 
     
     
    </logic:iterate>
    </tr>
    </logic:notEmpty>
    <logic:empty name="result" scope="request">
        <td width="103" align=center valign="bottom" background="img/menu_2.jpg" >
        <bean:message key="str4414"/>
        </td> 
    </logic:empty>
    </TBODY>
</TABLE>