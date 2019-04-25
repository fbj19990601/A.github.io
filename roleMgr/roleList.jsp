<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.util.*"%>
<%@ page import="com.saas.biz.roleMgr.RoleInfo"%>
<%@ page contentType="text/html;charset=GBK"%>
<jsp:useBean id="bean" class="com.saas.biz.commen.ParamethodMgr" scope="page" />
<jsp:useBean id="tools" class="com.saas.biz.commen.PageTools" scope="page" />
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%
   HttpSession  logsession = request.getSession(); 
    String cust_id = "";
    String iStart ="1";
    if (request.getParameter("iStart") != null)
    {
        iStart = request.getParameter("iStart");
    }
    if (logsession.getAttribute("SESSION_CUST_ID") != null)
    {
        cust_id = logsession.getAttribute("SESSION_CUST_ID").toString();
    }
   RoleInfo roleObj=new RoleInfo();
   ArrayList roleList =roleObj.getRoleInfoByCust_id(Integer.valueOf(iStart).intValue(),cust_id);
   HashMap typeMap=bean.getCompareInfoByCode("CRM","role_type");
   int counter=roleObj.getRoleCount(cust_id,"0");
   String toolsBar=tools.getPageTools(String.valueOf(counter),"20","roleListIndex.jsp?iStart=",Integer.parseInt(iStart));
%>

<html>
<head>
<title><bean:message key="str361"/></title>
<script language="javascript">
  function chechIfo()
  {
	if(confirm('�Ƿ�ȷ��ɾ����ɫ��')) 
	{
		return true;
	}
	else
	{
		return false;
	}
  }
</script>
<style>
  .t_head{style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" }
</style>
<SCRIPT>WinLIKEerrorpage='/winlike/winman/hlp-error.html';</SCRIPT>
<SCRIPT SRC="/winlike/winman/wininit.js"></SCRIPT>
<SCRIPT SRC="/winlike/winman/winman.js"></SCRIPT>
<SCRIPT>
            WinLIKE.definewindows=mydefss;
            function mydefss() {
                
            	var j=new WinLIKE.window('', 100, 100, '90%', 'WinLIKE.browsersize().Height -Top-30', 2);
            	j.Vis=false;
            	j.Nam='appwin';
            	WinLIKE.addwindow(j);
            };
</SCRIPT>
</head>
<body>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
	  <tr>
	    <td height="13">&nbsp;</td>
	  </tr>
	  <tr>
	    <td>
		     <table width="100%" border=0 cellpadding=2 cellspacing=1 align=center bgcolor="#e7e7e7">
		        <tr>
			        <td class="line1" style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align="center" width="25%"><bean:message key="str349"/></td>
					<td class="t_head" align="center" width="20%"><bean:message key="str350"/></td>
					<td class="t_head" align="center" width="15%"><bean:message key="str362"/></td>
					<td class="t_head" align="center" width="10%"><bean:message key="str322"/></td>
					<td class="t_head" align="center" width="10%"><bean:message key="str323"/></td>
		        </tr>
		        <%
		            if(roleList != null && roleList.size()>0)
		            {
		              	 for (Iterator it = roleList.iterator(); it.hasNext();)
		                  {
						        HashMap map = (HashMap) it.next();
						        String role_name="";
						        String role_type="";
						        String role_code="";
						        String role_state="��Ч";
						        if(map.get("role_name") != null)
						        {
						           role_name=map.get("role_name").toString();
						        }
						        if(map.get("role_type") != null)
						        {
						           role_type=map.get("role_type").toString();
						           if(typeMap!=null && typeMap.size()>0){
						             role_type=typeMap.get(role_type).toString();
						           }
						        }
						        if(map.get("role_code") != null)
						        {
						           role_code=map.get("role_code").toString();
						        }
						        %>
						        <tr style="background-color:#f9f9f9; " id="changcolor_tr<%=cust_id%>" onmouseover="MM_changeProp('changcolor_tr<%=cust_id%>','','backgroundColor','#ffffff','DIV')" onmouseout="MM_changeProp('changcolor_tr<%=cust_id%>','','backgroundColor','#f9f9f9','DIV')">
					              <td  style=" color:#000000; padding:3px 5px;" align=left><%=role_name%></td>
					              <td  style=" color:#000000;" align=center><%=role_type%></td>
					              <td  style=" color:#000000;" align=center><%=role_state%></td>
					              <td  style=" color:#000000;" align=center>
					                <a href=updateRoleInfo.jsp?role=<%=role_code%>&cust=<%=cust_id%>  TARGET=appwin onclick="mydefss()"><img src=/img/edit.gif width=16 height=16 border=0 alt="�޸Ľ�ɫ"></a>&nbsp;&nbsp;&nbsp;
					              </td>
					              <td>  
					                <a href=/doTradeReg.do?cust_id=<%=cust_id%>&trade_type_code=1030&role_code=<%=role_code%> target="_self"  onClick="return chechIfo()"><img src=/img/del.gif width=16 height=16 border=0 alt="ɾ����ɫ"></a>
					              </td>
					            </tr>
						        <%
					     }
					     %>
					    <tr>
						  <%=toolsBar%>										
						</tr>
					     <%
		            }
		        %>
		    </table>
	     </td>
	  </tr>
	  <tr>
	    <td height="13">&nbsp;</td>
	  </tr>
	</table>
</body>
</html>