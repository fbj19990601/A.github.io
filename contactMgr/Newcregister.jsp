<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="java.util.*"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="com.saas.biz.commen.ParamethodMgr"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<jsp:useBean id="bean" class="com.saas.biz.commen.commMethodMgr" scope="page" />
<%@ page import="com.saas.biz.AreaInfoMgr.AreaInfo"%>
<%@ page import="com.saas.biz.entityclassMgr.EntityClassInfo"%>
<%@ page import="com.saas.biz.levelMgr.LevelInfo"%>
<%
	String work_depart = bean.genOption("work_depart");
	String calling_type_code = bean.genOption("calling_type_code");
	String folk_code = bean.genOption("folk_code");
	String fbtime = new SimpleDateFormat("yyyy-MM-dd").format(new Date());

	ParamethodMgr paramCom = new ParamethodMgr();
	//密码提示问题
	ArrayList passReqList = paramCom.getCompareInfo("CRM", "passwd_ques");
	//工作单位
	ArrayList workList = paramCom.getCompareInfo("CRM", "work_name");
	//教育程度
	ArrayList degreeList = paramCom.getCompareInfo("CRM", "degree");
	//客户关系
	ArrayList custRelation = paramCom.getCompareInfo("CRM", "relation_type_code");
	 AreaInfo arae=new AreaInfo();
     Map country_Map=new HashMap();
     country_Map=arae.getCountryAllByCode("cn");
     EntityClassInfo entityClass=new EntityClassInfo();
     HttpSession sesson=request.getSession();
     String session_cust=(String)sesson.getAttribute("SESSION_CUST_ID");
     ArrayList list=entityClass.getEntityByUpClassAndEntity(session_cust,"000000000000000","0");
     ArrayList custLevel = new LevelInfo().getLevelListByCustEntity(session_cust, "1");
     String name=bean.commen.GenTradeId();
%>
<html>
	<head>
		<title><bean:message key="str1676"/></title>

		<link href="/style/layout.css" rel="stylesheet" type="text/css">

		<style type="text/css" media="screen">
        .green {float:left;
        border-color: #485E00;
        border-style: solid;
        background-color: #F7FFDD;
        border-width: 1px;
        font-size: 12px;
        color: #485E00;
        font-family: 宋体;
        padding: 3px 3px;
        
        }
        
        .orange {float:left;
        border-color: #FF7300;
        border-style: solid;
        background-color: #FFF5D8;
        border-width: 1px;
        font-size: 12px;
        color: #000000;
        font-family: 宋体;
        padding: 3px 3px;
        
        }
    </style>
        <script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/AreaInfo.js'></script> 
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/EntityClassInfo.js'></script> 
        <script type='text/javascript' src='<%=request.getContextPath()%>/dwr/engine.js'></script>  
        <script type='text/javascript' src='<%=request.getContextPath()%>/dwr/util.js'></script> 
		<script src="/js/UrlEncode.js" language="jscript" type="text/jscript"></script>
		<script src="/js/newcregister.js" language="jscript" type="text/jscript"></script>
		<script src="/js/checkCust.js" language="jscript" type="text/jscript"></script>
		<script language="javascript" src="/js/Calendar_Ly.js"></script>
	</head>
	<body>
		<div id="login-body">
			<div id="lg_content">
				<form method="post" name="NewRegisterForm" id="NewRegisterForm"
					action=/doTradeReg.do onsubmit="return CheckCustValue() "
					target="_self">
					<div id="lg_text">
						<div id="lg_title"> 
							 <bean:message key="str1677"/>
						</div>
						<div id="lg_reg">
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr style="display:none">
									<td width="168" height="30" align="right">
										<bean:message key="str1678"/>									</td>
									<td width="252">
										<input name="user_name" type="text" value="<%=name%>" class="login_textarea"> <font color="#ff0000">*</font><!--onfocus="user_name_focus(true);" onblur="user_name_focus(false);" maxlength="20" class="login_textarea"-->									</td>
									<td colspan="2">
										<div id="divUsername">
											<bean:message key="str1798"/>										</div>									</td>
								</tr>
								<tr style="display:none">
									<td height="30" align="right">
									<bean:message key="str1620"/></td>
									<td><input type="password" name="passwd2" value="123456" class="login_textarea" >
								    <!--maxlength="20" onfocus="password_focus(true, 0);" onblur="password_focus(false, 0);" class="login_textarea"-->									<font color="#ff0000">*</font></td>
									<td colspan="2" id="tdPassword">
										<div id="divPassword1">
											<bean:message key="str1679"/>										</div>									</td>
								</tr>
								<tr style="display:none">
									<td height="30" align="right">
										<bean:message key="str1039"/></td>
									<td>
										<input type="password" name="passwd" value="123456" class="login_textarea" ><!--maxlength="20" onfocus="password_focus(true, 1);" onblur="password_focus(false, 1);" class="login_textarea"-->									<font color="#ff0000">*</font></td>
									<td colspan="2" id="tdRePassword">
										<div id="divPassword2">
										<bean:message key="str1168"/>										</div>									</td>
								</tr>
								<input type="hidden" name="rsrv_str1" value="0">
								<tr>
									<td height="30" align="right">
										<bean:message key="str1680"/></td>
									<td>
										<input type="text" name="cust_name" maxlength="20" class="login_textarea">
										<font color="#ff0000">*</font> </td>
									<td colspan="2" align="left">									</td>
								</tr>
								<tr>
									<td height="30" align="right">
										<bean:message key="str1681"/></td>
									<td>
										<input type="hidden" name="relation_type_code" id="relation_type_code"  value="1">
											<select name="class_level" id="class_level" maxlength="25" class="login_textarea">
											<%
												if (custLevel != null && custLevel.size() > 0)
												{
												  for (int i = 0; i < custLevel.size(); i++)
												  {
													HashMap map = (HashMap) custLevel.get(i);
													String value = map.get("level_code").toString();
													String name = map.get("level_name").toString();
											%>
													<option value="<%=value%>">
														<%=name%>													</option>
											<%
												  }
												}
											%>
										</select>
										<font color="#ff0000">*</font> </td>
									<td colspan="2" align="left">
										<div id="customer_type">
											<bean:message key="str1682"/>										</div>									</td>
								</tr>
								<tr>
									<td height="30" align="right">
										<bean:message key="str1683"/></td>
									<td colspan="3">
										<input type="hidden" name="entity_type" id="entity_type" value="0">
										<select name="sev1" id="sev1" size="5" style="width: 100px;float: left" onclick="setSev2(this.value);">
										 <%
										    if(list !=null && list.size()>0){
										      for(int i=0;i<list.size();i++){
										         HashMap map=(HashMap)list.get(i);
										         String idx=map.get("class_id").toString();
										         String name=map.get("class_name").toString();
										   %>
										    <option value="<%=idx%>"><%=name%></option>
										   <%      
										      }
										    }
										 %>
										</select>	
										<select name="sev2" id="sev2" size="5" style="width: 100px;display: none;float: left" onclick="setSev3(this.value);"></select>
											
										<select name="sev3" id="sev3" size="5" style="width: 100px;display: none;float: left" onclick="setClassId(this.value)"></select>	<font color="#ff0000">*</font>								</td>
								</tr>
								<tr>
									<td height="30" align="right">
										<bean:message key="str1684"/></td>
									<td>
										<input type="text" name="email" maxlength="20" class="login_textarea">
										<font color="#ff0000">*</font> </td>
									<td width="145" align="right"><input type="hidden" name="pspt_id" maxlength="20" value="0000">    
									  									<bean:message key="str1685"/></td>
								    <td width="275"><input name="sex" type="radio" value="0" checked>
								      <bean:message key="str1686"/>
                                        <input type="radio" name="sex" value="1">
                                    <bean:message key="str1058"/></td>
								</tr>
								<tr id="trContact1">
									<td height="30" colspan="4" align="left">
										<div id="lg_title">
											<bean:message key="str1687"/>									</div>									</td>
								</tr>
								<tr id="trContact2">
									<td height="30" align="right" valign="middle">
										<bean:message key="str3467"/>									</td>
									<td>
										<select name="passwd_ques" maxlength="25"
											class="login_textarea">
											<%
												if(passReqList != null && passReqList.size() > 0)
												{
												   for(int i = 0; i < passReqList.size(); i++)
												   {
														HashMap map = (HashMap) passReqList.get(i);
													    String value = map.get("para_code1").toString();
													    String name = map.get("para_code2").toString();
														%>
														<option value="<%=value%>">
															<%=name%>														</option>
														<%
												     }
												}
											%>
										</select>									</td>
									<td align="right" id="tdQues"><bean:message key="str1178"/> <font color="#ff0000">&nbsp; </font> </td>
								    <td id="tdQues"><input type="text" name="passwd_answer" maxlength="25"class="login_textarea" onchange="passwd_ques_focus(true);" onblur="passwd_ques_focus(false);"></td>
								</tr>
								<tr id="trContact3" >
									<td height="30" align="right" valign="middle">QQ：</td>
									<td><input type="text" name="qq" class="login_textarea"></td>
									<td align="right"><bean:message key="str1191"/></td>
								    <td align="left"><input type="text" name="home_addr" maxlength="40"
											class="login_textarea"></td>
								</tr>
								<tr id="trContact4" >
									<td height="30" align="right" valign="middle"><bean:message key="str1639"/></td>
									<td><select name="work_depart" class="login_textarea">
                                      <%=work_depart%>
                                    </select></td>
									<td align="right" id="trContact5"
										><bean:message key="str3497"/> </td>
								    <td id="trContact5"
										><select name="educate_degree_code" style="width:100px">
                                      <%
													if (degreeList != null && degreeList.size() > 0) {
													for (int i = 0; i < degreeList.size(); i++) {
														HashMap map = (HashMap) degreeList.get(i);
														String value = map.get("para_code1").toString();
														String name = map.get("para_code2").toString();
											%>
                                      <option value="<%=value%>"> <%=name%> </option>
                                      <%
												}
												}
											%>
                                    </select></td>
								</tr>
								<tr id="trContact6" >
									<td height="30" align="right" valign="middle"><bean:message key="str1061"/></td>
									<td><select name="folk_code" style="width:100px;">
                                      <%=folk_code%>
                                    </select></td>
									<td align="right"><bean:message key="str1636"/> </td>
								    <td><input name="birthday" type="text" id="birthday"
											onfocus="setday(this);" value="<%=fbtime%>"
											style="width:93px">
(yyyy-mm-dd) </td>
								</tr>
								<tr id="trContact7" >
									<td height="30" align="right" valign="middle"><bean:message key="str1637"/></td>
									<td><input name="pspt_addr" type="text" maxlength="40" class="login_textarea"></td>
									<td align="right"><bean:message key="str3475"/> </td>
								    <td><select name="country_code" id="country_code" onclick="setProvience(this.value)">
                                      <%
												if (country_Map != null && country_Map.size() > 0)
												{
													Iterator it = country_Map.entrySet().iterator();
													 while (it.hasNext()) {
														Map.Entry entry = (Map.Entry) it.next();
														Object key = entry.getKey();
														Object value = entry.getValue();
														%>
                                      <option value=<%=key%>><%=value%></option>
                                      <%
													}
												 }
										   %>
                                    </select>
                                      <select name="province" id="province" style="width:100px" onclick="setCitys(this.value)">
                                        <option value="0"><bean:message key="str4704"/></option>
                                      </select></td>
								</tr>
								<tr id="trContact11" >
									<td height="30" align="right" valign="middle"><bean:message key="str3476"/> </td>
									<td><select name="eparchy_code" id="eparchy_code" style="width:100px">
                                      <option value="0"><bean:message key="str1694"/></option>
                                    </select></td>
									<td align="right"><bean:message key="str1695"/> </td>
								    <td><input type="text" name="post_addr" maxlength="40"
											class="login_textarea"></td>
								</tr>
								<tr id="trContact12" >
									<td height="30" align="right" valign="middle">blog：</td>
									<td><input type="text" name="blog" class="login_textarea"></td>
									<td align="right"><bean:message key="str3494"/> </td>
								    <td><select name="work_name" maxlength="25" class="login_textarea">
                                      <%
												if (workList != null && workList.size() > 0) {
												for (int i = 0; i < workList.size(); i++) {
													HashMap map = (HashMap) workList.get(i);
													String value = map.get("para_code1").toString();
													String name = map.get("para_code2").toString();
											%>
                                      <option value="<%=value%>"> <%=name%> </option>
                                      <%
												}
												}
											%>
                                    </select></td>
								</tr>
								<tr id="trContact13" >
									<td height="30" align="right" valign="middle"><bean:message key="str3496"/> </td>
									<td><input type="text" name="job" maxlength="25"
											class="login_textarea"></td>
									<td align="right"><bean:message key="str1629"/> </td>
								    <td><input type="radio" name="marriage" value="1">
是<bean:message key="str2852"/>
  <input name="marriage" type="radio" value="0" checked>
否 <bean:message key="str2853"/></td>
								</tr>
								<tr>
								  <td height="30" colspan="4" valign="middle"><div id="lg_title">
							<span id="spnCompany" >&nbsp; <bean:message key="str1181"/> </span>
						</div></td>
							  </tr>
								<tr>
								  <td height="30" colspan="4" valign="middle"><table id="tabCompany" width="100%" border="0" cellspacing="0"
								cellpadding="0" >
                                    <tr>
                                      <td width="14%" height="30" align="right"> <bean:message key="str1653"/> </td>
                                      <td><input name="cust_aim2" type="text" maxlength="40" size="40" class="login_textarea">                                      </td>
                                      <td align="right"><bean:message key="str1698"/> </td>
                                      <td><input name="company_address2" type="text" maxlength="40"
											size="40" class="login_textarea"></td>
                                    </tr>
                                    <tr>
                                      <td width="14%" height="30" align="right"><bean:message key="str1088"/> </td>
                                      <td><input name="website2" type="text" size="25" maxlength="25"
											class="login_textarea"></td>
                                      <td align="right"><bean:message key="str1699"/></td>
                                      <td><select name="select2" class="login_textarea">
                                        <option value="1"> 10-20人 </option>
                                        <option value="2"> 20-50人 </option>
                                        <option value="3"> 50-60人 </option>
                                      </select></td>
                                    </tr>
                                    <tr>
                                      <td height="30" align="right"><bean:message key="str3129"/></td>
                                      <td><input name="group_contact_phone2" type="text" size="25"
											maxlength="25" class="login_textarea"></td>
                                      <td align="right"><bean:message key="str1184"/> </td>
                                      <td><input name="fax_nbr2" type="text" size="15" maxlength="15"
											class="login_textarea"></td>
                                    </tr>
                                    <tr>
                                      <td height="30" align="right"><bean:message key="str1231"/> </td>
                                      <td><select name="select3" style="width:100px">
                                        <%=calling_type_code%>
                                      </select></td>
                                      <td align="right"><bean:message key="str1234"/></td>
                                      <td><input type="text" name="juristic2" maxlength="15"
											class="login_textarea"></td>
                                    </tr>

                                    <tr>
                                      <td height="30" align="right"> <bean:message key="str1703"/></td>
                                      <td colspan="3"><table>
                                          <tr>
                                            
                                            <td><select name="select" size="10" style="width: 120px"
														onChange="this.form.sort2.options.length=0;this.form.sort3.options.length=0;getSubitems(this.form.sort2, this.value)">
                                                <option selected value="0"> <bean:message key="str2655"/></option>
                                              </select>                                            </td>
                                            <td><select name="select" size="10" style="width: 120px"
														onChange="this.form.sort3.options.length=0;getSubitems(this.form.sort3, this.value)">
                                                <option value="0">  <bean:message key="str2655"/></option>
                                              </select>                                            </td>
                                            <td><select name="select" size="10" style="width: 120px">
                                                <option value="0">  <bean:message key="str2655"/></option>
                                              </select>                                            </td>
											  <td><select name="select" style="display:none">
                                                <option selected value="0"> <bean:message key="str2655"/></option>
                                              </select>                                            </td>
											  <td><font color="#ff0000">*</font></td>
                                          </tr>
                                      </table>
                                      </td>
                                    </tr>
                                    <tr>
                                      <td height="30" align="right"> <bean:message key="str1704"/> </td>
                                      <td colspan="3">&nbsp;&nbsp;
                                          <label>
                                          <input name="salebuy" type="radio"
												onclick="showSalebuy(true, false)" checked>
                                            <bean:message key="str1705"/> </label>
                                          <label>
                                          <input name="salebuy" type="radio"
												onclick="showSalebuy(false, true)">
                                            <bean:message key="str1706"/></label>
                                          <label>
                                          <input name="salebuy" type="radio"
												onclick="showSalebuy(true, true)">
                                            <bean:message key="str1707"/></label>                                      </td>
                                    </tr>
                                    <tr id="trSale">
                                      <td height="30" align="right">&nbsp;</td>
                                      <td width="36%">&nbsp;&nbsp;&nbsp; <font color="red"><bean:message key="str1709"/></font><bean:message key="str1819"/> <BR>
                                        &nbsp;&nbsp;&nbsp;
                                        <INPUT id="txtSaleService" maxLength="40" size="35"
											name="txtSaleService2"
											onfocus="salebuy_service_focus(true, 'divSale')"
											onblur="salebuy_service_focus(false, 'divSale')">                                      </td>
                                      <td width="18%">&nbsp;</td>
                                      <td width="32%"><div id="div"> <bean:message key="str1710"/></div></td>
                                    </tr>
                                    <tr id="trBuy">
                                      <td height="30" align="right">&nbsp;</td>
                                      <td>&nbsp;&nbsp;&nbsp; <font color="red"><bean:message key="str1711"/></font><bean:message key="str1712"/> <BR>
                                        &nbsp;&nbsp;&nbsp;
                                        <INPUT id="txtBuyService" maxLength="40" size="35"
											name="txtBuyService2"
											onfocus="salebuy_service_focus(true, 'divBuy')"
											onblur="salebuy_service_focus(false, 'divBuy')">                                      </td>
                                      <td width="18%">&nbsp;</td>
                                      <td width="32%"><div id="div2"> <bean:message key="str1710"/></div></td>
                                    </tr>
                                    <tr>
                                      <td height="30" align="right"> <bean:message key="str1714"/></td>
                                      <td colspan="3"><textarea name="textarea" cols="50" rows="6"></textarea>                                      </td>
                                    </tr>
                                    <input type="hidden" name="cust_aim2" value=""/>
                                    <tr>
                                      <td height="90" align="right"> <bean:message key="str1715"/> </td>
                                      <td height="90" colspan="3"><textarea name="textarea" cols="50" rows="6"></textarea>                                      </td>
                                    </tr>
                                  </table></td>
							  </tr>
							</table>
						</div>
					</div>
					<div id="lg_text">
					  <div id="lg_title1">
							<br>
							&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
							&nbsp;
							<input type="image" name="imageField2" src="/images/tong.gif">
							<input type="hidden" name="trade_type_code" value="1047">
							<input type="hidden" name="e_class_id" id="e_class_id" value="0">
							<input type="hidden" name="e_class_name" id="e_class_name" value="">
							<input type="hidden" name="e_class_id_grp" id="e_class_id_grp" value="">
							<input name="develope_channel" type="hidden" value="">
							<input type="hidden" name="e_class_name_grp" id="e_class_name_grp" value="">
							<input type="hidden" name="relation_type_name" id="relation_type_name" value="">
							<input name="id" type="hidden" value="">
						</div>
					</div>
				</form>
			</div>
		</div>
		<div class="login_bottom"></div>
		<script language="jscript" type="text/jscript">
	getSubitems(document.NewRegisterForm.bigsort, "", "请选择...", "");
	getSubitems(document.NewRegisterForm.sort1, "");
</script>
	</body>
</html>
<script type="text/javascript">
<!--
function setProvience(country){
    var country_id=country;
	AreaInfo.getAreaByParent(country_id,function(data){
	 DWRUtil.removeAllOptions("province");
	 DWRUtil.removeAllOptions("eparchy_code");
	 DWRUtil.addOptions("province",data);
	});
}
function setCitys(prov){
   var provence=prov;
	 AreaInfo.getAreaByParent(provence,function(data){
	 DWRUtil.removeAllOptions("eparchy_code");
	 DWRUtil.addOptions("eparchy_code",data);
	});
}
function setSev2(id){
 var cust=document.getElementById("sev5").value;
  document.getElementById("e_class_id").value=id;
  document.getElementById("e_class_name").value=DWRUtil.getText("sev1");
  document.getElementById("e_class_id_grp").value=id;
  document.getElementById("e_class_name_grp").value=DWRUtil.getText("sev1");
 var type="0";
 EntityClassInfo.getClassByUpClassAndEntity(cust,id,type,function(data){
   
     document.getElementById("sev2").style.display="block";
     DWRUtil.removeAllOptions("sev2");
	 DWRUtil.addOptions("sev2",data);
     var item=document.getElementById("sev2").length;
	    if(item==0)
	    {
	    	document.getElementById("sev2").style.display="none"; 
	    }
	     else
	   	{
	   		document.getElementById("sev2").style.display="block";
	   	}
 });
}
function setSev3(id){
	document.getElementById("e_class_id").value=id;
	document.getElementById("e_class_name").value=DWRUtil.getText("sev2");
	document.getElementById("e_class_id_grp").value=DWRUtil.getValue("sev1")+"|"+id;
	document.getElementById("e_class_name_grp").value=DWRUtil.getText("sev1")+"|"+DWRUtil.getText("sev2");
	var cust=document.getElementById("sev5").value;
 var type="0";
 EntityClassInfo.getClassByUpClassAndEntity(cust,id,type,function(data){
     document.getElementById("sev3").style.display="block";
     DWRUtil.removeAllOptions("sev3");
	 DWRUtil.addOptions("sev3",data);
	 var item=document.getElementById("sev3").length;
	    if(item==0)
	    {
	    	document.getElementById("sev3").style.display="none"; 
	    }
	     else
	   	{
	   		document.getElementById("sev3").style.display="block";
	   	}
 });
}
function setClassId(id){
document.getElementById("e_class_id").value=id;
document.getElementById("e_class_name").value=DWRUtil.getText("sev3");
document.getElementById("e_class_id_grp").value=DWRUtil.getValue("sev1")+"|"+DWRUtil.getValue("sev2")+"|"+id;
document.getElementById("e_class_name_grp").value=DWRUtil.getText("sev1")+"|"+DWRUtil.getText("sev2")+"|"+DWRUtil.getText("sev3");
}
//-->
</script>

