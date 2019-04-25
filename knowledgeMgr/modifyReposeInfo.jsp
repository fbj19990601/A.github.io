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
<%@ page import="com.saas.biz.repositoryMgr.RepositoryInfo"%>
<%@ page import="com.saas.biz.commen.commMethodMgr"%>

<%
     commMethodMgr commen = new commMethodMgr();
 	 String idx = commen.GenTradeId();
     String repository_id="";
     String title="",content="",repository_type="";
      if (request.getParameter("repository_id") != null)
      {
        repository_id = request.getParameter("repository_id");
        RepositoryInfo repository=new RepositoryInfo();
        ArrayList reposList=repository.getRepositoryIdx(repository_id);
        if(reposList != null && reposList.size()>0)
        {
           HashMap map=(HashMap)reposList.get(0);
           if(map.get("title") !=null)
           {
             title=map.get("title").toString();
           }
           if(map.get("content") !=null)
           {
             content=map.get("content").toString();
           }
		   if(map.get("repository_type") !=null)
           {
             repository_type=map.get("repository_type").toString();
		   }
        }
      }
	String fbtime=new SimpleDateFormat("yyyy-MM-dd").format(new Date());
     ParamethodMgr paramCom=new ParamethodMgr();
	repository_type=paramCom.getItemsBySelected("77",repository_type);
%>
<html>
<head>
<title><bean:message key = "str0987"/></title>
<link href="/style/css.css" rel="stylesheet" type="text/css">
<style type="text/css">
.line6 {width:72spx; width:70spx!important;border:#ffcb99 1px solid;  background-color:#fff8ee; text-align:left; padding-left: 20px;padding-top: 10px;padding-bottom: 10px; color:#000000; margin-top:13px; margin-bottom:13px;}   /*横栏样式6---- 头部提醒1*/
.line6 .img{width:53px; height:53px; float:left; margin-right:20px;}
.line6 .title {font-size:14px; font-weight:bold; color:#ff5400;}
.line1 {border-left:#ff7300 3px solid; background-color:#e2e2e2; color:#333333;text-align:left; font-size:13px; font-weight:bold; padding-left: 20px; padding-top: 5px;padding-bottom: 5px; }  /*横栏样式1*/
</style>
<script src="/www/fuction/calendar.js" type="text/javascript"></script>
<script language="JavaScript" src="/www/fuction/public.js"></script>
<script language="JavaScript">
    function Check_Value()
	{
	    if (document.reposForm.title.value.replace(/\s*/g,"") == "" || document.reposForm.title.value.replace(/\s*/g,"") == null) 
			{                                                                                         
				alert("标题不可以为空！");                                                             
				document.reposForm.title.focus();                                                    
				return false;                                                                            
			}  
			var str=content.getText();
			str=str.replace(/\s*/g,""); 
			if(str == ""  )
			{
				alert("知识内容不可以为空！");
				return false;
			}
			
			
			if( str.length > 4000)
			{
				 alert( "知识内容字数应少于4000字" );
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
   <SCRIPT>WinLIKEerrorpage='/winlike/winman/hlp-error.html';</SCRIPT>
		<SCRIPT SRC="/winlike/winman/wininit.js"></SCRIPT>
		<SCRIPT SRC="/winlike/winman/winman.js"></SCRIPT>
		<SCRIPT>
      WinLIKE.definewindows=mydefss;
      function mydefss() {
      	var j=new WinLIKE.window('', 100, 100, '90%', 'WinLIKE.browsersize().Height -Top-30', 2);
      	j.Vis=false;
      	j.Nam='appwin';
      	WinLIKE.addwindow(j);
      };
    </SCRIPT>  
</head>
	<link href="/style/layout.css" rel="stylesheet" type="text/css">
<body>
  <form name=reposForm action=/doTradeReg.do method=post>
<table width="818" border="0" cellspacing="0" cellpadding="0" align=center>
  <tr>
    <td height="26" >&nbsp;</td>
  </tr>
  <tr>
    <td>
	<table width=93% border=0 cellpadding=5 cellspacing=1 align=center  bgcolor="#dddddd">
          <input name="trade_type_code" type="hidden" value="0274">
          <tr>
		     <td class="line1" align="left" colspan="2"><bean:message key = "str2656"/></td>
	      </tr>
		  <tr>
            <td width="12%" align=right style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;"><bean:message key = "str2665"/></td>
            <td width="88%" align=left bgcolor="#FFFFFF">
						<div class="ping">
						<select name=repository_type>
                          <%=repository_type%>
                       </select>
				</div>
            </td>
          </tr>
          <tr>
            <td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right><bean:message key = "str2666"/></td>
            <td align=left bgcolor="#FFFFFF">
            	<div class="ping">
            	<input name="title" type="text" size=70 maxlength=70 value="<%=title%>">
            	</div>
            </td>
          </tr>
          <tr>
            <td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right><bean:message key = "str2664"/></td>
            <td align=left bgcolor="#FFFFFF">
			  <div class="ping">
			    <textarea name="content" style="display:none"><%=content%></textarea>
            <iframe ID=content src=/www/ewebeditor/ewebeditor.htm?id=content&style=coolblue&root_id=<%=repository_id%>  frameborder=0 scrolling=no width=600 HEIGHT=350></iframe>
			</div>
			</td>
          </tr>
          <tr style="display:none">
					 <td  style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
						   		<bean:message key = "str3937"/>
						   </td>
					       <td bgcolor="#FFFFFF">
					          <div class="ping1">
					            <input name="path" id="path" type="hidden" size=40 value="<%=idx%>">
					            <iframe id="saveImag" name="saveImag" style="margin-top:2px" frameborder="0" scrolling="no" hspace="0" WIDTH="330" HEIGHT="25" src="/inc/saveImage.jsp?root_id=<%=idx%>"></iframe>
					           </div>
					        </td>
					   </tr>
				    <input type="hidden"name="idx" value="<%=idx%>">
          <input name="repository_id" type="hidden" value=<%=repository_id%>>
          <input name="repository_class" type="hidden" value=0>
          <tr style="display:none">
            <td style="background-color:#ffffff; color:#000000;  font-size:12px;" colspan=2 align="center"><INPUT name="advshow" type="checkbox" value="0" onclick="check_none(reposForm)">
             <bean:message key = "str4308"/>
            </td>
          </tr>
          <tr>
            <td  style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px; padding-top:10px;padding-bottom:10px;" align="center" colspan=2>
            	<input class="xgan" name="submit1" type="button" onclick="confirmsub(reposForm)">
            </td>
          </tr>
      </table></td>
  </tr>
  <tr>
    <td height="46">&nbsp;</td>
  </tr>
</table>
 </form>
</body>
</html>

