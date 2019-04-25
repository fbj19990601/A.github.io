<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="java.util.*"%>
<%@ page contentType="text/html;charset=GBK"%>
<jsp:useBean id="bean" class="com.saas.biz.commen.ParamethodMgr" scope="page" />
<jsp:useBean id="comm" class="com.saas.biz.commen.commMethodMgr" scope="page" />
<%@ page import="com.saas.biz.AreaInfoMgr.AreaInfo"%>
<%@ page import="com.saas.biz.entityclassMgr.EntityClassInfo"%>
<%
	String channels_type=bean.getSelectItems("64");
	HttpSession httpSess=request.getSession();
	String cust_id=(String)httpSess.getAttribute("SESSION_CUST_ID");
	AreaInfo area=new AreaInfo();
	Map country_Map=new HashMap();
    country_Map=area.getAreaByParent("5J2mc0X0G85BH");
    EntityClassInfo entityClass=new EntityClassInfo();
%>
<html>

	<head>
		<title><bean:message key="str4663"/></title>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/NewAreaList.js'></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/AreaInfo.js'></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/engine.js'></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/util.js'></script>
		<link href="/style/layout.css" rel="stylesheet" type="text/css">
		<script language="javascript" src="/js/Calendar_Ly.js"></script>
		<script type="text/javascript" src="/js/prototype.js"></script>
		<link rel="stylesheet" type="text/css" href="../ext/resources/css/ext-all.css" />
		<script type="text/javascript" src="../ext/adapter/ext/ext-base.js"></script>
		<script type="text/javascript" src="../ext/ext-all.js"></script>
		<script type="text/javascript" src="setchannal.js"></script>
		<style type="text/css">
		.Tree-Img {
		    background-image:url(/img/org.png) !important;
		}
		.root-Img {
		    background-image:url(/img/home.png) !important;
		}
      </style>
    <script type="text/javascript">
		
			 function confirmsub(){
			     if(document.getElementById("channels_type").value=="" || document.getElementById("channels_type").value==null){
			       alert("请选择渠道类型！");
			       return false;
			     }
			     if(document.getElementById("channels_id").value=="" || document.getElementById("channels_id").value==null){
			       alert("请选择渠道片区！");
			       return false;
			     }
			     if(document.getElementById("province").value=="请选择.."){
			       alert("请选择行政片区！");
			       return false;
			     }
			     return true;
			 }
		</script>
	</head>
	<body>
		<form name=resumeForm action=/doTradeReg.do method=post target="_self">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="2"></td>
				</tr>
				<tr>
					<td valign="top">
						<table width=100% border=0 cellpadding=5 cellspacing=1 align=center bgcolor="#dddddd">
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right> 
									<bean:message key="str4068"/> 
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping">
										<select name="channels_type" id="channels_type">
											<%=channels_type%>
										</select> 
										&nbsp; <br></div>
								</td>
							</tr>
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
								<bean:message key="str4656"/>
								</td>
								<td  align=left bgcolor="#FFFFFF">
									<div class="ping">
										<div id="tree-div"></div>
									</div>
								</td>
							</tr>
							<tr>
							  	<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
							  		<bean:message key="str4664"/>
							  	</td>
								<td  align=left bgcolor="#FFFFFF">
									 <div class="ping">
								              <font style="font-weight:bolder;"><bean:message key="str1047"/></font>
				   								 <select name="province" id="province" onclick="setCitys(this.value)">
				   									<option value="请选择.."><bean:message key="str1048"/></option>
													<%
														if (country_Map != null && country_Map.size() > 0)
														{
															Iterator it = country_Map.entrySet().iterator();
															while (it.hasNext()) {
															Map.Entry entry = (Map.Entry) it.next();
															Object key = entry.getKey();
															Object value = entry.getValue();
															%>
															<option value=<%=key%>>
																<%=value%>
															</option>
															<%
													     }
									 			     }
							  	 					%>
				    						     </select>
												   <font style="font-weight:bolder;"><bean:message key="str1049"/></font>
													 <select name="eparchy_code" id="eparchy_code" style="display:inline"  onclick="setAreas(this.value)">
				             							<option value="请选择.."><bean:message key="str1050"/></option>
				      	 							</select>
				        						<font style="font-weight:bolder;"><bean:message key="str1051"/></font>
				      	 							<select name="city" id="city" style="display:inline" onclick="setAreaCode()">
				             							<option value="请选择.."><bean:message key="str1050"/></option>
				           				 </select>
				           		  </div>
								</td>
            				</tr>
							
							<input name="up_channels_id" id="up_channels_id" type="hidden" value="000000000000000"/>
							<input name="cust_id" id="cust_id" type="hidden" value="<%=cust_id%>"/>
							<input name="channels_level" id="channels_level" type="hidden" value="0"/>
							<input name="channels_id" id="channels_id" type="hidden"/>
                            <input name="area_name" id="area_name" type="hidden"/>
                            <input name="area_code" id="area_code" type="hidden"/>
                            <input name="exc_tag" id="exc_tag" type="hidden" value="0"/>
                            <input name="oper_user_id" id="oper_user_id" type="hidden" value=""/>
							<input name="trade_type_code" type="hidden" value="1120"/>
							<input name="remark2" id="remark2" type="hidden" value="片区设置!"/>
							<tr>
								<td style="background-color:#ffffff; color:#000000;  font-size:12px; padding:3px 5px;" colspan=2 align="center">
										<input name="comit" type="submit" value="" onclick="return confirmsub()" style="background-image: url('/images/tj.gif');width:70px;height: 26px;border:0;cursor:hand;text-align:center;">
								</td>
							</tr>
							<input type="hidden" name="cust_id" id="cust_id" value="<%=cust_id %>"/>
						</table>
					</td>
				</tr>
				<tr>
					<td width="100%" align="left" bgcolor="#FFFFFF" colspan="2"><div class="ping1">
					    <div id="loading" style="display: none">
					     <img src="/img/wait.gif" border="0"><bean:message key="str1613"/>
					    </div>
						<div id="area-div"></div>
				  </td>
				</tr>
				<tr>
					<td height="13"></td>
				</tr>
			</table>
		</form>
	</body>
</html>

