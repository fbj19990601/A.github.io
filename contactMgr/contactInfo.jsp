<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.util.*"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="com.saas.biz.commen.ParamethodMgr"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<jsp:useBean id="bean" class="com.saas.biz.commen.commMethodMgr" scope="page" />
<%@ page import="com.saas.biz.AreaInfoMgr.AreaInfo"%>
<%@ page import="com.saas.biz.entityclassMgr.EntityClassInfo"%>
<%@ page import="com.saas.biz.levelMgr.LevelInfo"%>
<%
    String user_id_a=bean.GenTradeId();
	String work_depart = bean.genOption("work_depart");
	String calling_type_code = bean.genOption("calling_type_code");
	String folk_code = bean.genOption("folk_code");
	String fbtime = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
    String end_date="";
    Calendar calend=Calendar.getInstance();
    calend.add(Calendar.YEAR,50);
    end_date=new SimpleDateFormat("yyyy-MM-dd").format(calend.getTime());
	ParamethodMgr paramCom = new ParamethodMgr();
	//密码提示问题
	//ArrayList passReqList = paramCom.getCompareInfo("CRM", "passwd_ques");
	//工作单位
	ArrayList workList = paramCom.getCompareInfo("CRM", "work_name");
	//教育程度
	 ArrayList degreeList = paramCom.getCompareInfo("CRM", "degree");
 	// ArrayList userRelation = paramCom.getCompareInfo("CRM", "relation_uu_code");
	 AreaInfo arae=new AreaInfo();
     Map country_Map=new HashMap();
     country_Map=arae.getAreaByParent("5J2mc0X0G85BH");
     EntityClassInfo entityClass=new EntityClassInfo();
     HttpSession sesson=request.getSession();
     String session_cust=(String)sesson.getAttribute("SESSION_CUST_ID");
     ArrayList list=entityClass.getEntityByUpClassAndEntity(session_cust,"000000000000000","1");
     ArrayList custLevel = new LevelInfo().getLevelListByCustEntity(session_cust, "1");
     String rean_name=bean.GenTradeId();
%>
<html>
	<head>
		<title><bean:message key="str1618"/></title>

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
        <script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/UserInfo.js'></script>
        <script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/AreaInfo.js'></script> 
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/EntityClassInfo.js'></script> 
        <script type='text/javascript' src='<%=request.getContextPath()%>/dwr/engine.js'></script>  
        <script type='text/javascript' src='<%=request.getContextPath()%>/dwr/util.js'></script> 
		<script src="/js/UrlEncode.js" language="jscript" type="text/jscript"></script>
		<script src="/js/newcregister.js" language="jscript" type="text/jscript"></script>
		<script src="/js/checkCust.js" language="jscript" type="text/jscript"></script>
		<script language="javascript" src="/js/Calendar_Ly.js"></script>
		<link rel="stylesheet" type="text/css" href="../ext/resources/css/ext-all.css" />
		<script type="text/javascript" src="../ext/adapter/ext/ext-base.js"></script>
		<script type="text/javascript" src="../ext/ext-all.js"></script>
	</head>
	<body>
		<div id="login-body">
			<div id="lg_content">
				<form method="post" name="NewRegisterForm" id="NewRegisterForm"
					action=/doTradeReg.do target="_self">
					
					
					
				  <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
            <tr>
              <td valign="top"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                  <tr>
                    <td align="left" valign="top" style="border-left:2px solid #FF6600; border-top:2px solid #fff; border-bottom:1px solid #fff; padding-left:10px; font-weight:bolder; font-size:14px; color:#000000; background-color:#e0e0e0; line-height:30px; "> <bean:message key="str1677"/></td>
                  </tr>
                  <tr>
                    <td valign="top" bgcolor="#CCCCCC" style="margin-bottom:5px;"><table width="100%" border="0" cellspacing="1" cellpadding="0">
          <tr style="display:none">
            <td width="20%" align="right" bgcolor="#f5f5f5" style="font-weight:bolder;"><bean:message key="str1739"/></td>
            <td colspan="3" align="left" bgcolor="#FFFFFF"><div class="ping" style="display:inline;"><input name="user_name" type="text"   maxlength="80" value="<%=rean_name%>"></div><div class="ping1" style="display:inline"><bean:message key="str1741"/>	</div></td>
            </tr>
          <tr style="display:none">
            <td align="right" bgcolor="#f5f5f5" style="font-weight:bolder;"><bean:message key="str1620"/></td>
            <td colspan="3" align="left" bgcolor="#FFFFFF"><div class="ping" style="display:inline;"><input type="password" name="passwd"  value="123456"></div><div class="ping1" style="display:inline"><bean:message key="str1679"/></div></td>
            </tr>
          <tr style="display:none">
            <td align="right" bgcolor="#f5f5f5" style="font-weight:bolder;"><bean:message key="str1039"/></td>
            <td colspan="3" align="left" bgcolor="#FFFFFF"><div class="ping" style="display:inline;"><input type="password" name="passwd" value="123456"></div>
			<div class="ping1" style="display:inline"><bean:message key="str1168"/> </div></td>
            </tr>
          <tr>
            <td align="right" bgcolor="#f5f5f5" style="font-weight:bolder;"><bean:message key="str1621"/></td>
            <td colspan="3" align="left" bgcolor="#FFFFFF">
				<div class="ping" style="display:inline;"><input type="text" name="cust_name" maxlength="20" class="login_textarea"></div>
				<div class="ping1" style="display:inline"><bean:message key="str1622"/></div></td>
            </tr>
          <tr>
            <td align="right" bgcolor="#f5f5f5" style="font-weight:bolder;"><bean:message key="str1623"/></td>
            <td colspan="3" align="left" bgcolor="#FFFFFF">
			<div class="ping1" style="display:inline;"><input type="hidden" name="relation_type_code" id="relation_type_code" value="1">
										<select name="rela_class" id="rela_class" maxlength="25" class="login_textarea">
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
										</select>	</div>
				<div class="ping1" style="display:inline"><a href="/levelMgr/levelIndex.jsp?menu_id=2EXFGfO71V2R8L6x8S&info_type=0" TARGET=appwin onclick="mydefss()"><span style="color: blue"><bean:message key="str4705"/></span></a></div></td>
            </tr>
          <tr>
            <td align="right" bgcolor="#f5f5f5" style="font-weight:bolder;"><bean:message key="str1624"/></td>
            <td colspan="3" align="left" bgcolor="#FFFFFF"><div class="ping1">
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
										<select name="sev3" id="sev3" size="5" style="width: 100px;display: none;float: left" onclick="setClassId(this.value)"></select>
										<div style="line-height:80px; margin-left:5px;">								
								      <a href="/entitypropMgr/classIndex.jsp?menu_id=2EpTKLTyXdV2R8LVx8S1&info_type=0" TARGET=appwin onclick="mydefss()"><span style="color: blue"><bean:message key="str1625"/></span></a></div>			
				</div>			</td>
            </tr>
          <tr>
            <td width="20%" align="right" bgcolor="#f5f5f5" style="font-weight:bolder;"><bean:message key="str1626"/></td>
            <input name="end_date" type="hidden" id="end_date" value="<%=end_date%>">
            <td width="80%" align="left" bgcolor="#FFFFFF" colspan="3"><input type="hidden" name="pspt_id" maxlength="20" value="0000"><div class="ping"><input type="text" name="email" maxlength="20" class="login_textarea"></div></td>
		      </tr>
          <tr>
            <td align="right" bgcolor="#f5f5f5" style="font-weight:bolder;"><bean:message key="str3129"/></td>
            <td align="left" bgcolor="#FFFFFF"><input name="group_contact_phone" type="text" size="25"
											maxlength="25" class="login_textarea"></td>
            <td align="right" bgcolor="#f5f5f5" style="font-weight:bolder;"><bean:message key="str1184"/></td>
            <td align="left" bgcolor="#FFFFFF"><input name="fax_nbr" type="text" size="15" maxlength="15"
											class="login_textarea"></td>
          </tr>
        </table></td>
                  </tr>
              </table></td>
            </tr>
            <tr>
              <td valign="top"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                  <tr>
                    <td align="left" valign="top" style="border-left:2px solid #FF6600;border-top:2px solid #fff; border-bottom:1px solid #fff; padding-left:10px; font-weight:bolder; font-size:14px; color:#000000; background-color:#e0e0e0; line-height:30px; ">联系人选填信息</td>
                  </tr>
                  <tr>
                    <td valign="top" bgcolor="#CCCCCC"><table width="100%" border="0" cellspacing="1" cellpadding="0">
          <tr>
            <td width="20%" align="right" bgcolor="#f5f5f5" style="font-weight:bolder;"> <bean:message key="str1628"/></td>
            <td width="30%" align="left" bgcolor="#FFFFFF"><div class="ping1"><input name="sex" type="radio" value="0" checked><bean:message key="str1630"/>
										<input type="radio" name="sex" value="1">	<bean:message key="str1058"/></div></td>
            <td width="20%" align="right" bgcolor="#f5f5f5" style="font-weight:bolder;"><bean:message key="str1629"/></td>
            <td width="30%" align="left" bgcolor="#FFFFFF"><div class="ping1"><input type="radio" name="marriage" value="1"> <bean:message key="str1631"/>
                                        <input name="marriage" type="radio" value="0" checked><bean:message key="str1632"/></div></td>
          </tr>
          <tr style="display:none">
            <td align="right" bgcolor="#f5f5f5" style="font-weight:bolder;"><bean:message key="str3467"/></td>
            <td width="30%" align="left" bgcolor="#FFFFFF"><div class="ping1">
            	<input name="passwd_ques" type="hidden" value="1"></div></td>
            <td width="20%" align="right" bgcolor="#f5f5f5" style="font-weight:bolder;"><bean:message key="str1178"/></td>
            <td width="30%" align="left" bgcolor="#FFFFFF"><div class="ping1"><input type="text" name="passwd_answer" maxlength="25"class="login_textarea" onchange="passwd_ques_focus(true);" onblur="passwd_ques_focus(false);"></div></td>
          </tr>
          <tr>
            <td align="right" bgcolor="#f5f5f5" style="font-weight:bolder;">QQ：</td>
            <td align="left" bgcolor="#FFFFFF"><div class="ping1"><input name="qq" type="text" maxlength="20" class="login_textarea"></div></td>
            <td align="right" bgcolor="#f5f5f5" style="font-weight:bolder;">blog：</td>
            <td align="left" bgcolor="#FFFFFF"><div class="ping1">
            	<input type="text" name="blog" maxlength="40"class="login_textarea">
           </td>
          </tr>
          <tr>
            <td align="right" bgcolor="#f5f5f5" style="font-weight:bolder;"><bean:message key="str1191"/></td>
            <td align="left" bgcolor="#FFFFFF">
            	<div class="ping1">
            		<input type="text" name="home_addr" maxlength="40" class="login_textarea">
				</div></td>
			<td align="right" bgcolor="#f5f5f5" style="font-weight:bolder;"><bean:message key="str3497"/></td>
			<td align="left" bgcolor="#FFFFFF">
				<div class="ping1">
				<select name="educate_degree_code" style="width:100px">
					<%
							if (degreeList != null && degreeList.size() > 0) {
							for (int i = 0; i < degreeList.size(); i++) {
								HashMap map = (HashMap) degreeList.get(i);
								String value = map.get("para_code1").toString();
								String name = map.get("para_code2").toString();
					%>
					<option value="<%=value%>">
						<%=name%>
					</option>
					<%
						}
						}
					%>
				</select>
               </div></td>
          </tr>
          <tr>
            <td align="right" bgcolor="#f5f5f5" style="font-weight:bolder;"><bean:message key="str1061"/></td>
            <td align="left" bgcolor="#FFFFFF"><div class="ping1"><select name="folk_code" style="width:100px;">
              <%=folk_code%>
            </select></div></td>
            <td align="right" bgcolor="#f5f5f5" style="font-weight:bolder;"><bean:message key="str1636"/></td>
            <td align="left" bgcolor="#FFFFFF"><div class="ping1"><input name="birthday" type="text" id="birthday"
											onfocus="setday(this);" value="<%=fbtime%>"
											style="width:93px"></div></td>
          </tr>
          <tr>
             <td align="right" bgcolor="#f5f5f5" style="font-weight:bolder;"><bean:message key="str3475"/></td>
               <td align="left" bgcolor="#FFFFFF" colspan="6">
            		<div class="ping1" style="display:inline;">
         						<select name="province" id="province" onclick="setCitys(this.value)">
         						<option value=""><bean:message key="str1180"/></option>
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
				   </div>
			  <font style="font-weight:bolder;"><bean:message key="str3476"/></font>
			  <div class="ping1" style="display:inline;">
				 <select name="eparchy_code" id="eparchy_code" style="width:100px;display:inline"  onclick="setAreas(this.value)">
                   <option value=""><bean:message key="str1180"/></option>
            	 </select>
              <font style="font-weight:bolder;"><bean:message key="str1051"/></font>
            	 <select name="city" id="city" style="display:inline">
                   <option value=""><bean:message key="str1180"/></option>
                 </select>
               </div>
             </td>
          </tr>
          <tr>
            <td align="right" bgcolor="#f5f5f5" style="font-weight:bolder;"><bean:message key="str1637"/></td>
            <td align="left" bgcolor="#FFFFFF"><div class="ping1"><input name="pspt_addr" type="text" maxlength="40" class="login_textarea"></div></td>
            <td align="right" bgcolor="#f5f5f5" style="font-weight:bolder;"><bean:message key="str1638"/></td>
            <td align="left" bgcolor="#FFFFFF"><div class="ping1">
            	<input type="text" name="post_addr" maxlength="40"	class="login_textarea"></div></td>
          </tr>
          <tr>
            <td align="right" bgcolor="#f5f5f5" style="font-weight:bolder;"><bean:message key="str1639"/></td>
            <td align="left" bgcolor="#FFFFFF">
            	<select name="work_depart" class="login_textarea">
					<%=work_depart%>
				</select>
			 </td>
            <td align="right" bgcolor="#f5f5f5" style="font-weight:bolder;"> <bean:message key="str1640"/></td>
            <td align="left" bgcolor="#FFFFFF"><div class="ping1"><select name="work_name" maxlength="25" class="login_textarea">
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
                                    </select></div></td>
          </tr>
        </table></td>
                  </tr>
              </table></td>
            </tr>
            <tr>
              <td valign="top"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                  <tr>
                    <td align="left" valign="top" style="border-left:2px solid #FF6600;border-top:2px solid #fff; border-bottom:1px solid #fff;padding-left:10px; font-weight:bolder; font-size:14px; color:#000000; background-color:#e0e0e0; line-height:30px; "><bean:message key="str1697"/></td>
                  </tr>
                  <tr>
                    <td valign="top" bgcolor="#CCCCCC"><table width="100%" border="0" cellspacing="1" cellpadding="0">
          <tr>
            <td width="20%" align="right" bgcolor="#f5f5f5" style="font-weight:bolder;"><bean:message key="str1756"/></td>
            <td width="30%" align="left" bgcolor="#FFFFFF"><div class="ping1"><input name="cust_aim" type="text" maxlength="40" size="40" class="login_textarea"></div></td>
            <td width="20%" align="right" bgcolor="#f5f5f5" style="font-weight:bolder;"><bean:message key="str1757"/></td>
            <td width="30%" align="left" bgcolor="#FFFFFF"><div class="ping1"><input name="company_address" type="text" maxlength="40"
											size="40" class="login_textarea"></div></td>
          </tr>
          <tr>
            <td align="right" bgcolor="#f5f5f5" style="font-weight:bolder;"><bean:message key="str1088"/></td>
            <td align="left" bgcolor="#FFFFFF"><div class="ping1"><input name="website" type="text" size="25" maxlength="25"
											class="login_textarea"></div></td>
            <td align="right" bgcolor="#f5f5f5" style="font-weight:bolder;"><bean:message key="str1183"/></td>
            <td align="left" bgcolor="#FFFFFF">
            	<div class="ping1">
            	  <select name="user_count" class="login_textarea">
                    <option value="1"> 10-100人 </option>
                    <option value="2"> 100-200人 </option>
                    <option value="3"> 200-1000人 </option>
                    <option value="4"> 1000人以上 </option>
                </select>
               </div>
             </td>
          </tr>
          <tr>
            <td align="right" bgcolor="#f5f5f5" style="font-weight:bolder;"><bean:message key="str1185"/></td>
            <td align="left" bgcolor="#FFFFFF"><div class="ping1"><select name="calling_type_code" style="width:100px">
                                          <%=calling_type_code%>
                                      </select></div></td>
            <td align="right" bgcolor="#f5f5f5" style="font-weight:bolder;"><bean:message key="str1186"/></td>
            <td align="left" bgcolor="#FFFFFF">
            	<div class="ping1">
            	 <input type="text" name="juristic" maxlength="15"class="login_textarea">
             </div>
			</td>
          </tr>
          <tr>
            <td align="right" bgcolor="#f5f5f5" style="font-weight:bolder;"><bean:message key="str1187"/></td>
            <td colspan="3" align="left" bgcolor="#FFFFFF">
            	<div class="ping">
            	  <table>
                                          <tr>
                                            <td><select name="sort1" id="sort1" size="10" style="width: 120px"
														onChange="this.form.sort2.options.length=0;this.form.sort3.options.length=0;getSubitems(this.form.sort2, this.value)">
                                                <option selected value="0"> <bean:message key="str2655"/> </option>
                                              </select>                                            </td>
                                            <td><select name="sort2" size="10" style="width: 120px"
														onChange="this.form.sort3.options.length=0;getSubitems(this.form.sort3, this.value)">
                                                <option value="0"> <bean:message key="str2655"/></option>
                                              </select>                                            </td>
                                            <td><select name="sort3" size="10" style="width: 120px">
                                                <option value="0"> <bean:message key="str2655"/></option>
                                              </select>                                            </td>
                                            <td><select name="bigsort" style="display:none">
                                                <option selected value="0"><bean:message key="str2655"/> </option>
                                              </select>                                            </td>
                                            </tr>
                                      </table></div></td>
            </tr>
          <tr>
            <td align="right" bgcolor="#f5f5f5" style="font-weight:bolder;"><bean:message key="str1097"/></td>
            <td colspan="3" align="left" bgcolor="#FFFFFF"><div class="ping1"><textarea name="group_memo" cols="50" rows="6"></textarea></div></td>
            </tr>
          <tr>
            <td align="right" bgcolor="#f5f5f5" style="font-weight:bolder;"><bean:message key="str1648"/></td>
            <td colspan="3" align="left" bgcolor="#FFFFFF"><div class="ping1"><textarea name="scope" cols="50" rows="6"></textarea></div></td>
            </tr>
        </table></td>
                  </tr>
              </table></td>
            </tr>
            <tr>
              <td height="40" align="center"><div id="lg_title1">
							<input type="image" name="imageField2" src="/images/tong.gif" onclick="return submitInfo();">
							<input type="hidden" name="trade_type_code" value="1050">
							<input type="hidden" name=user_id_a id=user_id_a value="<%=user_id_a%>">
							<input name="develope_channel" type="hidden" value="">
							<input type="hidden" name="e_class_id" id="e_class_id" value="0">
							<input type="hidden" name="pspt_type_code" value="0">
							<input type="hidden" name="e_class_name" id="e_class_name" value="">
							<input type="hidden" name="e_class_id_grp" id="e_class_id_grp" value="">
							<input type="hidden" name="e_class_name_grp" id="e_class_name_grp" value="">
							<input type="hidden" name="relation_type_name" id="relation_type_name" value="">
							<input name=sev5 id="sev5" type="hidden" value="<%=session_cust%>">
							<input name="id" type="hidden" value="">
							<input type="hidden" name="user_type" value="0">
							<input type="hidden" name="rsrv_str1" value="0">
							<input type="hidden" name="relation_uu_code" value="0">
							<input type="hidden" name="job" value="">
							<input type="hidden" name="class_level" value="1">
			  </div></td>
            </tr>
          </table>
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

var fectureArray=new Array();
	 fectureArray=['请选择..'];
function setAreas(city_id){
	AreaInfo.getAreaByParent(city_id,function(data){
	 DWRUtil.removeAllOptions("city");
     DWRUtil.addOptions("city",fectureArray);
	 DWRUtil.addOptions("city",data);
	});
}
function setCitys(prov){
   var provence=prov;
	 AreaInfo.getAreaByParent(provence,function(data){
	 DWRUtil.removeAllOptions("eparchy_code");
	 DWRUtil.addOptions("eparchy_code",fectureArray);
	 DWRUtil.addOptions("eparchy_code",data);
	 DWRUtil.removeAllOptions("city");
	 DWRUtil.addOptions("city",fectureArray);
	});
}


function setSev2(id){
 var cust=document.getElementById("sev5").value;
  document.getElementById("e_class_id").value=id;
  document.getElementById("e_class_name").value=DWRUtil.getText("sev1");
  document.getElementById("e_class_id_grp").value=id;
  document.getElementById("e_class_name_grp").value=DWRUtil.getText("sev1");
 var type="1";
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
 var type="1";
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
function submitInfo(){
	if(document.NewRegisterForm.sort1.value=="")
	{
		document.NewRegisterForm.rsrv_str1.value="0";
	}
	else
	{
		document.NewRegisterForm.rsrv_str1.value="1";
	}
	if(document.NewRegisterForm.sort2.value!="")
	{
			document.NewRegisterForm.rsrv_str1.value="2";
	}
	if(document.NewRegisterForm.sort3.value!="")
	{
		document.NewRegisterForm.rsrv_str1.value="3";
	}
	if(document.NewRegisterForm.cust_name.value=="" || document.NewRegisterForm.cust_name.value==null){
	  alert("联系人名称不能为空！");
	 return false;
	}
	
	if(document.NewRegisterForm.email.value == ""||document.NewRegisterForm.email.value == null)
	{
		alert("邮箱地址不能为空！");
		return false;
	}
	

var strIn=/^[_a-z0-9]+@([_a-z0-9]+\.)+[a-z0-9]{2,3}$/; //正则表达式（邮箱格式）

if(document.NewRegisterForm.email.value!="")//当E_mail中有值时判断E_mail格式是否正确
   {
    if(strIn.test(document.NewRegisterForm.email.value)==false)//正则表达式（邮箱格式
        {
             alert("邮箱输入不正确");
             document.NewRegisterForm.email.focus();
             return false;
        }
   }  

if(document.getElementById("sort1").value==""){
          
          alert("主营行业不能为空！");
		  return false;

}
	return true;
}

//-->
</script>

