<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN"
 "http://www.w3.org/TR/html4/strict.dtd">
 <%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.util.*"%>
<%@ page import="com.saas.biz.custMgr.Custinfo"%>
<%@ page import="com.saas.biz.serverMgr.ServerInfo"%>
<%@ page import="com.saas.biz.commen.ParamethodMgr"%>
<%@ page import="com.saas.biz.AreaInfoMgr.AreaInfo"%>
<%@ page import="com.saas.biz.userMgr.UserDetailInfo"%>
<jsp:useBean id="bean" class="com.saas.biz.commen.commMethodMgr" scope="page" />
<jsp:useBean id="comm" class="com.saas.biz.commen.ParamethodMgr" scope="page" />
<jsp:useBean id="interf" class="com.saas.biz.rightMgr.TradeInterface" scope="page" />
<html>
<head>
<title><bean:message key="str116"/></title>
<link href="/crm/style/css.css" rel="stylesheet" type="text/css">
<link href="/style/css.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="/ext/adapter/ext/ext-base.js"></script>
<script type="text/javascript" src="/ext/ext-all.js"></script>
<link rel="stylesheet" type="text/css" href="/ext/resources/css/ext-all.css"/>
<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/AreaInfo.js'></script>
<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/engine.js'></script>  
<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/util.js'></script>  
<style type="text/css">
.line6 {width:72spx; width:70spx!important;border:#ffcb99 1px solid;  background-color:#fff8ee; text-align:left; padding-left: 20px;padding-top: 10px;padding-bottom: 10px; color:#000000; margin-top:13px; margin-bottom:13px;}   /*横栏样式6---- 头部提醒1*/
.line6 .img{width:53px; height:53px; float:left; margin-right:20px;}
.line6 .title {font-size:14px; font-weight:bold; color:#ff5400;}
.line1 {border-left:#ff7300 3px solid; background-color:#e2e2e2; color:#333333;text-align:left; font-size:12px;}  /*横栏样式1*/
h1 {float:left;padding-left:8px; font-size:15px; font-weight:bold; padding-top:5px;}
#td{
width:100px;
text-align:right;
margin-left:5px;
height:30px;
line-height:30px;
}
</style>
 
</head>
<%   
  HttpSession  logsession = request.getSession();     
  String s_cust_id="";
  if (logsession.getAttribute("SESSION_CUST_ID") != null)
  {
        s_cust_id = logsession.getAttribute("SESSION_CUST_ID").toString();
  }
  ArrayList custList=new ArrayList();
  String cust_id="",cust_name="",cust_aim="",fax_nbr="",group_contact_phone="",company_address="",juristic="",
  post_addr="",job="",qq="",home_addr="",blog="",post_code="",local_native_code="",work_name="",eparchy="",province="",
  group_memo="",scope="",website="",user_count="",user_id="",reg_money="";
  String user_count1 = "",calling_type_code="",enterprise_size_code="";
   boolean modify=false;
   if (request.getParameter("user_id") != null){
        user_id=request.getParameter("user_id");
   }
  if (request.getParameter("obj_cust_id") != null)
  {
        cust_id = request.getParameter("obj_cust_id").toString();
        ArrayList servList=new ServerInfo().getCustSerevicByCustId(cust_id);
       if(cust_id ==s_cust_id || cust_id.equals(s_cust_id))
       {
          modify=true;
       }
       else if(servList !=null && servList.size()>0)
       {
          modify=false;
       }
       else
       {
         modify=true;
       }
  }
  String folk_code = "";
  ParamethodMgr paramCom = new ParamethodMgr();
 
  ArrayList degreeList = paramCom.getCompareInfo("CRM", "degree");
  AreaInfo arae=new AreaInfo();
  ArrayList userList=new ArrayList();
  Map country_Map=new HashMap();
  country_Map=arae.getCountryAllByCode("cn");
  try{
  custList=new Custinfo().genSpecCustInfo(cust_id);
  userList=new UserDetailInfo().getUserDetailByUserId(user_id,cust_id);
  }catch(Exception ex){
    out.print(ex.getMessage());
  }
  if(userList !=null && userList.size()>0){
     HashMap u_Map=(HashMap)userList.get(0);
      if(u_Map.get("home_addr")!=null){home_addr=u_Map.get("home_addr").toString();}
      if(u_Map.get("qq")!=null){qq=u_Map.get("qq").toString();}
      if(u_Map.get("blog")!=null){blog=u_Map.get("blog").toString();}
      if(u_Map.get("cust_name")!=null){cust_name=u_Map.get("cust_name").toString();}
      if(u_Map.get("folk_code")!=null){folk_code=u_Map.get("folk_code").toString();}
      if(u_Map.get("post_addr")!=null){post_addr=u_Map.get("post_addr").toString();}
      if(u_Map.get("post_code")!=null){post_code=u_Map.get("post_code").toString();}
      if(u_Map.get("job")!=null){job=u_Map.get("job").toString();}
      //if(map.get("work_name")!=null){work_name=map.get("work_name").toString();}
  }
  if(custList !=null && custList.size()>0)
  {
        HashMap map=(HashMap)custList.get(0);
        if(map.get("cust_name")!=null){cust_name=map.get("cust_name").toString();}
        if(map.get("reg_money")!=null){reg_money=map.get("reg_money").toString();}
        if(map.get("enterprise_size_code")!=null){enterprise_size_code=map.get("enterprise_size_code").toString();}
        if(map.get("calling_type_code")!=null){calling_type_code=map.get("calling_type_code").toString();}
		if(map.get("cust_aim")!=null){cust_aim=map.get("cust_aim").toString();}
		if(map.get("fax_nbr")!=null){fax_nbr=map.get("fax_nbr").toString();}
		if(map.get("group_contact_phone")!=null){group_contact_phone=map.get("group_contact_phone").toString();}
		if(map.get("company_address")!=null){company_address=map.get("company_address").toString();}
		if(map.get("juristic")!=null){juristic=map.get("juristic").toString();}
		if(map.get("group_memo")!=null){group_memo=map.get("group_memo").toString();}
		if(map.get("scope")!=null){scope=map.get("scope").toString();}
		if(map.get("website")!=null){website=map.get("website").toString();}
		if(map.get("user_count")!=null){
			user_count=map.get("user_count").toString();
			if(!user_count.equals("")){
				user_count = comm.getParaCode2ByParaCode1("53",user_count);
			}
		}
		if(map.get("eparchy_code")!=null){eparchy=map.get("eparchy_code").toString();}
		if(map.get("province")!=null){province=map.get("province").toString();}
		eparchy = interf.comCodetoName("AREA_NAME",eparchy);
		province = interf.comCodetoName("AREA_NAME",province);
		
  }
  %>
<font color="#000000"></font>
<body>
   <table width="720" border="0" cellpadding="8" cellspacing="1" align=center  bgcolor="#e7e7e7">
   	  <tr height="25">
   	  	<td bgcolor="#ffffff">
   	  		<br>
   				<table cellspacing="0" cellpadding="0" width="700" border="0" align=center>
						 
							<tr height="30">
								<td  align="center"  colspan="3" style="background-color:#e2e2e2; color:#000000;  font-weight:bold; padding-top: 10px;"  width="700"><font face="宋体" size="6"><%=cust_aim%></font>
								</td>
							</tr>
					</table>	
					<br>
					<br>
					<table cellspacing="0" cellpadding="0" width="700" border="0" align=center>	
							<tr height="25">
								<td align="left" class="line1"  colspan="3" style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;"  width="150" >
									 <bean:message key="str1228"/> 
								</td>
							</tr>
							<br>
						  <tr>
						  	 <td>
						  	 	<div>
										<%=scope%>
									</div>
						  	 </td>
						  </tr>	
					</table>
					<br>
					<br>
					
		   <table width="700"  border="0" align="center" cellpadding="0" cellspacing="0">
	      <tr height="25">
	       <td class="line1"  colspan="3" style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;"  width="150" align="center">
	       	<bean:message key="str1229"/>
	       </td>
        </tr>
			 </table>
				<table width="700"  border="0" align="center" cellpadding="5" cellspacing="0"   style="border:#e0e0e0 1px solid;" >
			 		<tr valign="top">
			 		 <td valign="middle" class="S lh15"><table cellspacing="2" cellpadding="4" width="700" border="0">
						 <tbody>
			 				 <tr valign="top" bgcolor="#f6f6f6">
			            <td width="20%" align="right" bgcolor="dcecff" class="S" style="word-break:break-all"><b><bean:message key="str1230"/></b><br /></td>
									<td width="30%" align="left" class="S" style="word-break:break-all">
										<span class="S" style="word-break:break-all"><%=interf.codeToName("work_name",work_name)%></span>
									</td>
									<td width="20%" align="right" bgcolor="dcecff" class="S" style="word-break:break-all">
										<span class="S" style="word-break:break-all"><b><bean:message key="str1231"/></b><br /></span>
									</td>
									<td width="30%" align="left" class="S" style="word-break:break-all">
										<span class="S" style="word-break:break-all">
											<span class="S" style="word-break:break-all"><%=calling_type_code%></span>
										</span>
									</td>
								</tr>
			          <tr valign="top" bgcolor="#ffffff">
			              <td align="right" bgcolor="dcecff" class="S" style="word-break:break-all"><b><bean:message key="str1232"/></b><br /></td>
								    <td align="left" class="S" style="word-break:break-all">
											<span class="S" style="word-break:break-all"><%=enterprise_size_code%></span>
										</td>
										<td align="right" bgcolor="dcecff" class="S" style="word-break:break-all">
											<span class="S" style="word-break:break-all"><b><bean:message key="str1233"/></b><br /></span>
										</td>
										<td align="left" class="S" style="word-break:break-all">
											<span class="S" style="word-break:break-all">
												<span class="S" style="word-break:break-all"><%=reg_money%></span>
												</span>
										</td>
								 </tr>
						<tr valign="top" bgcolor="#f6f6f6">
			               <td align="right" bgcolor="dcecff" class="S" style="word-break:break-all"><b><bean:message key="str1234"/></b><br /></td>
			               <td align="left" class="S" style="word-break:break-all">
			               		<span class="S" style="word-break:break-all"><%=juristic%></span>
			               </td>
							<td align="right" bgcolor="dcecff" class="S" style="word-break:break-all"><b><bean:message key="str1924"/></b><br /></td>
			              	<td align="left" class="S" style="word-break:break-all">
			              		<span class="S" style="word-break:break-all"><%=user_count%></span>
						 	</td>
						</tr>
									   
			         </tbody>
			       </table>
						</td>
			    </tr>
			   </table>
					
					<br>
					<br>
				<table width=700 border=0 cellpadding=2 cellspacing=1 align=center  bgcolor="#e7e7e7">
					  <tr height="25">
					    <td class="line1"  colspan="3" style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;"  width="150" align="center">
					     <bean:message key="str2073"/>
					    </td>
					  </tr>
					  <tr style="display:none">
					      <td width="21%" align="right" style=" color:#000000; font-weight:bolder;"><bean:message key="str3227"/></td>
					      <td style=" color:#000000;background-color:#FFFFFF" colspan="2" align="left" width="79%">
					      	<div class="ping1"><%=cust_name%></div>
					      </td>
						</tr>	
						<tr style="background-color:#f9f9f9; ">
					      <td style=" color:#000000; font-weight:bolder;" align="right"><bean:message key="str3439"/></td>
					      <td style=" color:#000000;background-color:#FFFFFF" colspan="2" align="left">
					      	<div class="ping1"><%=juristic%></div>
					      </td>
						 </tr>
						<tr style="background-color:#f9f9f9; ">
					      <td  width="18%"  align="right" style=" color:#000000; font-weight:bolder;"><bean:message key="str3488"/></td>
					      <td style=" color:#000000;background-color:#FFFFFF" colspan="2" align="left" width="82%">
					      	<div class="ping1"><%=group_contact_phone%></div>
					      </td>
					  </tr>
						<tr style="background-color:#f9f9f9; ">
					      <td align="right" style=" color:#000000; font-weight:bolder;"><bean:message key="str1242"/></td>
					      <td style=" color:#000000; background-color:#FFFFFF" colspan="2" align="left">
					      	<div class="ping1"><%=fax_nbr%></div>
					      </td>
						 </tr>
						 <tr style="background-color:#f9f9f9; ">
					      <td align="right" style=" color:#000000; font-weight:bolder;"><bean:message key="str1243"/></td>
					      <td style=" color:#000000;background-color:#FFFFFF" colspan="2" align="left">
					      	<div class="ping1"><%=company_address%></div>
					      </td>
						 </tr>
						 <tr style="background-color:#f9f9f9; ">
					      <td style=" color:#000000; font-weight:bolder;" align="right"><bean:message key="str1244"/></td>
					      <td style=" color:#000000;background-color:#FFFFFF" colspan="2" align="left">
					      	<div class="ping1"><%=post_code%></div></td>
						 </tr>
						 <tr style="background-color:#f9f9f9; ">
					      <td align="right" style=" color:#000000; font-weight:bolder;"><bean:message key="str1245"/></td>
					      <td style=" color:#000000;background-color:#FFFFFF" colspan="2" align="left">
					      	<div class="ping1"><%=website%></div>
					      </td>
						 </tr>
						 <tr style="display:none">
					      <td style=" color:#000000; font-weight:bolder;" align="right"><bean:message key="str1246"/></td>
					       <td style=" color:#000000;background-color:#FFFFFF" colspan="2" align="left">
					          <div class="ping1">
					          	<a href="http://maps.google.com/?q=<%=province%>" target="_blank"><%=province%></a>
											<a href="http://maps.google.com/?q=<%=eparchy%>"  target="_blank"><%=eparchy%></a>
										</div>
					      </td>
						 </tr> 	 
						 
						 
						  
						 <tr style="display:none">
					      <td align="right" style=" color:#000000; font-weight:bolder;"><bean:message key="str1247"/></td>
					      <td style=" color:#000000;background-color:#FFFFFF" colspan="2" align="left" >
					      	<div class="ping1"><%=group_memo%></div>
					      </td>
						 </tr>
						   
						 <tr style="display:none">
					      <td height="40"  colspan="3" style="color:#000000;text-align: center;">
					      	<input class="gban" type="button" name="close" value="" onclick="javascript:window.close();">
					      </td>
						 </tr>
						</table>
						<br>
				    <br>
					</td>
				</tr>
				 
 		</table>
</body>
</html>