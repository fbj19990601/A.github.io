<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"

"http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>

<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="java.util.*"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.saas.biz.commen.ParamethodMgr"%>
<jsp:useBean id="bean" class="com.saas.biz.commen.commMethodMgr" scope="page" />
<%@ page import="com.saas.biz.commen.commMethodMgr"%>
<%
	ParamethodMgr paramCom = new ParamethodMgr();
	String link_type = paramCom.getSelectItems("29");
	commMethodMgr commen = new commMethodMgr();
	String link_no = commen.GenTradeId();
	HttpSession  logsession = request.getSession();
	String cust_id=""; 
	if (logsession.getAttribute("SESSION_CUST_ID") != null)
    {
        cust_id = logsession.getAttribute("SESSION_CUST_ID").toString();
    }
%>

<html>
	<head>
		<title><bean:message key="str182"/></title>
		<link href="/style/layout.css" rel="stylesheet" type="text/css">
		<link href="/style/daohang.css" rel="stylesheet" type="text/css">
		<link href="/style/manager.css" rel="stylesheet" type="text/css">
		<style type="text/css">
		.line6 {width:72spx; width:70spx!important;border:#ffcb99 1px solid;  background-color:#fff8ee; text-align:left; padding-left: 20px;padding-top: 10px;padding-bottom: 10px; color:#000000; margin-top:13px; margin-bottom:13px;}   /*横栏样式6---- 头部提醒1*/
		.line6 .img{width:53px; height:53px; float:left; margin-right:20px;}
		.line6 .title {font-size:14px; font-weight:bold; color:#ff5400;}
		.line1 {border-left:#ff7300 3px solid; background-color:#e2e2e2; color:#333333;text-align:left; font-size:12px; font-weight:bold; padding-left: 20px; padding-top: 5px;padding-bottom: 5px; }  /*横栏样式1*/
		</style>
		<script type="text/javascript" src="/js/prototype.js"></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/CustlinkInfo.js'></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/engine.js'></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/util.js'></script>
		<script language="JavaScript">
    	function confirmsub()
    	{
    	        var link_name=$F("link_name");
    	        if(link_name== "" || link_name == null)
			    {
					alert("Link name can not be empty!");                                                             
					document.formQuery.link_name.focus();                                                    
					return false;     
			    }
                var link_url=$F("link_url");
				 if(link_url == "http://" )
				 {
					alert("Link address can not be empty!");                                                             
					document.formQuery.link_url.focus();                                                    
					return false;     
				 }
				
	 
       var strRegex = "^((https|http|ftp|rtsp|mms)?://)"  
  + "?(([0-9a-z_!~*'().&=+$%-]+: )?[0-9a-z_!~*'().&=+$%-]+@)?" //ftp的user@  
        + "(([0-9]{1,3}\.){3}[0-9]{1,3}" // IP形式的URL- 199.194.52.184  
        + "|" 
        + "([0-9a-z_!~*'()-]+\.)*" 
        + "([0-9a-z][0-9a-z-]{0,61})?[0-9a-z]\." 
        + "[a-z]{2,6})" // first level domain- .com or .museum  
        + "(:[0-9]{1,4})?" // 端口- :80  
        + "((/?)|" // a slash isn't required if there is no file name  
        + "(/[0-9a-z_!~*'().;?:@&=+$,%#-]+)+/?)$";  
        var re=new RegExp(strRegex);    
  			if(re.test(document.getElementById("link_url").value)){   
 
			}else{   
				 Ext.MessageBox.alert("XSaaS Tips","Link address not in the correct format!"); 
			
				document.getElementById("link_url").focus();
				return false;
	
            }


						
			   	return true;
    	}
    	function urlCheck(){
    	var result="";
    	         var cust_id=$F("cust_id");
    	         var link_name=$F("link_name");
    	         var link_url=$F("link_url");
	    	     CustlinkInfo.getCustFriendlyExists(cust_id,link_name,link_url,checkUrl);
	    	     if(result==""){
	    	      return false;
	    	     }else if(result>0){
			   	      alert("Links has been in existence, please re-add!");
			   	      return false;
			   	}
    	}
    	function checkUrl(data){
    	result=data;
    	 if(data>0){
   	      alert("Links has been in existence, please re-add!");
   	      document.formQuery.link_name.focus();  
   	      return false;
   	     }else{
   	      return true;
   	     }
    	}
  </script>
	</head>
	<body>
		<form name="formQuery" id="formQuery" action=/doTradeReg.do method="post" target="_self">
			<table width="725" border=0 cellpadding=5 cellspacing=1 align=center bgcolor="#dddddd">
				<input name=link_no type=hidden value="<%=link_no%>">
				<input name=trade_type_code type=hidden value=0297>
				<tr>
					<td class="line1" align="left" colspan="2">
						<bean:message key="str1344"/>
						<input type=hidden name=trade_type_code value=0343>
					</td>
				</tr>
				<tr>
					<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right width="15%">
						<bean:message key="str1345"/>
					</td>
					<td style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left width="85%">
					  <div class="ping">
						<input type=text name="link_name" maxlength=50 size=50>
					  </div>
					</td>
				</tr>
				<tr>
					<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
						<bean:message key="str1346"/>
					</td>
					<td style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left>
					 <div class="ping">
						<select name=link_type>
							<%=link_type%>
						</select>
					</div>
					</td>
				</tr>
				<tr>
					<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
						<bean:message key="str1347"/>
					</td>
					<td style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left>
					  <div class="ping">
						<input type=text name="link_url" id="link_url" maxlength=50 size=50 value="http://" onblur="urlCheck()">
						(<bean:message key="str5112"/> http://www.xsaas.com)
					    </div>
					</td>
				</tr>
				<tr>
					<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
						<bean:message key="str1349"/>
					</td>
					<td style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left>
						<textarea name=rsrv_str3 style=display:none></textarea>
						<iframe id="rsrv_str3" src="/www/ewebeditor/ewebeditor.htm?id=rsrv_str3&style=coolblue&root_id=<%=link_no%>" frameborder=0 scrolling=no width=600 height=350></iframe>
					</td>
				</tr>
				<input type="hidden" name="cust_id" id="cust_id" value="<%=cust_id%>"/>
				<tr>
					<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px; padding-top:10px;padding-bottom:10px;" align=center colspan=2>
						<input class="tjan" name="submit" type="submit" value="" onclick="return confirmsub()">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
