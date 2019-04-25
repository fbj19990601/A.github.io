<%@ page contentType="text/html;charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="com.saas.biz.commen.ParamethodMgr"%>
<jsp:useBean id="bean" class="com.saas.biz.commen.commMethodMgr" scope="page" />
<%
	String credit_id = bean.GenTradeId();
	SimpleDateFormat formate = new SimpleDateFormat("yyyy-MM-dd");
	String start_date = formate.format(new Date());
	Calendar cal = Calendar.getInstance();
	cal.add(Calendar.YEAR, 3);
	String end_date = formate.format(cal.getTime());
	ParamethodMgr paramCom = new ParamethodMgr();
	String credit_type = paramCom.getSelectItems("7");
	String credit_department = paramCom.getSelectItems("32");
%>
<html>
	<head>
		<title><bean:message key="str190"/></title>
		<link href="/style/css.css" rel="stylesheet" type="text/css">
		<style type="text/css" media="screen">
			form {padding:0px; margin:0px;}
			.line6 {width:72spx; width:70spx!important;border:#ffcb99 1px solid;  background-color:#fff8ee; text-align:left; padding-left: 20px;padding-top: 10px;padding-bottom: 10px; color:#000000; margin-top:13px; margin-bottom:13px;}   /*横栏样式6---- 头部提醒1*/
			.line6 .img{width:53px; height:53px; float:left; margin-right:20px;}
			.line6 .title {font-size:14px; font-weight:bold; color:#ff5400;}
			.line1 {border-left:#ff7300 3px solid; background-color:#e2e2e2; color:#333333;text-align:left; font-size:12px;}  /*横栏样式1*/
       </style>
		<script language="javascript" src="/js/Calendar_Ly.js"></script>
	    <script type="text/javascript" src="/inc/prototype.js"></script>
		<script type="text/javascript" src="/inc/upLoad.js"></script>
		<script type="text/javascript" src="/js/public_b2b.js"></script>
		<script language="JavaScript">
    	function confirmsub()
    	{
    	    if(document.formQuery.credit_title.value.replace(/\s*/g,"")=="" )
    	    {
	    	   alert("Certificate name can not be empty!");
	    	   document.formQuery.credit_title.focus();
	    	   return false;
    	    }
    	      
					var desc=credit_desc.getText();
					desc=desc.replace(/\s*/g,""); 
					if(desc == ""  )
					{
						alert("Please fill in the certificate that!");
						return false;
					}
					if( desc.length > 4000)
					{
						 alert( "Volume certificate that the word should be less than 4000" );
						 return false;	
					}
					if ( document.formQuery.start_date.value.replace(/\s*/g,"") == ""  ) 
					{                                                                                         
						alert("Effective start time can not be empty!");                                                             
						document.formQuery.start_date.focus();                                                    
						return false;                                                                            
					}                                                                                        
					if ( document.formQuery.end_date.value.replace(/\s*/g,"") == "" ) 
					{                                                                                         
						alert("Effective cut-off time can not be empty!");                                                             
						document.formQuery.end_date.focus();                                                    
						return false;                                                                            
					}   
				//////////////////判断时间是否合理////////////////
			  if(!checkDate(document.formQuery.start_date.value,document.formQuery.end_date.value)){
				 return false;
			   }
			   ///////////////////////////////////////////////
    	   return true;
    	}
  </script>
	</head>
	<body>
		<form name="formQuery" id="formQuery" action=/doTradeReg.do method="post" target="_self">
			<table width="727" border="0" cellspacing="0" cellpadding="0" align="center">
				<tr>
					<td height="1">
						&nbsp;
					</td>
				</tr>
				<tr>
					<td valign="top">
						<table width="100%" border=0 cellpadding=5 cellspacing=1 align=center bgcolor="#dddddd">
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right width="20%">
									<bean:message key="str3334"/>
									<input name=credit_id type=hidden value="<%=credit_id%>">
									<input name=trade_type_code type=hidden value=0220>
								</td>
								<td style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left width="80%">
									<div class="ping">
										<select name=credit_type>
											<%=credit_type%>
										</select>
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
									<bean:message key="str3335"/>
								</td>
								<td style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left>
									<div class="ping">
										<select name=credit_department>
											<%=credit_department%>
										</select>
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
									&nbsp;&nbsp;&nbsp;&nbsp;<bean:message key="str3336"/>
								</td>
								<td style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left>
									<div class="ping">
										<input name="credit_title" type="text" size=70 maxlength=70>
									</div>
								</td>
							</tr>
							<tr>
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
									<bean:message key="str3337"/>
								</td>
								<td style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left>
									<div class="ping">
										<textarea name=credit_desc style=display:none></textarea>
										<iframe id="credit_desc" src="/www/ewebeditor/ewebeditor.htm?id=credit_desc&style=coolblue&root_id=<%=credit_id%>" frameborder=0 scrolling=no width=600 height=350></iframe>
									</div>
									<bean:message key="str3338"/>
								</td>
							</tr>
							<tr>
								<td align="right" style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;">
									<bean:message key="str3339"/>
								</td>
								<td align="left" style="background-color:#ffffff; color:#000000;  font-size:12px;">
									<div class="ping">
										<input name="credit_start_date" id="start_date" type="text" size="10" value="<%=start_date%>" onfocus="setday(this);" style="width:93px">
										(yyyy-mm-dd)
									</div>
								</td>
							</tr>
							<tr>
								<td align="right" style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" width="15%">
									<bean:message key="str3340"/>
								</td>
								<td align="left" style="background-color:#ffffff; color:#000000;  font-size:12px;" width="85%">
									<div class="ping">
										<input name="credit_end_date" id="end_date" type="text" size="10" value="<%=end_date%>" onfocus="setday(this);" style="width:93px">
										(yyyy-mm-dd)
									</div>
								</td>
							</tr>
							<tr style="display:none">
								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
									<bean:message key="str3341"/>
								</td>
								<td bgcolor="#FFFFFF" height="25px">
									<div class="ping1">
										<iframe src="/inc/uploadAttr.jsp?idx=<%=credit_id%>" width="100%" height="100%" frameborder="no" border="0" marginwidth="0" marginheight="0" scrolling="no" allowtransparency="yes"></iframe>
									</div>
								</td>
							</tr>
							<tr style="display:none">
								<td colspan="2" bgcolor="#FFFFFF">
									<dir id="attr-div"></dir>
								</td>
							</tr>
							<tr>
								<td align=center style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;padding-top:10px;padding-bottom:10px;" colspan=2>
									<input class="tjan" name=submit1 type=submit value="" onclick="return confirmsub()">
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
