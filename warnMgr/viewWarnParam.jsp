<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"

"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.util.*"%>
<jsp:useBean id="comm" class="com.saas.biz.warnparaMgr.WarnparaInfo" scope="page" />
<jsp:useBean id="goodsBean" class="com.saas.biz.goodsMgr.GoodsInfo" scope="page" />
<jsp:useBean id="houseBean" class="com.saas.biz.wareHouseMgr.wareHouseInfo" scope="page" />
<jsp:useBean id="posBean" class="com.saas.biz.wareHousePosMgr.WareHousePosInfo" scope="page" />
<jsp:useBean id="bean" class="com.saas.biz.commen.ParamethodMgr" scope="page" />
<%@ page import="java.text.SimpleDateFormat"%>
<%
	String param_id="";
	if(request.getParameter("param_id")!=null){
	  param_id=request.getParameter("param_id");
	}
	HttpSession  logsession = request.getSession(); 
    String cust_id = "";
    if (logsession.getAttribute("SESSION_CUST_ID") != null)
    {
        cust_id = logsession.getAttribute("SESSION_CUST_ID").toString();
    }
	Calendar cal = Calendar.getInstance();
	String start = new SimpleDateFormat("yyyy-MM-dd").format(cal.getTime());
	cal.add(Calendar.MONTH, 3);
	String end = new SimpleDateFormat("yyyy-MM-dd").format(cal.getTime());
	HashMap map=comm.getWarnParamById(param_id);
	String param_name=map.get("param_name").toString();
	String param_type="",param_value="",sum_type="",param_door="",remark="",mod_type="",quo_id="",post="";
	if(map.get("param_value")!=null){
	  param_value=map.get("param_value").toString();
	}
	if(map.get("param_type")!=null){
	  param_type=map.get("param_type").toString();
	  if(param_type =="0" || param_type.equals("0")){param_type="数量";}
	  else if(param_type =="1" || param_type.equals("1")){param_type="时间";}
	  else if(param_type =="2" || param_type.equals("2")){
	   param_type="位置";
	   if(param_value.length()>0){
		  quo_id=param_value.substring(0,param_value.length()-2);
		  post=param_value.substring(param_value.length()-1,param_value.length());
		  if(post.equals("p")|| post=="p"){
		    param_value=posBean.getPosNameById(cust_id,quo_id);
		  }else{
		    param_value=houseBean.getHouseNameById(cust_id,quo_id);
		  }
	   }
	  }
	  else if(param_type =="3" || param_type.equals("3")){
	   param_type="物料种类";
	   if(param_value.length()>0){
		  quo_id=param_value.substring(0,param_value.length()-2);
		  HashMap goods_Map=goodsBean.getOneGoods(cust_id,quo_id);
		  if(goods_Map.get("goods_name")!=null){
		    param_value=goods_Map.get("goods_name").toString();
		  }
	   }
	  }
	}
	if(map.get("sum_type")!=null){
	  sum_type=map.get("sum_type").toString();
	  if(sum_type=="0" || sum_type.equals("0")){sum_type="或运算";}
      else if(sum_type=="1" || sum_type.equals("1")){sum_type="与运算";}
    }
	if(map.get("remark")!=null){
	  remark=map.get("remark").toString();
	}
	if(map.get("param_door")!=null){
	  param_door=map.get("param_door").toString();
	}
	if(map.get("mod_type")!=null){
	  mod_type=map.get("mod_type").toString();
	  mod_type=bean.getParamNameByValue("87",mod_type);
	}
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
%>
<html>
	<head>
		<title>XSaaS-预警参数管理</title>
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
																	预警参数名称：
																</td>
																<td style="background-color:#ffffff; color:#000000;  font-size:12px;" align="left" width="80%">
																	<div class="ping1">
																	<%=param_name%>
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
																	参数类型：
																</td>
																<td style="background-color:#ffffff; color:#000000;  font-size:12px;" align="left" width="80%">
																	<div class="ping1">
																	 <%=param_type%>
																	</div>
																</td>
															</tr>
															<tr>
																<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;text-align:right" align=right width="20%">
																	<%=param_value%>：
																</td>
																<td style="background-color:#ffffff; color:#000000;  font-size:12px;" align="left" width="80%">
																	<div class="ping1">
																	   <%=param_value%>
																	</div>
																</td>
															</tr>
															<tr>
																<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;text-align:right" align=right width="20%">
																	告警值：
																</td>
																<td style="background-color:#ffffff; color:#000000;  font-size:12px;" align="left" width="80%">
																	<div class="ping1">
																	  <%=param_door%>
																	</div>
																</td>
															</tr>
															<tr>
																<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;text-align:right" align=right width="20%">
																	运算方式：
																</td>
																<td style="background-color:#ffffff; color:#000000;  font-size:12px;" align="left" width="80%">
																	<div class="ping1">
																	<%=sum_type%>
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
																	备注：
																</td>
																<td align=left bgcolor="#FFFFFF">
																	<div class="ping1">
																		<%=remark%>
																	</div>
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



