<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"

"http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>

<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>

<%@ page import="java.util.*"%>

<%@ page import="java.util.Date"%>

<%@ page import="java.text.SimpleDateFormat"%>

<%@ page import="com.saas.biz.advertiseMgr.*"%>

<%@ page contentType="text/html;charset=GBK"%>

<%@ page import="com.saas.biz.commen.ParamethodMgr"%>

<%@ page import="com.saas.biz.resumeMgr.ResumeInfo"%>

<jsp:useBean id="bean" class="com.saas.biz.commen.commMethodMgr" scope="page"/>

<%

    String fbtime=new SimpleDateFormat("yyyy-MM-dd").format(new Date());

    String resume_id="",userName="",grad_from="",profession="",wish="",born_date=fbtime,born_site="",

    phone="",email="",addr="",position="",age="",job_age="",grad_date=fbtime,work_history="",spec="",tel="";

    HttpSession  logsessionres = request.getSession(); 

     String userIdx="";

     if (logsessionres.getAttribute("SESSION_USER_ID") != null)

     {

        userIdx = logsessionres.getAttribute("SESSION_USER_ID").toString();

        userName=logsessionres.getAttribute("SESSION_USER_NAME").toString();

     }

     ParamethodMgr paramCom=new ParamethodMgr();

	ArrayList  degreeList =paramCom.getCompareInfo("CRM","degree");

	ArrayList  sexList =paramCom.getCompareInfo("CRM","sex");

	ArrayList  certList =paramCom.getCompareInfo("CRM","cert");

	 ArrayList resumeLists=resume.genResumeByUser_Id(user_id);

	 if(resumeLists !=null && resumeLists.size()>0)

	 {

	     HashMap map=(HashMap)resumeLists.get(0);

	     resume_id=map.get("resume_id").toString();

	     if(map.get("grad_from")!=null)

	     {

	       grad_from=map.get("grad_from").toString();

	     }

	      if(map.get("profession")!=null)

	     {

	       profession=map.get("profession").toString();

	     }

	      if(map.get("wish")!=null)

	     {

	       wish=map.get("wish").toString();

	     }

	     if(map.get("born_site")!=null)

	     {

	       born_site=map.get("born_site").toString();

	     }

	     if(map.get("born_date")!=null)

	     {

	       born_date=map.get("born_date").toString();

	       if(born_date.length()>10)

	       {

	         born_date=born_date.substring(0,10);

	       }

	     }

	      if(map.get("phone")!=null)

	     {

	       phone=map.get("phone").toString();

	     }

	      if(map.get("email")!=null)

	     {

	       email=map.get("email").toString();

	     }

	      if(map.get("addr")!=null)

	     {

	       addr=map.get("addr").toString();

	     }

	      if(map.get("position")!=null)

	     {

	       position=map.get("position").toString();

	     }

	       if(map.get("age")!=null)

	     {

	       age=map.get("age").toString();

	     }

	      if(map.get("job_age")!=null)

	     {

	       job_age=map.get("job_age").toString();

	     }

	      if(map.get("grad_date")!=null)

	     {

	       grad_date=map.get("grad_date").toString();

	        if(grad_date.length()>10)

	       {

	         grad_date=grad_date.substring(0,10);

	       }

	     }

	      if(map.get("work_history")!=null)

	     {

	       work_history=map.get("work_history").toString();

	     }

	      if(map.get("spec")!=null)

	     {

	       spec=map.get("spec").toString();

	     }

	     if(map.get("tel")!=null)

	     {

	       tel=map.get("tel").toString();

	     }

	 }

%>

<html>

<head>

<title>电子商务平台<bean:message key="str182"/></title>



<script language="javascript" src="/js/Calendar_Ly.js"></script>

<script src="/www/fuction/calendar.js" type="text/javascript"></script>

<script language="JavaScript" src="/www/fuction/public.js"></script>

<script language="JavaScript">

    function Check_Value()

	{

		if (cTrim(document.resumeForm.grad_from.value,0) == "" || document.resumeForm.grad_from.value == null) 

		{                                                                                         

			alert("毕业学校不可以为空！");                                                             

			document.resumeForm.grad_from.focus();                                                    

			return false;                                                                            

		}                                                                                       

		if (cTrim(document.resumeForm.profession.value,0) == "" || document.resumeForm.profession.value == null) 

		{                                                                                         

			alert("专业不可以为空！");                                                             

			document.resumeForm.profession.focus();                                                    

			return false;                                                                            

		}      

		if (cTrim(document.resumeForm.wish.value,0) == "" || document.resumeForm.wish.value == null) 

		{                                                                                         

			alert("期望薪资不可以为空！");                                                             

			document.resumeForm.wish.focus();                                                    

			return false;                                                                            

		}

		else if(! isNum(document.resumeForm.wish.value))

	     {

			alert("期望薪资有误，请输入正确的数字！");

			document.resumeForm.wish.focus(); 

			return false;

	     }                                                                                     

		if (cTrim(document.resumeForm.born_date.value,0) == "" || document.resumeForm.born_date.value == null) 

		{                                                                                         

			alert("出生年月不可以为空！");                                                             

			document.resumeForm.born_date.focus();                                                    

			return false;                                                                            

		}                                                                                      

		if (cTrim(document.resumeForm.born_site.value,0) == "" || document.resumeForm.born_site.value == null) 

		{                                                                                         

			alert("籍贯不可以为空！");                                                             

			document.resumeForm.born_site.focus();                                                    

			return false;                                                                            

		}                                                                                      

		                                                                                  

		if (cTrim(document.resumeForm.phone.value,0) == "" || document.resumeForm.phone.value == null) 

		{                                                                                         

			alert("联系电话不可以为空！");                                                             

			document.resumeForm.phone.focus();                                                    

			return false;                                                                            

		}                                                                                       

		if (cTrim(document.resumeForm.email.value,0) == "" || document.resumeForm.email.value == null) 

		{                                                                                         

			alert("电子邮件不可以为空！");                                                             

			document.resumeForm.email.focus();                                                    

			return false;                                                                            

		}                                                                                       

		if (cTrim(document.resumeForm.tel.value,0) == "" || document.resumeForm.tel.value == null) 

		{                                                                                         

			alert("固定电话不可以为空！");                                                             

			document.resumeForm.tel.focus();                                                    

			return false;                                                                            

		}                                                                                      

		if (cTrim(document.resumeForm.addr.value,0) == "" || document.resumeForm.addr.value == null) 

		{                                                                                         

			alert("联系地址不可以为空！");                                                             

			document.resumeForm.addr.focus();                                                    

			return false;                                                                            

		}                                                                                       

		if (cTrim(document.resumeForm.position.value,0) == "" || document.resumeForm.position.value == null) 

		{                                                                                         

			alert("当前职位不可以为空！");                                                             

			document.resumeForm.position.focus();                                                    

			return false;                                                                            

		}                                                                                       

		if (cTrim(document.resumeForm.age.value,0) == "" || document.resumeForm.age.value == null) 

		{                                                                                         

			alert("年龄不可以为空！");                                                             

			document.resumeForm.age.focus();                                                    

			return false;                                                                            

		}

		else if(! isNum(document.resumeForm.age.value))

	     {

			alert("年龄有误，请输入正确的数字！");

			document.resumeForm.age.focus(); 

			return false;

	     }                                                                                       

		if (cTrim(document.resumeForm.degree.value,0) == "" || document.resumeForm.degree.value == null) 

		{                                                                                         

			alert("学历不可以为空！");                                                             

			document.resumeForm.degree.focus();                                                    

			return false;                                                                            

		}                                                                                     

		if (cTrim(document.resumeForm.job_age.value,0) == "" || document.resumeForm.job_age.value == null) 

		{                                                                                         

			alert("工作年限不可以为空！");                                                             

			document.resumeForm.job_age.focus();                                                    

			return false;                                                                            

		}                                                                                       

		if (cTrim(document.resumeForm.grad_date.value,0) == "" || document.resumeForm.grad_date.value == null) 

		{                                                                                         

			alert("毕业年份不可以为空！");                                                             

			document.resumeForm.grad_date.focus();                                                    

			return false;                                                                            

		}                                                                                       

		if (work_history.getText()=="" || document.resumeForm.work_history.value == null) 

		{                                                                                         

			alert("工作经历不可以为空！");                                                             

			document.resumeForm.work_history.focus();                                                    

			return false;                                                                            

		}                                                                                      

		if (spec.getText()=="" || document.resumeForm.spec.value == null) 

		{                                                                                         

			alert("特殊技能不可以为空！");                                                             

			document.resumeForm.spec.focus();                                                    

			return false;                                                                            

		}                                                                                        

		if (cTrim(document.resumeForm.cert.value,0) == "" || document.resumeForm.cert.value == null) 

		{                                                                                         

			alert("所获证书不可以为空！");                                                             

			document.resumeForm.cert.focus();                                                    

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

    	     	addparm(formobj);

    	         formobj.submit();   	         

    	    }

    	    else

    	    {

    	        return;

    	    }

    	}

     function  addparm(formobj)

     {

        if(formobj.str_attr)

        {

       		var attr_str="";

       		formobj.str_attr.value="";

			for(var i=0;i<formobj.length;i++)

			{

				if(formobj[i].getAttribute("name").substring(0,4)=="attr")

				{

			 	  attr_str =attr_str + formobj[i].getAttribute("name").substring(4, formobj[i].getAttribute("name").length)+":";

			 	  attr_str = attr_str +formobj[i].getAttribute("value")+"|";

				}

			}

			formobj.str_attr.value=attr_str;

	    }

     }    	

     function   isNum(str)

    {   

      return   (str.search(/^\d+(\.\d+)?$/)!=-1);   

    }   	

</script>

</head>

<body>

<table width="100%" border="0" cellspacing="0" cellpadding="0">

  <tr><td height="2"></td>

  </tr>

  <tr>

    <td valign="top"><table width=100% border=0 cellpadding=5 cellspacing=1 align=center bgcolor="#dddddd">

        <form name=resumeForm action=/doTradeReg.do method=post  target="_blank">

          <tr>

            <td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right  width=15%><bean:message key="str2474"/>

              <input name="resume_id" type="hidden" value=<%=resume_id%>></td>

            <td style="background-color:#ffffff; color:#000000;  font-size:12px; padding:3px 5px;"  align=left  width=85%><input name="name" type="text" size=30 maxlength=30 value="<%=userName%>">

            </td>

          </tr>

          <tr>

            <td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right><bean:message key="str710"/></td>

            <td style="background-color:#ffffff; color:#000000;  font-size:12px; padding:3px 5px;" align=left><input name="grad_from" type="text" size=50 maxlength=50 value="<%=grad_from%>">

            </td>

          </tr>

          <tr>

            <td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right><bean:message key="str1443"/></td>

            <td style="background-color:#ffffff; color:#000000;  font-size:12px; padding:3px 5px;" align=left><input name="profession" type="text" size=50 maxlength=50 value="<%=profession%>">

            </td>

          </tr>

          <tr>

            <td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right><bean:message key="str1444"/></td>

            <td style="background-color:#ffffff; color:#000000;  font-size:12px; padding:3px 5px;" align=left><input name="wish" type="text" size=15 maxlength=15 value="<%=wish%>">

            </td>

          </tr>

          <tr>

            <td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right><bean:message key="str1445"/></td>

            <td style="background-color:#ffffff; color:#000000;  font-size:12px; padding:3px 5px;"  align=left><input name="born_date" id="born_date" readonly type="text" size=10 value="<%=born_date%>" onfocus="setday(this);"  style="width:93px">(yyyy-mm-dd)</td>

          </tr>

          <tr>

            <td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right><bean:message key="str1446"/></td>

            <td style="background-color:#ffffff; color:#000000;  font-size:12px; padding:3px 5px;" align=left><input name="born_site" type="text" size=50 maxlength=50 value="<%=born_site%>">

            </td>

          </tr>

          <tr>

            <td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right><bean:message key="str1447"/></td>

            <td style="background-color:#ffffff; color:#000000;  font-size:12px; padding:3px 5px;" align=left><input name="phone" type="text" size=15 maxlength=15 value="<%=phone%>">

            </td>

          </tr>

          <tr>

            <td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right><bean:message key="str1448"/></td>

            <td style="background-color:#ffffff; color:#000000;  font-size:12px; padding:3px 5px;" align=left><input name="email" type="text" size=50 maxlength=50 value="<%=email%>">

            </td>

          </tr>

          <tr>

            <td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right><bean:message key="str1449"/></td>

            <td style="background-color:#ffffff; color:#000000;  font-size:12px; padding:3px 5px;" align=left><input name="tel" type="text" size=15 maxlength=15 value="<%=tel%>">

            </td>

          </tr>

          <tr>

            <td  style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right><bean:message key="str1450"/></td>

            <td style="background-color:#ffffff; color:#000000;  font-size:12px; padding:3px 5px;" align=left><input name="addr" type="text" size=50 maxlength=50 value="<%=addr%>">

            </td>

          </tr>

          <tr>

            <td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right><bean:message key="str1451"/></td>

            <td style="background-color:#ffffff; color:#000000;  font-size:12px; padding:3px 5px;" align=left><input name="position" type="text" size=50 maxlength=50 value="<%=position%>">

            </td>

          </tr>

          <tr>

            <td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right><bean:message key="str1452"/></td>

            <td style="background-color:#ffffff; color:#000000;  font-size:12px; padding:3px 5px;" align=left><input name="age" type="text" size=4 maxlength=4 value="<%=age%>">

            </td>

          </tr>

          <tr>

            <td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right><bean:message key="str1453"/></td>

            <td style="background-color:#ffffff; color:#000000;  font-size:12px; padding:3px 5px;" align=left><select name=remark>

                <%

					if(sexList != null && sexList.size()>0)

					{

						for(int i=0;i<sexList.size();i++)

						{

							HashMap map=(HashMap)sexList.get(i);

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

            <td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right><bean:message key="str1454"/></td>

            <td style="background-color:#ffffff; color:#000000;  font-size:12px; padding:3px 5px;" align=left><select name=degree>

                <%

					if(degreeList != null && degreeList.size()>0)

					{

						for(int i=0;i<degreeList.size();i++)

						{

							HashMap map=(HashMap)degreeList.get(i);

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

            <td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right><bean:message key="str1455"/></td>

            <td style="background-color:#ffffff; color:#000000;  font-size:12px; padding:3px 5px;" align=left><input name="job_age" type="text" size=4 maxlength=4 value="<%=job_age%>">

            </td>

          </tr>

          <tr>

            <td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right><bean:message key="str1456"/></td>

            <td style="background-color:#ffffff; color:#000000;  font-size:12px; padding:3px 5px;" align=left><input name="grad_date" id="grad_date" readonly type="text" size=10  value="<%=grad_date%>" onfocus="setday(this);"  style="width:93px">(yyyy-mm-dd)</td>

          </tr>

          <tr>

            <td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right><bean:message key="str1457"/></td>

            <td style="background-color:#ffffff; color:#000000;  font-size:12px; padding:3px 5px;" align=left><textarea name="work_history" style=display:none><%=work_history%></textarea>

              <iframe ID=work_history src=/www/ewebeditor/ewebeditor.htm?id=work_history&style=coolblue&root_id=<%=resume_id%> frameborder=0 scrolling=no width=600 HEIGHT=350></iframe></td>

          </tr>

          <tr>

            <td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right><bean:message key="str1458"/></td>

            <td style="background-color:#ffffff; color:#000000;  font-size:12px; padding:3px 5px;" align=left><textarea name="spec" style=display:none><%=spec%></textarea>

              <iframe ID=spec src=/www/ewebeditor/ewebeditor.htm?id=spec&style=coolblue&root_id=<%=resume_id%> frameborder=0 scrolling=no width=600 HEIGHT=350></iframe></td>

          </tr>

          <input name="trade_type_code" type="hidden" value="0341">

          <tr>

            <td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right><bean:message key="str1459"/></td>

            <td style="background-color:#ffffff; color:#000000;  font-size:12px; padding:3px 5px;" align=left><select name="cert" >

            	<%

					if(certList != null && certList.size()>0)

					{

						for(int i=0;i<certList.size();i++)

						{

							HashMap map=(HashMap)certList.get(i);

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

            <td style="background-color:#ffffff; color:#000000;  font-size:12px; padding:3px 5px;" colspan=2 align="center"><INPUT name="advshow" type="checkbox" value="0" onclick="check_none(resumeForm)">       

              <bean:message key="str2448"/>

            </td>

          </tr>

          <tr>

            <td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;padding-top:10px;padding-bottom:10px;" align="center"  colspan=2><input class="tjan" name="submit1" type="button" value="" disabled="true" onclick="confirmsub(resumeForm)">

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

