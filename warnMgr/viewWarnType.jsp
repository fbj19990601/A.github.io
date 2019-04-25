<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"

"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.util.*"%>
<jsp:useBean id="comm" class="com.saas.biz.warntypeMgr.WarnTypeInfo" scope="page" />
<jsp:useBean id="bean" class="com.saas.biz.commen.ParamethodMgr" scope="page" />
<%@ page import="java.text.SimpleDateFormat"%>
<%
   String mod_id="";
   if(request.getParameter("mod_id")!=null){
     mod_id=request.getParameter("mod_id");
   }
	HashMap map=comm.getWarnTypeById(mod_id);
	String mod_name=map.get("mod_name").toString();
	String mod_type="",warn_circle="",exec_date="",warn_type="",start="",end="",remark="";
	if(map.get("mod_type")!=null){mod_type=map.get("mod_type").toString();mod_type=bean.getParamNameByValue("87",mod_type);}
	if(map.get("warn_circle")!=null){warn_circle=map.get("warn_circle").toString();warn_circle=bean.getParamNameByValue("86",warn_circle);}
	if(map.get("exec_date")!=null){exec_date=map.get("exec_date").toString();
	if(exec_date.length()>10){exec_date=exec_date.substring(0,10);}}
	if(map.get("warn_type")!=null){warn_type=map.get("warn_type").toString();
	if(warn_type=="0" || warn_type.equals("0")){warn_type="E-mail";}
    else if(warn_type=="1" || warn_type.equals("1")){warn_type="底部通知";}
    else if(warn_type=="2" || warn_type.equals("2")){warn_type="手工查询";}}
    if(map.get("start_date")!=null){
      start=map.get("start_date").toString();
      if(start.length()>10){
       start=start.substring(0,10);
      }
    }
    if(map.get("end_date")!=null){
      end=map.get("end_date").toString();
      if(end.length()>10){
       end=end.substring(0,10);
      }
    }
	if(map.get("remark")!=null){remark=map.get("remark").toString();}
%>
<html>
	<head>
		<title>XSaaS-预警参数</title>
		<link href="/style/layout.css" rel="stylesheet" type="text/css">
		<script language="javascript" src="/js/Calendar_Ly.js"></script>
		<script type="text/javascript" src="/js/prototype.js"></script>
	</head>
	<body>
		<form name=resumeForm action=/doTradeReg.do method=post target="_self">
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
											<table width="100%" border="0" cellspacing="0" cellpadding="0">
												<tr>
													<td height="2"></td>
												</tr>
												<tr>
													<td valign="top">
														<table width=100% border=0 cellpadding=5 cellspacing=1 align=center bgcolor="#dddddd">
															<tr>
																<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;text-align:right" align=right width="20%">
																	预警模式名称：
																</td>
																<td style="background-color:#ffffff; color:#000000;  font-size:12px;" align="left" width="80%">
																	<div class="ping1">
																	 <%=mod_name%>
																	</div>
																</td>
															</tr>
															<tr>
																<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;text-align:right" align=right width="20%">
																	预警模式类型：
																</td>
																<td style="background-color:#ffffff; color:#000000;  font-size:12px;" align="left" width="80%">
																	<div class="ping1">
																	<%=mod_type%>
																	</div>
																</td>
															</tr>
															<tr>
																<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;text-align:right" align=right width="20%">
																	预警类型：
																</td>
																<td style="background-color:#ffffff; color:#000000;  font-size:12px;" align="left" width="80%">
																	<div class="ping1">
																	<%=warn_type%>
																	</div>
																</td>
															</tr>
															<tr>
																<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;text-align:right" align=right width="20%">
																	告警周期：
																</td>
																<td style="background-color:#ffffff; color:#000000;  font-size:12px;" align="left" width="80%">
																	<div class="ping1">
																	<%=warn_circle%>
																	</div>
																</td>
															</tr>
															<tr>
																<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
																	开始日期：
																</td>
																<td align=left bgcolor="#FFFFFF">
																	<div class="ping1">
																		<%=start%>
																	</div>
																</td>
															</tr>
															<tr>
																<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
																	结束日期：
																</td>
																<td align=left bgcolor="#FFFFFF">
																	<div class="ping1">
																		<%=end%>
																	</div>
																</td>
															</tr>
															<tr>
																<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
																	告警时间：
																</td>
																<td align=left bgcolor="#FFFFFF">
																	<div class="ping1">
																		<%=exec_date%>
																	</div>
																</td>
															</tr>
															<tr>
																<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
																	备注：
																</td>
																<td align=left bgcolor="#FFFFFF">
																	<div class="ping1">
																		<%=remark%>
																	</div>
																</td>
															</tr>
															<tr>
																<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;padding-top:10px;padding-bottom:10px;text-align:center;" align="center" colspan="2">
																</td>
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
			</table>
		</form>
	</body>
</html>



