<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ page import="java.util.*" %> 
<html>
<head>
<title><bean:message key="system.tittle"/></title>
<link href="style/css.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<script language="JavaScript">

<!--
var timerID = null
var timerRunning = false
function stopclock(){
    if(timerRunning)
        clearTimeout(timerID)
    timerRunning = false
}

function startclock(){
    stopclock()
    showtime()
}

function showtime(){
    var now = new Date()
    var hours = now.getHours()
    var minutes = now.getMinutes()
    var seconds = now.getSeconds()
    var timeValue = "" + ((hours > 12) ? hours - 12 : hours)
    timeValue  += ((minutes < 10) ? ":0" : ":") + minutes
    timeValue  += ((seconds < 10) ? ":0" : ":") + seconds
    if (hours>=6 && hours<=12)
       {timeValue  += ("上午")}
    if(hours>12 && hours<=18) 
       {timeValue += ("下午")}
    if(hours>18 && hours <=24)
       {timeValue +=("晚上")}
    if(hours<6) 
       {timeValue += ("深夜")}
    document.clock.face.value = timeValue 
    timerID = setTimeout("showtime()",1000)
    timerRunning = true
}


//-->
</script>
</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onLoad="startclock();">
<table width="100%" border="0" cellspacing="0" cellpadding="0" align=right>
  <tr>
    <td width="100%">
    	<table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td height=30>
          	<table width="100%" height="61" border="0" cellpadding="0" cellspacing="0" background="img/admin_bg1.jpg">
              <tr>
                <td width="2%">&nbsp;</td>
                <td width="40%" valign="middle" class="top"><img src="img/admin_2.gif" width="366" height="61"></td>
                <td width="53%" align="right"  id="menu_2"><font color="#ffffff"><A href="http://192.168.10.111/" target="_blank"><bean:message key="str5001"/></A><!--│<A href="http://192.168.10.112/saletj.do?trade_type_code=0141&class_type=5&class_level=1&class_id=" target="_blank">我要采购</A>│<A href="http://192.168.10.112/stockordercenter.do?trade_type_code=0154&class_type=4&class_level=1&class_id=" target="_blank">我要销售</A>│<A href="http://192.168.10.112/infoCenter.do?trade_type_code=0411&class_type=1&class_level=1&class_id=" target="_blank">资讯</A>│<A href="#" target="_blank">论坛</A></font-->&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
              </tr>
            </table>
          </td>
        </tr>
        <TR>
              <td height="27" align="right" valign="top">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
        	        <tr>
                        <td align="left" valign="top" bgcolor="#1F64AE">
                         <!--form method="POST" name="clock">
                          <input type="text" name="face" size="11" style="font-size: 10pt"> 
                         </form -->    
                        </td>
                        <td height="32" align="right" valign="top" bgcolor="#1F64AE">
                            <TABLE height="100%"  border=0 cellPadding=0 cellSpacing=0 bgcolor="#F1F4F6"   valign=right>                        
                    	    	<TBODY>        	    	    
                    	    	<logic:notEmpty name="result" scope="request">
                    	    	<tr align="center">
                    	    	<logic:iterate id="result1" name="result" scope="request">                    				 
                    				<td class="grayD" width="90"id="menu_3" onMouseover="this.className='grayE';" onMouseout="this.className='grayD'">
                        				<logic:notEmpty name="result1" property="var">
                        					<bean:define id="menuId" name="result1" property="var"/>
                        					<%
                        						HashMap menumap=new HashMap();
                        		                menumap.put("up_menu_id",menuId);
                        		                menumap.put("menu_class","3");
                        		                menumap.put("trade_type_code","0121");
                        		                request.setAttribute("menumap",menumap);  
                        					%>
                        					<html:link action="/getchildsubmenulist" name="menumap" target="topFrame">	
                        						<bean:write name="result1" property="text" filter="false"/>
                        					</html:link>
                        				 </logic:notEmpty>
                        				 <logic:empty name="result1" property="var">
                        				 	<bean:write name="result1" property="text" filter="false"/>
                        				 </logic:empty>
                    				</td><td width="2" background="img/admin_3.gif"></td>
        		                </logic:iterate>
        		                </tr>
                		        </logic:notEmpty>
                		        <logic:empty name="result" scope="request">
                		            <tr align="center">
                		                <td class="grayD" width="90"id="menu_3" onMouseover="this.className='grayE';" onMouseout="this.className='grayD'">
                		                <bean:message key="str4414"/>
                		                </td><td width="2" background="img/admin_3.gif"></td>
                                    </tr>
                		        </logic:empty>
        	                </TBODY>
                         </TABLE>
                     </td>
                </tr>
                <tr>
                    <td height="2" bgcolor="#9E9D9D"></td>
                </tr>
          </table>
        </td>
      </TR> 
      </table>
    </td> 
  </tr>
</table>	
</body>
</html>
