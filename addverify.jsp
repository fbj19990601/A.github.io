<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.util.*"%>
<jsp:useBean id="comm" class="com.saas.biz.commen.commMethodMgr" scope="page" />
<jsp:useBean id="param" class="com.saas.biz.commen.ParamethodMgr" scope="page" />
<%@ page import="com.saas.biz.commen.ParamethodMgr"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="com.saas.biz.verifyMgr.VerifyInfo"%>
<%
	//String verify_id = comm.GenTradeId();
	
//	Calendar cal = Calendar.getInstance();
//	String req_date = new SimpleDateFormat("yyyy-MM-dd").format(cal.getTime());

	String param_attr=param.getSelectItems("100");
 
	HttpSession logsession = request.getSession();
	String cust_id = "";
	String iStart = "0";
	String meun_idx = "";
	if (request.getParameter("iStart") != null) {
		iStart = request.getParameter("iStart");
	}
	if (logsession.getAttribute("SESSION_CUST_ID") != null) {
		cust_id = logsession.getAttribute("SESSION_CUST_ID").toString();
	}
	if (request.getParameter("menu_id") != null) {
		meun_idx = request.getParameter("menu_id");
		logsession.setAttribute("menu_id", meun_idx);
	}
	if (logsession.getAttribute("menu_id") != null) {
		meun_idx = (String) logsession.getAttribute("menu_id");
	}

	
	/*****************************************/
	VerifyInfo verifyList = new VerifyInfo();
	ArrayList linkArray = verifyList.genCustVerifyByCust_id(Integer.valueOf(iStart).intValue(), cust_id);
	int counter = verifyList.getVerifyNumber(cust_id);
	int pages = counter / 30 + 1;
	int pageUp = 0, pageDown = 0;
	int currenPage = Integer.valueOf(iStart).intValue();
	if (pages > currenPage) {
		if (currenPage > 0) {
			pageUp = currenPage - 1;
		}
		pageDown = currenPage + 1;
	} else if (pages == currenPage) {
		pageUp = currenPage - 1;
		pageDown = currenPage;
	}
	 
   	ParamethodMgr comparList = new ParamethodMgr();
  	 
//	HashMap verify_Map = comparList.getCompareInfoByCode("B2B", "verify_status");
%>
<html>
	<head>
		<meta name="Generator" content="Easy Struts Xslt generator for Eclipse (http://easystruts.sf.net).">
		<title>电子商务平台</title>
		<link href="/style/css.css" rel="stylesheet" type="text/css">
		<style type="text/css">
		.line6 {width:72spx; width:70spx!important;border:#ffcb99 1px solid; font-weight:bold; background-color:#fff8ee; text-align:left; padding-left: 20px;padding-top: 10px;padding-bottom: 10px; color:#000000; margin-top:13px;}   /*横栏样式6---- 头部提醒1*/
		.line6 .img{width:53px; height:53px; float:left; margin-right:20px;}
		.line6 .title {font-size:14px; font-weight:bold; color:#ff5400;}
		.line1 {border-left:#ff7300 3px solid; background-color:#e2e2e2; color:#333333;text-align:left; font-size:12px;}  /*横栏样式1*/
		.td{background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;}
		</style>
		<link href="/style/layout.css" rel="stylesheet" type="text/css">
		<link href="/style/daohang.css" rel="stylesheet" type="text/css">
		<link href="/style/manager.css" rel="stylesheet" type="text/css">
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
		<table width="727" border="0" cellspacing="0" cellpadding="0" align=center>
			<tr>
				<td height="13"></td>
			</tr>
			<tr>
				<td>
					<table width="100%" border=0 cellpadding=2 cellspacing=1 align=center bgcolor="#e7e7e7">
						<tr class="line1">
							<td  align="center" class="line1" width="15%">验证类型</td>
							<td  align="center" width="15%">验证名称</td>
							<td  align="center" width="15%">验证状态</td>
						  <td  align="center" width="15%">查看详细</td>
							<td  align="center" width="15%">申请时间</td>
							<td  align="center" width="10%">修改验证</td>
						</tr>
						<%
						if(linkArray != null && linkArray.size() > 0) 
						{
							for(int i=0;i<linkArray.size();i++) 
							{
								HashMap map = (HashMap) linkArray.get(i);
								String verify_id = map.get("verify_id").toString();
								String verify_name=map.get("verify_name").toString();
							//	String req_desc=map.get("req_desc").toString(); 
								String verify_status="",status="";
								String req_date = "",	verify_type="",para_code1="";
								if( map.get("verify_type" ) != null) 
								{
								    para_code1 = map.get("verify_type").toString();
									 	verify_type = param.getParamNameByValue( "100",para_code1);
								}
								if(map.get("verify_status") != null) 
								{
							    verify_status = map.get("verify_status").toString();
							    if( verify_status == "0" || verify_status.equals("0") )
							    {
							    	status="新申请";
							    }
							   else if(verify_status=="1"||verify_status.equals("1"))
							   	{
							   	   status="申请通过";
							   	}
							   else
							  	status="申请未通过";
							    	
									//if (verify_Map.get(verify_status)!=null) {
									//	verifytype =verify_Map.get(verify_status).toString();
									//}
									
								}
							
								if(map.get("req_date") != null) {
								   req_date = map.get("req_date").toString();
									if (req_date.length() > 10) {
										req_date = req_date.substring(0, 10);
									}
								}
									%>
									<tr style="background-color:#f9f9f9; ">
										<td style=" color:#000000;" align="left"><%=verify_type%></td>
										<td style=" color:#000000;" align="left"><%=verify_name%></td>
										<td style=" color:#000000;" align="center"><%=status%></td>
										<td style=" color:#000000;" align=center>
											<a href="viewVerifyInfo.jsp?verify_id=<%=verify_id%>" TARGET=appwin onclick="mydefss()"><img src=/img/view.gif width=16 height=16 border=0 alt="查看详情信息"></a>
										</td>
									
										<td style=" color:#000000;" align="center"><%=req_date%></td>
										<td style=" color:#000000;" align=center>
											<a href="modifyVerify.jsp?verify_id=<%=verify_id%>" TARGET=appwin onclick="mydefss()"><img src=/img/edit.gif width=16 height=16 border=0  alt="修改状态"></a>
										</td>
										
									</tr>
									<%
								}
						%>
						<tr>
							<td align="left" class="line1" colspan="3" style="font-weight:normal;">共<%=counter%>条 &nbsp;共<%=pages%>页</td>
							<td align="right" class="td" colspan="4"><a href="modifyAdvertIndex.jsp?iStart=0&meun_id=<%=meun_idx%>">首页</a>&nbsp; &nbsp;
							  <a href="addverify.jsp?iStart=<%=pageUp%>&meun_id=<%=meun_idx%>">上一页</a> &nbsp;
							  <a href="addverify.jsp?iStart=<%=pageDown%>&meun_id=<%=meun_idx%>">下一页 </a>&nbsp;
							  <a href="addverify.jsp?iStart=<%=pages%>&meun_id=<%=meun_idx%>">尾页</a>
							</td>
						</tr>
						<%
						}
						%>
					</table>
				</td>
			</tr>
		</table>
	</body>
</html>
