<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.Date"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.saas.biz.commen.ParamethodMgr"%>
<jsp:useBean id="bean" class="com.saas.biz.commen.commMethodMgr" scope="page"/>
<%
     String job_id=bean.GenShortTradeId();
     ParamethodMgr paramCom=new ParamethodMgr();
	ArrayList  jobTypeList =paramCom.getCompareInfo("CRM","job_type");
%>
<script language="JavaScript" src="www/fuction/public.js"></script>
<script language="JavaScript">
    function Check_Value()
	{
		if (cTrim(document.resumeForm.job_type.value,0) == "" || document.resumeForm.job_type.value == null)
		{                                                                                         
			alert("职位类型不可以为空！");                                                             
			document.resumeForm.job_type.focus();                                                    
			return false;                                                                            
		}    
                                                                               
	//	if (cTrim(document.resumeForm.title.value,0) == "" || document.resumeForm.title.value == null) 
	//	{                                                                                         
	//		alert("职位不可以为空！");                                                             
	//		document.resumeForm.title.focus();                                                    
	//		return false;                                                                            
	//	}                                                                                      
		if (request.getText()=="" || document.resumeForm.request.value == null)  
		{                                                                                        
			alert("招聘要求不可以为空！");                                                             
			document.resumeForm.request.focus();                                                    
			return false;                                                                            
		}                                                                                       
		if (cTrim(document.resumeForm.job_addr.value,0) == "" || document.resumeForm.job_addr.value == null)
		{                                                                                         
			alert("工作地址不可以为空！");                                                             
			document.resumeForm.job_addr.focus();                                                    
			return false;                                                                            
		}                                                                                      
		 return true;
   }
   
   
   
   
 function checkstr(str,digit){
	var n=0;
	for(i=0;i<str.length;i++){
		var leg=str.charCodeAt(i);
		if(leg>255){
		   	n+=2;
		}else {
			n+=1;
		}
	}
	if (n>digit){
		return true;
	}else {
		return false;
	}	 	 
}	
function checkuserinfo(){
	var name=resumeForm.title.value;
	if(name==""){
		alert("标题不能为空");
		resumeForm.title.focus();
		return;
	}else{
		if(checkstr(name,30)){
			alert("标题长度不能超过20个字符，请重新输入！");
			resumeForm.title.focus();
			return;
		}
	}
	resumeForm.submit();
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
</script>
<html>
<head>
<title>BtoB Platform 1.0</title>
<script src="/www/fuction/calendar.js" type="text/javascript"></script>
</head>
<body>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="13"></td>
  </tr>
  <tr>
    <td><table width=100% border=0 cellpadding=5 cellspacing=1 align=center  bgcolor="#dddddd">
       <form name=resumeForm action=/doTradeReg.do method=post target="_self">
          <tr>
            <td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;"  align=right><bean:message key="str743"/>
        	   <input name="job_id" type="hidden" value="<%=job_id%>"></td>
            <td style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left><select name=job_type>
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
            <td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;"  align=right><bean:message key="str740"/></td>
            <td style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left>
            	<div class="ping">
            	<input name="title" type="text" size=30 maxlength=30 onClick="checkuserinfo()"><bean:message key="str741"/>
            	</div>
            </td>
          </tr>
          <tr>
            <td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;"  align=right  valign=top><bean:message key="str742"/></td>
            <td style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left>
            	<div class="ping">
            	<textarea name="request" style=display:none></textarea>
              <iframe ID=request src=/www/ewebeditor/ewebeditor.htm?id=request&style=coolblue&root_id=<%=job_id%> frameborder=0 scrolling=no width=600 HEIGHT=350></iframe>
            </div>
              </td>
          </tr>
          <tr>
            <td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;"  align=right><bean:message key="str739"/></td>
            <td style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left>
            	<div class="ping">
            	<input name="job_addr" type="text" size=50 maxlength=50>
						</div>
            </td>
          </tr>
          <tr>
            <td  style="background-color:#ffffff; color:#000000;  font-size:12px;"  colspan=2  align=center><INPUT name="advshow" type="checkbox" value="0" onclick="check_none(resumeForm)">
             &nbsp; <bean:message key="str744"/>
            </td>
          </tr>
          <tr>
            <td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;padding-top:10px;padding-bottom:10px;" align=center  colspan=2><input class="tjan" name="submit1" type="button" value="" disabled="true" onclick="confirmsub(resumeForm)">
            </td>
          </tr>
		   <input  name="trade_type_code" type="hidden" value="1600">
          </form>
      </table></td>
  </tr>
  <tr>
    <td height="13"></td>
  </tr>
</table>
</body>
</html>

