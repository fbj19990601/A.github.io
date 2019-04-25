<%@ page contentType="text/html; charset=gb2312" language="java"
	import="java.sql.*,java.util.StringTokenizer" errorPage=""%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<title><bean:message key="str2930"/></title>
	</head>
	<body>
		<%
		String staff_id,start_date,end_date,rightsStr,menu_id,sql;
		
		       staff_id=request.getParameter("acceptMenName");
		       start_date=request.getParameter("startTime");
		       end_date=request.getParameter("endTime");
		       rightsStr=request.getParameter("options");
		       out.print(staff_id+"<br>");
		       out.print(start_date+"<br>");
		       out.print(end_date+"<br>");
		       out.print(rightsStr+"<br>");
			try {
				Class.forName("oracle.jdbc.driver.OracleDriver").newInstance();
				String url = "jdbc:oracle:thin:@192.168.10.202:1521:saas";
				String user = "dev";
				String password = "111111";
				Connection conn = DriverManager.getConnection(url, user,
				password);
				conn.setAutoCommit(true);
                Statement stmt=conn.createStatement();
                sql="delete from rightinfo where staff_id ='"+staff_id+"'";
                out.print(sql+"<br>");
                stmt.execute(sql);
                StringTokenizer tk=new StringTokenizer(rightsStr,";");
		         while(tk.hasMoreTokens()){
			        menu_id=tk.nextToken();
			        out.print("menu_id=="+menu_id+"<br>");
			        sql =" insert into rightinfo(STAFF_ID,MENU_ID,START_DATE,END_DATE,RIGHT_ATTR,IN_DATE) values('"+staff_id+"','"+
			               menu_id+"',TO_DATE('"+start_date+"','YYYY-MM-DD'),TO_DATE('"+end_date+"','YYYY-MM-DD'),'0',sysdate)";
				   out.print(sql+"<br>");
				   stmt.executeUpdate(sql);
				   out.print("操作完成!<br>");
		          }
				stmt.close();
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
				out.print("操作失败!<br>");
			}
		%>
		<table>
		<tr>
		<td><a href="deleteRights.jsp"><bean:message key="str2958"/></a></td>
		<td></td>
		<td><a href="default.jsp"><bean:message key="str3107"/></a></td>
		</tr>
		</table>
		<script language="JavaScript">
	    	alert("操作完成!");
		</script>
	</body>
</html>
