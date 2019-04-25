<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.saas.biz.rightMgr.*"%>
<%@ page import="java.util.*"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<jsp:useBean id="bean" class="com.saas.biz.commen.ParamethodMgr" scope="page" />
<%@ page import="java.text.SimpleDateFormat"%>
<%
    String class_code=bean.getSelectItems("1");
    String start_date="",end_date="";
    Calendar cal=Calendar.getInstance();
    SimpleDateFormat formate=new SimpleDateFormat("yyyy-MM-dd");
    start_date=formate.format(cal.getTime());
    cal.add(Calendar.MONTH,3);
    end_date=formate.format(cal.getTime());
 %>
<html>
	<head>
		<title><bean:message key="str190"/></title>
		<link href="/style/css.css" rel="stylesheet" type="text/css">
		<link href="/style/layout.css" rel="stylesheet" type="text/css">
		<link rel="stylesheet" type="text/css" href="../ext/resources/css/ext-all.css" />
		<script type="text/javascript" src="../ext/adapter/ext/ext-base.js"></script>
		<script type="text/javascript" src="../ext/ext-all.js"></script>
		<script type="text/javascript" src="../ext/build/locale/ext-lang-zh_CN.js"></script>
		<script language="javascript" src="/js/prototype.js"></script>
		<script type="text/javascript" src="/js/prototype.js"></script>
	    <script language="javascript" src="/js/Calendar_Ly.js"></script>
		<script type="text/javascript" src="menuTree.js"></script>
		<style type="text/css">
			.line6 {width:72spx; width:70spx!important;border:#ffcb99 1px solid;  background-color:#fff8ee; text-align:left; padding-left: 20px;padding-top: 10px;padding-bottom: 10px; color:#000000; margin-top:13px; margin-bottom:13px;}   /*横栏样式6---- 头部提醒1*/
			.line6 .img{width:53px; height:53px; float:left; margin-right:20px;}
			.line6 .title {font-size:14px; font-weight:bold; color:#ff5400;}
			.line1 {border-left:#ff7300 3px solid; background-color:#e2e2e2; color:#333333;text-align:left; font-size:12px;}  /*横栏样式1*/
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
			<span class="title"><bean:message key="str4079"/></span>
			<br />
			<bean:message key="str4080"/>
			<br />
			 <bean:message key="str4081"/>
		</div>
		<form name=resumeForm action=/doTradeReg.do method=post target="_self">
		<table width="100%" border="0" cellpadding="2" cellspacing="1" align="center" class="line6">
			<tr>
				<td align=right width="15%">
						<bean:message key="str4082"/>
					</td>
					<td align=left width="85%">
						<div class="ping">
							<select id="cust_class" name="cust_class" onchange="creatTree(this.value)">
							 <option value="s"><bean:message key="str158"/></option>
							  <%=class_code%>
							</select>
						<div class="ping">
					</td>
				</tr>
			   <tr>
		     <td colspan="2" style="font-weight:normal;font-size: 15px;padding-left: 55px">
		      <bean:message key="str3966"/><br>
			<%
                RightMenu sysright = new RightMenu();
                ArrayList syslist = sysright.genSysServ("SYS");
                if (syslist != null && syslist.size()>0)
                {
                    for(int i=0;i<syslist.size();i++)
        		    {
            			HashMap sysInfo = (HashMap)syslist.get(i);
            			String sysname = "";
            			String syscode = "";
            			if (sysInfo.get("para_code1") != null) syscode =sysInfo.get("para_code1").toString();
            			if (sysInfo.get("para_code2") != null) sysname =sysInfo.get("para_code2").toString();
            			if(i==6){
            			out.print("<br>");
            			}
            %>
			      <span style="padding: 1px;color:blue;cursor: hand"><input type="radio" name="service" onclick="selectServer('<%=syscode%>')"><%=sysname%></span>
			   <%}
               }%>
		     </td>
		   </tr>
			<tr>
				<td  align=right width="15%">
					<bean:message key="str162"/>
				</td>
				<td align=left width="85%">
				    <input type="text" name="start_date" id="start_date" maxlength="100" size="10" value="<%=start_date%>" onfocus="setday(this);">
				</td>
			</tr>
			<tr>
				<td  align=right width="15%">
					<bean:message key="str163"/>
				</td>
				<td align=left width="85%">
				    <input type="text" name="end_date" id="end_date" maxlength="100" size="10" value="<%=end_date%>" onfocus="setday(this);">
				</td>
			</tr>
			<tr >
				<td  align=right width="15%">
					<bean:message key="str3968"/>
				</td>
				<td align=left width="85%">
				<div id="send-tree"></div>
				</td>
			</tr>
			<tr>
			    <td align="center" colspan="2">
			      <input class="tjan" name="submit" type="submit" value="" onclick="return checkvalue()">
				</td>
			</tr>
		</table>
		<input type="hidden" name="trade_type_code" id="trade_type_code" value="1202">
		<input type="hidden" name="sub_code" id="sub_code">
		<input type="hidden" name="menu_id" id="menu_id" size="100" value="0">
		</form>
	</body>
</html>
