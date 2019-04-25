<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.saas.biz.saleMgr.SaleInfo"%>
<%@ page import="com.saas.biz.commen.ParamethodMgr"%>
<jsp:useBean id="classBean" class="com.saas.biz.productclassMgr.Productclass" scope="page" />
<html>
	<head>
		<title><bean:message key="str696"/></title>
		<link href="/style/layout.css" rel="stylesheet" type="text/css">
		<script language="javascript" src="/js/Calendar_Ly.js"></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/Hello.js'></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/engine.js'></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/util.js'></script>
		<script type="text/javascript" src="/js/public_b2b.js"></script>
		<script type="text/javascript" src="/js/prototype.js"></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/Productclass.js'></script>
		<script language="javascript" src="supply.js"></script>
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
		<%
			String date = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
			String sale_id = "";
			String title = "";
			String content = "";
			String sale_addr = "";
			String start_date = date;
			String end_date = date;
			String sale_price = "";
			String commodity_price = "";
			String sale_num = "";
			String carriage_pay = "";
			if (request.getParameter("sale_id") != null) {
				sale_id = request.getParameter("sale_id");
			}
			SaleInfo saleObj = new SaleInfo();
			ArrayList saleList = new ArrayList();
			saleList = saleObj.genOneSale(sale_id);
			if (saleList != null && saleList.size() > 0) {
				HashMap map = (HashMap) saleList.get(0);
				sale_id = map.get("sale_id").toString();
				if (map.get("title") != null) {
			     title = map.get("title").toString();
				}
				if (map.get("start_date") != null) {
			     start_date = map.get("start_date").toString();
				if (start_date.length() > 10) {
					start_date = start_date.substring(0, 10);
				}
				}
				if (map.get("content") != null) {
			      content = map.get("content").toString();
				}
				if (map.get("sale_addr") != null) {
			     sale_addr = map.get("sale_addr").toString();
				}
				if(map.get("sale_num") !=null){
				sale_num=map.get("sale_num").toString();
				}
				if(map.get("carriage_pay") !=null){
					carriage_pay=map.get("carriage_pay").toString();
				}
				
				if (map.get("end_date") != null) {
					end_date = map.get("end_date").toString();
					if (end_date.length() > 10) {
						end_date = end_date.substring(0, 10);
					}
				}
				if (map.get("sale_price") != null) {
			       sale_price = map.get("sale_price").toString();
				}
				if (map.get("commodity_price") != null) {
			       commodity_price = map.get("commodity_price").toString();
				}
			}
			ParamethodMgr paramCom = new ParamethodMgr();
			String price_type = paramCom.getSelectItems("3");
			String select = classBean.getSelectedByComm("5", "1");
		%>
		<form name=classForm action=/doTradeReg.do method=post target="_self">
			<table width="818" border="0" cellspacing="0" cellpadding="0" align="center">
				<tr>
					<td width="115" height="26">
						&nbsp;
					</td>
				</tr>
				<tr>
					<td>
						<table width="93%" border=0 cellpadding=5 cellspacing=1 align=center bgcolor="#dddddd">
							<tr>
								<td class="line1" align="left" colspan="2">
									<bean:message key="str4728"/>
									<input type=hidden name=sale_id value="<%=sale_id%>">
									<input type="hidden" name="web_id" id="web_id" value="000000000000000">
								</td>
							</tr>
							<tr>
								<td width="131" align=right style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;">
									<bean:message key="str4729"/>
								</td>
								<td class="line1" width="751" align=left style="background-color:#ffffff; color:#000000;  font-size:12px; padding:3px 5px;">
									<input type=text name="title" id="title" value="<%=title%>" maxlength="100">
								</td>
							</tr>
							<tr>
								<td height="30" align="right" style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;" valign="top">
									<bean:message key="str4730"/>
								</td>
								<td class="line1" align="left" style="background-color:#ffffff; color:#000000;  font-size:12px;">
									<table border="0" cellpadding="0" cellspacing="0" style="margin-left:15px">
										<tr>
											<td style="background-color:#ffffff; color:#000000;  font-size:12px;">
												<select name="sort1" size="10" style="width: 130px" onChange="setSecondClass(this.value);" onclick="setTypeName(this)">
													<%=select%>
												</select>
											</td>
											<td style="background-color:#ffffff; color:#000000; font-size:12px;">
												<select name="sort2" size="10" style="width: 130px; display: none" onChange="setTherdClass(this.value);" onclick="setTypeName(this)">
													<option value="0">
														<bean:message key="str1079"/>
													</option>
												</select>
											</td>
											<td style="background-color:#ffffff; color:#000000;  font-size:12px;">
												<select name="sort3" size="10" style="width: 130px; display: none" onclick="setTypeName(this)" onchange="cretateSelect('4',this.value)">
													<option value="0">
														<bean:message key="str1079"/>
													</option>
												</select>
											</td>
											<td>
												<div id="nextElement" style="display: none">
													<div id="4" style="width;100px; float:left;display:inline;white-space:nowrap"></div>
													<input type="hidden" name="index_s" id="index_s" value="4">
												</div>
											</td>
										</tr>
									</table>

								</td>
							</tr>
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
									<bean:message key="str4731"/>
								</td>
								<td class="line1" style="background-color:#ffffff; color:#000000;  font-size:12px; padding:3px 5px;" align=left>
									<textarea name=content style="display:none">
										<%=content%>
									</textarea>
									<iframe id="content" src="/www/ewebeditor/ewebeditor.htm?id=content&style=coolblue&root_id=<%=sale_id%>" frameborder="0" scrolling="no" width="600" height="350"></iframe>
								</td>
							</tr>
							<tr>
								<td align=right style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;">
									<bean:message key="str3826"/>
								</td>
								<td align=left style="background-color:#ffffff; color:#000000;  font-size:12px;">
									<div style="padding-left: 0px;padding-bottom: 0px;padding-right: 0px;padding-top: 0px;">
										<iframe src="/inc/uploadImg.jsp?root_id=<%=sale_id%>" width="100%" height="180px" frameborder="0" marginwidth="0" marginheight="0" scrolling="no"></iframe>
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
									<bean:message key="str390"/>
								</td>
								<td class="line1" style="background-color:#ffffff; color:#000000;  font-size:12px; padding:3px 5px;" align=left>
									<input name="start_date" id="start_date" type="text" value="<%=start_date%>" onfocus="setday(this);">
									(yyyy-MM-dd)
								</td>
							</tr>
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
									<bean:message key="str331"/>
								</td>
								<td class="line1" style="background-color:#ffffff; color:#000000;  font-size:12px; padding:3px 5px;" align=left>
									<input name="end_date" id="end_date" type="text" value="<%=end_date%>" onfocus="setday(this);">
									(yyyy-MM-dd)
								</td>
							</tr>
							<tr>
								<td align="right" style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;">
									<bean:message key="str420"/>
								</td>
								<td style="background-color:#ffffff; color:#000000;  font-size:12px;" align="left">
									<select name="price_type" maxlength="25">
										<%=price_type%>
									</select>
								</td>
							</tr>
							<tr>
								<td align="right" style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;">
									<bean:message key="str959"/>
								</td>
								<td class="line1" style="background-color:#ffffff; color:#000000;  font-size:12px; padding:3px 5px;" align="left">
									<input name="sale_price" type="text" value="<%=sale_price%>" onkeyup="if(isNaN(value))execCommand('undo')">
									<bean:message key="str3401"/>
								</td>
							</tr>
							<tr>
								<td align="right" style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;">
									<bean:message key="str3402"/>
								</td>
								<td class="line1" style="background-color:#ffffff; color:#000000;  font-size:12px; padding:3px 5px;" align="left">
									<input name="commodity_price" type="text" value="<%=commodity_price%>" onkeyup="if(isNaN(value))execCommand('undo')">
									<bean:message key="str3401"/>
								</td>
							</tr>
							<tr style = "display:none">
								<td align="right"
									style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;">
									Number of commodities:
								</td>
								<td class="line1"
									style="background-color:#ffffff; color:#000000;  font-size:12px; padding:3px 5px;"
									align="left">
									<input name="sale_num" id="sale_num" type="text" value="<%=sale_num %>"
										onkeyup="if(isNaN(value))execCommand('undo')">
									<bean:message key="str3401"/>
								</td>
							</tr>
							<tr style = "display:none">
								<td align="right"
									style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;">
									Freight£º
								</td>
								<td class="line1"
									style="background-color:#ffffff; color:#000000;  font-size:12px; padding:3px 5px;"
									align="left">
									<input name="carriage_pay" type="text"
										value="<%=carriage_pay%>"
										onkeyup="if(isNaN(value))execCommand('undo')">
									<bean:message key="str3401"/>
								</td>
							</tr>
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
									<bean:message key="str421"/>
								</td>
								<td class="line1" style="background-color:#ffffff; color:#000000;  font-size:12px; padding:3px 5px;" align=left>
									<input type=text name=sale_addr value="<%=sale_addr%>" maxlength="100"><bean:message key="str4732"/>
									<input name="rsrv_str1" id="rsrv_str1" type="hidden" value="0">
									<input type=hidden name=trade_type_code value="0347">
								</td>
							</tr>
							<tr>
								<td align="center" style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;padding-top:10px;padding-bottom:10px;" colspan="2">
									<input class="tjan" name=submit type=submit value="" onclick="return checkInfo()">
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
