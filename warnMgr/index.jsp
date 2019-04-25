<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"

"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.util.*"%>
<jsp:useBean id="comm" class="com.saas.biz.commen.commMethodMgr" scope="page" />
<jsp:useBean id="bean" class="com.saas.biz.commen.ParamethodMgr" scope="page" />
<%@ page import="java.text.SimpleDateFormat"%>
<%
	String menu_id = "";
	if (request.getParameter("menu_id") != null) {
		menu_id = request.getParameter("menu_id");
	}
	String plan_id = comm.GenTradeId();
	String prioritys = bean.getSelectItems("74");
	String security = bean.getSelectItems("71");
	String plan_class = bean.getSelectItems("73");
	String plan_type =bean.getSelectItems("70");
	Calendar cal = Calendar.getInstance();
	String start = new SimpleDateFormat("yyyy-MM-dd").format(cal.getTime());
	cal.add(Calendar.MONTH, 3);
	String end = new SimpleDateFormat("yyyy-MM-dd").format(cal.getTime());
%>
<html>
	<head>
		<title><bean:message key="str1368"/></title>
		<link href="/style/layout.css" rel="stylesheet" type="text/css">
		<link rel="stylesheet" type="text/css" href="../ext/resources/css/ext-all.css" />
		<script type="text/javascript" src="../ext/adapter/ext/ext-base.js"></script>
		<script type="text/javascript" src="../ext/ext-all.js"></script>
		<script type="text/javascript" src="../ext/build/locale/ext-lang-zh_CN.js"></script>
		<script language="javascript" src="/js/Calendar_Ly.js"></script>
		<script type="text/javascript" src="/salesFormMgr/userGird.js"></script>
		
		<style type="text/css">
		.Tree-Img {
		    background-image:url(/img/org.png) !important;
		}
		.root-Img {
		    background-image:url(/img/home.png) !important;
		}
		</style>
		<script type="text/javascript">
		  Ext.onReady(function(){ 
	      var resizeable = new Ext.Resizable('tree-div', {
	            pinned:true,
	            autoWidth:true,
	            autoHeight:true,
	            handles: 'e',
	            widthIncrement:50,
	            minWidth: 50,
				maxWidth:450,
	            dynamic: true
	        });
	     var tree = new Ext.tree.TreePanel({   
		    	el:"tree-div",   
		        autoScroll:false,
		        animate:true,
		        width:'35%',
		        autoHeight:true,
		        enableDD:false,
		        rootVisible:false,
		        containerScroll: true, 
		        loader: new Ext.tree.TreeLoader({
		            dataUrl:'/tree/json_data.jsp'            
		        })
		    });
	    var root = new Ext.tree.AsyncTreeNode({
	        text: "部门",
	        draggable:false,
	        iconCls:'root-Img',
	        id:'000000000000000'
	    });
	    tree.setRootNode(root);
	    tree.render();
	   	root.expand();
	   	tree.on("click",function(node,event){
	   	 document.getElementById("depart_id").value=node.id;
	   	 document.getElementById("depart_name").value=node.text;
	   	});
	   	tree.expandAll();
	   });
	   
	   //空值判断
	    function check_Value(){
	       
	       var depart_name=document.getElementById("depart_name").value;
	       if(depart_name ==null || depart_name ==""){
	        Ext.MessageBox.alert("XSaaS 提示","请填写制定计划的部门名称！");
	        return false;
	       }
	        var title=document.getElementById("title").value;
	       if(title ==null || title ==""){
	        Ext.MessageBox.alert("XSaaS 提示","请填写计划名称！");
	        return false;
	       }
	       var sale_user_name=document.getElementById("sale_user_name").value;
	       if(sale_user_name ==null || sale_user_name ==""){
	        Ext.MessageBox.alert("XSaaS 提示","请填计划负责人！");
	        return false;
	       }else{
	         document.getElementById("planner_name").value=sale_user_name;
	         document.getElementById("planner_id").value=document.getElementById("sale_user_id").value;
	       }
	       return true;
	    }
		</script>
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
																<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;text-align:right" align=right width="15%">
																	<bean:message key="str4181"/>
																</td>
																<td style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left colspan="3" width="85%">
																	<div class="ping">
																		<div id="tree-div"></div>
																		<input type="hidden" name="depart_id" id="depart_id" readonly size="30">
																		<div class="ping">
																</td>
															</tr>
															<tr>
																<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;text-align:right" align=right width=15%>
																	<bean:message key="str4182"/>
																</td>
																<td style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left width=35%>
																	<div class="ping">
																		<input type="text" name="depart_name" id="depart_name" readonly size="25">
																	</div>
																</td>
																<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;text-align:right" align=right width=15%>
																	<bean:message key="str4183"/>
																</td>
																<td style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left width=35%>
																	<div class="ping">
																		<select id="plan_type" name="plan_type">
																			<%=plan_type%>
																		</select>
																	</div>
																</td>
															</tr>
															<tr>
																<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;text-align:right" align=right width=15%>
																	<bean:message key="str4184"/>
																</td>
																<td style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left width=35%>
																	<div class="ping">
																		<input name="title" type="text" id="title" size=30 maxlength=50>
																	</div>
																</td>
																<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;text-align:right" align=right width=15%>
																	<bean:message key="str4185"/>
																</td>
																<td style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left width=35%>
																	<div class="ping">
																		<input type="text" name="sale_user_name" id="sale_user_name" size="15" maxlength="100" readonly>
																		<input type="button" name="ubnt" value="选择" onclick="showUserWind()">
																		<div id="grid5"></div>
																		<input type="hidden" name="sale_user_id" id="sale_user_id" size="25" maxlength="100">
																	</div>
																</td>
															</tr>
															<tr>
																<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;text-align:right" align=right width=15%>
																	<bean:message key="str4186"/>
																</td>
																<td style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left width=35%>
																	<div class="ping">
																		<select id="prioritys" name="prioritys">
																			<%=prioritys%>
																		</select>
																	</div>
																</td>
																<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;text-align:right" align=right width=15%>
																	<bean:message key="str4187"/>
																</td>
																<td style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left width=35%>
																	<div class="ping">
																		<select id="security" name="security">
																			<%=security%>
																		</select>
																	</div>
																</td>
															</tr>
															<tr>
																<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;text-align:right" align=right width=15%>
																	<bean:message key="str4188"/>
																</td>
																<td style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left width=85% colspan="3">
																	<div class="ping1">
																		<select id="plan_class" name="plan_class">
																			<%=plan_class%>
																		</select>
																	</div>
																		<input name="plan_state" type="hidden" id="plan_state" value="0" size="20">
																</td>
															</tr>
															<tr>
																<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;text-align:right" align=right width=15%>
																	<bean:message key="str3831"/>
																</td>
																<td style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left width=35%>
																	<div class="ping">
																		<input name="start_date" type="text" id="start_date" value="<%=start%>" size="10" maxlength="10" onfocus="setday(this);" />
																	</div>
																</td>
																<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;text-align:right" align=right width=15%>
																	<bean:message key="str3832"/>
																</td>
																<td style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left width=35%>
																	<div class="ping1">
																		<input name="end_date" type="text" id="end_date" value="<%=end%>" size="10" maxlength="10" onfocus="setday(this);" />
																	</div>
																</td>
															</tr>
															<tr>
																<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;text-align:right" align=right>
																	<bean:message key="str4190"/>
																</td>
																<td align="left" bgcolor="#FFFFFF" colspan="3">
																	<div class="ping">
																		<textarea name="content" id="content" cols="50" rows="6"></textarea>
																	</div>
																</td>
															</tr>
															<tr>
																<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;text-align:right" align=right>
																	<bean:message key="str2835"/>
																</td>
																<td align="left" bgcolor="#FFFFFF" colspan="3">
																	<div class="ping1">
																		<input name="remark" id="remark" type="text" size=52 maxlength="50" />
																	</div>
																</td>
															</tr>
															<tr>
																<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;padding-top:10px;padding-bottom:10px;text-align:center;" 
																align="center" colspan=4>
																	<input class="tjan" name="submit" type="submit" value="" onclick="return check_Value()">
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
				<input name="plan_id" id="plan_id" type="hidden" value="<%=plan_id%>">
				<input name="trade_type_code" id="trade_type_code" type="hidden" value="1158">
				<input name="planner_name" type="hidden" id="planner_name">
				<input name="planner_id" type="hidden" id="planner_id">
				<input type="hidden" name="rsrv_str1"  value=""> 
				<input type="hidden" name="rsrv_str2"  value=""> 
				<input type="hidden" name="rsrv_str3"  value=""> 
				<input type="hidden" name="rsrv_str4"  value=""> 
				<input type="hidden" name="rsrv_str5"  value=""> 
				<input type="hidden" name="rsrv_str6"  value=""> 
				<input type="hidden" name="rsrv_str7"  value=""> 
				<input type="hidden" name="rsrv_str8"  value=""> 
				<input type="hidden" name="rsrv_str9"  value=""> 
				<input type="hidden" name="rsrv_str10" value=""> 
				<input type="hidden" name="plan_state" value=""> 
				<input type="hidden" name="state_resean" value="新增计划">
				<tr>
					<td align="center">
						<div class="bottom_admin">
							<%@ include file="/bottom.jsp"%>
						</div>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>



