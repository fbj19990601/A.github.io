<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="java.util.*"%>
<%@ page import="com.saas.biz.relationccMgr.RelationCcInfo"%>
<%@ page import="com.saas.biz.custMgr.Custinfo"%>
<%@ page import="com.saas.biz.commen.ParamethodMgr"%>
<%@ page contentType="text/html;charset=GBK"%>

<html>
	<head>
		<title><bean:message key="str3429"/></title>
		<link href="/style/css.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="/ext/adapter/ext/ext-base.js"></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/engine.js'></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/util.js'></script>
		<script src="/js/UrlEncode.js" language="jscript" type="text/jscript"></script>
		<script src="/js/newcregister.js" language="jscript" type="text/jscript"></script>
		<script src="/js/checkCust.js" language="jscript" type="text/jscript"></script>
		<script type="text/javascript" src="/ext/ext-all.js"></script>
		<link rel="stylesheet" type="text/css" href="/ext/resources/css/ext-all.css" />
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/UserInfo.js'></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/engine.js'></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/util.js'></script>
		<style type="text/css">
.line6 {width:72spx; width:70spx!important;border:#ffcb99 1px solid;  background-color:#fff8ee; text-align:left; padding-left: 20px;padding-top: 10px;padding-bottom: 10px; color:#000000; margin-top:13px;}   /*横栏样式6---- 头部提醒1*/
.line6 .img{width:53px; height:53px; float:left; margin-right:20px;}
.line6 .title {font-size:14px; font-weight:bold; color:#ff5400;}
.line1 {border-left:#ff7300 3px solid; background-color:#e2e2e2; color:#333333;text-align:left; font-size:12px;}  /*横栏样式1*/
</style>
<script language="javascript">
  function chechIfo(obj_id)
  {
    var result=new Boolean(false);
	if(confirm('是否确认要执行本操作？')) 
	{
	    return true;
	}
	else
	{
		return false;
	}
  }
  function checkRaleType(type){
    if(type!="0"){
      document.getElementById("code").value="2";
      sumbimtData();
    }
  }
  function checkRelation(){
    if(document.getElementById("cust_name").value!=""){
       document.getElementById("code").value="1";
       sumbimtData();
    }else{
      alert('请输入正确的客户名称，否则会影响你的查询结果！');
      document.getElementById("cust_name").focus();
    }
  }
  function sumbimtData(){
    document.relationForm.submit();
  }
  function setCodeValue(val){
     document.getElementById("code").value=val;
     document.NewRegisterForm.submit();
  }
</script>
	</head>
	<body>
		<%
   HttpSession  logsession = request.getSession(); 
    String cust_id = "";
    String iStart ="0";
    String meun_idx="",callingType="";
    String code="0";
   String keyword="",type_code="";
   if (request.getParameter("code") != null)
   {
       code = request.getParameter("code");
   }
   if (request.getParameter("callingType") != null)
   {
       callingType = request.getParameter("callingType");
   }
   if (request.getParameter("cust_name") != null)
   {
       keyword = request.getParameter("cust_name");
       keyword=new String(keyword.getBytes("ISO-8859-1"),"GBK");  
   }
   if (request.getParameter("relation_type_code") != null)
   {
       type_code = request.getParameter("relation_type_code");
   }
    if (request.getParameter("iStart") != null)
    {
        iStart = request.getParameter("iStart");
    }
    if (logsession.getAttribute("SESSION_CUST_ID") != null)
    {
        cust_id = logsession.getAttribute("SESSION_CUST_ID").toString();
    }
    if (request.getParameter("menu_id") != null)
    {
        meun_idx = request.getParameter("menu_id");
        logsession.setAttribute("menu_id",meun_idx);
    }
    if( logsession.getAttribute("menu_id")!= null)
    {
       meun_idx=(String)logsession.getAttribute("menu_id");
    }
  RelationCcInfo relation=new RelationCcInfo();
  ArrayList relationList =new ArrayList();
  try
  {  
	   if(code=="0" || code.equals("0")){
	     relationList=relation.getRelationPageByType(Integer.valueOf(iStart).intValue(),cust_id,"1");
	    }else if(code=="1" || code.equals("1")){
	     relationList=relation.getRelationByCustName(cust_id,keyword);
	    }
	    else if(code=="2" || code.equals("2")){
	     relationList=relation.getRelationByRelaType(cust_id,type_code);
	    }
  }
  catch(Exception ex)
  {
    out.print(ex.getMessage());
  }
   ParamethodMgr paramObj=new ParamethodMgr();
   HashMap typeMap=paramObj.getCompareInfoByCode("CRM","relation_type_code");
   ArrayList custRelation = paramObj.getCompareInfo("CRM", "relation_type_code"); 
   
   String selectItmes=paramObj.getSelectItems("21");//行业查询相关
   
    int counter=relation.getPageSizeByType("1",cust_id);
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
	
	
	String user_name = "",phone="",province = "",city = "",profession = "";
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
	if (request.getParameter("city") != null)
   	{
       city = request.getParameter("city");
   	}
	if (request.getParameter("profession") != null)
   	{
       profession = request.getParameter("profession");
   	}
   	Custinfo info = new Custinfo();
   	ArrayList custDefinitList = new ArrayList();
   	try{
   	 if(code=="5" || code.equals("5")){
   		custDefinitList = info.getCustInfoBydefinition(cust_id,user_name,phone,province,city);
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
						<bean:message key="str1855"/>
					</td>
					<td colspan="3" align="left" bgcolor="#FFFFFF">
						<div class="ping" style="display:inline;">
							<input name="user_name" type="text" value="">
						</div>
						<div class="ping1" style="display:inline"></div>
					</td>
				</tr>
				<tr>
					<td width="17%" align="right" bgcolor="#f5f5f5" style="font-weight:bolder;">
						<bean:message key="str3129"/>
					</td>
					<td colspan="3" align="left" bgcolor="#FFFFFF">
						<div class="ping" style="display:inline;">
							<input name="phone" type="text" value="">
						</div>
						<div class="ping1" style="display:inline"></div>
					</td>
				</tr>
				<tr>
					<td width="17%" align="right" bgcolor="#f5f5f5" style="font-weight:bolder;">
						<bean:message key="str1919"/>
					</td>
					<td colspan="3" align="left" bgcolor="#FFFFFF">
						<div class="ping" style="display:inline;">
							<input name="province" type="text" value="">
						</div>
						<div class="ping1" style="display:inline"></div>
					</td>
				</tr>
				<tr>
					<td width="17%" align="right" bgcolor="#f5f5f5" style="font-weight:bolder;">
						<bean:message key="str1920"/>
					</td>
					<td colspan="3" align="left" bgcolor="#FFFFFF">
						<div class="ping" style="display:inline;">
							<input name="city" type="text" value="">
						</div>
						<div class="ping1" style="display:inline"></div>
					</td>
				</tr>
				<tr>
					<td width="17%" align="right" style="font-weight:bolder;" colspan="2">
						<input class="cxan" type="button" value="" style="cursor: hand" onclick="setCodeValue('5')">
					</td>
				</tr>
			</table>

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
										<select name="sort1" size="10" style="width: 120px" onChange="this.form.sort2.options.length=0;this.form.sort3.options.length=0;getSubitems(this.form.sort2, this.value)">
											<option selected value="0">
												<bean:message key="str2655"/>
											</option>
										</select>
									</td>
									<td>
										<select name="sort2" size="10" style="width: 120px" onChange="this.form.sort3.options.length=0;getSubitems(this.form.sort3, this.value)">
											<option value="0">
												<bean:message key="str2655"/>
											</option>
										</select>
									</td>
									<td>
										<select name="sort3" size="10" style="width: 120px">
											<option value="0">
											<bean:message key="str2655"/>
											</option>
										</select>
									</td>
									<td>
										<select name="bigsort" style="display:none">
											<option selected value="0">
												<bean:message key="str2655"/>
											</option>
										</select>
									</td>
								</tr>
							</table>
						</div>
					</td>
				</tr>
			
			<input type="hidden" name="callingType" id="callingType" value="0">
			<div class="ping1" style="display:inline"></div>
			<tr>
				<td width="17%" align="right" style="font-weight:bolder;" colspan="2">
					<input class="cxan" type="button" value="" style="cursor: hand" onclick="setCallingType('6')">
				</td>
			</tr>
			</table>
		</form>

		<%
				    if(custDefinitList != null && custDefinitList.size()>0)
		            {
		        %>

		<table width=727 border=0 cellpadding=2 cellspacing=1 align=center bgcolor="#e7e7e7">
			<tr>
				<td class="line1" style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="35%">
					<bean:message key="str3237"/>
				</td>
				<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="15%">
					<bean:message key="str371"/>
				</td>
				<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="15%">
					<bean:message key="str372"/>
				</td>
				<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="15%">
					<bean:message key="str1141"/></
			</tr>

			<%
		            	
		                int i=0;
		              	 for (Iterator it = custDefinitList.iterator(); it.hasNext();)
		                  {
						        HashMap map = (HashMap) it.next();
						        String obj_cust_id=map.get("obj_cust_id").toString();
						        String cust_name="";
						        String relation_type_code="";
						        String group_contact_phone="";
						        String start_date="";
						        String remark="";
						        String cust_code="";
						        if(map.get("remark") != null)
						        {
						           remark=map.get("remark").toString();
						        }
						        if(map.get("develope_man") != null)
						        {
						           cust_code=map.get("develope_man").toString();
						        }
						        if(map.get("cust_name") != null)
						        {
						           cust_name=map.get("cust_name").toString();
						        }
						        if(map.get("group_contact_phone") != null)
						        {
						           group_contact_phone=map.get("group_contact_phone").toString();
						        }
						        if(map.get("relation_type_code") != null)
						        {
						           relation_type_code=map.get("relation_type_code").toString();
						           if(typeMap.get(relation_type_code) !=null)
						           {
						             relation_type_code=typeMap.get(relation_type_code).toString();
						           }
						        }
						        if(map.get("start_date") != null)
						        {
						           start_date=map.get("start_date").toString();
						           if(start_date.length()>10)
						           {
						             start_date=start_date.substring(0,10);
						           }
						        }
						        %>

			<tr style="background-color:#f9f9f9; " id="changcolor_tr<%=i%>" onmouseover="MM_changeProp('changcolor_tr<%=i%>','','backgroundColor','#ffffff','DIV')" onmouseout="MM_changeProp('changcolor_tr<%=i%>','','backgroundColor','#f9f9f9','DIV')">
				<td style=" color:#000000; padding:2px 5px;" align=left>
					<a href="Custinfo.jsp?obj_cust_id=<%=obj_cust_id%>&user_id=" target="_blank"><%=cust_name%> </a>
				</td>
				<td style=" color:#000000;" align=center>
					<%=relation_type_code%>
				</td>
				<td style=" color:#000000; padding:2px 5px;" align=left>
					<%=group_contact_phone%>
				</td>
				<td style=" color:#000000;" align=center>
					<%=start_date%>
				</td>
			</tr>

			<%i++;
					     }
					     
					     %>
			<%
		            	}
		        		%>
		</table>


		<%
		            if(callingList != null && callingList.size()>0)
		            {
		        %>

		<table width=727 border=0 cellpadding=2 cellspacing=1 align=center bgcolor="#e7e7e7">
			<tr>
				<td class="line1" style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="35%">
					<bean:message key="str1253"/>
				</td>
				<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="15%">
					<bean:message key="str371"/>
				</td>
				<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="15%">
					<bean:message key="str372"/>
				</td>
				<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="15%">
					<bean:message key="str1141"/></
			</tr>

			<%
		            	
		                int i=0;
		              	 for (Iterator it = callingList.iterator(); it.hasNext();)
		                  {
						        HashMap map = (HashMap) it.next();
						        String obj_cust_id=map.get("obj_cust_id").toString();
						        String cust_name="";
						        String relation_type_code="";
						        String group_contact_phone="";
						        String start_date="";
						        String remark="";
						        String cust_code="";
						        if(map.get("remark") != null)
						        {
						           remark=map.get("remark").toString();
						        }
						        if(map.get("develope_man") != null)
						        {
						           cust_code=map.get("develope_man").toString();
						        }
						        if(map.get("cust_name") != null)
						        {
						           cust_name=map.get("cust_name").toString();
						        }
						        if(map.get("group_contact_phone") != null)
						        {
						           group_contact_phone=map.get("group_contact_phone").toString();
						        }
						        if(map.get("relation_type_code") != null)
						        {
						           relation_type_code=map.get("relation_type_code").toString();
						           if(typeMap.get(relation_type_code) !=null)
						           {
						             relation_type_code=typeMap.get(relation_type_code).toString();
						           }
						        }
						        if(map.get("start_date") != null)
						        {
						           start_date=map.get("start_date").toString();
						           if(start_date.length()>10)
						           {
						             start_date=start_date.substring(0,10);
						           }
						        }
						        %>

			<tr style="background-color:#f9f9f9; " id="changcolor_tr<%=i%>" onmouseover="MM_changeProp('changcolor_tr<%=i%>','','backgroundColor','#ffffff','DIV')" onmouseout="MM_changeProp('changcolor_tr<%=i%>','','backgroundColor','#f9f9f9','DIV')">
				<td style=" color:#000000; padding:2px 5px;" align=left>
					<a href="Custinfo.jsp?obj_cust_id=<%=obj_cust_id%>&user_id=" target="_blank"><%=cust_name%> </a>
				</td>
				<td style=" color:#000000;" align=center>
					<%=relation_type_code%>
				</td>
				<td style=" color:#000000; padding:2px 5px;" align=left>
					<%=group_contact_phone%>
				</td>
				<td style=" color:#000000;" align=center>
					<%=start_date%>
				</td>
			</tr>

			<%i++;
					     }
					     
					     %>
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
