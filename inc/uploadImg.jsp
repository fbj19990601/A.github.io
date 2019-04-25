<%@ page contentType="text/html;charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ page import="java.util.*"%>
<jsp:useBean id="comm" class="com.saas.biz.attachMgr.Attachinfo" scope="page" />
<%
	String root_id = "", attach_id = "", file_path = "";
	if (request.getParameter("root_id") != null) {
		root_id = request.getParameter("root_id");
	}
	String display = "display:none";
	int cols=1;
%>
<html>
	<head>
		<title>upload</title>
		<link href="/style/layout.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="/js/prototype.js"></script>
		<script type="text/javascript">
		   function submitForm(){
		      document.getElementById("files").value=document.getElementById("file_dir").value;
		      document.forms[0].submit();
		   }
		  function checkImage() {
			var imag = document.getElementById('files').value;
			if (imag == null || imag == "") {
				alert("Please choose to upload the annex!");
				return false;
			} else {
				var pos = imag.lastIndexOf(".");
				var lastname = imag.substring(pos, imag.length)
				if (lastname.toLowerCase() == ".exe"
						|| lastname.toLowerCase() == ".bat"
						|| lastname.toLowerCase() == ".sh"
						|| lastname.toLowerCase() == ".so"
						|| lastname.toLowerCase() == ".dll") {
					alert("You upload the file type for the" + lastname + "£¬Annex is not the right type of format£¡");
					return false;
				}
			}
			 return true;
		}
		</script>
	</head>
	<body>
		<html:form action="/uploadFile.do" enctype="multipart/form-data" target="_self">
			<table width="100%" border=0 cellpadding=0 cellspacing=0 align=left bgcolor="#dddddd" height="170px">
				<tr id="img-div" style="display: block;">
				<td>
				 <table width="100%" border=0 cellpadding=0 cellspacing=0 align=left bgcolor="#dddddd" style="float: left;">
				   <tr>
					<%
						ArrayList list = comm.getAttachInfoByList(root_id);
						if (list != null && list.size() > 0) {
							display = "display:block";
							cols=list.size();
							for (int i = 0; i < list.size(); i++) {
								HashMap map = (HashMap) list.get(i);
								attach_id = map.get("attach_id").toString();
								file_path = "";
								if (map.get("file_path") != null) {
									file_path = map.get("file_path").toString();
 
								}
								%>
									<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=left> 
										<div style="width: 100px;height: 100px">
											<img src="<%=file_path%>" border=0 width="100" height="100">
											<br>
											<a href="/doTradeReg.do?trade_type_code=1157&attach_id=<%=attach_id%>" target="_self"><bean:message key="str2677"/></a>
										</div>
									</td>
								<%
						 }
					 }
					%>
					</tr>
					</table>
                </td>
				</tr>
				<tr>
					<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" colspan="<%=cols%>">
						<html:file property="files" />
						<html:errors property="files" />
						<input type="submit" value="Upload" onclick="return checkImage()">
						<input name="file_dir" type="hidden" id="file_dir" value="" />
						<input name="trade_type_code" type="hidden" value="1156" />
						<input name="filename" type="hidden" />
						<input name="attach_root_id" type="hidden" value="<%=root_id%>" />
						<input name="id" type="hidden" id="id" value="<%=root_id%>" />
						<input type="hidden" name="rsrv_str1" id="rsrv_str1" value="0">
						<input type="hidden" name="rsrv_str2" id="rsrv_str2" value="2">
					</td>
				</tr>
			</table>
		</html:form>
	</body>
</html>
