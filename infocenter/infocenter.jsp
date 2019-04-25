<%@ page contentType="text/html;charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>

        <link rel="stylesheet" href="/css/wbarrefixe.css" type="text/css" media="screen" />
		
	    <SCRIPT src="/js/jquery-1[1].2.1.pack.js" language=Javascript></SCRIPT>
		<SCRIPT src="/js/jquery.cookie.js" language=Javascript></SCRIPT>
		<SCRIPT src="/js/wbarrefixe.packed.js" language=Javascript></SCRIPT>
		<%
            String info_type = "4";
            if (request.getParameter("info_type") != null)
            {
                info_type = request.getParameter("info_type");
            }
            if (info_type.equals("Z") || request.getParameter("info_type") == null)
            {   
                return;
            }
        %>
		<div id="magicbox">
			<div id="magicmenu">
			    <ul>
    				<li><a href="#" class="magic1"><bean:message key="str2616"/></a></li>
    				<li><a href="#" class="magic2"><bean:message key="str2617"/></a></li>
    				<li><a href="#" class="magic3"><bean:message key="str2618"/></a></li>
				</ul>
		    </div>
			<div id="magiccontent">
				<div id="magicmini"><bean:message key="str2619"/><a href="https://www.xsaas.com" target="_blank">www.xsaas.com</a><bean:message key="str2620"/></div>
				<div id="magicmaxi"> 
                    <table width="100%" border="0" cellspacing="0" cellpadding="0" style="border-left:#dddddd 1px solid;border-right:#dddddd 1px solid;border-top:#dddddd 1px solid;border-bottom:#dddddd 2px solid; height:35px">
                       
                      <tr>
                        <td align="left">
                            <div>
                        	    <ul style="width:100%; margin:0px; padding:0px;">
                        	         <jsp:include page="/infocenter/infoget.jsp">
            								  <jsp:param name="info_type" value="<%=info_type%>" />
            						 </jsp:include>
                        	    </ul>
                    	   </div>
                        </td>
                      </tr>
                    </table>
                </div>
			</div>
		</div>