<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.*"%>
<%@ page import="com.saas.biz.conUseMgr.ConUseInfo"%>
<jsp:useBean id="bean" class="com.saas.biz.commen.ParamethodMgr" scope="page" />
<jsp:useBean id="comm" class="com.saas.biz.commen.commMethodMgr" scope="page" />
<%
	HttpSession  logsession = request.getSession(); 
	Calendar cal = Calendar.getInstance();
	String start_Date = new SimpleDateFormat("yyyy-MM-dd").format(cal.getTime());
	String cust_id = "",back_id="",obj_cust_id="",con_id="";
	back_id=comm.GenTradeId();
	
    if (logsession.getAttribute("SESSION_CUST_ID") != null)
    {
        cust_id = logsession.getAttribute("SESSION_CUST_ID").toString();
    }
	 if (request.getParameter("obj_cust_id") != null)
    {
        obj_cust_id = request.getParameter("obj_cust_id");
    }
    if (request.getParameter("con_id") != null)
    {
        con_id = request.getParameter("con_id");
    }
    ConUseInfo conInfo = new ConUseInfo();
    ArrayList conList = conInfo.getAllConuseConNo(cust_id,obj_cust_id);
    int size=0;
    if(conList!=null && conList.size()>0){
     	size = conList.size();
    }
    HashMap map = new HashMap();
%>
<html>
	<head>
		<title><bean:message key="str116"/></title>
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
		</style>
		<link rel="stylesheet" type="text/css" href="../ext/resources/css/ext-all.css" />
		<script type="text/javascript" src="../ext/adapter/ext/ext-base.js"></script>
		<script type="text/javascript" src="../ext/ext-all.js"></script>
		<script type="text/javascript" src="../ext/build/locale/ext-lang-zh_CN.js"></script>
		<script type="text/javascript" src="/js/prototype.js"></script>
		<script language="javascript" src="/js/Calendar_Ly.js"></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/WareHousePosInfo.js'></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/engine.js'></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/util.js'></script>
				<script type="text/javascript" src="userGird.js"></script>
		<script type="text/javascript">
		 function checkAllConNo(){
		 	var size = document.getElementById('size').value;
		 	var con_id='';
		 	if(document.getElementById('checkAll').checked==true){
		 		for(var i=0;i<size;i++){
		 			var obj = 'con_id'+i;
		 			document.getElementById(obj).checked =true;
		 			con_id=con_id+document.getElementById(obj).value+'|';
		 		}
		 	}else if(document.getElementById('checkAll').checked==false){
		 		for(var i=0;i<size;i++){
		 			var obj = 'con_id'+i;
		 			document.getElementById(obj).checked =false;
		 			con_id='';
		 		}
		 	}
		 	document.getElementById('con_id').value=con_id;
		 }
		
		 function confirmsub(){
		 	var size = document.getElementById('size').value;
		 	var con_id='';
		 	var con_no='';
		 	for(var i=0;i<size;i++){
		 		var id_obj = 'con_id'+i;
		 		var no_obj = 'con_no'+i;
		 		if(document.getElementById(id_obj).checked ==true){
		 			con_no=con_no+document.getElementById(no_obj).value+'|';
		 			con_id=con_id+document.getElementById(id_obj).value+'|';
		 		}
		 	}
		 	document.getElementById('con_id').value=con_id;
		 	document.getElementById('con_no').value=con_no;
		    if(document.getElementById("con_id").value=="" || document.getElementById("con_id").value==null){
		       alert("请选择合同编码！");
		       return false;
		     }
		    
		     if(document.getElementById("back_date").value=="" || document.getElementById("back_date").value==null){
		       alert("请选择回收时间！");
		       return false;
		     }
		     if(document.getElementById("back_reason").value=="" || document.getElementById("back_reason").value==null){
		       alert("请填写回收原因！");
		       return false;
		     }
		     
		    
		     return true;
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
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
									<bean:message key="str1572"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
								<div class="ping">
									<ul style="width: 100%">
									<div class="ping1">
										<input type="checkbox" id="checkAll" name="checkAll" value="" onclick="checkAllConNo()"><bean:message key="str1581"/>
											<hr>
									</div>
									
										<% 
											String con_no="",con_id1="";
											if(conList!=null && conList.size()>0){
												for(int k=0;k<conList.size();k++){
													map = (HashMap)conList.get(k);
													if(map.get("con_no")!=null){con_no=map.get("con_no").toString();}
													if(map.get("con_id")!=null){con_id1=map.get("con_id").toString();}
										%>
										
											<li style="width: 30%; float: left">
												<input type="checkbox" name="con_id<%=k %>" id="con_id<%=k %>" value="<%=con_id1 %>">
												<input type="hidden" name="con_no<%=k %>" id="con_no<%=k %>" value="<%=con_no %>">
												<a href="disConuse.jsp?con_id=<%=con_id1 %>"><%=con_no %></a>
											</li>
										
										<%
												}
											}
										%>
									</ul>
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
									<bean:message key="str1567"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping">
										<input name="back_date" type="text" id="back_date" size=10 maxlength=15 value="<%=start_Date%>" onfocus="setday(this);">
										<span style="color:red">(yyyy-MM-dd)</span>
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
									<bean:message key="str1568"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping">
										<textarea rows="6" cols="50" name="back_reason" id="back_reason"></textarea>
									</div>
								</td>
							</tr>
							
							
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
									<bean:message key="str1569"/>
								</td>
								<td align=left bgcolor="#FFFFFF">
									<div class="ping1">
										<input name="remark" id="remark" size="52" maxlength="50" >
									</div>
								</td>
							</tr>
							<input name="publish_date" type="hidden" value="<%=start_Date%>">
							<input name="trade_type_code" type="hidden" value="6543">
							<input name="back_id" type="hidden" id="back_id" value="<%=back_id%>">
							<input name="size" type="hidden" id="size" value="<%=size %>">
							<input name="con_no" type="hidden" id="con_no" value="">
							<input name="con_id" type="hidden" id="con_id" value="">
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;padding-top:10px;padding-bottom:10px;" align="center" colspan=2>
									<input name="comit" type="submit" value="" onclick="return confirmsub()" style="background-image: url('/images/tj.gif');width:70px;height: 26px;border:0;cursor:hand">
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

