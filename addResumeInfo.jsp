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
<jsp:useBean id="bean" class="com.saas.biz.commen.commMethodMgr" scope="page"/>
<%
    String resume_id=bean.GenShortTradeId();
    String fbtime=new SimpleDateFormat("yyyy-MM-dd").format(new Date());
    HttpSession  logsession = request.getSession(); 
     String userName="";
     if (logsession.getAttribute("SESSION_USER_NAME") != null)
     {
        userName = logsession.getAttribute("SESSION_USER_NAME").toString();
     }
     ParamethodMgr paramCom=new ParamethodMgr();
	ArrayList  degreeList =paramCom.getCompareInfo("CRM","degree");
	ArrayList  sexList =paramCom.getCompareInfo("CRM","sex");
	ArrayList  certList =paramCom.getCompareInfo("CRM","cert");
%>
<html>
<head>
<title>B2B EC-platform</title>
<link href="/style/layout.css" rel="stylesheet" type="text/css">

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
  <tr>
    <td height="2"></td>
  </tr>
  <tr>
    <td><table width=100% border=0 cellpadding=5 cellspacing=1 align=center bgcolor="#dddddd">
        <form name=resumeForm action=/doTradeReg.do method=post  target="_blank">
          <tr>
            <td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;" align=right>姓名<input name="resume_id" type="hidden" value=<%=resume_id%>></td>
            <td style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left><input name="name" type="text" size=30 maxlength=30 value="<%=userName%>" readonly>
            </td>
          </tr>
          <tr>
            <td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;" align=right>毕业学校</td>
            <td style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left><input name="grad_from" type="text" size=50 maxlength=50 class="ping">
            </td>
          </tr>
          <tr>
            <td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;" align=right>专业</td>
            <td style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left><input name="profession" type="text" size=50 maxlength=50 class="ping">
            </td>
          </tr>
          <tr>
            <td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;" align=right>期望薪资</td>
            <td style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left><input name="wish" type="text" size=5 maxlength=10 class="ping">
            </td>
          </tr>
          <tr>
            <td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;" align=right>出生年月</td>
            <td style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left><input name="born_date" id="born_date" readonly type="text" size=10  onfocus="setday(this);"  style="width:93px" class="ping">(yyyy-mm-dd)</td>
          </tr>
          <tr>
            <td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;" align=right>籍贯</td>
            <td style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left><input name="born_site" type="text" size=25 maxlength=50 class="ping">
            </td>
          </tr>
          <tr>
            <td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;" align=right>联系电话</td>
            <td style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left><input name="phone" type="text" size=15 maxlength=15 class="ping">
            </td>
          </tr>
          <tr>
            <td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;" align=right>电子邮件</td>
            <td style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left><input name="email" type="text" size=30 maxlength=50 class="ping">
            </td>
          </tr>
          <tr>
            <td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;" align=right>固定电话</td>
            <td style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left><input name="tel" type="text" size=15 maxlength=15 class="ping">
            </td>
          </tr>
          <tr>
            <td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;" align=right>联系地址</td>
            <td style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left><input name="addr" type="text" size=50 maxlength=50 class="ping">
            </td>
          </tr>
          <tr>
            <td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;" align=right>求职职位</td>
            <td style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left><input name="position" type="text" size=50 maxlength=50 class="ping">
            </td>
          </tr>
          <tr>
            <td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;" align=right>年龄</td>
            <td style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left><input name="age" type="text" size=4 maxlength=4 class="ping">岁
            </td>
          </tr>
          <tr>
            <td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;" align=right>性别：</td>
            <td style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left><select name=remark>
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
            <td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;" align=right>学历</td>
            <td style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left><select name=degree>
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
            <td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;" align=right>工作年限</td>
            <td style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left><input name="job_age" type="text" size=4 maxlength=4>
            </td>
          </tr>
          <tr>
            <td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;" align=right>毕业年份</td>
            <td style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left><input name="grad_date" id="grad_date" readonly type="text" size=10  onfocus="setday(this);"  style="width:93px">(yyyy-mm-dd)</td>
          </tr>
          <tr>
            <td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;" align=right  valign=top>工作经历</td>
            <td style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left><textarea name="work_history" style=display:none></textarea>
              <iframe ID=work_history src=/www/ewebeditor/ewebeditor.htm?id=work_history&style=coolblue&root_id=<%=resume_id%> frameborder=0 scrolling=no width=600 HEIGHT=350></iframe></td>
          </tr>
          <tr>
            <td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;" align=right  valign=top>特殊技能</td>
            <td style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left><textarea name="spec" style=display:none></textarea>
              <iframe ID=spec src=/www/ewebeditor/ewebeditor.htm?id=spec&style=coolblue&root_id=<%=resume_id%> frameborder=0 scrolling=no width=600 HEIGHT=350></iframe></td>
          </tr>
          <input name="trade_type_code" type="hidden" value="0260">
          <tr>
            <td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;"  align=right>所获证书</td>
            <td style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left><select name="cert" >
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
            <td style="background-color:#ffffff; color:#000000;  font-size:12px;" colspan=2 align="center"><INPUT name="advshow" type="checkbox" value="0" onclick="check_none(resumeForm)">       
              以上资料正确无误。
            </td>
          </tr>
          <tr>
            <td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;padding-top:10px;padding-bottom:10px;"  colspan=2  align=center><input  
			class ="tjan" name="submit1" type="button" value="提交" disabled="true" onclick="confirmsub(resumeForm)">
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
