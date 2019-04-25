<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.Map.Entry"%>
<%@ page import="com.saas.biz.relationccMgr.RelationCcInfo"%>
<%@ page import="com.saas.biz.rightMgr.TradeInterface"%>
<%@ page import="com.saas.biz.commen.ParamethodMgr"%>
<%@ page contentType="text/html;charset=GBK"%>

<html>
<head>
<title><bean:message key="str1577"/></title>
<link href="/style/css.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="/ext/adapter/ext/ext-base.js"></script>
<script type="text/javascript" src="/ext/ext-all.js"></script>
<link rel="stylesheet" type="text/css" href="/ext/resources/css/ext-all.css"/>
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
  
</script>
</head>
<body>
<%
   HttpSession  logsession = request.getSession(); 
    String cust_id = "";
    String iStart ="0",rela_class="";
    String meun_idx="";
    String code="";
    String keyword="",type_code="1";
     if (request.getParameter("keyword") != null)
   {
       keyword = request.getParameter("keyword");
   }
    if (request.getParameter("rela_class") != null)
   {
       rela_class = request.getParameter("rela_class");
   }
   if (request.getParameter("code") != null)
   {
       code = request.getParameter("code");
   }
   if (request.getParameter("cust_name") != null)
   {
       keyword = request.getParameter("cust_name");
       keyword=new String(keyword.getBytes("ISO-8859-1"),"GBK");  
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
    }
  RelationCcInfo relation=new RelationCcInfo();
  ArrayList relationList =new ArrayList();
  ArrayList typeList = new ArrayList();
  
  typeList = relation.getSelfdefinition(cust_id);
  int counter = 0;
  relationList = relation.getRelationByCustNameLike(Integer.valueOf(iStart).intValue(),cust_id,"" );
  counter = relation.getRelationByCustNameLike(cust_id,"" );
	   if(code=="0" || code.equals("0")){
	     relationList=relation.getRelationPageByType(Integer.valueOf(iStart).intValue(),cust_id,rela_class);
	     counter =relation.getRelationByType(cust_id,rela_class);
	    }else if(code=="1" || code.equals("1")){
	     relationList = relation.getRelationByCustNameLike(Integer.valueOf(iStart).intValue(),cust_id,keyword);
	     counter = relation.getRelationByCustNameLike(cust_id,keyword);
	    }

    //int counter=relation.getPageSizeByType(rela_class,cust_id);
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
%>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
	  <tr>
	    <td height="13" align="left">
	     <form name="relationForm" id="relationForm" action="clientViewByRank.jsp?menu_id=<%=meun_idx%>" method="post">
	     <div style="margin-left: 12px;margin-top: 5px;margin-bottom: 5px">
			&nbsp;&nbsp;<bean:message key="str290"/>&nbsp;<input type="text" maxlength="50" name="cust_name" id="cust_name">&nbsp;&nbsp;&nbsp;&nbsp;<input class="cxan" type="button" value="" onclick="checkRelation()" style="cursor: hand">
        </div>
          <input type="hidden" name="code" id="code" value="1"> 
        </form>
	    </td>
	    <tr>
	    	<td>
	    	<hr>
	    	<%
	    	if(typeList !=null && typeList.size()>0){
	    		for (int i = 0; i < typeList.size(); i++) {
					HashMap map = (HashMap) typeList.get(i);
					String ct = "", level_name = "",relaClass = "";
					if (map.get("rela_class") != null) {
						relaClass = map.get("rela_class").toString();
					}
					if (map.get("level_name") != null) {
						level_name = map.get("level_name").toString();
			%>	
					<a href="clientViewByRank.jsp?rela_class=<%=relaClass%>&menu_id=<%=meun_idx%>&code=0&cust_id=<%=cust_id %>"> <%=level_name%> </a>:
			<%
					}
					if (map.get("ct") != null) {
						ct = map.get("ct").toString();
			%>
			<%=ct %><bean:message key="str4716"/>
			<%
					}
				}
			}
					
			%>
  			<hr>
	    	</td>
	    </tr>
	  <tr>
	    <td>
		     <table width=727 border=0 cellpadding=2 cellspacing=1 align=center  bgcolor="#e7e7e7">
		        <tr>
			        <td class="line1" style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="35%"><bean:message key="str617"/></td>
					<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="15%"><bean:message key="str618"/></td>
					<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="15%"><bean:message key="str846"/></td>
					<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="15%">Email</td>
		        </tr>
		        <%
		            if(relationList != null && relationList.size()>0)
		            {    int i=0;
		              	 for (Iterator it = relationList.iterator(); it.hasNext();)
		                  {
						        HashMap map = (HashMap) it.next();
						        String obj_cust_id=map.get("obj_cust_id").toString();
						        String cust_name="";
						        String email = "",start_date = "";
						        String group_contact_phone="";
						        if(map.get("email") != null)
						        {
						           email=map.get("email").toString();
						        }
						        if(map.get("start_date") != null)
						        {
						           start_date=map.get("start_date").toString();
						        }
						        if(map.get("cust_name") != null)
						        {
						           cust_name=map.get("cust_name").toString();
						        }
						        if(map.get("group_contact_phone") != null)
						        {
						           group_contact_phone=map.get("group_contact_phone").toString();
						        }
						       
						        
				%>
						        
						        <tr style="background-color:#f9f9f9; " id="changcolor_tr<%=i%>" onmouseover="MM_changeProp('changcolor_tr<%=i%>','','backgroundColor','#ffffff','DIV')" onmouseout="MM_changeProp('changcolor_tr<%=i%>','','backgroundColor','#f9f9f9','DIV')">
					              <td  style=" color:#000000; padding:2px 5px;" align=left><a href="Custinfo.jsp?obj_cust_id=<%=obj_cust_id%>&user_id=" TARGET=appwin onclick="mydefss()"><%=cust_name%></a></td>
					              <td  style=" color:#000000; padding:2px 5px;" align=left><%=group_contact_phone%></td>
					              <td  style=" color:#000000;" align=center><%=start_date%></td>
					              <td  style=" color:#000000;" align=center><%=email%></td>
					            </tr>
						        
				<%
						i++;
					     }
					     
				%>
					     
					    <tr>

																		<td  align="left" colspan="2" style="font-weight:normal; padding:2px 5px;"><bean:message key="str3988"/><%=counter%><bean:message key="str611"/>&nbsp;<bean:message key="str759"/><%=Integer.parseInt(iStart)+1 %><bean:message key="str1029"/>&nbsp;&nbsp;<bean:message key="str3988"/><%=pages%><bean:message key="str1029"/></td>
											
																		<td  align="right" colspan="3"  style=" padding:2px 5px;">
																		<a href="clientViewByRank.jsp?iStart=0&code=<%=code%>&rela_class=<%=rela_class%>&cust_id=<%=cust_id%>&keyword=<%=keyword%>"><bean:message key="str1030"/></a>&nbsp; &nbsp;
																		<% 
																			if(Integer.parseInt(iStart)>0){
																		%>
																			<a href="clientViewByRank.jsp?iStart=<%=pageUp%>&code=<%=code%>&rela_class=<%=rela_class%>&cust_id=<%=cust_id%>&keyword=<%=keyword%>"><bean:message key="str1031"/></a> &nbsp;
																		<%
																			}
																			if(Integer.parseInt(iStart)<pages-1){
																		%>
																			<a href="clientViewByRank.jsp?iStart=<%=pageDown%>&code=<%=code%>&rela_class=<%=rela_class%>&cust_id=<%=cust_id%>&keyword=<%=keyword%>"> <bean:message key="str1032"/> </a>&nbsp; 
																		<%
																			}
																		%>
																		<a  href="clientViewByRank.jsp?iStart=<%=pages-1%>&code=<%=code%>&rela_class=<%=rela_class%>&cust_id=<%=cust_id%>&keyword=<%=keyword%>"><bean:message key="str1033"/></a></td>
											
															         </tr>

					     
				<%
		            }
		        %>
		    </table>
	     </td>
	  </tr>
	  <tr>
	    <td height="13"></td>
	  </tr>
	</table>
</body>
</html>                                                            