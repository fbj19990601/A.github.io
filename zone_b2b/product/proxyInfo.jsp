<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.util.*"%>
<jsp:useBean id="bean" class="com.saas.biz.commen.ParamethodMgr" scope="page" />
<jsp:useBean id="categoryBean" class="com.saas.biz.ProcessMgr.ProcessInfo" scope="page" />
<jsp:useBean id="attach" class="com.saas.biz.attachMgr.Attachinfo" scope="page" />
<jsp:useBean id="cust" class="com.saas.biz.organizeMgr.OrganizeInfo" scope="page" />
<jsp:useBean id="level" class="com.saas.biz.custMgr.CustClass" scope="page" />
<%@ page import="com.saas.biz.custMgr.Custinfo"%>
<%@ page import="com.saas.biz.newsMgr.NewsInfo"%>

<%@ page import="com.saas.biz.enquirydealMgr.EnquirydInfo"%>
<%
	String category_id = "", type = "",iStart="1";
	if (request.getParameter("category_id") != null) {
		category_id = request.getParameter("category_id");
	}
	if (request.getParameter("type") != null) {
		type = request.getParameter("type");
	}
	
	if (request.getParameter("iStart") != null) {
		iStart = request.getParameter("iStart");
	}
	
	String category_name = bean.getParamNameByValue("105", type);
	String file_path = "/zone_b2b/images/cp.gif", cust_class = "";
	ArrayList list = categoryBean.genOneProcess(category_id);
	HashMap cateMap = new HashMap();
	if (list != null && list.size() > 0) {
		cateMap = (HashMap) list.get(0);
	}
	ArrayList attaList = attach.getAttachInfoByList(category_id);
	if (attaList != null && list.size() > 0) {
		HashMap attachMap = (HashMap) list.get(0);
		if (attachMap.get("file_path") != null) {
			file_path = attachMap.get("file_path").toString();
			file_path = file_path.substring(23);
		}
	}
	String publish_name = "", cust_id = "", category_title = "", category_date = "", end_date = "", category_desc = "", category_abstract = "", category_addr = "";
	if (cateMap.get("cust_id") != null) {
		cust_id = cateMap.get("cust_id").toString();
		publish_name = cust.getCustNameById(cust_id);
		cust_class = level.cust_Class_Name(cust_id);
	}
	if (cateMap.get("category_title") != null) {
		category_title = cateMap.get("category_title").toString();
	}
	if (cateMap.get("category_desc") != null) {
		category_desc = cateMap.get("category_desc").toString();
	}
	if (cateMap.get("category_abstract") != null) {
		category_abstract = cateMap.get("category_abstract").toString();
	}
	if (cateMap.get("category_addr") != null) {
		category_addr = cateMap.get("category_addr").toString();
	}
	if (cateMap.get("publish_date") != null) {
		category_date = cateMap.get("publish_date").toString();
		if (category_date.length() > 10) {
			category_date = category_date.substring(0, 10);
		}
	}
	if (cateMap.get("end_date") != null) {
		end_date = cateMap.get("end_date").toString();
		if (end_date.length() > 10) {
			end_date = end_date.substring(0, 10);
		}
	}
	
	Custinfo in = new Custinfo();
	NewsInfo info = new NewsInfo();
	ArrayList List2 = in.getCustById();
	ArrayList List1 = info.getNewCastById();
	EnquirydInfo ei = new EnquirydInfo();
	ArrayList List3 =ei.getEnquiryNewByList(Integer.parseInt(iStart),5, category_id);
	
	HttpSession logsession = request.getSession();
	String s_cust_id = "", s_user_id = "";
	if (logsession.getAttribute("SESSION_CUST_ID") != null) {
		s_cust_id = (String) logsession.getAttribute("SESSION_CUST_ID");
		s_user_id = (String) logsession.getAttribute("SESSION_USER_ID");
	}
%>
<html>
	<head>
		<title><%=category_title%></title>
		<link href="/zone_b2b/css/css.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript">
		  function checkContent(){
		     var content=document.getElementById("content").value;
		     var rsrv_str5=document.getElementById("rsrv_str5").value;
		     if(content==null || content==""){
		        alert("����д�������,��վ��ӭ����������ۣ�");
		        return false;
		     }else if(content.length>250){
		       alert("�������ݲ���̫�������Զ�η���������ۣ�");
		       return false;
		     }
		    return true;
		  }
		</script>
	</head>
	<body>
		<jsp:include flush="true" page="/zone_b2b/top.jsp" />
		<table width="980" height="10" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td></td>
			</tr>
		</table>
		<form name="classForm" method="post" action="/doTradeReg.do" target="_self">
			<table width="980" border="0" align="center" cellpadding="0" cellspacing="0">
				<tr>
					<td width="680" valign="top">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td valign="top">
									<table width="100%" border="0" cellpadding="4" cellspacing="1" bgcolor="DBECF4">
										<tr>
											<td height="26" valign="top" background="/zone_b2b/images/xian4.gif" bgcolor="#FFFFFF">
												����ǰ��λ��:
												<img src="/zone_b2b/images/lujian.gif" border="0">
												<a href="/" class="lanse">��ҳ</a>
												<img src="/zone_b2b/images/lujian.gif" border="0">
												<%=category_name%>
											</td>
										</tr>
									</table>
									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td height="5"></td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
						<table width="100%" border="0" cellpadding="20" cellspacing="1" bgcolor="DBECF4">
							<tr>
								<td height="923" valign="top" bgcolor="#FFFFFF">
									<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
										<tr>
											<td align="left" width="50%">
												<img src="<%=file_path%>" width="200" height="200" border="0">
											</td>
											<td align="left" width="50%" style="float: left;">
												<table width="100%" border="0" align="left" cellpadding="0" cellspacing="0">
													<tr>
														<td height="32" align="left" width="25%">
															<span class="zi">�ͻ�����:</span>
														</td>
														<td width="75%"><%=publish_name%></td>
													</tr>
													<tr>
														<td height="32" align="left">
															<span class="zi">�ͻ�����:</span>
														</td>
														<td><%=cust_class%></td>
													</tr>
													<tr>
														<td height="32" align="left">
															<span class="zi">��Ϣ����:</span>
														</td>
														<td height="32" align="left">
															<%=category_title%>
														</td>
													</tr>
													<tr>
														<td height="32" align="left">
															<span class="zi">����ʱ��:</span>
														</td>
														<td height="32" align="left">
															<%=category_date%>
														</td>
													</tr>
													<tr>
														<td height="32" align="left">
															<span class="zi">������ַ:</span>
														</td>
														<td height="32" align="left">
															<%=category_addr%>
														</td>
													</tr>
												</table>
											</td>
										</tr>
									</table>
									<br>
									<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
										<tr>
											<td valign="top" class=wz20 id=zoom>
												[������Ϣ����]&nbsp;
												<%=category_desc%>
												<BR>
											</td>
										</tr>
									</table>
									<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
										<tr>
											<td valign="top" class=wz20 id=zoom>
												[������Ϣ����]&nbsp;
												<%=category_abstract%>
												<BR>
											</td>
										</tr>
									</table>
									<TABLE width="95%" border=0 align="center" cellPadding=0 cellSpacing=0 class=xian>
										<TBODY>
											<TR>
												<TD height=10></TD>
											</TR>
										</TBODY>
									</TABLE>
									<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
										<%
												if (List3 != null && List3.size() > 0) {
												for (int i = 0; i < List3.size(); i++) {
													HashMap map = (HashMap) List3.get(i);
													String rsrv_str5 = "", enquiry_date = "", enquiry_content = "";
													if (map.get("rsrv_str5") != null) {
												rsrv_str5 = map.get("rsrv_str5").toString();
													}
													else {
												rsrv_str5 = "�ο�";
													}
													if (map.get("enquiry_content") != null) {
												enquiry_content = map.get("enquiry_content").toString();
													}
													if (map.get("enquiry_date") != null) {
												enquiry_date = map.get("enquiry_date").toString();
												if (enquiry_date.length() > 10) {
													enquiry_date = enquiry_date.substring(0, 10);
												}
													}
										%>
										<tr>
											<td>
												<span class="leftbt14"><%=rsrv_str5%> </span>
												<%=enquiry_date%>
												<BR>
												<span style="padding-left: 10px; font-style: inherit"><%=enquiry_content%> </span>
											</td>
										</tr>
										<%
											}
											}
										%>
										<tr>
											<td style="color: red;">
												ע�⣺
												<span style="font-weight: bold;">�벻Ҫ�������к��������޹صĹ�����ӣ�Υ�߷�IP��</span>
											</td>
										</tr>
										<tr>
											<td>
												����������:
												<INPUT name="rsrv_str5" id="rsrv_str5" size="23" maxLength="50">
											</td>
										</tr>
										<tr>
											<td>
												<TEXTAREA id="content" name="content" rows="6" cols="75"></TEXTAREA>
											</td>
										</tr>
										<tr>
											<td>
												<input type="hidden" name="cust_id" name="cust_id" value="<%=s_cust_id%>">
												<input type="hidden" name="user_id" name="user_id" value="<%=s_user_id%>">
												<input type="hidden" name="session_user_id" name="session_user_id" value="<%=s_user_id%>">
												<input type="hidden" name="sale_id" name="sale_id" value="<%=category_id%>">
												<input type="hidden" name="deal_tag" name="deal_tag" value="6">
												<input type="hidden" name="rsrv_str3" name="rsrv_str3" value="">
												<input type="hidden" name="rsrv_str4" name="rsrv_str4" value="">
												<input type="hidden" id="trade_type_code" name="trade_type_code" value="1308">
											</td>
										</tr>
										<tr>
											<td>
												<label>
													<input type="submit" name="Submit2" value="ȷ�Ϸ�������" onclick=" return checkContent()">
												</label>
											</td>
										</tr>
										<tr>
											<td>
												&nbsp;
											</td>
										</tr>
										<tr>
											<td class="time">
												������֪��
												<BR>
												һ���������±������ء����������ӹ���������涨����
												<BR>
												�����Ͻ��������������Ϣ����˾���ܡ���Ʒ��Ϣ�ȹ��������Ϣ��
												<BR>
												�����Ͻ������ظ�������
												<BR>
												�ġ��Ͻ��Ը��ˡ�ʵ�塢���塢���ҵȽ����������̰���
											</td>
										</tr>
									</table>
									<TABLE width="95%" border=0 align="center" cellPadding=0 cellSpacing=0 class=xian>
										<TBODY>
											<TR>
												<TD height=36></TD>
											</TR>
										</TBODY>
									</TABLE>
								</td>
							</tr>
						</table>
					</td>
					<td valign="top">
						&nbsp;
					</td>
					<td width="290" valign="top">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="2">
									<img src="/zone_b2b/images/zixun_08.gif" width="2" height="29">
								</td>
								<td background="/zone_b2b/images/zixun_09.gif">
									<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
										<tr>
											<td width="5%">
												<img src="/zone_b2b/images/lujian.gif" width="5" height="9" />
											</td>
											<td class="btlanse">
												������Ѷ����
											</td>
										</tr>
									</table>
								</td>
								<td width="2">
									<img src="/zone_b2b/images/zixun_11.gif" width="2" height="29">
								</td>
							</tr>
						</table>
						<table width="100%" border="0" cellpadding="5" cellspacing="1" bgcolor="94C3DD">
							<tr>
								<td height="220" valign="top" bgcolor="#FFFFFF">
									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<%
												if (List1 != null && List1.size() > 0) {
												for (int i = 0; i < List1.size(); i++) {
													HashMap map = (HashMap) List1.get(i);
													String title = "", news_idx = "";
													if (map.get("news_id") != null) {
												news_idx = map.get("news_id").toString();
													}
													if (map.get("title") != null) {
												title = map.get("title").toString();
													}
										%>
										<tr>
											<td>
												��
												<a href="zixun_list_content.jsp?news_id=<%=news_idx%>" class="lanse"><%=title%> </a>
											</td>
										</tr>
										<%
											}
											}
										%>
									</table>
								</td>
							</tr>
						</table>
						<table width="100%" border="0" cellspacing="0" cellpadding="0" style="display: none">
							<tr>
								<td width="2">
									<img src="/zone_b2b/images/zixun_08.gif" width="2" height="29">
								</td>
								<td background="/zone_b2b/images/zixun_09.gif">
									<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
										<tr>
											<td width="5%">
												<img src="/zone_b2b/images/lujian.gif" width="5" height="9" />
											</td>
											<td width="95%" class="btlanse">
												�༭�Ƽ�
											</td>
										</tr>
									</table>
								</td>
								<td width="2">
									<img src="/zone_b2b/images/zixun_11.gif" width="2" height="29">
								</td>
							</tr>
						</table>
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="2">
									<img src="/zone_b2b/images/zixun_08.gif" width="2" height="29">
								</td>
								<td background="/zone_b2b/images/zixun_09.gif">
									<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
										<tr>
											<td width="5%">
												<img src="/zone_b2b/images/lujian.gif" width="5" height="9" />
											</td>
											<td width="95%" class="btlanse">
												�Ƽ���Ӧ��
											</td>
										</tr>
									</table>
								</td>
								<td width="2">
									<img src="/zone_b2b/images/zixun_11.gif" width="2" height="29">
								</td>
							</tr>
						</table>
						<table width="100%" border="0" cellpadding="5" cellspacing="1" bgcolor="94C3DD">
							<tr>
								<td height="160" valign="top" bgcolor="#FFFFFF">
									<table width="100%" border="0" cellpadding="0" cellspacing="0">
										<%
												if (List2 != null && List2.size() > 0) {
												for (int i = 0; i < List2.size(); i++) {
													HashMap map = (HashMap) List2.get(i);
													String cust_name = "", news_cust_id = "", level_name = "";
													if (map.get("cust_id") != null) {
												news_cust_id = map.get("cust_id").toString();
													}
													if (map.get("cust_name") != null) {
												cust_name = map.get("cust_name").toString();
													}
													if (cust_name.length() > 13) {
												cust_name = cust_name.substring(0, 13);
													}
													if (map.get("para_code2") != null) {
												level_name = map.get("para_code2").toString();
													}
										%>
										<!--/�ظ�-->
										<tr>
											<td>
												��
												<a href="/zone_b2b/enterprise/customer/<%=news_cust_id%>/" target=_blank class="lanse"><%=cust_name%> </a>
											</td>
											<td>
												<%=level_name%>
											</td>
										</tr>
										<!--�ظ�/-->
										<%
											}
											}
										%>
									</table>
								</td>
							</tr>
						</table>
						<table width="100%" border="0" cellspacing="0" cellpadding="0" style="display: none">
							<tr>
								<td width="2">
									<img src="/zone_b2b/images/zixun_08.gif" width="2" height="29">
								</td>
								<td background="/zone_b2b/images/zixun_09.gif">
									<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
										<tr>
											<td width="5%">
												<img src="/zone_b2b/images/lujian.gif" width="5" height="9" />
											</td>
											<td width="95%" class="btlanse">
												��Ʒ�Ƽ�
											</td>
										</tr>
									</table>
								</td>
								<td width="2">
									<img src="/zone_b2b/images/zixun_11.gif" width="2" height="29">
								</td>
							</tr>
						</table>
					<td>&nbsp;pag
				</tr>
			</table>
			<jsp:include flush="true" page="/zone_b2b/footer.jsp" />
		</form>
	</body>
</html>
