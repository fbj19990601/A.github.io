<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.util.*"%>

<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="com.saas.biz.commen.ParamethodMgr"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<jsp:useBean id="bean" class="com.saas.biz.commen.commMethodMgr" scope="page" />
<%@ page import="com.saas.biz.AreaInfoMgr.AreaInfo"%>
<%@ page import="com.saas.biz.entityclassMgr.EntityClassInfo"%>
<%@ page import="com.saas.biz.levelMgr.LevelInfo"%>
<%@ page import="com.saas.biz.custMgr.Custinfo"%>
<%
    HttpSession sesson=request.getSession();
    String session_cust=(String)sesson.getAttribute("SESSION_CUST_ID");
	//String work_depart = bean.genOption("work_depart");
	String calling_type_code = bean.genOption("calling_type_code");
	//String folk_code = bean.genOption("folk_code");
	String fbtime = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
	ParamethodMgr paramCom = new ParamethodMgr();
	//密码提示问题
	ArrayList passReqList = paramCom.getCompareInfo("CRM", "passwd_ques");
	//工作单位
	//ArrayList workList = paramCom.getCompareInfo("CRM", "work_name");
	//教育程度
	//ArrayList degreeList = paramCom.getCompareInfo("CRM", "degree");
	//客户级别
	 ArrayList custLevel = new LevelInfo().getLevelListByCustEntity(session_cust, "0");
	 AreaInfo arae=new AreaInfo();
     Map country_Map=new HashMap();
     country_Map=arae.getAreaByParent("5J2mc0X0G85BH");
     EntityClassInfo entityClass=new EntityClassInfo();
     ArrayList list=entityClass.getEntityByUpClassAndEntity(session_cust,"000000000000000","0");
     String default_code=bean.GenTradeId();
     String develope_channel=new Custinfo().getCustChannal(session_cust);
%>
<html>
	<head>
		<title><bean:message key="str1200"/></title>


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
                    <td align="left" valign="top" style="border-left:2px solid #FF6600; border-top:2px solid #fff; border-bottom:1px solid #fff; padding-left:10px; font-weight:bolder; font-size:14px; color:#000000; background-color:#e0e0e0; line-height:30px; ">
					   <bean:message key="str1854"/>					</td>
                  </tr>
                  <tr>
             <td valign="top" bgcolor="#CCCCCC" style="margin-bottom:5px;">
         <table width="100%" border="0" cellspacing="1" cellpadding="0">
          <tr style="display:none">
            <td width="17%" align="right" bgcolor="#f5f5f5" style="font-weight:bolder;"><bean:message key="str1855"/></td>
            <td colspan="3" align="left" bgcolor="#FFFFFF"><div class="ping" style="display:inline;"><input name="user_name" type="text" value="<%=default_code%>"></div><div class="ping1" style="display:inline"><bean:message key="str1904"/></div></td>
          </tr>
          <tr style="display:none">
            <td align="right" bgcolor="#f5f5f5" style="font-weight:bolder;"><bean:message key="str1856"/></td>
            <td colspan="3" align="left" bgcolor="#FFFFFF"><div class="ping" style="display:inline;"><input type="text" name="passwd" value="123456" class="login_textarea"></div><div class="ping1" style="display:inline"><bean:message key="str1906"/></div></td>
            </tr>
          <tr style="display:none">
            <td align="right" bgcolor="#f5f5f5" style="font-weight:bolder;"><bean:message key="str1039"/></td>
            <td colspan="3" align="left" bgcolor="#FFFFFF"><div class="ping" style="display:inline;">&nbsp;</div>
			<div class="ping1" style="display:inline"><bean:message key="str1168"/> </div></td>
            </tr>
          <tr>
            <td align="right" bgcolor="#f5f5f5" style="font-weight:bolder;"><bean:message key="str3227"/></td>
            <td colspan="3" align="left" bgcolor="#FFFFFF">
				<div class="ping" style="display:inline;"><input type="text" name="cust_name" maxlength="20" onfocus="CustName_focus(true, 1);" onblur="CustName_focus(false, 1);" class="login_textarea"></div>
				<div id="divCustName" class="ping1" style="display:inline"><bean:message key="str1170"/> </div></td>
            </tr>
          <tr>
            <td align="right" bgcolor="#f5f5f5" style="font-weight:bolder;"><bean:message key="str1858"/></td>
            <td colspan="3" align="left" bgcolor="#FFFFFF">
			<div class="ping" style="display:inline;"><select name="rela_class" id="rela_class" maxlength="50" class="login_textarea">
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
				</select></div>
				<div class="ping1" style="display:inline"><bean:message key="str1859"/><a href="/levelMgr/levelIndex.jsp?menu_id=2EXFGfO71V2R8L6x8S&info_type=0" target="_blank"><span style="color: blue"><bean:message key="str1860"/></span></a><bean:message key="str1861"/></div></td>
            </tr>
          <tr>
            <td align="right" bgcolor="#f5f5f5" style="font-weight:bolder;"><bean:message key="str1911"/></td>
            <td colspan="3" align="left" bgcolor="#FFFFFF"><div class="ping">
            <input name=sev5 id="sev5" type="hidden" value="<%=session_cust%>">
            <input name="pspt_type_code" type="hidden" value="0"/>
            <input type="hidden" name="work_name" value="">
			 <input type="hidden" name="post_addr" value="">
			 <input type="hidden" name="job" value="">
			 <input type="hidden" name="blog" value="">
			 <input type="hidden" name="develope_channel" value="<%=develope_channel%>">
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
								      <a href="/entitypropMgr/classIndex.jsp?menu_id=2EpTKLTyXdV2R8LVx8S1&info_type=0" target="_blank"><span style="color: blue"><bean:message key="str1912"/></span></a>	</div>			
				</div>			</td>
            </tr>
          <tr>
            <td width="20%" align="right" bgcolor="#f5f5f5" style="font-weight:bolder;"><bean:message key="str1913"/></td>
            <td width="80%" align="left" bgcolor="#FFFFFF" colspan="3"><div class="ping"><input type="text" name="email" maxlength="20" class="login_textarea" onblur="checkEmail()"></div>
               <input type="hidden" name="pspt_id" maxlength="20" value="0000">
            	<input name="sex" type="hidden" value="0">
            </td>
		 </tr>
        </table></td>
                  </tr>
              </table></td>
            </tr>
            <tr>
              <td valign="top"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                  <tr>
                    <td align="left" valign="top" style="border-left:2px solid #FF6600;border-top:2px solid #fff; border-bottom:1px solid #fff; padding-left:10px; font-weight:bolder; font-size:14px; color:#000000; background-color:#e0e0e0; line-height:30px; "><bean:message key="str1914"/></td>
                  </tr>
                  <tr>
                    <td valign="top" bgcolor="#CCCCCC"><table width="100%" border="0" cellspacing="1" cellpadding="0">
          <tr>
            <td width="20%" align="right" bgcolor="#f5f5f5" style="font-weight:bolder;"><bean:message key="str3467"/></td>
            <td width="30%" align="left" bgcolor="#FFFFFF"><div class="ping1"><select name="passwd_ques" maxlength="50"
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
				</select></div></td>
            <td width="20%" align="right" bgcolor="#f5f5f5" style="font-weight:bolder;"><bean:message key="str1178"/></td>
            <td colspan="4" width="30%" align="left" bgcolor="#FFFFFF"><div class="ping1"><input type="text" name="passwd_answer" maxlength="50"class="login_textarea"></div></td>
          </tr>
          <tr>
            <td align="right" bgcolor="#f5f5f5" style="font-weight:bolder;"><bean:message key="str1179"/></td>
            <td colspan="6" align="left" bgcolor="#FFFFFF" colspan="5"><div class="ping1"><input name="pspt_addr" type="text" maxlength="40" class="login_textarea"></div></td>
				<input name="marriage" type="hidden" value="0">
         </td>
          </tr>
          <tr>
               <td align="right" bgcolor="#f5f5f5" style="font-weight:bolder;"><bean:message key="str1047"/></td>
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
			  <font style="display:none"><bean:message key="str3476"/></font>
			  <div class="ping1" style="display:inline;">
				 <select name="eparchy_code" id="eparchy_code" style="width:100px;display:inline"  onclick="setAreas(this.value)">
                   <option value=""><bean:message key="str1180"/></option>
            	 </select>
              <font style="font-weight:bolder;"><bean:message key="str3477"/></font>
            	 <select name="city" id="city" style="display:inline">
                   <option value=""><bean:message key="str1180"/></option>
                 </select>
               </div>
             </td>
          </tr>
        </table></td>
                  </tr>
              </table></td>
            </tr>
            <tr>
              <td valign="top"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                  <tr>
                    <td align="left" valign="top" style="border-left:2px solid #FF6600;border-top:2px solid #fff; border-bottom:1px solid #fff;padding-left:10px; font-weight:bolder; font-size:14px; color:#000000; background-color:#e0e0e0; line-height:30px; "><bean:message key="str1181"/></td>
                  </tr>
                  <tr>
                    <td valign="top" bgcolor="#CCCCCC"><table width="100%" border="0" cellspacing="1" cellpadding="0">
          <tr>
            <td width="20%" align="right" bgcolor="#f5f5f5" style="font-weight:bolder;"><bean:message key="str1653"/></td>
            <td width="30%" align="left" bgcolor="#FFFFFF"><div class="ping1"><input name="cust_aim" type="text" maxlength="40" size="30" class="login_textarea"></div></td>
            <td width="20%" align="right" bgcolor="#f5f5f5" style="font-weight:bolder;"><bean:message key="str1698"/></td>
            <td width="30%" align="left" bgcolor="#FFFFFF"><div class="ping1"><input name="company_address" type="text" maxlength="50"
											size="40" class="login_textarea"></div></td>
          </tr>
          <tr>
            <td align="right" bgcolor="#f5f5f5" style="font-weight:bolder;"><bean:message key="str1088"/></td>
            <td align="left" bgcolor="#FFFFFF"><div class="ping1"><input name="website" type="text" size="25" maxlength="50"
											class="login_textarea"></div></td>
            <td align="right" bgcolor="#f5f5f5" style="font-weight:bolder;"><bean:message key="str1183"/></td>
            <td align="left" bgcolor="#FFFFFF"><div class="ping1"><select name="user_count" class="login_textarea">
                                      <option value="1"> 10-50人 </option>
                                      <option value="2"> 50-100人 </option>
                                      <option value="3"> 100-300人 </option>
                                      <option value="4"> 300-1000人 </option>
                </select></div></td>
          </tr>
          <tr>
            <td align="right" bgcolor="#f5f5f5" style="font-weight:bolder;"><bean:message key="str1447"/></td>
            <td align="left" bgcolor="#FFFFFF"><div class="ping1"><input name="group_contact_phone" type="text" size="25"
											maxlength="50" class="login_textarea"></div></td>
            <td align="right" bgcolor="#f5f5f5" style="font-weight:bolder;"><bean:message key="str1627"/> </td>
            <td align="left" bgcolor="#FFFFFF"><div class="ping1"> <input name="fax_nbr" type="text" size="15" maxlength="15"
											class="login_textarea"></div></td>
          </tr>
          <tr>
            <td align="right" bgcolor="#f5f5f5" style="font-weight:bolder;"><bean:message key="str1644"/></td>
            <td align="left" bgcolor="#FFFFFF"><div class="ping1"><select name="calling_type_code" style="width:100px">
                                    <%=calling_type_code%>
                </select></div></td>
            <td align="right" bgcolor="#f5f5f5" style="font-weight:bolder;"><bean:message key="str1645"/></td>
            <td align="left" bgcolor="#FFFFFF"><div class="ping1"><input type="text" name="juristic" maxlength="30"
											class="login_textarea"></div></td>
          </tr>
          <tr>
            <td align="right" bgcolor="#f5f5f5" style="font-weight:bolder;"><bean:message key="str1646"/></td>
            <td colspan="3" align="left" bgcolor="#FFFFFF"><div class="ping"><table>
											<tr>
												<td>
													<select name="bigsort" style="display:none">
														<option selected value="0">
															<bean:message key="str2655"/>													</option>
													</select>												</td>
												<td>
													<select name="sort1" size="10" 
														onChange="this.form.sort2.options.length=0;this.form.sort3.options.length=0;getSubitems(this.form.sort2, this.value)">
														<option selected value="0">
														<bean:message key="str2655"/>													</option>
													</select>												</td>
												<td>
													<select name="sort2" size="10" 
														onChange="this.form.sort3.options.length=0;getSubitems(this.form.sort3, this.value)">
														<option value="0">
														<bean:message key="str2655"/>													</option>
													</select>												</td>
												<td>
													<select name="sort3" size="10" >
														<option value="0">
																<bean:message key="str2655"/>													</option>
													</select>												</td>
											   
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
							<input type="hidden" name="trade_type_code" value="1047">
							<input type="hidden" name="e_class_id" id="e_class_id" value="0">
							<input type="hidden" name="e_class_name" id="e_class_name" value="">
							<input type="hidden" name="e_class_id_grp" id="e_class_id_grp" value="">
							<input type="hidden" name="user_type" value="0">
							<input type="hidden" name="e_class_name_grp" id="e_class_name_grp" value="">
							<input type="hidden" name="relation_type_name" id="relation_type_name" value="">
							<input name="id" type="hidden" value="">
							<input type="hidden" name="qq" value="">	
							<input type="hidden" name="home_addr" value="">	
							<input type="hidden" name="educate_degree_code" value="">	
							<input type="hidden" name="folk_code" value="">	
							<input type="hidden" name="work_depart" value="">	
							<input name="birthday" type="hidden" id="birthday" value="<%=fbtime%>">
							<input type="hidden" name="rsrv_str1" value="0">
							<input type="hidden" name="relation_type_code" value="1">
							<input type="hidden" name="class_level" value="1">
			  </div></td>
            </tr>
          </table>
					
				</form>
			</div>
		</div>
		  
		
		<script language="jscript" type="text/jscript">
	getSubitems(document.NewRegisterForm.bigsort, "", "请选择...", "");
	getSubitems(document.NewRegisterForm.sort1, "");
</script>
	</body>
</html>
<script type="text/javascript">

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

function showSalebuy(sale, buy)
{
	document.getElementById("trSale").style.display = (sale ? "block" : "none");
	document.getElementById("trBuy").style.display = (buy ? "block" : "none");
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
	  Ext.MessageBox.alert("XSaaS 提示","客户名称不能为空！");
	 return false;
	}
	if(document.NewRegisterForm.sev1.value=="" || document.NewRegisterForm.sev1.value==null){
	  Ext.MessageBox.alert("XSaaS 提示","客户分类不能为空！如果你没有分类，请点击『添加客户分类』，增加分类！");
	 return false;
	}
	if(document.NewRegisterForm.email.value == ""||document.NewRegisterForm.email.value == null)
	{
		Ext.MessageBox.alert("XSaaS 提示","邮箱地址不能为空！");
		return false;
	}
	return true;
}

</script>

