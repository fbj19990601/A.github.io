<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<%@ page contentType="text/html;charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="java.util.*"%>
<%@ page import="com.saas.biz.rightMgr.*"%>
<%
	String subsys_code = "B2B", menu_class = "1";
	if (request.getParameter("menu_class") != null) {
		menu_class = request.getParameter("menu_class");
	}
	if (request.getParameter("subsys_code") != null) {
		subsys_code = request.getParameter("subsys_code");
	}
	HttpSession left_session = request.getSession();
	String user_name = "", user_id = "", user_class = "", role_code = "", user_type = "";
	if (left_session.getAttribute("SESSION_USER_NAME") != null) {
		user_name = left_session.getAttribute("SESSION_USER_NAME").toString();
		user_id = left_session.getAttribute("SESSION_USER_ID").toString();
		user_class = left_session.getAttribute("SESSION_CUST_CLASS").toString();
		role_code = left_session.getAttribute("SESSION_ROLE_CODE").toString();
		user_type = left_session.getAttribute("SESSION_USER_TYPE").toString();
	}
	ArrayList firstMenuList = new RightMenu().getLeftMenuList(user_id, user_name, menu_class, user_class, subsys_code, user_type, role_code);
%>
<HTML>
	<HEAD>
		<title><bean:message key="str2736"/></title>
		<link href="images/member.css" type="text/css" rel="stylesheet">
		<style type="text/css"> 
		BODY 
		{
		 SCROLLBAR-FACE-COLOR: #FFE9D4;
		 SCROLLBAR-HIGHLIGHT-COLOR: #FFE9D4;
		 SCROLLBAR-SHADOW-COLOR: #FFE9D4;
		 SCROLLBAR-3DLIGHT-COLOR: #FFE9D4;
		 SCROLLBAR-ARROW-COLOR: #ffffff;
		 SCROLLBAR-TRACK-COLOR: #FFF3ED;
		 SCROLLBAR-DARKSHADOW-COLOR: #FFF3ED
		}
		a:link{color: ##003366;text-decoration: none;}
		a:visited{color: ##003366;text-decoration: none;}
		a:hover{color: #FF5500;font-weight: bold;}
		</style>
		<script type="text/javascript" src="/js/prototype.js"></script>
		<script type="text/javascript" src="menu.js"></script>
	</HEAD>
	<body bgColor="#7db3ff" leftmargin="3" topMargin="5" rightmargin="0">
		<table width="165" cellpadding="0" cellspacing="0" class="leftside" ID="Table1" border="0">
			<TR>
				<TD align="center" height="40">
					<A target="main" href="home.jsp"><IMG src="images/backhome.gif" alt="ÉÌÎñÊÒÊ×Ò³" width="133" height="27" border="0"> </A>
				</TD>
			</TR>
			<%
			  if(firstMenuList!=null && firstMenuList.size()>0){
			  int index=0;
			    for(int i=0;i<firstMenuList.size();i++){
			      index++;
			      MenuInfo menu=(MenuInfo)firstMenuList.get(i);
			      String m_name="",m_desc="";
			      m_name=menu.getMenu_name(); 
			      m_desc=menu.getMenu_desc();
			      ArrayList children=menu.getChildren();
			      String image="images/1.gif",display="display:none";
			      if(i==0){
			        image="images/_1.gif";
			        display="display:block";
			      }
			%>
				<TR>
					<TD class="leftmenutitle" style="CURSOR: pointer" onClick="ShowMenu(document.getElementById('leftmenu<%=i%>'),document.getElementById('leftmenu<%=i%><%=index%>'));">
						<img id="leftmenu<%=i%><%=index%>" src="<%=image%>" alt="<%=m_desc%>" width="9" height="9">
						<%=m_name%>
					</TD>
				</TR>
				<TR>
					<TD>
						<DIV class="leftmenu" id="leftmenu<%=i%>" style="<%=display%>">
						  <%if(children!=null && children.size()>0){
						     for(int j=0;j<children.size();j++){
						     MenuInfo child=(MenuInfo)children.get(j);
						     String c_name=child.getMenu_name();
						     String menu_id=child.getMenu_id();
						     String menu_desc=child.getMenu_desc();
						  %>
							<a target="main" href="index.jsp?menu_id=<%=menu_id%>&subsys_code=<%=subsys_code%>" title="<%=menu_desc%>"><%=c_name%></A>
						  <%}
						  }%>
						</DIV>
					</TD>
				</TR>
			  <%}
			}%>
			<TR>
				<TD height="50">
					&nbsp;<div id="sesson-div"></div>
				</TD>
			</TR>
		</table>
	</body>
</HTML>
