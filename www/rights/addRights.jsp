<%@ page contentType="text/html; charset=gb2312" language="java"
	import="java.sql.*, java.text.SimpleDateFormat, java.util.*,
 java.util.Date" import="com.saas.biz.mysite.*" errorPage=""%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<!--------------------------------------------------------------------
   当前页面JavaScript函数部分
---------------------------------------------------------------------->

	
<html>
<script language="javascript" src="Calendar.js"></script>
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


<!-- 分配权限操作 -->
function moveToRight(){
    var selectName,selectIdx,index;
    index=document.grantRights.rightsList.selectedIndex;
    if(index<0){
      alert("请选择要分配的权限项!");
    }else{
    selectName=document.grantRights.rightsList.options[index].text;
    selectIdx=document.grantRights.rightsList.value;
    
    <!--向分配权限列表中加入一项-->
    document.grantRights.leftList.options.add(new  Option(selectName,selectIdx));  
    
   <!--将分配过的权限项从已有权限列表中删除-->
   document.grantRights.rightsList.options.remove(index);
    }
}

<!--取消权限操作-->
function moveToLeft(){
  var selectName,selectIdx,index;
    index=document.grantRights.leftList.selectedIndex;
    if(index<0){
      alert("请选择要回收的权限项!");
    }else{
    selectName=document.grantRights.leftList.options[index].text;
    selectIdx=document.grantRights.leftList.value;
    
    <!--向已有权限列表中加入在分配权限项中删除的那一项-->
    document.grantRights.rightsList.options.add(new  Option(selectName,selectIdx));  
    
   <!--将分配过的权限项从分配权限列表中删除-->
   document.grantRights.leftList.options.remove(index);
    }
}

<!--保存权限信息-->
function saveRightsInfo(){
 var count,elemName,elemValue,acceptName,optionStr="";
 var bgtime,ovtime,aa,bb;
    
    aa=document.grantRights.startTime.value;
    bb=document.grantRights.endTime.value;
    bgtime=aa.split("-")[0]+aa.split("-")[1]+aa.split("-")[2];
    ovtime=bb.split("-")[0]+bb.split("-")[1]+bb.split("-")[2];
    
    acceptName=document.grantRights.acceptMenName.value;
    count=document.grantRights.leftList.options.length;
    
  <!--  判断开始时间是否小于结束时间-->
    if(bgtime>ovtime){
    alert("开始时间："+aa+" 不能大于结束时间："+bb);
    return false;
    }
    if(count>0){
      if(acceptName==null || acceptName.length<1){
          alert("请选择接受权限分配的人员!");
          return false;
          }else{
          for (var i=0;i<count;i++){
          optionStr+=document.grantRights.leftList.options[i].value+";";
          }
          document.grantRights.options.value=optionStr;
           return true;
           }
   }else{
      alert("请分配权限!");
      return false;
   }
   
}
<!--返回主页-->
function returnRightsInfo(){
 document.grantRights.action="default.jsp";
}

<!--取消权限信息-->
  function cancelRightsInfo(){
    window.location.reload();   
  }
</script>
<script language="javascript">
  var cdr = new Calendar("cdr");
  document.write(cdr);
  cdr.showMoreDay = true;
</script>
	<body>
	<div>
		<%
		String curr_UserName="";
		String end="";
		String start="";
		String custId="";
		String sql="";
		String curr_UserId="";
		HttpSession tempsession = request.getSession();
	    custId =(String)tempsession.getAttribute("SESSION_CUST_ID");
		curr_UserName=(String)tempsession.getAttribute("SESSION_USER_NAME");
		Calendar date = Calendar.getInstance();
		date.set(Calendar.MONTH,date.get(Calendar.MONTH)+3 );
		ResultSet rs =null;
        start =new SimpleDateFormat("yyyy-MM-dd").format(new Date()).toString();
	    end =new SimpleDateFormat("yyyy-MM-dd").format(date.getTime()).toString();
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
					<form action="saveOrCancelInfo.jsp" method="get" name="grantRights">
					<table width="100" bgcolor="#9999CC">
					<tr>
					<td nowrap align="center"><bean:message key="str2975"/>权限管理</td>
					<td nowrap align="center"><bean:message key="str2976"/>权限操作</td>
					<td nowrap align="center"><bean:message key="str2977"/>分配权限</td>
					<td nowrap align="center"><bean:message key="str2978"/>人员列表</td>
					<td nowrap align="center"><bean:message key="str2979"/>授权人</td>
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
					  <input name="moveToR" type="button" value="  &gt;&gt;  "align="middle" onClick="moveToRight()">
					  <p>
					  <br>
					  <input name="moveToL" type="button" value="  &lt;&lt;  "align="middle" onClick="moveToLeft()">				
					 </td>
					 <td width="25" align="left">
					  <select name="leftList" size="15"  >
					  </select>
					 </td>
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
						<td align="left"><bean:message key="str2980"/>请从人员列表中选择要分配权限的人员姓名!
						    <input name="acceptMenName" type="text"> 
						    <input name="acceptMenId" type="text" >
						    <input name="options" type="hidden">  
						   <br>
						   开始时间<bean:message key="str3346"/>
						    <input name="startTime" type="text" value="<%=start %>"> 
						     <br> 
						   结束时间<bean:message key="str3347"/>
						   <input name="endTime" type="text"value="<%=end %>">
						</td>
					</tr>
					<tr align="center">
					<td align="center"><input name="saveRights" type="submit" value=" 保存 " onClick="return saveRightsInfo()"></td>
					<td align="center"><input name="resetRights" type="button" value=" 取消 " onClick="cancelRightsInfo()"></td>
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
