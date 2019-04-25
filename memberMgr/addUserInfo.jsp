<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.saas.biz.rightMgr.*"%>
<%@ page import="com.saas.biz.commen.ParamethodMgr"%>
<%@ page import="com.saas.biz.userMgr.UserInfo"%>
<%@ page import="com.saas.biz.AreaInfoMgr.AreaInfo"%>
<%@ page import="com.saas.biz.organizeMgr.OrganizeInfo"%>
<jsp:useBean id="bean" class="com.saas.biz.organizeMgr.OrganizeInfo" scope="page" />
<jsp:useBean id="comm" class="com.saas.biz.commen.commMethodMgr" scope="page" />
<%
	String birthday = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
	String user_id = "",cust_id="",view="",enable="",modify="",org_idx="";
	ParamethodMgr paramCom = new ParamethodMgr();
	HttpSession http_Ses=request.getSession();
	if(http_Ses.getAttribute("SESSION_CUST_ID")!=null){
	  cust_id=String.valueOf(http_Ses.getAttribute("SESSION_CUST_ID"));
	}
	String cust_name=bean.getCustNameById(cust_id);
	ArrayList passReqList = paramCom.getCompareInfo("CRM", "passwd_ques");
	ArrayList creditList = paramCom.getCompareInfo("CRM", "pspt_type_code");
	ArrayList folkList = paramCom.getCompareInfo("CRM", "folk_code");
	ArrayList degreeList = paramCom.getCompareInfo("CRM", "educate_degree_code");
	AreaInfo arae=new AreaInfo();
    Map country_Map=new HashMap();
    country_Map=arae.getAreaByParent("5J2mc0X0G85BH");
    user_id=comm.GenTradeId();
	ArrayList list=bean.getOrganizeByUpIdList(cust_id,"000000000000000");
    if(list !=null && list.size()>0){
	  HashMap map=(HashMap)list.get(0);
	  org_idx=map.get("org_id").toString();
	}
	cust_name=bean.getCustNameById(cust_id);
	TradeInterface interf = new TradeInterface();
%>
 <html>
	<head>
		<title>成员管理</title>
		<link href="/style/css.css" rel="stylesheet" type="text/css">
		<style type="text/css">
		.line6 {width:72spx; width:70spx!important;border:#ffcb99 1px solid;  background-color:#fff8ee; text-align:left; padding-left: 20px;padding-top: 10px;padding-bottom: 10px; color:#000000; margin-top:13px;}   /*横栏样式6---- 头部提醒1*/
		.line6 .img{width:53px; height:53px; float:left; margin-right:20px;}
		.line6 .title {font-size:14px; font-weight:bold; color:#ff5400;}
		.line1 {border-left:#ff7300 3px solid; background-color:#e2e2e2; color:#333333;text-align:left; font-size:12px; font-weight:bold; padding-left:20px;}  /*横栏样式1*/
		.Tree-Img {
		    background-image:url(/img/org.png) !important;
		}
		.root-Img {
		    background-image:url(/img/home.png) !important;
		}
		</style>
<script language="JavaScript" src="/www/fuction/public.js"></script>
<script src="/www/fuction/calendar.js" type="text/javascript"></script>
<script language="javascript" src="/js/Calendar_Ly.js"></script>
<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/AreaInfo.js'></script>
<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/UserInfo.js'></script>
<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/OrganizeInfo.js'></script>  
<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/engine.js'></script>  
<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/util.js'></script>
<link rel="stylesheet" type="text/css" href="../ext/resources/css/ext-all.css" />
<script type="text/javascript" src="../ext/adapter/ext/ext-base.js"></script>
<script type="text/javascript" src="../ext/ext-all.js"></script>
<script language="JavaScript">

function Check_Value()
{
    if(document.getElementById("user_name").value==""){
      alert("用户名不能为空！");
      document.getElementById("user_name").focus();
      return false;  
    }
	if (cTrim(document.Userform.passwd.value,0) == "" || document.Userform.passwd.value == null) 
	{                                                                                         
		alert("密码不可以为空！");                                                             
		document.Userform.passwd.focus();                                                    
		return false;                                                                            
	} 
	if (cTrim(document.Userform.passwd1.value,0) == "" || document.Userform.passwd1.value == null) 
	{                                                                                         
		alert("确认密码不可以为空！");                                                             
		document.Userform.passwd1.focus();                                                    
		return false;                                                                            
	}    
	if (document.Userform.passwd.value !=document.Userform.passwd1.value) 
	{                                                                                         
		alert("输入密码不一致！");                                                             
		document.Userform.passwd.focus();                                                    
		return false;                                                                            
	}
	if(document.getElementById("depart_name").value==""){
      alert("请选择归属部门！");
      document.getElementById("depart_name").focus();
       return false;  
    } 
       
	if (document.Userform.role_code.value =="") 
	{                                                                                         
		alert("请选择该用户所属角色，这决定了该用户可以使用系统哪些功能！");                                                             
		document.Userform.role_code.focus();                                                    
		return false;                                                                            
	}           
	/**                                                                                  
	if (cTrim(document.Userform.passwd_answer.value,0) == "" || document.Userform.passwd_answer.value == null) 
	{                                                                                         
		Ext.MessageBox.alert("Xsaas-提示","密码提示问题答案不可以为空！");                                                             
		document.Userform.passwd_answer.focus();                                                    
		return false;                                                                            
	}  **/      
	        
    /**                                                                       
	if (cTrim(document.Userform.pspt_id.value,0) == "" || document.Userform.pspt_id.value == null) 
	{                                                                                         
		Ext.MessageBox.alert("Xsaas-提示","证件号码不可以为空！");                                                             
		document.Userform.pspt_id.focus();                                                    
		return false;                                                                            
	}                                                                                      
	if (cTrim(document.Userform.local_native_code.value,0) == "" || document.Userform.local_native_code.value == null) 
	{                                                                                         
		Ext.MessageBox.alert("Xsaas-提示","籍贯不可以为空！");                                                             
		document.Userform.local_native_code.focus();                                                    
		return false;                                                                            
	}                                                                                        
	if (cTrim(document.Userform.phone.value,0) == "" || document.Userform.phone.value == null) 
	{                                                                                         
		Ext.MessageBox.alert("Xsaas-提示","联系电话不可以为空！");                                                             
		document.Userform.phone.focus();                                                    
		return false;                                                                            
	}                                                                                        
	if (cTrim(document.Userform.job.value,0) == "" || document.Userform.job.value == null) 
	{                                                                                         
		Ext.MessageBox.alert("Xsaas-提示","职位不可以为空！");                                                             
		document.Userform.job.focus();                                                    
		return false;                                                                            
	}                                                                                   
	**/       
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
    window.location.reload();
}
function confirmsub(formobj)
{
  if(window.confirm('你确定要提交吗？')) 
  {
      if (!Check_Value())
      {
           return;
      }    	            	           
      formobj.submit();    	         
  }
  else
  {
      return;
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
		        containerScroll: true, 
		        loader: new Ext.tree.TreeLoader({
		            dataUrl:'/tree/json_data.jsp'            
		        })
		    });
		var root_name=document.getElementById("cust_name").value;
	    var root = new Ext.tree.AsyncTreeNode({
	        text: root_name,
	        draggable:false,
	        iconCls:'root-Img',
	        id:'000000000000000'
	    });
	    tree.setRootNode(root);
	    tree.render();
	   	root.expand();
	   	tree.on("click",function(node,event){
	   	 document.getElementById("org_depart_code").value=node.id;
	   	 document.getElementById("depart_name").value=node.text;
	   	});
	   	tree.expandAll();
	   });
   
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
   //检测用户名是否重复
   function checkUserName(name){
     if(name !=null && name !=""){
        UserInfo.getUserNameCount(name,function(data){
           if(data== 1){
             alert("此用户名已存在,请重新填写！");
             document.getElementById("user_name").value="";
             document.getElementById("user_name").focus();
           }
        });
     }
   }
</script>
<script>
function startP(){
opener.location.reload();   
}
</script>
</head>
	<body onload="startP()">
	<jsp:include page="/inc/linkMenuInclude.jsp">
<jsp:param name="menu_id" value="RTh72Y5XJYTFI3u853w3" />
</jsp:include>
		<form name=Userform action=/doTradeReg.do method=post target="_self">
			<table width="100%" border="0" cellspacing="0" cellpadding="0"
				align="center">
				
				<tr>
					<td>
						<table width=100% border=0 cellpadding=5 cellspacing=1
							bgcolor="#dddddd" align="center">
							<input type=hidden name=trade_type_code value="0280" >
							<input name="user_id" type=hidden value=<%=user_id%>>
							<input name="cust_id" id="cust_id" type=hidden value=<%=cust_id%>>
							<input name="org_idx" id="org_idx" type="hidden" value="<%=org_idx%>">
							<tr>
								<td class="line1" align="left" colspan="4">
								<%
								  out.print("新增员工信息...");
								%>								</td>
							</tr>
							<tr>
								<td width="17%"
									align=right bgcolor="#f2f2f2"
									style=" color:#000000;  font-weight:bold; font-size:12px;">
									用户名：								</td>
								<td colspan="3" align=left bgcolor="#FFFFFF">
								<div class="ping"><input type="text" name="user_name" id="user_name" value="" onblur="checkUserName(this.value);">	</div>							</td>
							</tr>
							<tr>
								<td
									align=right bgcolor="#f2f2f2"
									style=" color:#000000;  font-weight:bold; font-size:12px;">
									密码：								</td>
								<td align=left bgcolor="#FFFFFF">
								<div class="ping"><input type=password name=passwd value="">	</div>							</td>
							    <td align=right bgcolor="#F2f2f2"><span style=" color:#000000;  font-weight:bold; font-size:12px;">确认密码：</span></td>
							    <td align=left bgcolor="#FFFFFF"><div class="ping"><input type=password name=passwd1 value="">	</div></td>
							</tr>
							<tr>
								<td
									align=right bgcolor="#f2f2f2"
									style=" color:#000000;  font-weight:bold; font-size:12px;">
									密码提示问题：								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping1"><select name=passwd_ques>
										<%
												if (passReqList != null && passReqList.size() > 0) {
												for (int i = 0; i < passReqList.size(); i++) {
													HashMap map = (HashMap) passReqList.get(i);
													String value = map.get("para_code1").toString();
													String name = map.get("para_code2").toString();
										%>
													<option value="<%=value%>">
														<%=name%>													</option>
										<%
											}
											}
										%>
									</select>	</div>							</td>
							    <td align=right bgcolor="#F2f2f2"><span style=" color:#000000;  font-weight:bold; font-size:12px;">密码提示问题答案：</span></td>
							    <td align=left bgcolor="#FFFFFF"><div class="ping1"><input type=text name=passwd_answer value="">	</div></td>
							</tr>
							<tr>
								<td align=right bgcolor="#f2f2f2" style=" color:#000000;  font-weight:bold; font-size:12px;">
									归属部门：								</td>
								<td colspan="3" align=left bgcolor="#FFFFFF">
								<div class="ping">
								    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                     <tr>
                     <td>
										  <div id="tree-div" style="display:inline;float:left;"></div>
												<input type="hidden" name="org_depart_code" id="org_depart_code" value=""> 
												<input type="hidden" name="depart_name" id="depart_name" value="">										
											</td>
                     </tr>
                    </table>
							    </div>								
							 </td>
							</tr>
							<tr>
								<td
									align=right bgcolor="#f2f2f2"
									style=" color:#000000;  font-weight:bold; font-size:12px;">
									用户角色：								</td>
								<td colspan="3" align=left bgcolor="#FFFFFF">
									<div class="ping"><select name="role_code" id="role_code">
									    <option value="">请选择归属角色</option>
									    <%=interf.getCustSpeOption("ROLE_LIST",cust_id)%>
									</select> 
									用户角色和权限密切相关，请慎重设置 [<a href="/roleMgr/roleIndex.jsp?menu_id=2EpTpGfO71V2R8NVx8S&info_type=0">添加角色</a>]		</div>						</td>
							</tr>
							<tr style="display:none">
								<td align=right bgcolor="#f2f2f2" style=" color:#000000;  font-weight:bold; font-size:12px;">
									是否允许登陆门户：								</td>
								<td colspan="3" align=left bgcolor="#FFFFFF">
								<div class="ping1"><input type="hidden"  name="web_login_tag" id="web_login_tag" value="1">	</div>							</td>
							</tr>
							<tr>
								<td align=right bgcolor="#f2f2f2"
									style=" color:#000000;  font-weight:bold; font-size:12px;">省份：</td>
               					<td align="left" bgcolor="#FFFFFF" colspan="6">
            					<div class="ping1" style="display:inline;">
         						<select name="province" id="province" onclick="setCitys(this.value)">
         						<option value="">请选择..</option>
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
				   				
			  					<font style="color:#000000;"><b>归属城市：</b></font>
			  					<div class="ping1" style="display:inline;">
				 					<select name="eparchy_code" id="eparchy_code" style="display:inline"  onclick="setAreas(this.value)">
                   						<option value="">请选择..</option>
            	 					</select>
              					<font style="color:#000000;"><b>区/县：</b></font>
            	 					<select name="city_code" id="city" style="display:inline">
                   						<option value="">请选择..</option>
                 					</select>
             				</td>
							</tr>
							<tr>
								<td
									align=right bgcolor="#f2f2f2"
									style=" color:#000000;  font-weight:bold; font-size:12px;">
									证件类别：								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping1"><select name=pspt_type_code>
										<%
												if (creditList != null && creditList.size() > 0) {
												for (int i = 0; i < creditList.size(); i++) {
													HashMap map = (HashMap) creditList.get(i);
													String value = map.get("para_code1").toString();
													String name = map.get("para_code2").toString();
										%>
										<option value="<%=value%>">
											<%=name%>										</option>
										<%
											}
											}
										%>
									</select>	</div>							</td>
							    <td align=right bgcolor="#f2f2f2"><span style="color:#000000;  font-weight:bold; font-size:12px;">证件号码：</span></td>
							    <td align=left bgcolor="#FFFFFF"><div class="ping1"><input type=text name=pspt_id value=""></div></td>
							</tr>
							<tr>
								<td
									align=right bgcolor="#f2f2f2"
									style=" color:#000000;  font-weight:bold; font-size:12px;">
									证件有效期：								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping1"><input name="pspt_end_date" type="text" id="pspt_end_date"
										onfocus="setday(this);" value="<%=birthday%>">
									</div>							</td>
							    <td align=right bgcolor="#f2f2f2"><span style=" color:#000000;  font-weight:bold; font-size:12px;">证件地址：</span></td>
							    <td align=left bgcolor="#FFFFFF"><div class="ping1"><input type=text name=pspt_addr value="">	</div>	</td>
							</tr>
							<tr>
								<td
									align=right bgcolor="#f2f2f2"
									style=" color:#000000;  font-weight:bold; font-size:12px;">
									用户性别：								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping1"><select name=sex>
										<option value=1>
											女性										</option>
										<option value=0>
											男性										</option>
									</select>		</div>						</td>
							    <td align=right bgcolor="#f2f2f2"><span style=" color:#000000;  font-weight:bold; font-size:12px;">生日：</span></td>
							    <td align=left bgcolor="#FFFFFF"><div class="ping1"><input name="birthday" type="text" id="birthday"
										onfocus="setday(this);" value="<%=birthday%>">
										</div></td>
							</tr>
							<tr>
								<td align=right bgcolor="#f2f2f2" style=" color:#000000;  font-weight:bold; font-size:12px;">
									籍贯：								</td>
								<td align=left bgcolor="#FFFFFF">
								<div class="ping1"><input type=text name=local_native_code value="">								</div></td>
							    <td align=right bgcolor="#f2f2f2"><span style=" color:#000000;  font-weight:bold; font-size:12px;">民族：</span></td>
							    <td align=left bgcolor="#FFFFFF"><div class="ping1"><select name=folk_code>
										<%
												if (folkList != null && folkList.size() > 0) {
												for (int i = 0; i < folkList.size(); i++) {
													HashMap map = (HashMap) folkList.get(i);
													String value = map.get("para_code1").toString();
													String name = map.get("para_code2").toString();
										%>
										<option value="<%=value%>">
											<%=name%>										</option>
										<%
											}
											}
										%>
									</select>	</div></td>
							</tr>
							<tr>
								<td
									align=right bgcolor="#f2f2f2"
									style=" color:#000000;  font-weight:bold; font-size:12px;">
									联系电话：								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping1"><input type=text name="phone" id="phone" value="">
									<input type="hidden" name="group_contact_phone" id="group_contact_phone" value="">	</div>							</td>
							    <td align=right bgcolor="#f2f2f2"><span style=" color:#000000;  font-weight:bold; font-size:12px;">传真：</span></td>
							    <td align=left bgcolor="#FFFFFF"><div class="ping1"><input type=text name=fax_nbr value="">		</div>	</td>
							</tr>
							<tr>
								<td
									align=right bgcolor="#f2f2f2"
									style=" color:#000000;  font-weight:bold; font-size:12px;">
									通信地址：								</td>
								<td align=left bgcolor="#FFFFFF">
								<div class="ping1"><input type=text name=post_addr value="">	</div>							</td>
							    <td align=right bgcolor="#f2f2f2"><span style=" color:#000000;  font-weight:bold; font-size:12px;">邮政编码：</span></td>
							    <td align=left bgcolor="#FFFFFF"><div class="ping1"><input type=text name=post_code value="">	</div></td>
							</tr>
							<tr>
								<td
									align=right bgcolor="#f2f2f2"
									style=" color:#000000;  font-weight:bold; font-size:12px;">
									家庭地址：								</td>
								<td align=left bgcolor="#FFFFFF">
								<div class="ping1"><input type=text name=home_addr value="">	</div>							</td>
							    <td align=right bgcolor="#f2f2f2"><span style=" color:#000000;  font-weight:bold; font-size:12px;">电子邮件：</span></td>
							    <td align=left bgcolor="#FFFFFF"><div class="ping1">	<input type=text name=email value="" >
									<input name="cust_name" id="cust_name" type="hidden" value="<%=cust_name%>">	</div></td>
							</tr>
							<tr>
								<td
									align=right bgcolor="#f2f2f2"
									style=" color:#000000;  font-weight:bold; font-size:12px;">
									QQ：								</td>
								<td align=left bgcolor="#FFFFFF">
								<div class="ping1"><input type=text name=qq value="">		</div>						</td>
							    <td align=right bgcolor="#f2f2f2"><span style=" color:#000000;  font-weight:bold; font-size:12px;">Blog：</span></td>
							    <td align=left bgcolor="#FFFFFF"><div class="ping1"><input type=text name=blog value="">		</div>	</td>
							</tr>
							
							<tr style="display: none">
								<td
									align=right bgcolor="#f2f2f2"
									style=" color:#000000;  font-weight:bold; font-size:12px;">
									工作单位：								</td>
								<td align=left bgcolor="#FFFFFF">
								<div class="ping1"><input type="hidden" name=work_name value="">	</div>							</td>
							    <td align=right bgcolor="#f2f2f2"><span style=" color:#000000;  font-weight:bold; font-size:12px;">工作部门： </span></td>
							    <td align=left bgcolor="#FFFFFF"><div class="ping1"><select name=work_depart>
									</select>						</div></td>
							</tr>
							
							<tr>
								<td
									align=right bgcolor="#f2f2f2"
									style=" color:#000000;  font-weight:bold; font-size:12px;">
									职位：								</td>
								<td align=left bgcolor="#FFFFFF">
								<div class="ping1"><input type=text name=job value="">	</div>							</td>
							    <td align=right bgcolor="#f2f2f2"><span style=" color:#000000;  font-weight:bold; font-size:12px;">教育程度：</span></td>
							    <td align=left bgcolor="#FFFFFF"><div class="ping1"><select name=educate_degree_code>
										<%
												if (degreeList != null && degreeList.size() > 0) {
												for (int i = 0; i < degreeList.size(); i++) {
													HashMap map = (HashMap) degreeList.get(i);
													String value = map.get("para_code1").toString();
													String name = map.get("para_code2").toString();
										%>
										<option value="<%=value%>">
											<%=name%>										</option>
										<%
											}
											}
										%>
									</select>	</div></td>
							</tr>
							<tr>
								<td
									align=right bgcolor="#f2f2f2"
									style=" color:#000000;  font-weight:bold; font-size:12px;">
									婚姻：								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping1"><select name=marriage>
										<option value=0>
											未婚										</option>
										<option value=1>
											已婚										</option>
									</select>	</div>							</td>
							    <td align=right bgcolor="#f2f2f2"><span style=" color:#000000;  font-weight:bold; font-size:12px;">社会保障号：</span></td>
							    <td align=left bgcolor="#FFFFFF"><div class="ping1">
						        <input type=text name=community_id value="">		</div></td>
							</tr>
							
							<tr>
								<td
									style="background-color:#ffffff; color:#000000; padding:3px;  font-size:12px;"
									align=center colspan=4>
									<INPUT id=advcheck name=advshow type=checkbox value=0
										onclick=check_none(Userform)>
									以上资料正确无误。
									<input type=hidden name=rsrv_num1 value=0>								</td>
							</tr>
							<tr>
								<td colspan=4 align=center bgcolor="#f2f2f2" style=" color:#000000;  font-weight:bold; font-size:12px; padding-top:5px;padding-bottom:5px;">
									<input class="tjan" name=submit1 type=button value="" disabled=true onclick=confirmsub(Userform)>&nbsp;&nbsp;
								</td>
							</tr>
						</table>
					</td>
				</tr>
				
			</table>
		</form>
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

</script>