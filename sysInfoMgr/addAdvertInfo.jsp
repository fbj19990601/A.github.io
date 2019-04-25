<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"

"http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="com.saas.biz.commen.ParamethodMgr"%>
<%@ page contentType="text/html;charset=GBK"%>
<jsp:useBean id="bean" class="com.saas.biz.commen.commMethodMgr" scope="page" />

<%
	String date = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
	String start_date = date;
	String end_date = date;
	Calendar cal = Calendar.getInstance();
	cal.add(Calendar.MONTH, 3);
	
	String adv_id = bean.GenTradeId();
	ParamethodMgr paramCom = new ParamethodMgr();
	String adv_type = paramCom.getSelectItems("11");
	String own_range = paramCom.getSelectItems("109");
%>

<html>
	<head>
		<title><bean:message key="str149"/></title>
		<link href="/style/css.css" rel="stylesheet" type="text/css">
		<style type="text/css">
		 form {padding:0px; margin:0px;}
		.line6 {width:72spx; width:70spx!important;border:#ffcb99 1px solid;  background-color:#fff8ee; text-align:left; padding-left: 20px;padding-top: 10px;padding-bottom: 10px; color:#000000; margin-top:13px; margin-bottom:13px;}   /*������ʽ6---- ͷ������1*/
		.line6 .img{width:53px; height:53px; float:left; margin-right:20px;}
		.line6 .title {font-size:14px; font-weight:bold; color:#ff5400;}
		.line1 {border-left:#ff7300 3px solid; background-color:#e2e2e2; color:#333333;text-align:left; font-size:13px; font-weight:bold; padding-left: 20px; padding-top: 5px;padding-bottom: 5px; }  /*������ʽ1*/
		</style>
		<link href="/style/layout.css" rel="stylesheet" type="text/css">
		<link href="/style/daohang.css" rel="stylesheet" type="text/css">
		<link href="/style/manager.css" rel="stylesheet" type="text/css">
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/ParamethodMgr.js'></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/engine.js'></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/util.js'></script>
		<script type="text/javascript" src="/js/prototype.js"></script>
		<script language="javascript" src="/js/Calendar_Ly.js"></script>
		<script type="text/javascript" src="/js/public_b2b.js"></script>
		<script language="JavaScript">
    	 function confirmsub()
    	 {
    	    var adv_type=$F("adv_type");
    	    if (adv_type=="" || adv_type==null) 
			{                                                                                         
				alert("ѡ�������ͣ�");                                                             
				$("adv_type").focus();                                                    
				return false;                                                                            
			}                                                                                      
            var own_range=$F("own_range");
			if (own_range =="" || own_range==null) 
			{                                                                                         
				alert("ѡ����ֵķ�Χ��");                                                             
				$("own_range").focus();                                                    
				return false;                                                                            
			}
			var str=content.getHTML();
			str=str.replace(/\s*/g,""); 
			if(str == ""  )
			{
				alert("����д�������ݣ�");
				return false;
			}
		    if($("start_date").value.replace(/\s*/g,"")=="" || $("start_date").value.replace(/\s*/g,"")==null)
			{
				alert("��ʼ���ڲ���Ϊ��!!!");
				$("start_date").focus();
				return false;
			}
		    if($("end_date").value.replace(/\s*/g,"")=="" || $("end_date").value.replace(/\s*/g,"")==null)
			{
				alert("�������ڲ���Ϊ��!!!");
				$("end_date").focus();
				return false;
			}
	           if(!checkDate($("start_date").value,$("end_date").value)){
			     return false;
			   }
			if($("show_no").value=="" || $("show_no").value==null)
			{
				alert("����д��ʾ˳��");
				$("show_no").focus();
				return false;
			}
           return true;         
         }
         function setShowNo(no){
           if(no =="" || no ==null){
             alert("��ѡ��Ͷ�Ź���Ƶ����");
           }else{
             ParamethodMgr.getAdvertiseNumber('109',no,createShowNo);
           }
         }
         function createShowNo(num){
         var array=new Array();
         DWRUtil.removeAllOptions("show_no");
         var hashmap=new Hash();
           for(var i=1;i<=num;i++){
             hashmap.set(i,i);
           }
           DWRUtil.addOptions("show_no",hashmap.values());
         }
  </script>
	</head>
	<body>
		<form name="formQuery" id="formQuery" action=/doTradeReg.do method="post" target="_self">
			<table width=727 border=0 cellpadding=5 cellspacing=1 align=center bgcolor="#e7e7e7">
				<tr>
					<td colspan="2" style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;">
						&nbsp;
					</td>
				</tr>
				<tr>
					<td width="100" align=right style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;">
						<bean:message key="str151"/>
						<input name=adv_id type=hidden value="<%=adv_id%>">
						<input name=trade_type_code type=hidden value=1302>
					</td>
					<td width="604" align=left style="background-color:#ffffff; color:#000000;  font-size:12px;">
						<div class="ping">
							<select name=adv_type id="adv_type">
								<option value="">
									<bean:message key="str158"/>
								</option>
								<%=adv_type%>
							</select>
						</div>
					</td>
				</tr>
				<tr>
					<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
						<bean:message key="str152"/>
					</td>
					<td style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left>
						<div class="ping">
							<select name="own_range" id="own_range" onchange="setShowNo(this.value)">
								<option value="">
									<bean:message key="str158"/>
								</option>
								<%=own_range%>
							</select>
						</div>
					</td>
				</tr>
				<tr>
					<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
						<bean:message key="str159"/>
					</td>
					<td style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left>
						<div class="ping">
							<select id="show_no" name="show_no">
							<option value=""><bean:message key="str158"/></option>
							</select>
						</div>
					</td>
				</tr>
				<tr>
					<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align="right" valign="middle">
						<bean:message key="str161"/>
					</td>
					<td style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left>
						<div class="ping">
							<textarea name=content style=display:none></textarea>
							<iframe id="content" src="/www/ewebeditor/ewebeditor.htm?id=content&style=coolblue&root_id=<%=adv_id%>" frameborder=0 scrolling=no width=600 height=350></iframe>
					</td>
				</tr>
				<tr>
					<td align="right" style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;">
						<bean:message key="str162"/>
					</td>
					<td align="left" style="background-color:#ffffff; color:#000000;  font-size:12px;">
						<div class="ping">
							<input name="start_date" id="start_date" type="text" value="<%=start_date%>" onfocus="setday(this);" style="width:93px">
							(yyyy-mm-dd)
						</div>
					</td>
				</tr>
				<tr>
					<td align="right" style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;">
					<bean:message key="str163"/>
					</td>
					<td align="left" style="background-color:#ffffff; color:#000000;  font-size:12px;">
						<div class="ping">
							<input name="end_date" id="end_date" type="text" value="<%=end_date%>" onfocus="setday(this);" style="width:93px">
							(yyyy-mm-dd)
						</div>
					</td>
				</tr>
				<tr>
					<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
						<bean:message key="str164"/>
					</td>
					<td style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left>
						<div class="ping1">
							<input name="remark" type="text" size="30" maxlength="100" >
						</div>
					</td>
				</tr>
				<tr>
					<td height="30" colspan="2" align="center" style="background-color:#f6f6f6; color:#000000;  font-size:12px;">
						<input class="tjan" type="submit" value="" onClick=" return confirmsub()">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
