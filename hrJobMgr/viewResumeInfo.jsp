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
<%@ page import="com.saas.biz.JobMgr.JobInfo"%>
<jsp:useBean id="bean" class="com.saas.biz.commen.commMethodMgr" scope="page"/>
<%
    String fbtime=new SimpleDateFormat("yyyy-MM-dd").format(new Date());
    String resume_id="",userName="",grad_from="",profession="",wish="",born_date=fbtime,born_site="",
    phone="",email="",addr="",position="",age="",job_age="",grad_date=fbtime,work_history="",spec="",tel="",
    remark="",cert="",degree="";
    HttpSession  logsessionres = request.getSession(); 
     String userIdx="";
     if(request.getParameter("resume_id")!=null)
     {
       resume_id=request.getParameter("resume_id");
     }
     if (logsessionres.getAttribute("SESSION_USER_ID") != null)
     {
        userIdx = logsessionres.getAttribute("SESSION_USER_ID").toString();
        userName=logsessionres.getAttribute("SESSION_USER_NAME").toString();
     }
     ResumeInfo resume=new ResumeInfo();
     ParamethodMgr paramCom=new ParamethodMgr();
	HashMap  degreeList =paramCom.getCompareInfoByCode("CRM","degree");
	HashMap  sexList =paramCom.getCompareInfoByCode("CRM","sex");
	HashMap  certList =paramCom.getCompareInfoByCode("CRM","cert");
	 ArrayList resumeLists=resume.genResumeByResumeId(resume_id);
	 if(resumeLists !=null && resumeLists.size()>0)
	 {
	     HashMap map=(HashMap)resumeLists.get(0);
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
	     if(map.get("remark")!=null)
	     {
	       remark=map.get("remark").toString();
	     }
	     if(map.get("cert")!=null)
	     {
	       cert=map.get("cert").toString();
	     }
	     if(map.get("degree")!=null)
	     {
	       degree=map.get("degree").toString();
	     }
	 }
%>
<html>
<head>
<title><bean:message key="str182"/></title>
<link href="/style/layout.css" rel="stylesheet" type="text/css">
<script language="javascript" src="/js/calendar.js"></script>
<script language="javascript">
  var cdr = new Calendar("cdr");
  document.write(cdr);
  cdr.showMoreDay = true;
</script>
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
<table width="818" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td height="26" background="/img/bg-1.gif"></td>
  </tr>
  <tr>
    <td background="/img/bg-2.gif"><table width=93% border=0 cellpadding=5 cellspacing=1 align=center   bgcolor="#dddddd" >
        <form name=resumeForm action=/doTradeReg.do method=post  target="_blank">
          
		  <tr>
		     <td class="line1" align="left" colspan="2"><bean:message key="str1413"/><input name="resume_id" type="hidden" value=<%=resume_id%>></td>
	      </tr>
          <tr>
            <td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;" align=right  width="15%"><bean:message key="str1414"/></td>
            <td style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left  width="85%"><%=userName%>"</td>
          </tr>
          <tr>
            <td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;" align=right><bean:message key="str1415"/></td>
            <td style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left><%=grad_from%>"
            </td>
          </tr>
          <tr>
            <td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;" align=right><bean:message key="str1416"/></td>
            <td style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left><%=profession%>
            </td>
          </tr>
          <tr>
            <td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;" align=right><bean:message key="str1417"/></td>
            <td style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left><%=wish%>
            </td>
          </tr>
          <tr>
            <td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;" align=right><bean:message key="str1418"/></td>
            <td style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left><%=born_date%></td>
          </tr>
          <tr>
            <td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;" align=right><bean:message key="str1419"/></td>
            <td  style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left><%=born_site%>
            </td>
          </tr>
          <tr>
            <td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;" align=right><bean:message key="str1255"/></td>
            <td style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left><%=phone%>
            </td>
          </tr>
          <tr>
		    <td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;" align=right><bean:message key="str1256"/></td>
            <td style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left><%=email%>
            </td>
          </tr>
          <tr>
            <td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;" align=right><bean:message key="str1421"/></td>
            <td  style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left><%=tel%>
            </td>
          </tr>
          <tr>
            <td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;" align=right><bean:message key="str1422"/></td>
            <td  style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left><%=addr%>
            </td>
          </tr>
          <tr>
            <td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;" align=right><bean:message key="str1423"/></td>
            <td  style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left><%=position%>
            </td>
          </tr>
          <tr>
            <td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;" align=right><bean:message key="str1424"/></td>
            <td  style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left><%=age%>
            </td>
          </tr>
          <tr>
            <td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;" align=right><bean:message key="str1425"/></td>
            <td  style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left>
                <%
                    if(remark !=null && !remark.equals(""))
                    {
						if(sexList != null && sexList.size()>0)
						{
								out.print(sexList.get(remark));
						} 
					}%>
              
            </td>
          </tr>
          <tr>
            <td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;" align=right><bean:message key="str1426"/></td>
            <td  style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left>
                <%
                if(degree!=null && !degree.equals(""))
                {
					if(degreeList != null && degreeList.size()>0)
					{
						out.print(degreeList.get("degree"));
					} 
			   }
			  %>
            </td>
          </tr>
          <tr>
            <td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;" align=right><bean:message key="str1427"/></td>
            <td  style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left><%=job_age%>
            </td>
          </tr>
          <tr>
            <td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;" align=right><bean:message key="str1428"/></td>
            <td  style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left><%=grad_date%></td>
          </tr>
          <tr>
            <td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;" align=right  valign=top><bean:message key="str1429"/></td>
            <td  style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left><%=work_history%></td>
          </tr>
          <tr>
            <td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;" align=right valign=top><bean:message key="str1430"/></td>
            <td  style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left><%=spec%></td>
          </tr>
          <input name="trade_type_code" type="hidden" value="0341">
          <tr>
            <td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;" align=right><bean:message key="str1431"/></td>
            <td  style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left>
            	<%
            	     if(cert!=null && !cert.equals(""))
            	     {
						if(certList != null && certList.size()>0)
						{
							out.print(certList.get(cert));
						} 
				}
				%>
            </td>
          </tr>
          <!--tr>
            <td class="grayE" colspan=2 align="left"><INPUT name="advshow" type="checkbox" value="0" onclick="check_none(resumeForm)">       
              以上资料正确无误。
            <td>
          </tr-->
          <tr>
         
            <td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px; padding-top:10px;padding-bottom:10px;" colspan="2" align=center>
            	<input class="gban" name="submit1" type="button" value="" onclick="javascript:window.close()">
            </td>
          </tr>
        </form>
      </table></td>
  </tr>
  <tr>
    <td height="46" background="/img/bg-3.gif">&nbsp;</td>
  </tr>
</table>
</body>
</html>
