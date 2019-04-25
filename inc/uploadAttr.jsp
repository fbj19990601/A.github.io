<%@ page contentType="text/html;charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ page import="java.util.*"%>
<jsp:useBean id="comm" class="com.saas.biz.attachMgr.Attachinfo" scope="page" />
<%
	String root_id = "";
	if (request.getParameter("idx") != null) {
		root_id = request.getParameter("idx");
	}
   ArrayList list = comm.getAttachInfoByList(root_id);
%>
<html>
	<head>
		<title>upload</title>
		<link href="/style/layout.css" rel="stylesheet" type="text/css">
		<link rel="stylesheet" type="text/css" href="../ext/resources/css/ext-all.css" />
		<script type="text/javascript" src="../ext/adapter/ext/ext-base.js"></script>
		<script type="text/javascript" src="../ext/ext-all.js"></script>
		<script type="text/javascript" src="../ext/build/locale/ext-lang-zh_CN.js"></script>
		<script type="text/javascript" src="/inc/prototype.js"></script>
		<script type="text/javascript" src="/inc/upLoad.js"></script>
		<script type="text/javascript">
		   function submitForm(){
		      document.getElementById("files").value=document.getElementById("file_dir").value;
		      document.forms[0].submit();
		   }
		   function show(){
		     var id=document.getElementById('id').value;
		     showUpLoadFile(id);
		   }
		</script>
	</head>
	<body>
		<html:form action="/uploadFile.do" enctype="multipart/form-data" target="_self">
		<table width=100% border=0 cellpadding=5 cellspacing=1 align=center bgcolor="#dddddd">
		   <tr>
				<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;padding-top:10px;padding-bottom:10px;height: 25px" align="center" height="25px">
				<input name="file_dir" type="hidden" id="file_dir" value="" />
				<input name="trade_type_code" type="hidden" value="1156" />
				<input name="filename" type="hidden" />
				<bean:message key="str2519"/>
				</td>
			</tr>
			<tr>
				<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=left width="100%" height="25px">
					<html:file property="files" />
					<html:errors property="files" />
					<input type="submit" value="Upload" onclick="return checkImage()">
			
				</td>
				<input name="attach_root_id" type="hidden" value="<%=root_id%>" />
				<input name="id" type="hidden" id="id" value="<%=root_id%>" />
				<input type="hidden" name="rsrv_str1" id="rsrv_str1">
			</tr>
			<tr>
				<td  style="background-color:#f6f6f6; color:#000000;" align=left height="25px">
					<%
                    if(list !=null && list.size()>0){
                      for(int i=0;i<list.size();i++){
                        HashMap map=(HashMap)list.get(i);
                        String attach_id=map.get("attach_id").toString();
                        String attach_name="",file_path="";
                        if(map.get("attach_name")!=null){
                          attach_name=map.get("attach_name").toString();
                        }
                        if(map.get("file_path")!=null){
                          file_path=map.get("file_path").toString();
                          //file_path=file_path.substring(23);
                        }
                       %>
                       <a href="<%=file_path%>" target="_blank"><img src=/img/attach.gif  border=0 style="cursor: hand" alt="Download Annex"></a>&nbsp;&nbsp;<a href="/doTradeReg.do?trade_type_code=1157&attach_id=<%=attach_id%>" target="_self"><bean:message key="str2677"/></a>&nbsp;&nbsp;
                       <%
                       if(i%2==0){
                        out.print("<br>");
                       }
                      }
                    }
                  %>
				</td>
			</tr>
		</table>
		</html:form>
	</body>
</html>
