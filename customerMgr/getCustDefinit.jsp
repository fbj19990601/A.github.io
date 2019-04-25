<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="java.util.*"%>
<%@ page import="com.saas.biz.relationccMgr.RelationCcInfo"%>
<%@ page import="com.saas.biz.AreaInfoMgr.AreaInfo"%>
<%@ page import="com.saas.biz.custMgr.Custinfo"%>
<%@ page import="com.saas.biz.commen.ParamethodMgr"%>
<%@ page contentType="text/html;charset=GBK"%>

<html>
	<head>
		<title><bean:message key="str1136"/></title>
		<link href="/style/layout.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="/ext/adapter/ext/ext-base.js"></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/AreaInfo.js'></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/engine.js'></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/util.js'></script>
		<script src="/js/UrlEncode.js" language="jscript" type="text/jscript"></script>
		<script src="/js/newcregister.js" language="jscript" type="text/jscript"></script>
		<script src="/js/checkCust.js" language="jscript" type="text/jscript"></script>
		<script type="text/javascript" src="/ext/ext-all.js"></script>
		<link rel="stylesheet" type="text/css" href="/ext/resources/css/ext-all.css" />
		
<script language="javascript">

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

  function setCodeValue(val){
  	if(document.getElementById('user_name').value==''&&document.getElementById('phone').value==''&&document.getElementById('province').value==''&&document.getElementById('eparchy_code').value==''&&document.getElementById('city').value==''){ 
  		alert('请您至少选择一个查询条件！');
  		return false;
  	}else{
     document.getElementById("code").value=val;
     document.NewRegisterForm.submit();
     }
  }
  function setClassId(val){
   document.getElementById("class_id").value=val;
  }
  function searchByClass(){
   var class_id=document.getElementById("class_id").value;
   if(class_id=="" || class_id==null){
     alert("请选择行业分类！");
   }else{
    document.getElementById("code").value="1";
    document.NewRegisterForm.submit();
   }
  }
</script>
	</head>
	<body>
	<%
	AreaInfo arae=new AreaInfo();
   	Map country_Map=new HashMap();
   	country_Map=arae.getAreaByParent("5J2mc0X0G85BH");
    HttpSession  logsession = request.getSession(); 
    String cust_id = "";
    String iStart ="0";
    String iStart2 = "0";
    String code="0";
    String keyword="",type_code="";
   if (request.getParameter("code") != null)
   {
       code = request.getParameter("code");
   }
    if (request.getParameter("iStart") != null)
    {
        iStart = request.getParameter("iStart");
    }
    if (request.getParameter("iStart2") != null)
    {
        iStart2 = request.getParameter("iStart2");
    }
    if (logsession.getAttribute("SESSION_CUST_ID") != null)
    {
        cust_id = logsession.getAttribute("SESSION_CUST_ID").toString();
    }
		
	String user_name = "",phone="",province = "",city_code = "",eparchy_code="",class_id="";
	if (request.getParameter("class_id") != null)
   	{
       class_id = request.getParameter("class_id");
   	}
	if (request.getParameter("class_id") != null)
   	{
       class_id = request.getParameter("class_id");
   	}
   	if (request.getParameter("user_name") != null)
   	{
       user_name = request.getParameter("user_name");
   	}
	if (request.getParameter("phone") != null)
   	{
       phone = request.getParameter("phone");
   	}
	if (request.getParameter("province") != null)
   	{
       province = request.getParameter("province");
   	}
   	if (request.getParameter("eparchy_code") != null)
   	{
       eparchy_code = request.getParameter("eparchy_code");
   	}
	if (request.getParameter("city_code") != null)
   	{
       city_code = request.getParameter("city_code");
   	}
   	Custinfo info = new Custinfo();
   	ArrayList custDefinitList = new ArrayList();
   	ArrayList callingList = new ArrayList();
   	user_name=new String(user_name.getBytes("ISO-8859-1"),"GBK");
   	phone=new String(phone.getBytes("ISO-8859-1"),"GBK");
   	eparchy_code=new String(eparchy_code.getBytes("ISO-8859-1"),"GBK");
   	city_code=new String(city_code.getBytes("ISO-8859-1"),"GBK");
   	if(eparchy_code=="请选择.." || city_code.equals("请选择..")){
   	 	eparchy_code = "";
   	 	city_code = "";
   	}
   	int counter = info.getCustInfoBydefinition(cust_id,user_name,phone,province,eparchy_code,city_code); 
   	
   	int counter2 = info.getCustDefinit(cust_id,class_id);
   	
   	int pages2=counter2/20+1;
	int pageUp2=0,pageDown2=0;
	int currenPage2=Integer.valueOf(iStart2).intValue();
	if(pages2>currenPage2)
	{
	   if(currenPage2>0)
	   {
		pageUp2=currenPage2-1;
	   }
		pageDown2=currenPage2+1;
	}
    else if(pages2==currenPage2)
	{
	   pageUp2=currenPage2-1;
	   pageDown2=currenPage2;
	}
   	
    int pages=counter/20+1;
	int pageUp=0,pageDown=0;
	int currenPage=Integer.valueOf(iStart).intValue();
	if(pages>currenPage)
	{
	   if(currenPage>0)
	   {
		pageUp=currenPage-1;
	   }
		pageDown=currenPage+1;
	}
    else if(pages==currenPage)
	{
	   pageUp=currenPage-1;
	   pageDown=currenPage;
	}
   	try{
   	 if(code=="5" || code.equals("5")){
   	 	eparchy_code=new String(eparchy_code.getBytes("ISO-8859-1"),"GBK");
   	 	city_code=new String(city_code.getBytes("ISO-8859-1"),"GBK");
   	 	if(eparchy_code=="请选择.." || city_code.equals("请选择..")){
   	 		eparchy_code = "";
   	 		city_code = "";
   	 	}
   		custDefinitList = info.getCustInfoBydefinition(cust_id,user_name,phone,province,eparchy_code,city_code,Integer.valueOf(iStart).intValue());
   		//out.print(custDefinitList);
   		if(custDefinitList!=null && custDefinitList.size()>0){
   		}
   	 }
   	 if(code=="1" || code.equals("1")){
   	 	callingList =info.getCustDefinit(cust_id,class_id,Integer.valueOf(iStart2).intValue());
   	 }
   	}catch(Exception e){
   	  out.print(e.getMessage());
   	}
%>

		<form action="clientViewBySelfdefinition.jsp" method="post" name="NewRegisterForm">
			<input type="hidden" name="code" id="code" value="0">
			<table width="100%" border="0" cellspacing="1" cellpadding="0">
				<tr>
					<td width="17%" align="right" bgcolor="#f5f5f5" style="font-weight:bolder;">
						<bean:message key="str1076"/>
					</td>
					<td colspan="3" align="left" bgcolor="#FFFFFF">
						<div class="ping" style="display:inline;">
							<input name="user_name" type="text" value="">
						</div>
						<div class="ping1" style="display:inline"></div>
					</td>
					<td width="17%" align="right" bgcolor="#f5f5f5" style="font-weight:bolder;">
						<bean:message key="str3488"/>
					</td>
					<td colspan="3" align="left" bgcolor="#FFFFFF">
						<div class="ping" style="display:inline;">
							<input name="phone" type="text" value="">
						</div>
						<div class="ping1" style="display:inline"></div>
					</td>
				</tr>
				<tr>
					<td align="right" bgcolor="#f5f5f5" style="font-weight:bolder;"><bean:message key="str3475"/></td>
               		<td colspan="3" align="left" bgcolor="#FFFFFF">
            		<div class="ping" style="display:inline;">
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
				    </td>
			  		<td width="17%" align="right" bgcolor="#f5f5f5" style="font-weight:bolder;"><bean:message key="str1049"/></td>
			  		<td colspan="3" align="left">
			  		 	<div class="ping" style="display:inline;">
				 	  		<select name="eparchy_code" id="eparchy_code" style="display:inline"  onclick="setAreas(this.value)">
                      			<option value=""><bean:message key="str1180"/></option>
            	 	  		</select>
            	 	  	</div>
            	 	</td>
            	 	<td width="50"></td>
          </tr><tr>
              		<td align="right" bgcolor="#f5f5f5" style="font-weight:bolder;"><bean:message key="str3477"/></td>
              		<td colspan="3" align="left" bgcolor="#FFFFFF">
              		<div class="ping" style="display:inline;">
            	 	<select name="city_code" id="city" style="display:inline">
                    <option value=""><bean:message key="str1180"/></option>
                 	</select>
                 	</div>
                 	</td>
		</tr>
				<tr>
					<td width="17%" align="right" style="font-weight:bolder;" colspan="2">
						<input class="cxan" type="button" value="" style="cursor: hand" onclick="setCodeValue('5')">
					</td>
				</tr>
				
			</table>
			<table><tr><td height="20"></td></tr></table>
			<table width="100%" border="0" cellspacing="1" cellpadding="0">
				<tr>
					<td width="17%" align="right" bgcolor="#f5f5f5" style="font-weight:bolder;">
						<bean:message key="str1187"/>
					</td>
					<td colspan="3" align="left" bgcolor="#FFFFFF">
						<div class="ping1">
							<table align="left">
								<tr style="display:inline;float:left;">
									<td>
										<select name="sort1" size="10" style="width: 120px" onChange="this.form.sort2.options.length=0;this.form.sort3.options.length=0;getSubitems(this.form.sort2, this.value)" onclick="setClassId(this.value)">
											<option selected value="0">
												<bean:message key="str160"/>
											</option>
										</select>
									</td>
									<td>
										<select name="sort2" size="10" style="width: 120px" onChange="this.form.sort3.options.length=0;getSubitems(this.form.sort3, this.value)" onclick="setClassId(this.value)">
											<option value="0">
												<bean:message key="str160"/>
											</option>
										</select>
									</td>
									<td>
										<select name="sort3" size="10" style="width: 120px" onclick="setClassId(this.value)">
											<option value="0">
												<bean:message key="str160"/>
											</option>
										</select>
									</td>
									<td>
										<select name="bigsort" style="display:none">
											<option selected value="0">
												<bean:message key="str160"/>
											</option>
										</select>
									<br></td>
								</tr>
							</table>
						</div>
					</td>
				</tr>
			
			<input type="hidden" name="class_id" id="class_id" value="">
			<div class="ping1" style="display:inline"></div>
			<tr>
				<td width="15"></td>
				<td width="17%" align="left" style="font-weight:bolder;" colspan="2">
					<input class="cxan" type="button" value="" style="cursor: hand" onclick="searchByClass()">
				</td>
			</tr>
			</table>

		</form>
		
		<table width=100% border=0 cellpadding=2 cellspacing=1 align=center bgcolor="#e7e7e7">
			<tr>
				<td class="line1" style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="35%">
					<bean:message key="str4123"/>
				</td>
				
				<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="15%">
					<bean:message key="str3290"/>
				</td>
				<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="15%">
					Email
				</td>
			</tr>

		<%
		            if(callingList != null && callingList.size()>0)
		            {
		                int i=0;
		              	 for (Iterator it = callingList.iterator(); it.hasNext();)
		                  {
						        HashMap map = (HashMap) it.next();
						        String obj_cust_id="";
						        String cust_name="";
						        String group_contact_phone="";
						        String email = "";
						        if(map.get("cust_id") != null)
						        {
						           obj_cust_id=map.get("cust_id").toString();
						        }
						        if(map.get("email") != null)
						        {
						           email=map.get("email").toString();
						        }
						        if(map.get("cust_name") != null)
						        {
						           cust_name=map.get("cust_name").toString();
						        }
						        if(map.get("group_contact_phone") != null && !map.get("group_contact_phone").equals(""))
						        {
						           group_contact_phone=map.get("group_contact_phone").toString();
						        }
						      
		 %>

			<tr style="background-color:#f9f9f9; " id="changcolor_tr<%=i%>" onmouseover="MM_changeProp('changcolor_tr<%=i%>','','backgroundColor','#ffffff','DIV')" onmouseout="MM_changeProp('changcolor_tr<%=i%>','','backgroundColor','#f9f9f9','DIV')">
				<td style=" color:#000000; padding:2px 5px;" align=left>
					<a href="Custinfo.jsp?obj_cust_id=<%=obj_cust_id%>&user_id=" TARGET=appwin onclick="mydefss()"><%=cust_name%> </a>
				</td>
				<td style=" color:#000000; padding:2px 5px;" align=left>
					<%=group_contact_phone%>
				</td>
				<td style=" color:#000000;" align=center>
					<%=email%>
				</td>
			</tr>

			<%
			i++;
			}
		    %>
		    <tr>

																		<td  align="left" colspan="2" style="font-weight:normal; padding:2px 5px;"><bean:message key="str3988"/><%=counter2%><bean:message key="str611"/> &nbsp;<%=Integer.parseInt(iStart2)+1 %><bean:message key="str1029"/>&nbsp;&nbsp;<bean:message key="str3988"/><%=pages2%><bean:message key="str1029"/></td>
											
																		<td  align="right" colspan="3"  style=" padding:2px 5px;">
																		<a href="clientViewBySelfdefinition.jsp?iStart2=0&code=<%=code%>&cust_id=<%=cust_id %>&class_id=<%=class_id %>"> <bean:message key="str1030"/></a>&nbsp; &nbsp;
																		<% 
																			if(Integer.parseInt(iStart2)>0){
																		%>
																			<a href="clientViewBySelfdefinition.jsp?iStart2=<%=pageUp2%>&code=<%=code%>&cust_id=<%=cust_id %>&class_id=<%=class_id%>"><bean:message key="str1031"/></a> &nbsp;
																		<%
																			}
																			if(Integer.parseInt(iStart)<pages2-1){
																		%>
																			<a href="clientViewBySelfdefinition.jsp?iStart2=<%=pageDown2%>&code=<%=code%>&cust_id=<%=cust_id %>&class_id=<%=class_id%>"><bean:message key="str1032"/> </a>&nbsp; 
																		<%
																			}
																		%>
																		<a  href="clientViewBySelfdefinition.jsp?iStart2=<%=pages2-1%>&code=<%=code%>&cust_id=<%=cust_id %>&class_id=<%=class_id%>"><bean:message key="str1033"/></a></td>
											
															         </tr>
		    
		   		   
		   	<% 
		     }
		    %>
		    
		    <%
		            if(custDefinitList != null && custDefinitList.size()>0)
		            {
		                int i=0;
		              	 for (Iterator it = custDefinitList.iterator(); it.hasNext();)
		                  {
						        HashMap map = (HashMap) it.next();
						        String obj_cust_id="";
						        String cust_name="";
						        String group_contact_phone="";
						        String email = "";
						        if(map.get("cust_id") != null && !map.get("cust_id").equals(""))
						        {
						           obj_cust_id=map.get("cust_id").toString();
						        }
						        if(map.get("email") != null && !map.get("email").equals(""))
						        {
						           email=map.get("email").toString();
						        }
						        if(map.get("cust_name") != null && !map.get("cust_name").equals(""))
						        {
						           cust_name=map.get("cust_name").toString();
						        }
						        if(map.get("group_contact_phone") != null && !map.get("group_contact_phone").equals(""))
						        {
						           group_contact_phone=map.get("group_contact_phone").toString();
						        }
						      
		 	%>

			<tr style="background-color:#f9f9f9; " id="changcolor_tr<%=i%>" onmouseover="MM_changeProp('changcolor_tr<%=i%>','','backgroundColor','#ffffff','DIV')" onmouseout="MM_changeProp('changcolor_tr<%=i%>','','backgroundColor','#f9f9f9','DIV')">
				<td style=" color:#000000; padding:2px 5px;" align=left>
					<a href="Custinfo.jsp?obj_cust_id=<%=obj_cust_id%>&user_id=" target="_blank"><%=cust_name%> </a>
				</td>
				<td style=" color:#000000; padding:2px 5px;" align=left>
					<%=group_contact_phone%>
				</td>
				<td style=" color:#000000;" align=center>
					<%=email%>
				</td>
			</tr>
			<%
			i++;
			}
		     %>
		     <tr>

																		<td  align="left" colspan="2" style="font-weight:normal; padding:2px 5px;"><bean:message key="str3988"/><%=counter%><bean:message key="str611"/> &nbsp;<bean:message key="str759"/><%=Integer.parseInt(iStart)+1 %><bean:message key="str1029"/>&nbsp;&nbsp;<bean:message key="str3988"/><%=pages%><bean:message key="str1029"/></td>
											
																		<td  align="right" colspan="3"  style=" padding:2px 5px;">
																		<a href="clientViewBySelfdefinition.jsp?iStart=0&code=<%=code%>&cust_id=<%=cust_id %>&user_name=<%=user_name %>&phone=<%=phone %>&province=<%=province %>&eparchy_code=<%=eparchy_code %>&city_code=<%=city_code %>"><bean:message key="str1030"/> </a>&nbsp; &nbsp;
																		<% 
																			if(Integer.parseInt(iStart)>0){
																		%>
																			<a href="clientViewBySelfdefinition.jsp?iStart=<%=pageUp%>&code=<%=code%>&cust_id=<%=cust_id %>&user_name=<%=user_name %>&phone=<%=phone %>&province=<%=province %>&eparchy_code=<%=eparchy_code %>&city_code=<%=city_code %>"><bean:message key="str1031"/></a> &nbsp;
																		<%
																			}
																			if(Integer.parseInt(iStart)<pages-1){
																		%>
																			<a href="clientViewBySelfdefinition.jsp?iStart=<%=pageDown%>&code=<%=code%>&cust_id=<%=cust_id %>&user_name=<%=user_name %>&phone=<%=phone %>&province=<%=province %>&eparchy_code=<%=eparchy_code %>&city_code=<%=city_code %>"><bean:message key="str1032"/>  </a>&nbsp; 
																		<%
																			}
																		%>
																		<a  href="clientViewBySelfdefinition.jsp?iStart=<%=pages-1%>&code=<%=code%>&cust_id=<%=cust_id %>&user_name=<%=user_name %>&phone=<%=phone %>&province=<%=province %>&eparchy_code=<%=eparchy_code %>&city_code=<%=city_code %>"><bean:message key="str1033"/></a></td>
											
															         </tr>
		     
		   
		     <%         	 
		     }
		    %>
		    
		</table>

<script language="jscript" type="text/jscript">
	getSubitems(document.NewRegisterForm.bigsort, "", "请选择...", "");
	getSubitems(document.NewRegisterForm.sort1, "");
</script>
	</body>
</html>

