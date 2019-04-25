<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"

"http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>

<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>

<%@ page import="java.util.*"%>

<%@ page contentType="text/html;charset=GBK"%>

<%@ page import="com.saas.biz.commen.ParamethodMgr"%>

<%@ page import="com.saas.biz.indexLinkMgr.*" %>

<%

     String link_id="",link_name="",link_no="",link_type="",link_desc="",link_url="";

     if (request.getParameter("link_id") != null)

     {

        link_id = request.getParameter("link_id");

        IndexlinkInfo linkInof=new IndexlinkInfo();

        ArrayList inofList=linkInof.getLinkInfoById(link_id);

        if(inofList != null && inofList.size()>0)

        {

           HashMap map=(HashMap)inofList.get(0);

           if(map.get("link_name")!=null)

           {

             link_name=map.get("link_name").toString();

           }

           if(map.get("link_no")!=null)

           {

             link_no=map.get("link_no").toString();

           }

           if(map.get("link_type")!=null)

           {

             link_type=map.get("link_type").toString();

           }

           if(map.get("link_desc")!=null)

           {

             link_desc=map.get("link_desc").toString();

             link_desc=link_desc.replaceAll("<[^<>]+>","");

           }

           if(map.get("link_url")!=null)

           {

             link_url=map.get("link_url").toString();

           }

        }

     }

     ParamethodMgr paramCom=new ParamethodMgr();

	ArrayList  linkTypeList =paramCom.getCompareInfo("CRM","link_type");

	

%>

<html>

<head>

<title><bean:message key="str1918"/></title>

<link href="/style/css.css" rel="stylesheet" type="text/css">

<style type="text/css">

.line6 {width:72spx; width:70spx!important;border:#ffcb99 1px solid;  background-color:#fff8ee; text-align:left; padding-left: 20px;padding-top: 10px;padding-bottom: 10px; color:#000000; margin-top:13px; margin-bottom:13px;}   /*横栏样式6---- 头部提醒1*/

.line6 .img{width:53px; height:53px; float:left; margin-right:20px;}

.line6 .title {font-size:14px; font-weight:bold; color:#ff5400;}

.line1 {border-left:#ff7300 3px solid; background-color:#e2e2e2; color:#333333;text-align:left; font-size:13px; font-weight:bold; padding-left: 20px; padding-top: 5px;padding-bottom: 5px; }  /*横栏样式1*/

</style>

<script language="JavaScript">

     function check_none()

     {

          if (document.formQuery.advshow.checked)

          {

      	    document.formQuery.submit1.disabled=false;        	     

      	}

      	else

      	{

      	   document.formQuery.submit1.disabled=true;

      	}

  	}

    	function exit()

    	{

    	    window.close();

    	}

    	function confirmsub()

    	{

    	    if(window.confirm('你确定要提交吗？')) 

    	    {

    	    	 

    	        if(document.formQuery.link_name.value== "" || document.formQuery.link_name.value == null)

			{

				alert("链接名称不可以为空！");                                                             

				document.formQuery.link_name.focus();                                                    

				return false;     

			}

			 if(document.formQuery.link_url.value== "" || document.formQuery.link_url.value == null)

			{

				alert("链接地址不可以为空！");                                                             

				document.formQuery.link_url.focus();                                                    

				return false;     

			}

    	       document.formQuery.submit();    	         

    	    }

    	    else

    	    {

    	        return;

    	    }

    	}

  </script>

</head>

<body>

	<table width="818" border="0" cellspacing="0" cellpadding="0" align="center">

		<form name="formQuery" id="formQuery" action=/doTradeReg.do method="post">

	  <tr>

	    <td height="26" background="/img/bg-1.gif">&nbsp;</td>

	  </tr>

	  <tr>

	    <td background="/img/bg-2.gif">

		     <table width=93% border=0 cellpadding=5 cellspacing=1 align=center bgcolor="#dddddd">

		     		<input name=link_id type=hidden value="<%=link_id%>">

		     		<input name=trade_type_code type=hidden value=0916>

					<tr>    

                    <td  class="line1" align="left" colspan="2"><bean:message key="str2779"/>

                   </td>

                   </tr>

				    <tr>

				      <td width="14%" align=right style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;"><bean:message key="str2780"/></td>

				      <td width="86%" align=left bgcolor="#FFFFFF"><div class="ping"><input type=text name="link_name" maxlength=50 size=50 value="<%=link_name%>"></div></td>

				    </tr>

				    <tr>

				      <td  style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;" align=right><bean:message key="str2781"/></td>

				      <td align=left bgcolor="#FFFFFF"><div class="ping1"><select name=link_type>

				               <%

									if(linkTypeList != null && linkTypeList.size()>0)

									{

										for(int i=0;i<linkTypeList.size();i++)

										{

											HashMap map=(HashMap)linkTypeList.get(i);

											String value=map.get("para_code1").toString();

											String name=map.get("para_code2").toString();

											%>

				                               <option value="<%= value %>"><%= name %></option>

				                               <%

										}

									} %>

				        </select>
</div>
				    </td>

                    </tr>

                     <tr>

				      <td  style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;" align=right><bean:message key="str2782"/></td>

				      <td align=left bgcolor="#FFFFFF"><div class="ping1"><input type=text name=link_url maxlength=50 size=50  value="<%=link_url%>">( http://www.xxxx.com)</div></td>

				    </tr>

                    <tr>

				      <td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;" align=right><bean:message key="str1349"/></td>

				      <td align=left bgcolor="#FFFFFF"><div class="ping1"><textarea name=link_desc style=display:none><%=link_desc%></textarea>

				         <iframe id="link_desc" src="/www/ewebeditor/ewebeditor.htm?id=link_desc&style=coolblue&root_id=<%=link_id%>" frameborder=0 scrolling=no width=600 height=350></iframe>  
</div>
				      </td>

				    </tr>

				    <tr>

				      <td  style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;" align=right><bean:message key="str2761"/></td>

				      <td align=left bgcolor="#FFFFFF"><div class="ping1"><input type=text name=link_no maxlength="100" value="<%=link_no%>"></div></td>

				    </tr>

				    <tr>

				      <input type=hidden name=rsrv_num1 value=0>

				      <td style="background-color:#ffffff; color:#000000;  font-size:12px;" colspan=2 align="center">&nbsp;<input id="advshow" name="advshow" type="checkbox" value=0 onclick="check_none()">

				        <bean:message key="str2785"/>

				      </td>

				    </tr>

				    <tr>

				      <td  colspan="2" style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;padding-top:10px;padding-bottom:10px;"  align=center><input class="tjan" name="submit1" type=button value="提交" disabled=true onclick=confirmsub()>&nbsp;&nbsp;</td>

				    </tr>

	      </table>

        </td>

	  </tr>

	  <tr>

	    <td height="46" background="/img/bg-3.gif">&nbsp;</td>

	  </tr>

	  </form>

	</table>

</body>

</html>