<%@ page contentType="text/html; charset=gb2312" language="java"
	import="java.sql.*, java.text.SimpleDateFormat, java.util.*,
 java.util.Date" import="com.saas.biz.mysite.*" errorPage=""%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<!--------------------------------------------------------------------
   ��ǰҳ��JavaScript��������
---------------------------------------------------------------------->

	
<html>
<script language="javascript" src="Calendar.js"></script>
<!--ѡ����Ȩ��Ա����-->
<script language="JavaScript">
 
<!-- ����Ȩ�޲��� -->
function moveToRight(){
    var flag=false;
    var selectName,selectIdx,index,count,addName="";
    index=document.grantRights.rightsList.selectedIndex;
    count=document.grantRights.leftList.options.length;
    if(index<0){
      alert("��ѡ��Ҫ�����Ȩ����!");
    }else{
    selectName=document.grantRights.rightsList.options[index].text;
    selectIdx=document.grantRights.rightsList.value;
    
    <!--�����Ȩ���б��м���һ��-->
    if(count>0){
       for(var i=0;i<count;i++){
          addName=document.grantRights.leftList.options[i].text;
          addName=addName.replace(/(^\s+)|\s+$/g,"") ;
          selectName=selectName.replace(/(^\s+)|\s+$/g,"") ;
          if(addName==selectName){
             flag=false;
            }else{
            flag=true;
            }
          }
            if(flag){
              document.grantRights.leftList.options.add(new  Option(selectName,selectIdx));
            }
         }else{
           document.grantRights.leftList.options.add(new  Option(selectName,selectIdx));
     }
    
   <!--���������Ȩ���������Ȩ���б���ɾ��-->
   document.grantRights.rightsList.options.remove(index);
    }
}

<!--ȡ��Ȩ�޲���-->
function moveToLeft(){
  var selectName,selectIdx,index,count,addName="";
  var flag=false;
    index=document.grantRights.leftList.selectedIndex;
    count=document.grantRights.rightsList.options.length;
    if(index<0){
      alert("��ѡ��Ҫ���յ�Ȩ����!");
    }else{
    selectName=document.grantRights.leftList.options[index].text;
    selectIdx=document.grantRights.leftList.value;
    
    <!--������Ȩ���б��м����ڷ���Ȩ������ɾ������һ��-->
    if(count>0){
       for(var i=0;i<count;i++){
          addName=document.grantRights.rightsList.options[i].text;
          addName=addName.replace(/(^\s+)|\s+$/g,"") ;
          selectName=selectName.replace(/(^\s+)|\s+$/g,"") ;
          if(addName==selectName){
             flag=false;
            }else{
            flag=true;
            }
          }
            if(flag){
             document.grantRights.rightsList.options.add(new  Option(selectName,selectIdx));
            }
         }else{
          document.grantRights.rightsList.options.add(new  Option(selectName,selectIdx));
     }
    
   <!--���������Ȩ����ӷ���Ȩ���б���ɾ��-->
   document.grantRights.leftList.options.remove(index);
    }
}

<!--����Ȩ����Ϣ-->
function saveRightsInfo(){
 var count,elemName,elemValue,acceptName,optionStr="";
 
  var bgtime,ovtime,aa,bb;
    
    aa=document.grantRights.startTime.value;
    bb=document.grantRights.endTime.value;
    bgtime=aa.split("-")[0]+aa.split("-")[1]+aa.split("-")[2];
    ovtime=bb.split("-")[0]+bb.split("-")[1]+bb.split("-")[2];
    
    acceptName=document.grantRights.acceptMenName.value;
    count=document.grantRights.leftList.options.length;
    
  <!--  �жϿ�ʼʱ���Ƿ�С�ڽ���ʱ��-->
    if(bgtime>ovtime){
    alert("��ʼʱ�䣺"+aa+" ���ܴ��ڽ���ʱ�䣺"+bb);
    return false;
    }
 
   if(count>0){
      if(acceptName==null || acceptName.length<1){
          alert("��ѡ�����Ȩ�޷������Ա!");
          return false;
          }else{
          for (var i=0;i<count;i++){
          optionStr+=document.grantRights.leftList.options[i].value+";";
          }
          document.grantRights.options.value=optionStr;
           return true;
           }
   }else{
      return true;
   }
}

<!--������ҳ-->
function returnRightsInfo(){
 document.grantRights.action="default.jsp";
}

<!--ȡ��Ȩ����Ϣ-->
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
		String curr_UserName,end,start,acceptMan,sql,acceptId;
		Calendar date_Time = Calendar.getInstance();
		date_Time.set(Calendar.MONTH,date_Time.get(Calendar.MONTH)+3 );
		HttpSession tempsession = request.getSession();
		curr_UserName=(String)tempsession.getAttribute("SESSION_USER_NAME");
		acceptMan=request.getParameter("acceptMenName");
		acceptId=request.getParameter("acceptMenId");
        start =new SimpleDateFormat("yyyy-MM-dd").format(new Date()).toString();
	    end =new SimpleDateFormat("yyyy-MM-dd").format(date_Time.getTime()).toString();
		%>
		<%
			try {
				    Class.forName("oracle.jdbc.driver.OracleDriver").newInstance();
					String url = "jdbc:oracle:thin:@192.168.10.202:1521:saas";
					String user = "dev";
					String password = "111111";
					Connection conn = DriverManager.getConnection(url, user,password);
					Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
					sql = "select t.menu_name,t.menu_id from menuinfo t where t.menu_id in( select f.menu_id from rightinfo f where f.end_date>=sysdate and f.staff_id= '"+curr_UserName+"')";
					ResultSet rs = stmt.executeQuery(sql);
					%>
					<form action="saveOrUpdateRights.jsp" method="get" name="grantRights">
					<table width="100" bgcolor="#9999CC">
					<tr>
					<td nowrap align="center"><bean:message key="str2975"/></td>
					<td nowrap align="center"><bean:message key="str2976"/></td>
					<td nowrap align="center"><bean:message key="str5133"/></td>
					<td nowrap align="center"><bean:message key="str2979"/></td>
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
					 <%
					  sql="select t.menu_id,t.menu_name  from menuinfo t where t.menu_id in(select f.menu_id from rightinfo f where f.end_date >= sysdate and f.staff_id='"+acceptMan+"')";
					  ResultSet rst = stmt.executeQuery(sql);%>
					  <select name="leftList" size="15">
					  <%
					  while(rst.next()){
					  %>
					  <option value=<%=rst.getString(1)%>><%=rst.getString(2)%></option>
					  <%}%>
					  </select>
					 </td>
						<td align="left"><bean:message key="str3799"/>
						    <input name="acceptMenName" type="text" value="<%=acceptMan%>"> 
						    UserId
						    <input name="acceptMenId" type="text"  value="<%=acceptId%>" >
						    <input name="options" type="hidden">  
						   <br>
						   <bean:message key="str3346"/>
						    <input name="startTime" type="text" value="<%=start %>"> 
						     <br> 
						   <bean:message key="str3347"/>
						   <input name="endTime" type="text" value="<%=end %>">
						</td>
					</tr>
					<tr align="center">
					<td align="center"><input name="saveRights" type="submit" value=" ���� " onClick="return saveRightsInfo()"></td>
					<td align="center"><input name="resetRights" type="button" value=" ȡ�� " onClick="cancelRightsInfo()"></td>
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
