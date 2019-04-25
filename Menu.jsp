<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="java.util.*" %> 
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<script language="JavaScript" src='js/menu.js'></script>  
<LINK href="style/css.css" type=text/css rel=stylesheet>
<TABLE cellSpacing=1 cellPadding=0  border=1   valign=right>
    <TBODY>        	    	    
    <logic:notEmpty name="result" scope="request">
    <tr>
    <logic:iterate id="result1" name="result" scope="request">
    	<td class=grayFA widht="5">&nbsp;</td>
    	<td class=grayD onMouseover=this.className='grayE'; onMouseout=this.className='grayD' align=center>
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
    	<td class=grayFA widht="5">&nbsp;</td>
     
    </logic:iterate>
    </tr>
    </logic:notEmpty>
    <logic:empty name="result" scope="request">
        <bean:message key="system.menu.blank"/>
    </logic:empty>
    </TBODY>
</TABLE>