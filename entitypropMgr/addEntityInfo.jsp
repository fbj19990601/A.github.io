<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"

"http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>

<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>

<%@ page import="java.util.*"%>

<%@ page contentType="text/html;charset=GBK"%>

<jsp:useBean id="bean" class="com.saas.biz.commen.ParamethodMgr" scope="page" />

<jsp:useBean id="comm" class="com.saas.biz.commen.commMethodMgr" scope="page" />

<%

	ArrayList list=bean.getCompareInfoByAttr("46");

	String attr_code=comm.GenTradeId();

%>

<html>

	<head>

		<title><bean:message key="str182"/></title>

		

		    <link href="/style/layout.css" rel="stylesheet" type="text/css">

		    

		<script language="javascript" src="/js/Calendar_Ly.js"></script>

		<script src="/www/fuction/calendar.js" type="text/javascript"></script>

		<script language="JavaScript" src="/www/fuction/public.js"></script>

		<script language="JavaScript">

    function Check_Value()

	{

	    if(document.getElementById("attr_name").value==""){

	      alert("属性名称不能为空！");

	      document.getElementById("attr_name").focus();

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

									align=right width=15%>

									<bean:message key="str439"/>

								</td>

								<td width=85% align=left bgcolor="#FFFFFF">
<div class="ping">
									<input name="attr_name" type="text" id="attr_name" size=30

										maxlength=50>
</div>
							  </td>

							</tr>

							<input name="attr_code" id="attr_code" type="hidden" value="<%=attr_code%>">

							<tr>

								<td

									style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;"

									align=right>

									<bean:message key="str1298"/>

								</td>

								<td align=left bgcolor="#FFFFFF">
<div class="ping1">
                                   <select name="entity_type" id="entity_type">

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

									align=right>

									<bean:message key="str1313"/>

								</td>

								<td align=left bgcolor="#FFFFFF">

									<div class="ping1"><textarea name="attr_desc" id="attr_desc" cols="50" rows="6"></textarea>
</div>
							  </td>

							</tr>

							<tr>

								<td

									style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;"

									align=right>

									<bean:message key="str3266"/>

								</td>

								<td align=left bgcolor="#FFFFFF">
<div class="ping1">
									<select name="enable_tag" id="enable_tag">

										<option value="0">

											<bean:message key="str352"/>

										</option>

										<option value="1">

											<bean:message key="str353"/>

										</option>

									</select>
</div>
							  </td>

							</tr>

							<tr>

								<td

									style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;"

									align=right>

									<bean:message key="str442"/>

								</td>

								<td align=left bgcolor="#FFFFFF">
<div class="ping1">
									<input name="default_value" id="default_value" type="text" size=6

										maxlength="10" onkeyup="if(isNaN(value))execCommand('undo')"/>
</div>
							  </td>

							</tr>

							<tr>

								<td

									style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;"

									align=right>

									<bean:message key="str1026"/>

								</td>

								<td align=left bgcolor="#FFFFFF">

								<div class="ping1">	<input name="remark" id="remark" type="text" size=52 maxlength="50" />
</div>
							  </td>

							</tr>

							<input name="trade_type_code" type="hidden" value="1040"/>

							<tr>

								<td

									style="background-color:#ffffff; color:#000000;  font-size:12px; padding:3px 5px;"

									colspan=2 align="center">

									<INPUT name="advshow" type="checkbox" value="0"

										onclick="check_none(resumeForm)">

									<bean:message key="str2448"/>

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

