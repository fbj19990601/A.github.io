<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
 
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.saas.biz.commen.ParamethodMgr"%>
<%@ page import="com.saas.biz.userMgr.UserInfo"%>
<%@ page import="com.saas.biz.AreaInfoMgr.AreaInfo"%>
<%@ page import="com.saas.biz.organizeMgr.OrganizeInfo"%>
<%@ page import="com.saas.biz.custMgr.Custinfo"%>
<jsp:useBean id="bean" class="com.saas.biz.organizeMgr.OrganizeInfo" scope="page" />
<%
	String date = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
	String user_id = "",cust_id="",view="",enable="",modify="",cust_aim="";
	String user_name = "",  passwd = "", passwd_answer = "", pspt_id = "", pspt_end_date = date, pspt_addr = "", birthday = date, local_native_code = "", post_addr = "",
	 phone = "", home_addr = "", community_id = "", job = "", email = "",qq="",fax="",blog="",post_code="",depart_code="",depart_name="";
	 String marriage="",educate_degree_code="";
	ParamethodMgr paramCom = new ParamethodMgr();
	  
	if(request.getParameter("cust_id")!=null){
	  cust_id=request.getParameter("cust_id");
	  cust_aim=new Custinfo().getCustCompany(cust_id);
	}
	if(request.getParameter("user")!=null){
	  modify=request.getParameter("user");
	}
	if(request.getParameter("view")!=null){
	  view=request.getParameter("view");
	  enable=" readonly";
	}
	String cust_name=bean.getCustNameById(cust_id);
	if (request.getParameter("user_id") != null) {
		user_id = request.getParameter("user_id");
		UserInfo userOjb = new UserInfo();
		ArrayList userList = userOjb.getUserInfoByUserId(user_id);
		if (userList != null && userList.size() > 0) {
			HashMap map = (HashMap) userList.get(0);
			if (map.get("user_name") != null) {
		        user_name = map.get("user_name").toString();
			}
			if (map.get("educate_degree_code") != null) {
		        educate_degree_code = map.get("educate_degree_code").toString();
			}
			if (map.get("marriage") != null) {
		        marriage = map.get("marriage").toString();
			}
			if (map.get("passwd") != null) {
		        passwd = map.get("passwd").toString();
			}
			if (map.get("passwd_answer") != null) {
				passwd_answer = map.get("passwd_answer").toString();
			}
			if (map.get("pspt_id") != null) {
				pspt_id = map.get("pspt_id").toString();
			}
			if (map.get("pspt_end_date") != null) {
				pspt_end_date = map.get("pspt_end_date").toString();
				if (pspt_end_date.length() > 10) {
					pspt_end_date = pspt_end_date.substring(0, 10);
				}
			}
			if (map.get("pspt_addr") != null) {
				pspt_addr = map.get("pspt_addr").toString();
			}
			if (map.get("birthday") != null) {
				birthday = map.get("birthday").toString();
				if (birthday.length() > 10) {
					birthday = birthday.substring(0, 10);
				}
			}
			if (map.get("local_native_code") != null) {
				local_native_code = map.get("local_native_code").toString();
			}
			if (map.get("post_addr") != null) {
				post_addr = map.get("post_addr").toString();
			}
			if (map.get("phone") != null) {
				phone = map.get("phone").toString();
			}
			if (map.get("community_id") != null) {
				community_id = map.get("community_id").toString();
			}
			if (map.get("home_addr") != null) {
				home_addr = map.get("home_addr").toString();
			}
			if (map.get("job") != null) {
				job = map.get("job").toString();
			}
			if (map.get("email") != null) {
				email = map.get("email").toString();
			}
			if (map.get("qq") != null) {
				qq = map.get("qq").toString();
			}
			if (map.get("fax") != null) {
				fax = map.get("fax").toString();
			}
			if (map.get("blog") != null) {
				blog = map.get("blog").toString();
			}
			if (map.get("post_code") != null) {
				post_code = map.get("post_code").toString();
			}
			if (map.get("depart_code") != null) {
				depart_code = map.get("depart_code").toString();
			}
		}
	}
	ArrayList passReqList = paramCom.getCompareInfo("CRM", "passwd_ques");
	ArrayList creditList = paramCom.getCompareInfo("CRM", "pspt_type_code");
	ArrayList folkList = paramCom.getCompareInfo("CRM", "folk_code");
	ArrayList degreeList = paramCom.getCompareInfo("CRM", "educate_degree_code");
	 AreaInfo arae=new AreaInfo();
     Map country_Map=new HashMap();
     String up_org_id="";
     country_Map=arae.getAreaByParent("5J2mc0X0G85BH");
     ArrayList orgList=new OrganizeInfo().getOrgnaizeByOrg_id(depart_code);
     if(orgList !=null && orgList.size()>0){
        HashMap map=(HashMap)orgList.get(0);
        depart_name=map.get("org_name").toString(); 
        up_org_id=map.get("up_org_id").toString();
        if(up_org_id=="000000000000000" || up_org_id.equals("000000000000000")){
         up_org_id=depart_code;
        }
     }
     String display="";
%>
 <html>
	<head>
		<title><bean:message key="str1764"/></title>
		<link href="/style/layout.css" rel="stylesheet" type="text/css">
		
<script language="JavaScript" src="/www/fuction/public.js"></script>
<script src="/www/fuction/calendar.js" type="text/javascript"></script>
<script language="javascript" src="/js/Calendar_Ly.js"></script>
<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/AreaInfo.js'></script>
<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/OrganizeInfo.js'></script>  
<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/engine.js'></script>  
<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/util.js'></script>
<link rel="stylesheet" type="text/css" href="../ext/resources/css/ext-all.css" />
<script type="text/javascript" src="../ext/adapter/ext/ext-base.js"></script>
<script type="text/javascript" src="../ext/ext-all.js"></script>
<script language="JavaScript">

function Check_Value()
{    
	document.getElementById("group_contact_phone").value=document.getElementById("phone").value;                                                                  
 	return true;
}
function check_none(current_obj)
{
     if (current_obj.advshow.checked)
     {
  	    current_obj.submit1.disabled=false;        	     
  	 }
  	 else
  	 {
  	    current_obj.submit1.disabled=true;
  	 }
}
function exit()
{
    window.close();
}
function confirmsub(formobj)
{
  document.getElementById('city_code').value=document.getElementById('city').value;
  if(document.getElementById("pspt_end_date").value=="" || document.getElementById("pspt_end_date").value==null){
	   alert("证件有效期不能为空！");
	   return false;
  }
  if(document.getElementById("birthday").value=="" || document.getElementById("birthday").value==null){
	   alert("生日不能为空！");
	   return false;
  }
  if(confirm('你确定要提交吗？')) 
  {
      if (!Check_Value())
      {
           return false;
      }    	            	           
      formobj.submit();    	         
  }
  else
  {
      return false;
  }
}
function setProvience(country){
    var country_id=country;
	AreaInfo.getAreaByParent(country_id,function(data){
	 DWRUtil.removeAllOptions("city_code");
	 DWRUtil.removeAllOptions("eparchy_code");
	 DWRUtil.addOptions("eparchy_code",data);
	});
}
function setCitys(prov){
   var provence=prov;
	 AreaInfo.getAreaByParent(provence,function(data){
	 DWRUtil.removeAllOptions("city_code");
	 DWRUtil.addOptions("city_code",data);
	});
}
function shwoOrHidden(){
if(document.getElementById("sh").style.display=="block"){
    document.getElementById("sh").style.display="none";
  }else{
    document.getElementById("sh").style.display="block";
  }
}
 var tree = new Ext.tree.TreePanel({   
    	el:"tree-div",   
        autoScroll:false,
        animate:true,
        width:'35%',
        height:'300px',
        enableDD:true,
        containerScroll: true, 
        loader: new Ext.tree.TreeLoader({
            dataUrl:'/tree.html'            
        })
    });
 function createTree(){
    var cust=document.getElementById("cust_id").value;
    var org_idx='000000000000000';
    var root_name=document.getElementById("cust_name").value;
	tree.on("click",function(node,event){
	  document.getElementById("org_depart_code").value=node.id;
	  document.getElementById("depart_name").value=node.text;
	});
    var root = new Ext.tree.AsyncTreeNode({
        text: root_name,
        draggable:false,
        iconCls:'root-Img',
        id:org_idx
    });
    tree.setRootNode(root);
   	var id=root.id;
   	OrganizeInfo.getOrganizeByUpIdMap(cust,id,function(data){
	for(var j=0;j<data.length;j++){ 
             var obj=data[j];
              callBackFunction(obj,tree.getNodeById(id));
     }
   	});
   	tree.render();
   	root.expand();
   	tree.expandAll();
   }
   
   //三级节点
   function callBackFunction(obj,node){
      var cust=document.getElementById("cust_id").value;
			for(var org_id in obj){ 
		         var org_name=obj[org_id];
		         if(org_id!='extend'){
		         var nodex = new Ext.tree.TreeNode({text:org_name,draggable:false,iconCls:'Tree-Img',id:org_id});
		         node.appendChild(nodex);
		         OrganizeInfo.getOrganizeByUpIdMap(cust,org_id,function(data){
			      for(var i=0;i<data.length;i++){ 
					var objx=data[i];
					for(var orgid in objx){ 
				         var orgname=objx[orgid];
				         if(orgid!='extend'){
				         var tree_nodex= new Ext.tree.TreeNode({text:orgname,draggable:false,iconCls:'Tree-Img',id:orgid});
				         nodex.appendChild(tree_nodex);
				         OrganizeInfo.getOrganizeByUpIdMap(cust,orgid,function(data){
				          for(var i=0;i<data.length;i++){ 
                            var obj=data[i];
                             callBackFunction(obj,tree_nodex);
                          }
				         });
				         }
			         }
			      }
			   });
			   }
		     }
   }
</script>
</head>
	<body onload="createTree()">
		<form name=Userform action=/doTradeReg.do method=post target="_self">
			<table width="818" border="0" cellspacing="0" cellpadding="0"
				align="center">
				<tr>
					<td height="26">&nbsp;
					</td>
				</tr>
				<tr>
					<td>
						<table width=93% border=0 cellpadding=5 cellspacing=1
							bgcolor="#dddddd" align="center">
							<input type=hidden name=trade_type_code value=0110 >
							<input name="user_id" type=hidden value=<%=user_id%>>
							<input name="cust_id" id="cust_id" type=hidden value=<%=cust_id%>>
							<tr>
								<td height="30" colspan="2" align="left" class="line1">
								<%if(view!=null && !view.equals("")){
								  out.print("查看联系人信息");
								  display="display:none";
								 }else if(modify!=null && !modify.equals("")){
								   out.print("修改用户详细信息");
								 }else{
								   out.print("修改联系人信息");
								   display="display:none";
								}
								%>
							  </td>
							</tr>
							<tr>
								<td align=right style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;">
								<bean:message key="str2477"/></td>
								<td width="74"
									style="background-color:#ffffff; color:#000000;  font-size:12px; padding:5px; text-align:left; width:75%;padding:3px 5px;height:25px">
									<%=cust_aim%>
							  </td>
							</tr>
							<tr>
								<td align=right style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;">
								<bean:message key="str2917"/></td>
								<td width="74"
									style="background-color:#ffffff; color:#000000;  font-size:12px; padding:5px; text-align:left; width:75%;">
									<%=cust_name%>
							  </td>
							</tr>
							<tr style="<%=display%>">
								<td align=right style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;">
									<bean:message key="str1038"/></td>
								<td
									style="background-color:#ffffff; color:#000000;  font-size:12px; padding:5px;"
									align=left>
									<input name=passwd type=text value="<%=passwd%>" size="30"  <%=enable%>>
								</td>
							</tr>
							<tr style="<%=display%>">
								<td
									align=right
									style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;">
									<bean:message key="str1039"/>								</td>
								<td
									style="background-color:#ffffff; color:#000000;  font-size:12px;padding:5px;"
									align=left>
									<input name=passwd1 type=text value="<%=passwd%>" size="30"  <%=enable%>>
								</td>
							</tr>
							<tr style="<%=display%>">
								<td
									align=right
									style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;">
									<bean:message key="str1040"/>								</td>
								<td
									style="background-color:#ffffff; color:#000000;  font-size:12px;padding:5px;"
									align=left>
									<select name=passwd_ques>
										<%
												if (passReqList != null && passReqList.size() > 0) {
												for (int i = 0; i < passReqList.size(); i++) {
													HashMap map = (HashMap) passReqList.get(i);
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
								</td>
							</tr>
							<tr style="<%=display%>">
								<td
									align=right
									style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;">
									<bean:message key="str1041"/>								</td>
								<td style="background-color:#ffffff; color:#000000;  font-size:12px;padding:5px;" align=left>
									<input name=passwd_answer type=text value="<%=passwd_answer%>" size="30"  <%=enable%>>
								</td>
							</tr>
							<tr>
								<td align=right style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;">
									<bean:message key="str1655"/>								</td>
								<td style="background-color:#ffffff; color:#000000;  font-size:12px; padding:5px; display:inline" align=left>
								   <div id="sh" style="display: none;">
								    <div id="tree-div"></div>
								   </div>
									<input type="hidden" name="org_depart_code" id="org_depart_code" value="<%=depart_code%>"> 
									<input name="depart_name" type="text" id="depart_name" value="<%=depart_name%>" size="30" <%=enable%>>
									<input type="checkbox" id="org" name="org" onclick="shwoOrHidden()"><bean:message key="str1774"/>	
								</td>
							</tr>
							<tr style="display:none">
								<td align=right style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;">
								<bean:message key="str1775"/>								</td>
								<td style="background-color:#ffffff; color:#000000;  font-size:12px; padding:5px;" align=left>
									<select name=web_login_tag>
										<o<bean:message key="str1776"/>
										</option>
										<option value=0>
											<bean:message key="str1777"/>
										</option>
									</select>
								</td>
							</tr>
							<tr>
								<td align="right" bgcolor="#f5f5f5" style="font-weight:bolder;"><font size="2"><bean:message key="str3475"/></font></td>
              					 <td align="left" bgcolor="#FFFFFF" >
            						<div class="ping1" style="display:inline;">
         						<select name="province" id="province" onclick="setCitys(this.value)">
         						<option value=""><bean:message key="str160"/></option>
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
							<font style="font-weight:bolder;" size="2"><bean:message key="str1049"/></font>
							<div class="ping1" style="display:inline;">
								<select name="eparchy_code" id="eparchy_code" style="display:inline"  onclick="setAreas(this.value)">
              						<option value=""><bean:message key="str1050"/></option>
       	 						</select>
        					 <font style="font-weight:bolder;" size="2"><bean:message key="str1051"/></font>
       	 						<select name="city" id="city" style="display:inline">
              						<option value=""><bean:message key="str1050"/></option>
            					</select>
          					</div>
        					</td>
							</tr>
							<tr>
								<td
									align=right
									style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;">
									<bean:message key="str1052"/>								</td>
								<td
									style="background-color:#ffffff; color:#000000;  font-size:12px;padding:5px;"
									align=left>
									<select name=pspt_type_code>
										<%
												if (creditList != null && creditList.size() > 0) {
												for (int i = 0; i < creditList.size(); i++) {
													HashMap map = (HashMap) creditList.get(i);
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
								</td>
							</tr>
							<tr style="display:none">
								<td
									align=right
									style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;">
									<bean:message key="str1053"/>								</td>
								<td
									style="background-color:#ffffff; color:#000000;  font-size:12px;padding:5px;"
									align=left>
									<input name=pspt_id type=text value="<%=pspt_id%>" size="30"  <%=enable%>>
								</td>
							</tr>
							<tr>
								<td
									align=right
									style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;">
									<bean:message key="str1054"/>							</td>
								<td
									style="background-color:#ffffff; color:#000000;  font-size:12px;padding:5px;"
									align=left>
									<input name="pspt_end_date" type="text" id="pspt_end_date"
										onfocus="setday(this);" value="<%=pspt_end_date%>">
									(yyyy-MM-dd)
								</td>
							</tr>
							<tr style="display: none">
								<td
									align=right
									style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;">
									<bean:message key="str1055"/>								</td>
								<td
									style="background-color:#ffffff; color:#000000;  font-size:12px;padding:5px;"
									align=left>
									<input name=pspt_addr type=text value=<%=pspt_addr%> size="40" <%=enable%>>
								</td>
							</tr>
							<tr>
								<td
									align=right
									style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;">
									<bean:message key="str1056"/>								</td>
								<td
									style="background-color:#ffffff; color:#000000;  font-size:12px;padding:5px;"
									align=left>
									<select name=sex>
									<option value=0>
											<bean:message key="str1057"/>
									  </option>
										<option value=1>
											<bean:message key="str1058"/>
										</option>
									</select>
								</td>
							</tr>
							<tr>
								<td
									align=right
									style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;">
									<bean:message key="str1059"/>								</td>
								<td
									style="background-color:#ffffff; color:#000000;  font-size:12px;padding:5px;"
									align=left>
									<input name="birthday" type="text" id="birthday"
										onfocus="setday(this);" value="<%=birthday%>" size="20" maxlength="10">
									(yyyy-MM-dd)
								</td>
							</tr>
							<tr>
								<td
									align=right
									style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;">
										<bean:message key="str1060"/>							</td>
								<td
									style="background-color:#ffffff; color:#000000;  font-size:12px;padding:5px;"
									align=left>
									<input type=text name=local_native_code
										value="<%=local_native_code%>"  <%=enable%>>
								</td>
							</tr>
							<tr>
								<td
									align=right
									style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;">
									<bean:message key="str1061"/>								</td>
								<td
									style="background-color:#ffffff; color:#000000;  font-size:12px;padding:5px;"
									align=left>
									<select name=folk_code>
										<%
												if (folkList != null && folkList.size() > 0) {
												for (int i = 0; i < folkList.size(); i++) {
													HashMap map = (HashMap) folkList.get(i);
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
								</td>
							</tr>
							<tr>
								<td
									align=right
									style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;">
									<bean:message key="str1447"/>								</td>
								<td
									style="background-color:#ffffff; color:#000000;  font-size:12px;padding:5px;"
									align=left>
									<input type=text name="phone" id="phone" value="<%=phone%>"  <%=enable%> size="30" maxlength="15">
									<input type="hidden" name="group_contact_phone" id="group_contact_phone" value="">
								</td>
							</tr>
							<tr>
								<td
									align=right
									style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;">
									<bean:message key="str1666"/>								</td>
								<td
									style="background-color:#ffffff; color:#000000;  font-size:12px;padding:5px;"
									align=left>
									<input type=text name=fax_nbr value="<%=fax%>"  <%=enable%> size="30" maxlength="15">
								</td>
							</tr>
							<tr>
								<td
									align=right
									style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;">
									<bean:message key="str1667"/>								</td>
								<td
									style="background-color:#ffffff; color:#000000;  font-size:12px;padding:5px;"
									align=left>
									<input type=text name=post_addr value="<%=post_addr%>"  <%=enable%> size="30" maxlength="40">
								</td>
							</tr>
							<tr>
								<td
									align=right
									style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;">
									<bean:message key="str1668"/>								</td>
								<td
									style="background-color:#ffffff; color:#000000;  font-size:12px;padding:5px;"
									align=left>
									<input type=text name=post_code value="<%=post_code%>"  <%=enable%> size="10" maxlength="6">
								</td>
							</tr>
							<tr>
								<td
									align=right
									style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;">
									<bean:message key="str1669"/>								</td>
								<td
									style="background-color:#ffffff; color:#000000;  font-size:12px;padding:5px;"
									align=left>
									<input name=home_addr type=text value="<%=home_addr%>" size="30"  <%=enable%>>
								</td>
							</tr>
							<tr>
								<td
									align=right
									style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;">
									<bean:message key="str3493"/>								</td>
								<td
									style="background-color:#ffffff; color:#000000;  font-size:12px;padding:5px;"
									align=left>
									<input name=email type=text value="<%=email%>" size="30"  <%=enable%>>
									<input name="cust_name" id="cust_name" type="hidden" value="<%=cust_name%>">
								</td>
							</tr>
							<tr>
								<td
									align=right
									style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;">
									QQ：								</td>
								<td
									style="background-color:#ffffff; color:#000000;  font-size:12px;padding:5px;"
									align=left>
									<input type=text name=qq value="<%=qq%>" <%=enable%> size="12" maxlength="12">
								</td>
							</tr>
							<tr>
								<td
									align=right
									style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;">
									Blog：								</td>
								<td
									style="background-color:#ffffff; color:#000000;  font-size:12px;padding:5px;"
									align=left>
									<input name=blog type=text value="<%=blog%>" size="30" <%=enable%>>
								</td>
							</tr>
							
							<tr style="display: none">
								<td
									align=right
									style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;">
									<bean:message key="str3494"/>								</td>
								<td
									style="background-color:#ffffff; color:#000000;  font-size:12px;padding:5px;"
									align=left>
									<input type="hidden" name=work_name value="">
								</td>
							</tr>
							<tr style="display: none">
								<td
									align=right
									style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;">
									<bean:message key="str3495"/>								</td>
								<td style="background-color:#ffffff; color:#000000;  font-size:12px;padding:5px;"
									align=left>
									<select name=work_depart>
									</select>
								</td>
						 	</tr>
							
							<tr>
								<td
									align=right
									style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;">
									<bean:message key="str3496"/>								</td>
								<td
									style="background-color:#ffffff; color:#000000;  font-size:12px;padding:5px;"
									align=left>
									<input name=job type=text value="<%=job%>" size="30">
									<input type=hidden name="up_org_id" id="up_org_id" value="<%=up_org_id%>">
								</td>
							</tr>
							<tr>
								<td
									align=right
									style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;">
									<bean:message key="str3497"/>								</td>
								<td
									style="background-color:#ffffff; color:#000000;  font-size:12px;padding:5px;"
									align=left>
									<select name=educate_degree_code>
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
								</td>
							</tr>
							<tr>
								<td
									align=right
									style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;">
									<bean:message key="str3498"/>								</td>
								<td
									style="background-color:#ffffff; color:#000000;  font-size:12px;padding:5px;" align=left>
									<select name=marriage>
										<% 
											if(marriage=="1"){
										%>
											<option value=1><bean:message key="str3500"/></option>
										<% 
											}else{
										%>
											<option value=0><bean:message key="str3499"/></option>
										<% 
											}
										%>
										<option value=0>
										<bean:message key="str3499"/>
										</option>
										<option value=1>
											<bean:message key="str3500"/>
										</option>
									</select>
								</td>
							</tr>
							<input type="hidden" name="city_code" id="city_code" value="">
							<tr style="display:none">
								<td
									align=right
									style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;">
									<bean:message key="str3501"/></td>
								<td
									style="background-color:#ffffff; color:#000000;  font-size:12px;padding:5px;"
									align=left>oornam<input type=text name=community_id value="<%=community_id%>">
								<br><br><br><br><br><br></td>
							</tr>
							<%if(view ==null || view.equals("")){%>
							<tr>
								<td
									style="background-color:#ffffff; color:#000000;  font-size:12px; padding:5px;"
									align=center colspan=2>
									<INPUT id=advcheck name=advshow type=checkbox value=0
										onclick=check_none(Userform)>
									<bean:message key="str3502"/>
									<input type=hidden name=rsrv_num1 value=0>
								</td>
							</tr>
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px; padding-top:10px;padding-bottom:10px;" align=center colspan=2>
									<input class="tjan" name=submit1 type=button value="" disabled=true onclick="return confirmsub(Userform)">&nbsp;&nbsp;&nbsp;
								</td>
							</tr>
							<%}else{%>
							<tr>
							<td colspan="2" style="text-align: center;">
							<input  class="gban" name=button1 type=button value="" onclick=exit()>
							</td>
							</tr>
							<%}%>
					  </table>
					</td>
				</tr>
				<tr>
					<td height="46">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
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
</script>