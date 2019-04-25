<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.saas.biz.rightMgr.*"%>
<%@ page import="java.util.*"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<jsp:useBean id="bean" class="com.saas.biz.commen.ParamethodMgr" scope="page" />
<%
    String class_code=bean.getSelectItems("1");
  	HttpSession htSe = request.getSession();
	String cust_class = (String) htSe.getAttribute("SESSION_CUST_CLASS");
 %>
<html>
	<head>
		<title><bean:message key="str116"/></title>
		<link href="/style/css.css" rel="stylesheet" type="text/css">
		<link href="/style/layout.css" rel="stylesheet" type="text/css">
	    <script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/RightMenu.js'></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/engine.js'></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/util.js'></script>
		<script type="text/javascript" src="/js/prototype.js"></script>
		<script type="text/javascript" src="menu.js"></script>
		<style type="text/css">
			.line6 {width:72spx; width:70spx!important;border:#ffcb99 1px solid;  background-color:#fff8ee; text-align:left; padding-left: 20px;padding-top: 10px;padding-bottom: 10px; color:#000000; margin-top:13px; margin-bottom:13px;}   /*������ʽ6---- ͷ������1*/
			.line6 .img{width:53px; height:53px; float:left; margin-right:20px;}
			.line6 .title {font-size:14px; font-weight:bold; color:#ff5400;}
			.line1 {border-left:#ff7300 3px solid; background-color:#e2e2e2; color:#333333;text-align:left; font-size:12px;}  /*������ʽ1*/
			h1 {float:left;padding-left:8px; font-size:15px; font-weight:bold; padding-top:5px;}
		.Tree-Img {
		    background-image:url(/img/org.png) !important;
		}
		.root-Img {
		    background-image:url(/img/home.png) !important;
		}
		</style>
	</head>
	<body>
		<div class="line6">
			<div class="img">
				<img src="/images/icon3_manager_rightbody.gif" />
			</div>
			<span class="title"><bean:message key="str3963"/></span>
			<br />
			<bean:message key="str3964"/>
			<br />
			<bean:message key="str3965"/>
		</div>
		<div class="line6">
			<bean:message key="str3966"/>
			<%
                RightMenu sysright = new RightMenu();
                ArrayList syslist = sysright.genSysServ("SYS");
                if (syslist != null)
                {
                    for(Iterator it = syslist.iterator(); it.hasNext();)
        		    {
            			HashMap sysInfo = (HashMap)it.next();
            			String sysname = "";
            			String syscode = "";
            			if (sysInfo.get("para_code1") != null) syscode =sysInfo.get("para_code1").toString();
            			if (sysInfo.get("para_code2") != null) sysname =sysInfo.get("para_code2").toString();
            %>
			 ��<a href="javascript:createTree('<%=syscode%>')"><%=sysname%></a>��
			   <%}
               }%>
		</div>
		<form name=resumeForm action=/doTradeReg.do method=post target="_self">
		<table width="100%" border="0" cellpadding="2" cellspacing="1" align="center" bgcolor="#e7e7e7">
		   <tr>
			<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;text-align:right" align=right width="15%">
					<bean:message key="str3967"/>
				</td>
				<td style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left width="85%">
					<div class="ping">
						<select id="class_code" name="class_code">
						  <%=class_code%>
						</select>
					<div class="ping">
				</td>
			</tr>
			<tr>
				<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;text-align:right" align=right width="15%">
					<bean:message key="str3968"/>
				</td>
				<td style="background-color:#ffffff; color:#000000;  font-size:12px;float: left" align=left width="85%">
				<div style="display:inline;float: left">
					<select name="s_menu1" id="s_menu1" size="7" onclick="setS_menu2(this.value)" style="float: left"></select>
					<select name="s_menu2" id="s_menu2" size="7" onclick="setS_menu3(this.value)" style="display:none;float: left"></select>
					<select name="s_menu3" id="s_menu3" size="7" onclick="setOper_menu(this.value)" style="display:none;float: left"></select>
				</div>
				</td>
			</tr>
			<tr>
				<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;text-align:right" align=right width="15%">
					<bean:message key="str3969"/>
				</td>
				<td style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left width="85%">
				<div style="display:inline;float: left">
					<select name="r_menu1" id="r_menu1" size="7" onclick="setR_menu2(this.value)" style="float: left"></select>
					<select name="r_menu2" id="r_menu2" size="7" onclick="setR_menu3(this.value)" style="display:none;float: left"></select>
					<select name="r_menu3" id="r_menu3" size="7" onclick="setOper_menu(this.value)" style="display:none;float: left"></select>
				</div>
				</td>
			</tr>
			<tr>
			    <td style="background-color:#ffffff; color:#000000;  font-size:12px;"  align="right" >
					<input class="tjan" name="submit" type="submit" value="" onclick="return senMenu()">&nbsp;&nbsp;&nbsp;&nbsp;
				</td>
				<td style="background-color:#ffffff; color:#000000;  font-size:12px;" align="left" >
					&nbsp;&nbsp;&nbsp;&nbsp;<input class="scan" name="submit" type="submit" value="" onclick="return removeMenu()">
				</td>
			</tr>
		</table>
		<input type="hidden" name="trade_type_code" id="trade_type_code">
		<input type="hidden" name="sub_code" id="sub_code">
		<input type="hidden" name="menu_id" id="menu_id">
		<input type="hidden" name="cust_class" id="cust_class" value="<%=cust_class%>">
		</form>
	</body>
</html>
