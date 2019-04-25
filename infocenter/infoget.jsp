<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.ahbay.interfaceMgr.*"%>
<%@ page import="java.util.*"%>
<%
    getInterfaceMgr interfaceMgr = new getInterfaceMgr();
    ArrayList list = new ArrayList();
    HttpSession  logsession = request.getSession(); 
    String info_type = "";
    if (request.getParameter("info_type") != null)
    {
        info_type = request.getParameter("info_type");
    }
    String s_id = "";
    if (logsession.getAttribute("SESSION_USER_ID") != null)
    {
        s_id = logsession.getAttribute("SESSION_USER_ID").toString();
    }
    list = interfaceMgr.getQueryPage(s_id,info_type);
%>

<%
    if (list != null && list.size()>0)
    {   
        for (Iterator inIt = list.iterator(); inIt.hasNext();)
	    {
		    HashMap map = (HashMap) inIt.next();
            String ulr = "";
            ulr = map.get("ulr").toString();             
%>      
            <li style="width:30%; float:left;padding: 0 0 0 15px;font-size:12px;background:url(/images/new024.gif) left center no-repeat">
                <%=ulr%>
            </li>                          
<%                            
        }
     }
%>
                 
 