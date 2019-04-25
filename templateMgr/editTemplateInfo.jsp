<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.Map.Entry"%>
<jsp:useBean id="bean" class="com.saas.biz.commen.ParamethodMgr" scope="page" />
<jsp:useBean id="comm" class="com.saas.biz.commen.commMethodMgr" scope="page" />
<jsp:useBean id="formBean" class="com.saas.biz.templateFormMgr.TempFormInfo" scope="page" />
<%@ page import="com.saas.biz.templateFormMgr.TemplateOject"%>
<%
    HttpSession  logsession = request.getSession(); 
    String cust_id="";
    if (logsession.getAttribute("SESSION_CUST_ID") != null)
    {
        cust_id = logsession.getAttribute("SESSION_CUST_ID").toString();
    }
    
	String entity_type="",form_name="",form_id="";
	if(request.getParameter("id")!=null){
	   form_id=request.getParameter("id");
	}
	  ArrayList list=formBean.getTemplateFormById(cust_id,form_id);
	  if(list !=null && list.size()>0){
	   HashMap map=(HashMap)list.get(0);
	   if(map.get("entity_type")!=null){ entity_type=map.get("entity_type").toString();}
	   if(map.get("form_name")!=null){ form_name=map.get("form_name").toString();}
	  }
	
	String entityName=bean.getParamNameByValue("60",entity_type);
	ArrayList formList=formBean.getTemplateAreaField(cust_id,form_id);
%>
<html>
	<head>
		<title><bean:message key="str4006"/></title>
		<link href="/style/layout.css" rel="stylesheet" type="text/css">
		<link href="/style/daohang.css" rel="stylesheet" type="text/css">
		<link href="/style/css.css" rel="stylesheet" type="text/css">
		<link href="/style/manager.css" rel="stylesheet" type="text/css">
		<style type="text/css" media="screen">
		form {padding:0px; margin:0px;}
		.line6 {width:72spx; width:70spx!important;border:#ffcb99 1px solid;  background-color:#fff8ee; text-align:left; padding-left: 20px;padding-top: 10px;padding-bottom: 10px; color:#000000; margin-top:13px; margin-bottom:13px;}   /*横栏样式6---- 头部提醒1*/
		.line6 .img{width:53px; height:53px; float:left; margin-right:20px;}
		.line6 .title {font-size:14px; font-weight:bold; color:#ff5400;}
		.line1 {border-left:#ff7300 3px solid; background-color:#e2e2e2; color:#333333;text-align:left; font-size:12px;}  /*横栏样式1*/
		.bnt{background-image: url('/images/zjtm.gif');width:100px;height: 26px;border:0;cursor:hand;margin-left: 5px;display:none;}
		</style>
		<link rel="stylesheet" type="text/css" href="../ext/resources/css/ext-all.css" />
		<script type="text/javascript" src="../ext/adapter/ext/ext-base.js"></script>
		<script type="text/javascript" src="../ext/ext-all.js"></script>
		<script type="text/javascript" src="../ext/build/locale/ext-lang-zh_CN.js"></script>
		<script type="text/javascript" src="/js/prototype.js"></script>
		<script language="JavaScript">
		function confirmsub(){
		if($F("field_type")=="a"){
		     Ext.Msg.alert("XSaaS 提示","请选择字段类型！");
			 return false;
			   if($F("field_type")=="3"){
			     if($F("default_value")=="" || $F("default_value")==null){
			      alert("默认值不能为空！");
			      return false;
			     }
			   }
		   }
		   if($F("field_name")=="" || $F("field_name")==null){
		     alert("字段名称不能为空！");
		     return false;
		   }
		  return true;
		}
		function addItmes(index){
		  if(index=="0"){
		    $("list-item").style.display="block";
		  }else if(index=="2"){
		    $("list-item").style.display="block";
		  }else{
		    $("list-item").style.display="none";
		  }
		}
		function showListPage(){
		  var form_id=$F("form_id");
		  var field_id=$F("field_id");
		  window.open ("addListItme.jsp?form_id="+form_id+"&field_id="+field_id);
		}
		function newAreaFunction(){
		   if($("newArea").checked){
		      $("area_name").value="";
		      $("area_id").value=$F("idx");
		      $("areaDiv").style.display="block";
		   }else{
		     $("area_name").value=$F("area");
		     $("area_id").value=$F("areaId");
		     $("areaDiv").style.display="none";
		   }
		}
		function showItems(tr,bnt,it){
		 if($(bnt).checked){
		   //$(tr).style.display="block";
		   $(it).style.display="block";
		 }else{
		  // $(tr).style.display="none";
		   $(it).style.display="none";
		 }
		}
		function deleteInfo(){
		  if(window.confirm("确定要进行删除操作？")){
		    return true;
		  }else{
		    return false;
		  }
		}
        </script>
	</head>
	<body>
		<form name=resumeForm action=/doTradeReg.do method=post target="_self">
			<table width="850" border="0" cellspacing="0" cellpadding="0" align="center" style="margin-top:25px">
				<tr>
					<td height="2" align="right"></td>
				</tr>
				<tr>
					<td valign="top">
						<table width=727 border=0 cellpadding=5 cellspacing=1 align=center bgcolor="#dddddd">
							<tr style="display:none">
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:14px;text-align:right;height:15px" align=right width=15%>
									<bean:message key="str4018"/>
								<br></td>
								<td width=35% align=left bgcolor="#FFFFFF">
									<div class="ping">
										<input name="entity_type" id="entity_type" value="<%=entity_type %>">
									</div>
								<br></td>

								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;text-align:right;" align=right width=15%>
									<bean:message key="str4019"/>
								<br></td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping">
										<input type="text" name="form_name" id="form_name" maxlength="100" size="25" value="<%=form_name%>" width=35%>
									</div>
								<br></td>
							</tr>
							<tr>
								<td style="background-color:#FFFFFF; color:#000000;  font-weight:bold; font-size:14px;text-align:center;" align=right colspan="4" height="20">
										<div style="text-align: right;cursor:hand" onclick="javascript:window.close();" title="关闭"><br></div>
								</td>
							</tr>
                            <tr>
								<td style="background-color:#FFFFFF; color:#000000;  font-weight:bold; font-size:14px;text-align:center;" align=center colspan="4" height="20">
										<%=form_name%>
								</td>
							</tr>
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;text-align:right;" align=right>
									<bean:message key="str4018"/>
								</td>
								<td align=left bgcolor="#FFFFFF" colspan="3">
									<div class="ping1">
										<%=entityName%>
									</div>
								</td>
							</tr>
							
							<%if(formList !=null && formList.size()>0){
							
							   for(int i=0;i<formList.size();i++){
							     TemplateOject obj=(TemplateOject)formList.get(i);
							     String areaName=obj.getArea_name();
							     String areaIdx=obj.getArea_id();
							     HashMap areaMaps=(HashMap)obj.getMap();
							     if(areaName!="#" && !areaName.equals("#")){
							     %>
							     <tr style="background-color:#D2E9FF">
									<td style="color:#000000;  font-weight:bold; font-size:12px;text-align:right;" align=right>
										<bean:message key="str4020"/>
									</td>
									<td align=left>
										<div class="ping1">
											<%=areaName%>
										</div>
									</td>
									<td style="font-weight:bold; font-size:12px;text-align:left;">
									  <input type="checkbox" name="showField<%=i%>" id="showField<%=i%>" onclick="showItems('tr<%=i%>','showField<%=i%>','tj<%=i%>')"><bean:message key="str4736"/> 
									</td>
									<td style="font-weight:bold; font-size:12px;text-align:center;">
									   <span style="color:#2828FF;margin-rihgt:30px;font-weight:normal"><a href="addFormArea.jsp?form_id=<%=form_id%>" TARGET=appwin onclick="mydefss()"><bean:message key="str4038"/></a>|<a href="editFormArea.jsp?form_id=<%=form_id%>&area_id=<%=areaIdx%>" TARGET=appwin onclick="mydefss()"><bean:message key="str1769"/></a>|<a href="/doTradeReg.do?trade_type_code=1079&form_id=<%=form_id%>&area_id=<%=areaIdx%>" onclick="return deleteInfo()" target="_self"><bean:message key="str2677"/></a></span><span style="text-align: right;color:red"><a href="addFieldItme.jsp?form_id=<%=form_id%>&area_id=<%=areaIdx%>" target="_blank"><bean:message key="str4039"/></a></span>
									</td>
							     </tr>
							     <%
							     }else{
							      %>
							     <tr style="background-color:#D2E9FF">
									<td style="color:#000000;  font-weight:bold; font-size:12px;text-align:right;" align=right>
										<bean:message key="str4020"/>
									</td>
									<td align=left>
										<div class="ping1">
										</div>
									</td>
									<td style="font-weight:bold; font-size:12px;text-align:left;">
											<input type="checkbox" name="showField<%=i%>" id="showField<%=i%>" onclick="showItems('tr<%=i%>','showField<%=i%>','tj<%=i%>')"><bean:message key="str4736"/>
									</td>
									<td style="font-weight:bold; font-size:12px;text-align:center;">
									   <span style="color:#2828FF;margin-rihgt:30px;font-weight:normal"><a href="addFormArea.jsp?form_id=<%=form_id%>" target="_self"><bean:message key="str4038"/></a>|<a href="editFormArea.jsp?form_id=<%=form_id%>&area_id=<%=areaIdx%>" target="_blank"><bean:message key="str1769"/></a>|<a href="/doTradeReg.do?trade_type_code=1079&form_id=<%=form_id%>&area_id=<%=areaIdx%>"  onclick="return deleteInfo()"target="_self"><bean:message key="str2677"/></a></span><span style="text-align: right;color:red"><a href="addFieldItme.jsp?form_id=<%=form_id%>&area_id=<%=areaIdx%>" target="_blank"><bean:message key="str4039"/></a></span>
									</td>
							     </tr>
							     <%
							     }
							     %>
							     <tr id="tj<%=i%>" style="display:none">
							      <td colspan="4">
							      <table  width=100% border=0 cellpadding=4 cellspacing=1 align=center bgcolor="#dddddd">
							     <% 
							    if(areaMaps !=null && areaMaps.size()>0){
							      Iterator it=areaMaps.entrySet().iterator();
							      while(it.hasNext()){
							      Entry entObj=(Entry)it.next();
							      HashMap fieldMap=(HashMap)entObj.getKey();
							      ArrayList items=(ArrayList)entObj.getValue();
							      String field_idx="";
							      if(fieldMap !=null && fieldMap.size()>0){
							         String fieldName="";
							         String fieldType="";
							         if(fieldMap.get("field_name")!=null){
							           fieldName=fieldMap.get("field_name").toString();
							         }
							         if(fieldMap.get("field_id")!=null){
							           field_idx=fieldMap.get("field_id").toString();
							         }
							         if(fieldMap.get("field_type")!=null){
							           fieldType=fieldMap.get("field_type").toString();
							           fieldType=bean.getParamNameByValue("59",fieldType);
							         }
							         %>
							     <tr style="background-color: #ECECFF">
									<td style="font-weight:bold; font-size:12px;text-align:right;" align=right>
										<bean:message key="str4013"/>
									</td>
									<td align=left bgcolor="#ECECFF" >
										<div class="ping1">
											<%=fieldName%>
										</div>
									</td>
									<td style="font-weight:bold; font-size:12px;text-align:right;" align=right>
										<bean:message key="str4012"/>
									</td>
									<td align=left bgcolor="#ECECFF" >
										<div class="ping1">
											<%=fieldType%><span style="color:#2828FF;margin-left:10px"><a href="addFieldItme.jsp?form_id=<%=form_id%>&area_id=<%=areaIdx%>" target="_blank"><img src="/img/add.png"  height="16px" width="16px" border="0"><bean:message key="str4038"/> </a><a href="editFormField.jsp?form_id=<%=form_id%>&field_id=<%=field_idx%>" target="_blank"><img src="/img/edit.png"  height="16px" width="16px" border="0"><bean:message key="str1769"/> </a><a href="/doTradeReg.do?trade_type_code=1080&form_id=<%=form_id%>&field_id=<%=field_idx%>"  onclick="return deleteInfo()" target="_self"><img src="/img/delete.png"  height="16px" width="16px" border="0"><bean:message key="str2677"/></a><a href="addListItme.jsp?form_id=<%=form_id%>&field_id=<%=field_idx%>" target="_blank"><bean:message key="str4737"/></a></span>
										</div>
									</td>
							   </tr>
							     <%
							      }
							      
							      if(items !=null && items.size()>0){
							        for(int j=0;j<items.size();j++){
							           HashMap itemMap=(HashMap)items.get(j);
							           String itemName="";
							           String deft="";
							           String item_idx="";
							           if(itemMap.get("item_name")!=null){
							             itemName=itemMap.get("item_name").toString();
							           }
							           if(itemMap.get("default_value")!=null){
							             deft=itemMap.get("default_value").toString();
							           }
							           if(itemMap.get("item_id")!=null){
							             item_idx=itemMap.get("item_id").toString();
							           }
							           %>
							     <tr>
									<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;text-align:right;" width="15%" align=right>
										<bean:message key="str4028"/>
									</td>
									<td align=left bgcolor="#FFFFFF" width="25%">
										<div class="ping1">
											<%=itemName%>
										</div>
									</td>
									<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;text-align:right;" width="15%" align=right>
										<bean:message key="str442"/>
									</td>
									<td align=left bgcolor="#FFFFFF" width="45%" >
										<div class="ping1">
											<%=deft%><span style="display:inline;margin-left:12px"><a href="addListItme.jsp?form_id=<%=form_id%>&field_id=<%=field_idx%>" target="_blank"><bean:message key="str4038"/> </a>|<a href="editFormItme.jsp?form_id=<%=form_id%>&item_id=<%=item_idx%>" target="_blank"><bean:message key="str1769"/></a> | <a href="/doTradeReg.do?trade_type_code=1078&form_id=<%=form_id%>&item_id=<%=item_idx%>" onclick="return deleteInfo()" target="_self"><bean:message key="str2677"/></a></span>
										</div>
									</td>
							   </tr>
							     <%
							        }
							      }
							    }
							    }
							    %>
							    </table>
							        </td>
							     </tr>
							    <%
							   }
							}%>
							
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;text-align:left;margin-left: 25px;text-align:center;" colspan="4">
									<br>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				 <input type="hidden" id="form_id" name="form_id" value="<%=form_id%>">
				 <input type="hidden" id="area_no" name="area_no" value="1">
				 <input type="hidden" id="area_name" name="area_name" value="">
				 <input type="hidden" id="area_id" name="area_id" value="">
				 <input type="hidden" id="trade_type_code" name="trade_type_code" value="1083">
				<tr>
					<td height="13"></td>
				</tr>
			</table>
		</form>
	</body>
</html>

