<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"

"http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="com.saas.biz.commen.config"%>
<%@ page contentType="text/html;charset=GBK"%>
<html>
<head>
<title><bean:message key="str3813"/></title>
</head>

<body>
	<% 
		String logPath="",length="";
		if(request.getParameter("logPath")!=null){
			logPath = request.getParameter("logPath");
		}
		if(request.getParameter("length")!=null){
			length = request.getParameter("length");
		}   
		String str = "";
		for(int i=0;i<Integer.parseInt(length);i++){
			String name="",value="";
			if(request.getParameter("name"+String.valueOf(i))!=null){
				name = request.getParameter("name"+String.valueOf(i));
			}
			if(request.getParameter("value"+String.valueOf(i))!=null){
				value = new String(request.getParameter("value"+String.valueOf(i)).getBytes("ISO-8859-1"),"GBK");
			}
			str = str+name+"="+value+"\n";
		}
		boolean flag = (new File(logPath)).delete(); 
		File log_file = new File(logPath);
		FileOutputStream fos = new FileOutputStream(log_file);
		byte[] b = str.getBytes();
		fos.write(b);
		fos.close();
		
		if(flag==true){
	%>
		<script type="text/javascript">
			alert('�����ɹ�����ɾ�����ļ��У�����¼�����̨����ϵͳҳ�棡');
			window.location.href='/index.jsp';
		</script>
	<%
		}else{
	%>
		<script type="text/javascript">
			alert('����ʧ�ܣ�');
		</script>
	<%
		}    	
	%>

</body>
</html>