<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.util.*"%>
<jsp:directive.page import="java.text.SimpleDateFormat"/>
<jsp:useBean id="auditBean" class="com.saas.biz.auditMgr.AuditInfo" scope="page"/>
<jsp:useBean id="bean" class="com.saas.biz.commen.ParamethodMgr" scope="page" />
<%
	String menu_id = "";
	HttpSession  logsession = request.getSession(); 
    String iStart ="0";
    String menu_idx="";
    String cust_id="";
    if (request.getParameter("iStart") != null)
    {
        iStart = request.getParameter("iStart");
    }
    if (logsession.getAttribute("SESSION_CUST_ID") != null)
    {
        cust_id = logsession.getAttribute("SESSION_CUST_ID").toString();
    }
    
    if (request.getParameter("menu_id") != null)
    {
        menu_idx = request.getParameter("menu_id");
        logsession.setAttribute("menu_id",menu_idx);
    }
    ArrayList list=auditBean.getAuditListByCust(Integer.parseInt(iStart),cust_id);
	int counter=auditBean.getAuditCountByCust(cust_id);
    int pages=counter/20+1;
	int pageUp=0,pageDown=0;
	int currenPage=Integer.valueOf(iStart).intValue();
	if(pages>currenPage)
	{
	   if(currenPage>0)
	   {
		pageUp=currenPage-1;
	   }
		pageDown=currenPage+1;
	}
    else if(pages==currenPage)
	{
	   pageUp=currenPage-1;
	   pageDown=currenPage;
	}
	HashMap stateMap=bean.getCompareInfoByCode("CRM","plan_state");
	HashMap typeMap=bean.getCompareInfoByCode("CRM","form_type");
%>
<html>
	<head>
		<title><bean:message key="str2826"/></title>
		<link href="/style/layout.css" rel="stylesheet" type="text/css">
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
		<table width="100%" border="0" cellpadding="0" cellspacing="0">
			<jsp:include page="/inc/top.jsp" />
			<tr>
				<td align="center">
					<div id="manager_body">
						<div id="manager_body_left">
							<jsp:include page="/inc/left.jsp" />
						</div>
						<div id="manager_body_right">
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td>
										<div id="righttop">
											<jsp:include page="/inc/menu.jsp">
												<jsp:param name="menu_id" value="<%=menu_id%>" />
											</jsp:include>
										</div>
										<table width="100%" border="0" cellspacing="0" cellpadding="0">
											<tr>
												<td height="2"></td>
											</tr>
											<tr>
												<td valign="top">
													<table width=100% border=0 cellpadding=5 cellspacing=1 align=center bgcolor="#dddddd">
														<tr>
															<td class="line1" style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="25%">
																<bean:message key="str2827"/>
															</td>
															<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="20%">
																<bean:message key="str2828"/>
															</td>
															<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="20%">
																<bean:message key="str2829"/>
															</td>
															<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="15%">
																<bean:message key="str2830"/>
															</td>
															<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="20%">
																<bean:message key="str2819"/>
															</td>
														</tr>
														<%
														 if(list !=null && list.size()>0){
														   for(int i=0;i<list.size();i++){
														     HashMap map=(HashMap)list.get(i);
														     String quo_id=map.get("quo_id").toString();
														     String quo_name="";
														     if(map.get("quo_name")!=null){quo_name=map.get("quo_name").toString();}
														      String form_name="";
														     if(map.get("form_name")!=null){form_name=map.get("form_name").toString();}
														     String audit_name="";
														     if(map.get("user_name")!=null){audit_name=map.get("user_name").toString();}
														     String form_id="";
														     if(map.get("form_id")!=null){form_id=map.get("form_id").toString();}
														     String entity_type="";
														     if(map.get("entity_type")!=null){
														        entity_type=map.get("entity_type").toString();
														        if(typeMap.get(entity_type)!=null){
														           entity_type=typeMap.get(entity_type).toString();
														        }
														     }
														     String state_code="";
														     if(map.get("audit_state")!=null){
														        state_code=map.get("audit_state").toString();
														        if(stateMap.get(state_code)!=null){
														           state_code=stateMap.get(state_code).toString();
														        }
														     }
														     String end_date=new SimpleDateFormat("yyyy-MM-dd").format(new Date());
														     if(map.get("audit_date")!=null){
														      end_date=map.get("audit_date").toString();
														      if(end_date.length()>10){
														        end_date=end_date.substring(0,10);
														      }
														     }
                                                             %>
														     <tr style="background-color:#f9f9f9;">
												              <td style="color:#000000;" align="left"><a href="/saleOrder/viewStateIndex.jsp?form_id=<%=form_id%>&name=<%=form_name%>&quo_id=<%=quo_id%>" TARGET=appwin onclick="mydefss()" title="²é¿´¶©µ¥"><%=quo_name%></a></td>
												              <td style="color:#000000;" align="left"><%=entity_type%></td>
												              <td style="color:#000000;" align="left"><%=state_code%></td>
												              <td style="color:#000000;" align="center"><%=end_date%></td>
												              <td style="color:#000000;" align="center"><%=audit_name%></td>
												            </tr>
														    <%														     
														   }
														 }
														%>
														 <tr>
														   <td  align="left" colspan="2"><bean:message key="str3988"/><%=counter%> <bean:message key="str611"/> &nbsp;<bean:message key="str3988"/><%=pages%><bean:message key="str1029"/></td>
														   <td  align="right" colspan="3"><a href="viewIndex.jsp?iStart=1&menu_id=<%=menu_idx%>"><bean:message key="str1030"/>  </a>&nbsp; &nbsp;<a href="viewIndex.jsp?iStart=<%=pageUp%>&menu_id=<%=menu_idx%>"><bean:message key="str1031"/></a> &nbsp;<a href="viewIndex.jsp?iStart=<%=pageDown%>&menu_id=<%=menu_idx%>"><bean:message key="str1032"/> </a>&nbsp; <a  href="viewIndex.jsp?iStart=<%=pages%>&menu_id=<%=menu_idx%>"><bean:message key="str1033"/></a></td>
												       </tr>
													</table>
												</td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td align="center">
					<div class="bottom_admin">
						<%@ include file="../../bottom.jsp"%>
					</div>
				</td>
			</tr>
		</table>
	</body>
</html>
