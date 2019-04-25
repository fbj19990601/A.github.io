<%@ page contentType="text/html; charset=gb2312" language="java"
	import="java.sql.*, java.text.SimpleDateFormat, java.util.*,
 java.util.Date" import="com.saas.biz.mysite.*" errorPage=""%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<!--------------------------------------------------------------------
   当前页面JavaScript函数部分
---------------------------------------------------------------------->

	
<html>
<!--选择授权人员操作-->
<script language="JavaScript">

function selectEmp()
	{
	var userName,userIdx,index;
	index=document.grantRights.userList.selectedIndex;
	userName=document.grantRights.userList.options[index].text;
	userIdx=document.grantRights.userList.value;
	document.grantRights.acceptMenName.value=userName;
	document.grantRights.acceptMenId.value=userIdx;
	}
	
<!--保存权限信息-->
function saveRightsInfo(){
    var userName;
	userName=document.grantRights.acceptMenName.value;
      if(userName==null || userName.length<1){
           alert("请选择要回收权限的人员!");
           return false;
       }else{
           return true;
       }
       return true;
}


<!--取消权限信息-->
  function cancelRightsInfo(){
    window.location.reload();   
  }
</script>
	<body>
	<div>
		<%
		String curr_UserName="";
		String custId="";
		String sql="";
		String curr_UserId="";
		HttpSession tempsession = request.getSession();
	    curr_UserId =(String)tempsession.getAttribute("SESSION_USER_ID");
		curr_UserName=(String)tempsession.getAttribute("SESSION_USER_NAME");
		custId=(String)tempsession.getAttribute("SESSION_CUST_ID");
		ResultSet rs=null;
		%>
		<%
			try {
				    Class.forName("oracle.jdbc.driver.OracleDriver").newInstance();
					String url = "jdbc:oracle:thin:@192.168.10.202:1521:saas";
					String user = "dev";
					String password = "111111";
					Connection conn = DriverManager.getConnection(url, user,password);
					Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
					sql="select t.cust_id from tf_f_user t where t.user_id='"+curr_UserId+"'";
					rs = stmt.executeQuery(sql);
					while(rs.next()){
					custId=rs.getString(1);
					}
					sql = "select t.menu_name,t.menu_id from menuinfo t where t.menu_id in( select f.menu_id from rightinfo f where f.end_date>=sysdate and f.staff_id= '"+curr_UserName+"')";
					rs = stmt.executeQuery(sql);
					%>
					<form action="updateRights.jsp" method="get" name="grantRights">
					<table width="100" bgcolor="#9999CC">
					<tr>
					<td nowrap align="center"><bean:message key="str2975"/>权限管理</td>
					<td nowrap align="center"><bean:message key="str2954"/>人员列表</td>
					<td nowrap align="center"></td>
					</tr>
					<tr align="center">
					<td>
					  <select name="rightsList" size="15" multiple>
					  <% while (rs.next()) {%>
					     <option  value=<%=rs.getString(2) %>><%=rs.getString(1)%></option>
					  <%
					      }
					  %>
					</select></td>
						<td align="center">
					<select name="userList" size="15" onChange="selectEmp()">
					    <%
					   sql = "select t.user_id,t.user_name from tf_f_user t where t.user_name <>'"+curr_UserName+"' and t.cust_id='"+custId+"'";
					   rs = stmt.executeQuery(sql);
					  while (rs.next()) {%>
					     <option  value=<%=rs.getString(1)%>><%=rs.getString(2)%></option>
					  <%
					      }
					  %>
					  </select></td>
						
					</tr>
					<tr align="center">
					<td align="center"><input name="saveRights" type="submit" value=" 确定 " onClick="return saveRightsInfo()"></td>
					<td align="center"><input name="resetRights" type="button" value=" 刷新 " onClick="cancelRightsInfo()">
					<input name="acceptMenName" type="hidden"> 
					<input name="acceptMenId" type="hidden"></td>
					</tr>
                  </table>
                  </form>
					<%
					rs.close();
					stmt.close();
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		%>			
	</div>
	</body>
</html>
