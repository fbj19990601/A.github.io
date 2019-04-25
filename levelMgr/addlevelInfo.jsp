<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="java.util.*"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.text.SimpleDateFormat"%>
<jsp:useBean id="bean" class="com.saas.biz.commen.ParamethodMgr" scope="page" />
<jsp:useBean id="comm" class="com.saas.biz.commen.commMethodMgr" scope="page" />
<%
	ArrayList list=bean.getCompareInfoByAttr("46");
	String level_code=comm.GenShortTradeId();
	Calendar cal = Calendar.getInstance();
  String start_Date = new SimpleDateFormat("yyyy-MM-dd").format(cal.getTime());
  cal.add(Calendar.MONTH, 1);
  String end_Date = new SimpleDateFormat("yyyy-MM-dd").format(cal.getTime());
  String param_name="",param_value="";
	if(request.getParameter("param_value")!=null){param_value=request.getParameter("param_value");}
	param_name = bean.getParamNameByValue("46",param_value);
%>

<html>
	<head>
		<title><bean:message key="str2697"/></title>
		<link href="/style/css.css" rel="stylesheet" type="text/css">
		<style type="text/css" media="screen">
form {padding:0px; margin:0px;}
.line6 {width:72spx; width:70spx!important;border:#ffcb99 1px solid;  background-color:#fff8ee; text-align:left; padding-left: 20px;padding-top: 10px;padding-bottom: 10px; color:#000000; margin-top:13px; margin-bottom:13px;}   /*横栏样式6---- 头部提醒1*/
.line6 .img{width:53px; height:53px; float:left; margin-right:20px;}
.line6 .title {font-size:14px; font-weight:bold; color:#ff5400;}
.line1 {border-left:#ff7300 3px solid; background-color:#e2e2e2; color:#333333;text-align:left; font-size:12px;}  /*横栏样式1*/
</style>
		<script language="javascript" src="/js/Calendar_Ly.js"></script>
		<script type="text/javascript" src="/js/public_b2b.js"></script>
		<script language="JavaScript">
    function Check_Value()
	{
	    if(document.getElementById("level_name").value==""){
	      alert("级别名称不能为空！");
	      document.getElementById("level_name").focus();
	      return false;
	    }
	    if(document.getElementById("level_code").value==""){
	      alert("级别代码不能为空！");
	      document.getElementById("level_code").focus();
	      return false;
	    }
	    if(!checkDate(document.getElementById("start_date").value,document.getElementById("end_date").value)){
		     return false;
		   }
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
    	function confirmsub(formobj)
    	{
    	    if(window.confirm('你确定要提交吗？')) 
    	    {  	    	
    	        if (Check_Value())
    	        {
    	            formobj.submit();   	
    	        }
    	    }
    	    else
    	    {
    	        return;
    	    }
    	}
</script>
	</head>
	<body>
		<form name=resumeForm action=/doTradeReg.do method=post
			target="_self">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="2"></td>
				</tr>
				<tr>
					<td valign="top">
						<table width=100% border=0 cellpadding=5 cellspacing=1 align=center
							bgcolor="#dddddd">
                            <tr>
								<td
									style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;"
									align=right>
									<bean:message key="str2698"/>
								</td>
								<td align="left" bgcolor="#FFFFFF">
<div class="ping1">
                                   <select name="entity_type" id="entity_type">
                                   	<%
                                   		if(param_name.equals("")){

                                   		}else{
                                   	%>
                                   		<option value="<%=param_value%>"><%=param_name%></option>
																		<%
																			}
																		%>
                                   <%
                                     if(list!=null && list.size()>0){
                                       for(int i=0;i<list.size();i++){
                                         HashMap map=(HashMap)list.get(i);
                                         String id=map.get("para_code1").toString();
                                         String name=map.get("para_code2").toString();
                                         %>
                                         <option value="<%=id%>"><%=name%></option>
                                         <%
                                       }
                                     }
                                   %>
                                   </select>
</div>
							  </td>
							</tr>
							<tr>
								<td
									style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;"
									align=right width=15%>
									<bean:message key="str2699"/>
								</td>
								<td align="left" bgcolor="#FFFFFF">
<div class="ping">
									<input name="level_name" type="text" id="level_name" size=30
										maxlength=30>
</div>
							  </td>
							</tr>
								<input name="level_code" id="level_code" type="hidden" value="<%=level_code%>">
							<tr>
								<td
									style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;"
									align=right>
									<bean:message key="str2700"/>
								</td>
								<td align="left" bgcolor="#FFFFFF">
<div class="ping1">
										<input name="start_date" type="text" id="start_date" value="<%=start_Date%>" size="16" maxlength="16" onfocus="setday(this);" />
</div>
							  </td>
							</tr>
							<tr>
								<td
									style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;"
									align=right>
									<bean:message key="str2701"/>
								</td>
								<td align="left" bgcolor="#FFFFFF">
<div class="ping1">
										<input name="end_date" type="text" id="end_date" value="<%=end_Date%>" size="16" maxlength="16" onfocus="setday(this);" />
</div>
							  </td>
							</tr>
							<tr>
								<td
									style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;"
									align=right>
									<bean:message key="str2810"/>
								</td>
								<td align="left" bgcolor="#FFFFFF">
<div class="ping1">
									<input name="remark" id="remark" type="text" size=30
										maxlength="500" />
</div>
							  </td>
							</tr>
							<input name="trade_type_code" type="hidden" value="1032"/>
							<tr>
								<td
									style="background-color:#ffffff; color:#000000;  font-size:12px; padding:3px 5px;"
									colspan=2 align="center">
									<INPUT name="advshow" type="checkbox" value="0"
										onclick="check_none(resumeForm)">
									<bean:message key="str3006"/>
								</td>
							</tr>
							<tr>
								<td
									style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;padding-top:10px;padding-bottom:10px;"
									align="center" colspan=2>
									<input class="tjan" name="submit1" type="button" value="" disabled="true" onclick="confirmsub(resumeForm)">
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

