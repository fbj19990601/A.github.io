<%@ page contentType="text/html;charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page import="java.util.*"%>
<%
    ArrayList backq=new ArrayList();
    String efix= "";
    String filename= "";
    String bbs_type= "";
    String cust_id="";
    String user_id="";
	String root_id="";
    HttpSession tempsession=null;
    if(request.getSession(false)!=null) 
    {
      tempsession = request.getSession();
      cust_id =(String)tempsession.getAttribute("SESSION_CUST_ID");
      user_id =(String)tempsession.getAttribute("SESSION_USER_ID");
	  session.setAttribute("SESSION_USER_ID",user_id);
   }
   if(request.getParameter("root_id")!=null)
   {
	   root_id=request.getParameter("root_id");
   }
%>
 
<html>
    <head>  
        <title>upload</title>
		<style type="text/css" media="screen">
.line6 {width:72spx; width:70spx!important;border:#ffcb99 1px solid;  background-color:#fff8ee; text-align:left; padding-left: 20px;padding-top: 10px;padding-bottom: 10px; color:#000000; margin-top:13px; margin-bottom:13px;}   /*������ʽ6---- ͷ������1*/
.line6 .img{width:53px; height:53px; float:left; margin-right:20px;}
.line6 .title {font-size:14px; font-weight:bold; color:#ff5400;}
.line1 {border-left:#ff7300 3px solid; background-color:#e2e2e2; color:#333333;text-align:left; font-size:12px;}  /*������ʽ1*/
</style>
<link href="/crm/style/css.css" rel="stylesheet" type="text/css"> 
		<script language="javascript">
		function checkImage()
		{
			var imag = document.getElementById('files').value; 
			if(imag==null || imag=="")
			{
				alert("Please choose to upload the annex!");
				return false;
			}
			else
			{
				var pos = imag.lastIndexOf(".");
				 var lastname = imag.substring(pos,imag.length)  //�˴��ļ���׺��Ҳ�������鷽ʽ���str.split(".") 
				 if (lastname.toLowerCase()==".exe" || lastname.toLowerCase()==".bat" || lastname.toLowerCase()==".sh" || lastname.toLowerCase()==".so" || lastname.toLowerCase()==".dll")
				 {
					 alert("You upload the file type for the"+lastname+"��Annex is not the right type of format��");
					 return false;
				 }
			}
			return true;
		}
		</script>
</head>
<body topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0"> 
<table border="0" cellpadding="0" cellspacing="0" style="margin-left:15px; background-color:FFF9F3">
      <tr>
		<html:form action="/uploadFile.do" enctype="multipart/form-data">
		   <input name="SESSION_CUST_ID" type="hidden" value=<%=cust_id%> />
		   <input name="SESSION_USER_ID" type="hidden" value=<%=user_id%> />
		   <input name="attach_root_id" type="hidden" value="<%=root_id%>" />
		   <input name="trade_type_code" type="hidden" value="0300"/>
		   <input name="filename" type="hidden"/>
		   <input name="fileUrl" type="hidden" value=""/>
		   <input name="efixq" type="hidden" value=""/>
		   <input name="rsrv_str0" type="hidden" value=""/>
		   <input name="upfile" type="hidden" value="<%=filename%>"/>
		   <input name="user_id_now" type="hidden" value="<%=user_id%>"/>
		   <input name="file_type" type="hidden" value="0"/>
		  <td valign="bottom"><html:file property="files"/><html:errors property="files"/></td>
		  <td valign="bottom">&nbsp;<input type="submit" value="Upload Annex" onClick=" return checkImage()"></td>
		 </html:form>
		 </tr>
</table>
</body>
</html> 