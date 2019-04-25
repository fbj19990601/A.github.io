<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>

<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.saas.biz.resumeMgr.ResumeInfo"%>
<%@ page import="com.saas.biz.userMgr.UserInfo"%>
<%@ page import="com.saas.biz.custMgr.Custinfo"%>
<%@ page import="com.saas.biz.commen.ParamethodMgr"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<title><bean:message key = "str5055"/></title>
		<link href="/zone_b2b/css/css.css" rel="stylesheet" type="text/css" />
	</head>
	<%
	String resume_id = "";
	if (request.getParameter("resume_id")  != null) {
		resume_id = request.getParameter("resume_id") ;
	}
	ResumeInfo ri = new ResumeInfo();
	ParamethodMgr para=new ParamethodMgr();
%>
	<body>
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td width="276">
					<img src="/zone_b2b/images/qiuzhi_02.gif" width="276" height="94">
				</td>
				<td background="/zone_b2b/images/qiuzhi_03.gif">&nbsp;
					
				</td>
				<td width="237">
					<img src="/zone_b2b/images/qiuzhi0_05.gif" width="237" height="94">
				</td>

			</tr>
		</table>
		<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td valign="top">
					<table width="100%" border="0" cellpadding="4" cellspacing="1" bgcolor="DBECF4">
						<tr>
							<td height="26" valign="top" background="/zone_b2b/images/xian4.gif" bgcolor="#FFFFFF">
								<bean:message key="str2239"/>
								<a href="/zone_b2b/" class="lanse"><bean:message key="str2737"/></a> 
								&gt;
								<a href="/zone_b2b/talents/" class="lanse"><bean:message key="str2742"/></a> &gt;
								<bean:message key="str5056"/>
							</td>

						</tr>
					</table>
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td height="5"></td>
						</tr>
					</table><table width="100%" border="0" align="center" cellpadding="5" cellspacing="1" bgcolor="DBECF4">
						<tr>

							<td valign="top" bgcolor="#FFFFFF"><%
			    	   ArrayList resumelist = ri.getRecruitmentNewByCust_id(resume_id);
				      if(resumelist != null && resumelist.size() > 0) 
						  {
						 for(int i = 0;i < resumelist.size(); i++) 
						 {
							HashMap map = (HashMap)resumelist.get(i);
							String profession="";
							String spec="";
						    String name="";
						    String born_date="";
						    String age="";
						    String wish="";
						    String degree="";
						    String position="";
						    String job_age="";
						    String grad_from="";
						    String grad_date="";
						    String update_date="";
						    String work_history="";
						    String tel="";
						    String email="";
						    String phone="";
						    String addr="";
							if(map.get("profession")!=null)
							{
								profession=map.get("profession").toString();
							}
							if(map.get("spec")!=null)
							{
								spec=map.get("spec").toString();
							}
								if(map.get("name")!=null)
							{
								name=map.get("name").toString();
							}
						
							if(map.get("born_date")!=null)
							{
							  born_date=map.get("born_date").toString();
							}	
							if (born_date.length() > 10) 
							{
							  born_date = born_date.substring(0, 10);
							}
							if(map.get("grad_date")!=null)
							{
							  born_date=map.get("grad_date").toString();
							}	
							if (grad_date.length() > 10) 
							{
							  grad_date = grad_date.substring(0, 10);
							}
							if(map.get("update_date")!=null)
							{
							  update_date=map.get("update_date").toString();
							}	
							if (update_date.length() > 10) 
							{
							  update_date = update_date.substring(0, 10);
							}
							if(map.get("age")!=null)
							{
								age=map.get("age").toString();
							}
							if(map.get("wish")!=null)
							{
								wish=map.get("wish").toString();
							}
							if(map.get("degree")!=null)
							{
								 degree=map.get("degree").toString();
								 degree =para.getParamNameByValue( "39", degree );
							}
							if(map.get("position")!=null)
							{
								position=map.get("position").toString();
							}
							if(map.get("job_age")!=null)
							{
								job_age=map.get("job_age").toString();
							}
							if(map.get("grad_from")!=null)
							{
								grad_from=map.get("grad_from").toString();
							}
							if(map.get("work_history")!=null)
							{
								work_history=map.get("work_history").toString();
							}
							if(map.get("tel")!=null)
							{
								tel=map.get("tel").toString();
							}
							if(map.get("email")!=null)
							{
								email=map.get("email").toString();
							}
							if(map.get("phone")!=null)
							{
								phone=map.get("phone").toString();
							}
							if(map.get("addr")!=null)
							{
								addr=map.get("addr").toString();
							}
					
						
					 %>
					
								<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
									<tr>
										<td height="26" class="leftbt14">
											<img src="/zone_b2b/images/tou.gif" width="8" height="19" align="absmiddle">
											<bean:message key="str5057"/>
										</td>
									</tr>
									<tr>
										<td height="3" class="xian"></td>
									</tr>
								</table>
								<table width="100%" border="0" align="center" cellpadding="5" cellspacing="1" bgcolor="#f1f1f1">
					
									<tr>
										<td width="15%" align="right" bgcolor="#f7f7f7">
											<bean:message key="str5058"/>
											<br>
											<br>
										</td>
										<td width="85%" bgcolor="#FFFFFF">
											<a href="#" class="lanse"><%=profession %> </a>
										</td>
									</tr>
									<tr>
										<td align="right" valign="top" bgcolor="#f7f7f7">
											<bean:message key="str5059"/>
										</td>

										<td bgcolor="#FFFFFF">
											<%=spec %>
										</td>
									</tr>
								</table>
								<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
									<tr>
										<td height="26" class="leftbt14">
											<img src="/zone_b2b/images/tou.gif" width="8" height="19" align="absmiddle">
											<bean:message key="str5060"/>
										</td>
									</tr>

									<tr>
										<td height="3" class="xian"></td>
									</tr>
								</table>
								<table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#E1E1E1">
									<TR>
										<TD width="15%" align="right" bgColor="#f7f7f7">
										<bean:message key="str3799"/>
										</TD>
										<TD width="39%" vAlign="top" bgColor="#FFFFFF">
											<%=name%>
										</TD>

										<TD vAlign="top" align="right" width="14%" bgColor="#f7f7f7">
											<bean:message key="str2921"/>
										</TD>
										<TD vAlign="top" width="32%" bgColor="#FFFFFF">
											<%=born_date %>
										</TD>
									</TR>

									<TR>
										<TD align="right" bgColor="#f7f7f7">
											<bean:message key="str1452"/>
										</TD>
										<TD vAlign="top" bgColor="#FFFFFF">
											<%=age %>
										</TD>
										<TD vAlign="top" align="right" bgColor="#f7f7f7">
											<bean:message key="str5061"/>
										</TD>

										<TD vAlign="top" bgColor="#FFFFFF">
											<%=wish%>
										</TD>
									</TR>
									<TR>
										<TD align="right" bgColor="#f7f7f7">
											<bean:message key="str1454"/>
										</TD>
										<TD vAlign="top" bgColor="#FFFFFF">
											<%=degree%>
										</TD>
										<TD vAlign="top" align="right" bgColor="#f7f7f7">
											<bean:message key="str1443"/>
										</TD>
										<TD vAlign="top" bgColor="#FFFFFF">
											<%=position %>
										</TD>
									</TR>
									<TR>
										<TD align="right" bgColor="#f7f7f7">
											<bean:message key="str723"/>
										</TD>
										<TD vAlign="top" bgColor="#FFFFFF">
											<%=job_age %>
										</TD>
										<TD vAlign="top" align="right" bgColor="#f7f7f7">
											<bean:message key="str1442"/>
										</TD>
										<TD vAlign="top" bgColor="#FFFFFF">
											<%=grad_from %>
										</TD>
									</TR>

									<TR>
										<TD align="right" bgColor="#f7f7f7">
											<bean:message key="str5062"/>
										</TD>
										<TD vAlign="top" bgColor="#FFFFFF">
											<%=grad_date %>
										</TD>
										<TD vAlign="top" align="right" bgColor="#f7f7f7">
											<bean:message key="str3481"/>
										</TD>
										<TD vAlign="top" bgColor="#FFFFFF">
											<%=update_date %>
										</TD>
									</TR>
									<TR>

										<TD align="right" bgColor="#f7f7f7">
											<bean:message key="str5054"/>：
										</TD>
										<TD colspan="3" vAlign="top" bgColor="#FFFFFF">
											<%=work_history %>
										</TD>
									</TR>
								</table>
								<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
									<tr>
										<td height="26" class="leftbt14">
											<img src="/zone_b2b/images/tou.gif" width="8" height="19" align="absmiddle">
											<bean:message key="str3440"/>
										</td>
									</tr>
									<tr>
										<td height="3" class="xian"></td>
									</tr>
								</table>
								<table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#E1E1E1">
									<TR>
										<TD width="15%" align="right" bgColor="#f7f7f7">
											<bean:message key="str3450"/>:										</TD>
										<TD width="39%" vAlign="top" bgColor="#FFFFFF">
											<%=tel %>									  </TD>
										<TD width="14%" align="right" vAlign="top" bgColor="#f7f7f7">
										<bean:message key="str3493"/>									</TD>
										<TD width="32%" vAlign="top" bgColor="#FFFFFF">
											<%=email %>									  </TD>
									</TR>
									<TR>
										<TD align="right" bgColor="#f7f7f7">
											<bean:message key="str3700"/>
										</TD>
										<TD vAlign="top" bgColor="#FFFFFF">
											<%=phone %>
										</TD>

										<TD align="right" bgColor="#f7f7f7">
											<bean:message key="str1450"/>
										</TD>
										<TD vAlign="top" bgColor="#FFFFFF">
											<%=addr %>
										</TD>
									</TR></table>
									<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td class="xian"height="10"></td>
  </tr>
</table>

									<%
				    }
				 }
			 %>
							  
								<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
									<tr>
										<td height="60" align="center">
											&nbsp;
											【<a href="javascript:window.close();" class="lanse"><bean:message key="str679"/></a>】 
											【<a href="javascript: window.print();" class="lanse"><bean:message key="str5018"/></a>】
										</td>

									</tr>
								</table>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<jsp:include flush="true" page="/zone_b2b/footer.jsp" />
	</body>
</html>
