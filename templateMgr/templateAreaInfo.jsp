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
    String cust_id="",nenuIdx="";
    if (logsession.getAttribute("SESSION_CUST_ID") != null)
    {
        cust_id = logsession.getAttribute("SESSION_CUST_ID").toString();
    }
    if(request.getParameter("menu_id")!=null){
	  nenuIdx=request.getParameter("menu_id");
	}
	String field_type = bean.getSelectItems("59");
	String area_idx = comm.GenTradeId();
	String field_id = comm.GenTradeId();
	String entity_type="",form_name="",area_no="",form_id="",area_id="",area_name="";
	if(request.getParameter("entity_type")!=null){
	  entity_type=request.getParameter("entity_type");
	}
	if(request.getParameter("form_name")!=null){
	  form_name=request.getParameter("form_name");
	  form_name=new String(form_name.getBytes("ISO-8859-1"),"GBK");   
	}
	if(request.getParameter("area_no")!=null){
	  area_no=request.getParameter("area_no");
	}
	if(request.getParameter("form_id")!=null){
	  form_id=request.getParameter("form_id");
	}
	if(request.getParameter("area_id")!=null){
	  area_id=request.getParameter("area_id");
	}
	if(request.getParameter("area_name")!=null){
	  area_name=request.getParameter("area_name");
	  area_name=new String(area_name.getBytes("ISO-8859-1"),"GBK");    
	}
	if(request.getParameter("trade")!=null){
	  ArrayList list=formBean.getTemplateFormById(cust_id,form_id);
	  if(list !=null && list.size()>0){
	   HashMap map=(HashMap)list.get(0);
	   if(map.get("entity_type")!=null){ entity_type=map.get("entity_type").toString();}
	   if(map.get("area_name")!=null){ area_name=map.get("area_name").toString();}
	   if(map.get("area_id")!=null){ area_id=map.get("area_id").toString();}
	   if(map.get("area_no")!=null){ area_no=map.get("area_no").toString();}
	   if(map.get("form_name")!=null){ form_name=map.get("form_name").toString();}
	  }
	}
	String entityName=bean.getParamNameByValue("60",entity_type);
	ArrayList formList=formBean.getTemplateAreaField(cust_id,form_id);
%>
<html>
	<head>
		<title><bean:message key="str4085"/>(http://soft.xsaas.com)</title>
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
		if(document.getElementById("field_type").value=="a"){
		     alert("请选择字段类型！");
			 return false;
			   if(document.getElementById("field_type").value=="3"){
			     if(document.getElementById("default_value").value=="" || document.getElementById("default_value").value==null){
			      alert("默认值不能为空！");
			      return false;
			     }
			   }
		   }
		   if(document.getElementById("field_name").value=="" || document.getElementById("field_name").value==null){
		    alert("字段名称不能为空！");
		     return false;
		   }
		  return true;
		}
		function addItmes(index){
		  if(index=="0"){
		    document.getElementById("list-item").style.display="block";
		  }else if(index=="2"){
		    document.getElementById("list-item").style.display="block";
		  }else{
		    document.getElementById("list-item").style.display="none";
		  }
		}
		function showListPage(){
		  var form_id=document.getElementById("form_id").value;
		  var field_id=document.getElementById("field_id").value;
		  window.open ("addListItme.jsp?form_id="+form_id+"&field_id="+field_id);
		}
		function newAreaFunction(){
		   if(document.getElementById("newArea").checked){
		      document.getElementById("area_name").value="";
		      document.getElementById("area_id").value=$F("idx");
		      document.getElementById("areaDiv").style.display="block";
		   }else{
		     document.getElementById("area_name").value=$F("area");
		     document.getElementById("area_id").value=$F("areaId");
		     document.getElementById("areaDiv").style.display="none";
		   }
		}
		function showItems(tr,bnt,it){
		 if(document.getElementById(bnt).checked){
		   //$(tr).style.display="block";
		   document.getElementById(it).style.display="block";
		 }else{
		  // $(tr).style.display="none";
		   document.getElementById(it).style.display="none";
		 }
		}
        </script>
	</head>
	<body>
		<form name=resumeForm action=/doTradeReg.do method=post target="_self">
			<table width="727" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="2"></td>
				</tr>
				<tr>
					<td valign="top">
						<table width=727 border=0 cellpadding=5 cellspacing=1 align=center bgcolor="#dddddd">
							<tr style="display:none">
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:14px;text-align:right;height:15px" align=right width=15%>
									<bean:message key="str4018"/>
								</td>
								<td width=35% align=left bgcolor="#FFFFFF">
									<div class="ping">
										<input name="entity_type" id="entity_type" value="<%=entity_type %>">
									</div>
								</td>

								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;text-align:right;" align=right width=15%>
									<bean:message key="str4019"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping">
										<input type="text" name="form_name" id="form_name" maxlength="100" size="25" value="<%=form_name%>" width=35%>
									</div>
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
							     <tr>
									<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;text-align:right;" align=right>
										<bean:message key="str4020"/>
									</td>
									<td align=left bgcolor="#FFFFFF">
										<div class="ping1">
											<%=areaName%>
										</div>
									</td>
									<td colspan="3"style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;text-align:left;">
									  <input type="checkbox" name="showField<%=i%>" id="showField<%=i%>" onclick="showItems('tr<%=i%>','showField<%=i%>','tj<%=i%>')"> <bean:message key="str4736"/><span style="color:#2828FF;margin-left:10px"><a href="addFieldItme.jsp?form_id=<%=form_id%>&area_id=<%=areaIdx%>" TARGET=appwin onclick="mydefss()"><img src="/images/xinzeng.png" height="16px" width="16px" border="0"><bean:message key="str4739"/></a></span>
									</td>
							     </tr>
							     <%
							     }else{
							      %>
							     <tr>
									<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;text-align:right;" align=right>
										<bean:message key="str4020"/>
									</td>
									<td align=left bgcolor="#FFFFFF" colspan="3">
										<div class="ping1">
											<input type="checkbox" name="showField<%=i%>" id="showField<%=i%>" onclick="showItems('tr<%=i%>','showField<%=i%>','tj<%=i%>')"><bean:message key="str4736"/><span style="color:#2828FF;margin-left:10px"><a href="addFieldItme.jsp?form_id=<%=form_id%>&area_id=<%=areaIdx%>" target="_blank"><img src="/images/xinzeng.png" height="16px" width="16px" border="0"><bean:message key="str4739"/></a></span>
										</div>
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
							      if(fieldMap !=null && fieldMap.size()>0){
							         String fieldName="";
							         String fieldType="";
							         String field_idx="";
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
							     <tr>
									<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;text-align:right;" align=right>
										<bean:message key="str4013"/>
									</td>
									<td align=left bgcolor="#FFFFFF" >
										<div class="ping1">
											<%=fieldName%>
										</div>
									</td>
									<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;text-align:right;" align=right>
										<bean:message key="str4012"/>
									</td>
									<td align=left bgcolor="#FFFFFF" >
										<div class="ping1">
											<%=fieldType%><span style="color:#2828FF;margin-left:10px"><a href="addListItme.jsp?form_id=<%=form_id%>&field_id=<%=field_idx%>" target="_blank"><img src="/images/xinzeng.png"  height="16px" width="16px" border="0"><bean:message key="str4740"/></a></span>
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
							           if(itemMap.get("item_name")!=null){
							             itemName=itemMap.get("item_name").toString();
							           }
							           if(itemMap.get("default_value")!=null){
							             deft=itemMap.get("default_value").toString();
							           }
							           %>
							     <tr>
									<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;text-align:right;" width="15%" align=right>
										<bean:message key="str4028"/>
									</td>
									<td align=left bgcolor="#FFFFFF" width="38%">
										<div class="ping1">
											<%=itemName%>
										</div>
									</td>
									<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;text-align:right;" width="15%" align=right>
										<bean:message key="str442"/>
									</td>
									<td align=left bgcolor="#FFFFFF" width="32%" >
										<div class="ping1">
											<%=deft%>
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
							 %>
							<tr>
								<td bgcolor="#FFFFFF" colspan="4" style="background-color:#f6f6f6; color:#000000;font-size:12px">
								<div class="ping1">
								     <bean:message key="str4741"/><input type="checkbox" name="newArea" id="newArea" onclick="newAreaFunction()"><span style="color:red"><bean:message key="str4742"/></span>
								</div>
								</td>
							</tr>
							<%}%>
							
							<tr id="areaDiv" style="display:none">
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;text-align:right;" align=right>
									<bean:message key="str4020"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping1">
										<input name="area_name" id="area_name" type="text" maxlength="100" size="30" value="<%=area_name %>">
									</div>
								</td>

								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;text-align:right;" align=right>
									<bean:message key="str4021"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping1">
										<input name="area_no" type="text" id="area_no" value="1" size=5 maxlength=5 value="<%=area_no %>">
									</div>
								</td>
							</tr>
							<tr>

								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;text-align:right;" align=right>
									<bean:message key="str4013"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping">
										<input name="field_name" type="text" id="field_name" size=20 maxlength=100>
									</div>
								</td>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;text-align:right;" align=right>
									<bean:message key="str4012"/>
								</td>
								<td align=left bgcolor="#FFFFFF" style="display:inline;float: left;margin-left: 5px;display:inline">
									<table width=100% border=0 cellpadding=5 cellspacing=1 align=center bgcolor="#dddddd">
										<tr>
											<td align=left bgcolor="#FFFFFF" width="40%">
												<div class="ping">
													<select name="field_type" id="field_type" onclick="addItmes(this.value)">
														<option value="a">
															<bean:message key="str158"/>
														</option>
														<%=field_type%>
													</select>
												</div>
											</td>
											<td align=left bgcolor="#FFFFFF" width="60%">
												<input type="button" name="list-item" id="list-item" class="bnt" onclick="showListPage()">
											</td>
										</tr>
									</table>

								</td>

							</tr>
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;text-align:right;" align=right>
									<bean:message key="str4023"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping1">
										<input name="field_no" type="text" id="field_no" value="1" size=5 maxlength=5 onkeyup="if(isNaN(value))execCommand('undo')">
										<span style="margin-left: 5px"><bean:message key="str4022"/></span>
									</div>
								</td>

								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;text-align:right;" align=right>
									<bean:message key="str442"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping1">
										<input name="default_value" type="text" id="default_value" size=25 maxlength=50>
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;text-align:right;" align=right>
									<bean:message key="str4017"/>
								</td>
								<td align=left bgcolor="#FFFFFF" colspan="3">
									<div class="ping1">
										<textarea name="field_desc" id="field_desc" cols="50" rows="6"></textarea>
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;text-align:right;" align=right>
									<bean:message key="str164"/>
								</td>
								<td align=left bgcolor="#FFFFFF" colspan="3">
									<div class="ping1">
										<input name="remark2" id="remark2" size="52" maxlength="50">
									</div>
								</td>
							</tr>
							<input name="trade_type_code" type="hidden" value="1076">
							<input name="field_id" id="field_id" type="hidden" value=<%=field_id%>>
							<input name="form_id" id="form_id" type="hidden" value=<%=form_id%>>
							<input name="area_id" id="area_id" type="hidden" value="<%=area_id%>">
							<input name="idx" id="idx" type="hidden" value="<%=area_idx%>">
							<input name="area" id="area" type="hidden" maxlength="100" size="30" value="<%=area_name%>">
							<input name="areaId" id="areaId" type="hidden" value="<%=area_id%>">
							<input name="menu_id" id="menu_id" type="hidden" value="<%=nenuIdx%>">
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;text-align:left;margin-left: 25px;text-align:center;" colspan="4">
									<input name="comit" type="submit" value="" onclick="return confirmsub()" style="background-image: url('/images/tj.gif');width:70px;height: 26px;border:0;cursor:hand;text-align:center;">
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td height="13"></td>
				</tr>
			</table>
		</form>
	</body>
</html>

