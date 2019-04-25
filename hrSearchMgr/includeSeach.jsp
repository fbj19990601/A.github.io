<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"

"http://www.w3.org/TR/html4/loose.dtd">

<%@ page contentType="text/html;charset=GBK" %>

<%@ page import="java.util.*" %>

<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>

<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>

<%@ page import="com.saas.biz.commen.ParamethodMgr"%>

<%

 HttpSession  logsession = request.getSession(); 

     ParamethodMgr paramCom=new ParamethodMgr();

     ArrayList  jobTypeList=paramCom.getCompareInfo("CRM","job_type");

	  String meun_idx="";

	  if (request.getParameter("menu_id") != null)

      {

        meun_idx = request.getParameter("menu_id");

        logsession.setAttribute("menu_id",meun_idx);

      }

%>

<html>

<head>

	<title><bean:message key="str1463"/></title>

	<link href="/style/layout.css" rel="stylesheet" type="text/css">

	<script src="/www/fuction/calendar.js" type="text/javascript"></script>

	<script language="JavaScript" src="/www/fuction/public.js"></script>

	<script language="JavaScript">

		function Check_Value()

		{

			if (cTrim(document.searchForm.job_type.value,0) == "" || document.searchForm.job_type.value == null) 

			{                                                                                         

				alert("招聘职位类别不可以为空！");                                                             

				document.searchForm.job_type.focus();                                                    

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

					if (!Check_Value())

					{

						 return;

					}    	            	           

					formobj.submit();    	         

				}

				else

				{

					return;

				}

			}	

	</script>

</head>

<body>

<table width="100%" border="0" cellspacing="0" cellpadding="0">

  <tr>

    <td height="2"></td>

  </tr>

  <tr>

    <td><table width=100% border=0 cellpadding=5 cellspacing=1 align=center bgcolor="#e7e7e7">

        <form name=searchForm action=resultIndex.jsp method=post target=blank>

          <tr>

            <td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;" align=right><bean:message key="str1464"/></td>

			<input type="hidden" name="menu_id" value="<%=meun_idx%>">

            <td style="background-color:#ffffff; color:#000000;  font-size:12px;"  align=left><select name=job_type>

               <%

					if(jobTypeList != null && jobTypeList.size()>0)

					{

						for(int i=0;i<jobTypeList.size();i++)

						{

							HashMap map=(HashMap)jobTypeList.get(i);

							String value=map.get("para_code1").toString();

							String name=map.get("para_code2").toString();

							%>

                               <option value="<%= value %>"><%= name %></option>

                               <%

						}

					} %>

              </select>

            </td>

          </tr>

          <tr>

            <td style="background-color:#ffffff; color:#000000;  font-size:12px;"  colspan=2><INPUT name="advshow" type="checkbox" value="0" onclick="check_none(searchForm)">

              <bean:message key="str3006"/>

            </td>

          </tr>

          <tr>

            <td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;padding-top:10px;padding-bottom:10px;" align=center  colspan=2><input class="tjcxan" name="submit1" type="button" value="" disabled="true" onclick="confirmsub(searchForm)">

            </td>

          </tr>

        </form>

      </table></td>

  </tr>

  <tr>

    <td height="13"></td>

  </tr>

</table>

</body>

</html>

