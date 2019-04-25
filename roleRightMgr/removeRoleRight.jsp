<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"


"http://www.w3.org/TR/html4/loose.dtd">


<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>


<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>


<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>


<%@ page import="java.util.*"%>


<%@ page contentType="text/html;charset=GBK"%>


<%@ page import="java.text.SimpleDateFormat"%>


<jsp:useBean id="role" class="com.saas.biz.roleMgr.RoleInfo" scope="page" />


<%


	String cust_id="";


	Calendar cal = Calendar.getInstance();


    String start_Date = new SimpleDateFormat("yyyy-MM-dd").format(cal.getTime());


    cal.add(Calendar.MONTH, 3);


    String end_Date = new SimpleDateFormat("yyyy-MM-dd").format(cal.getTime());


    HttpSession sess=request.getSession();


    if(sess.getAttribute("SESSION_CUST_ID")!=null){


      cust_id=(String)sess.getAttribute("SESSION_CUST_ID");


    }


    ArrayList roleList=role.getRoleInfoByCustId(cust_id);


%>


<html>


	<head>


		<title><bean:message key="str3371"/></title>


		<link href="/style/layout.css" rel="stylesheet" type="text/css">





<script language="javascript" src="/js/Calendar_Ly.js"></script>


<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/RightMenu.js'></script> 


<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/engine.js'></script>  


<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/util.js'></script> 


<script language="JavaScript">


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


    	      checkIsDelete();


    	    }


    	    else


    	    {


    	        return;


    	    }


    	}


 function initMenu(role){


   if(role!="0"){


    var cust=document.getElementById("cust_id").value;


    RightMenu.getRoleByCodeAndClass("CRM","1",role,cust,setMenu1Info);


   }else{


    var cust=document.getElementById("menu_id").value="";


    DWRUtil.removeAllOptions("sort1");


    document.getElementById("sort2").style.display="none";


    document.getElementById("sort3").style.display="none";


   }


 }


 function setMenu1Info(data){


   DWRUtil.removeAllOptions("sort1");


   DWRUtil.addOptions("sort1",data);


 }


 function setMenu2Info(id){


   if(id !="0"){


      document.getElementById("menu_id").value=id;


      var cust=document.getElementById("cust_id").value;


      var role=document.getElementById("role_code").value;


      RightMenu.getRoleByUpmenId("CRM",id,cust,role,initMenu2);


   }


 }


function initMenu2(data){


   document.getElementById("sort2").style.display="block";


   DWRUtil.removeAllOptions("sort2");


   DWRUtil.addOptions("sort2",data);


   document.getElementById("sort3").style.display="none";


 } 


 function setMenu3Info(id){


   document.getElementById("menu_id").value=id;


   if(id !=""){


      var cust=document.getElementById("cust_id").value;


      var role=document.getElementById("role_code").value;


      RightMenu.getRoleByUpmenId("CRM",id,cust,role,initMenu3);


   }


 }


function initMenu3(data){


   document.getElementById("sort3").style.display="block";


   DWRUtil.removeAllOptions("sort3");


   DWRUtil.addOptions("sort3",data);


    var item=document.getElementById("sort3").length;


    if(item==0)


    {


    	document.getElementById("sort3").style.display="none"; 


    }


     else


   	{


   		document.getElementById("sort3").style.display="block";


   	}


 } 


 function setMenuID(id){


     document.getElementById("menu_id").value=id;


 }


 function checkIsDelete(){


   var id=document.getElementById("menu_id").value;


   if(id !=""){


      var cust=document.getElementById("cust_id").value;


      var role=document.getElementById("role_code").value;


      RightMenu.getRoleByUpmenId("CRM",id,cust,role,Check_Value);


   }else{


       alert("请选择要回收的权限菜单！");


       return false;


   }


 }


    function Check_Value(data)


	{


	    for(var obj in data){


	     alert("请先回收下级权限菜单！");


	     return ;


	    }


	    document.resumeForm.submit();


	}


</script>


	</head>


	<body>


		<form name=resumeForm action=/doTradeReg.do method=post


			target="_blank">


			<table width="100%" border="0" cellspacing="0" cellpadding="0">


				<tr>


					<td height="2"></td>


				</tr>


				<tr>


					<td valign="top">


						<table width=100% border=0 cellpadding=5 cellspacing=1 align=center


							bgcolor="#dddddd">


							<tr>


								<td


									style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;"


									align=right width=15%>


									<bean:message key="str349"/></td>


								<td width=85% align=left bgcolor="#FFFFFF">

<div class="ping">
									<select name="role_code" id="role_code" onclick="initMenu(this.value);">


									<option value="0"><bean:message key="str1079"/></option>


                                   <%


                                     if(roleList!=null && roleList.size()>0){


                                       for(int i=0;i<roleList.size();i++){


                                         HashMap map=(HashMap)roleList.get(i);


                                         String id=map.get("role_code").toString();


                                         String name=map.get("role_name").toString();


                                         %>


                                         <option value="<%=id%>"><%=name%></option>


                                         <%


                                       }


                                     }


                                   %>


                                   </select>

</div>
							  </td>


							</tr>


							<tr>


								<td


									style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;"


									align=right>


									<bean:message key="str2900"/>


								</td>


								<td align=left bgcolor="#FFFFFF">

<div class="ping">
                                   <select name="sort1" id="sort1" size="10" style="width: 110px;float: left" onclick="setMenu2Info(this.value);"><option value="0"><bean:message key="str3373"/></option></select>


                                   <select name="sort2" id="sort2" size="10" style="display:none;width: 110px;float: left" onclick="setMenu3Info(this.value);"></select>


                                   <select name="sort3" id="sort3" size="10" style="display:none;width: 110px;float: left" onclick="setMenuID(this.value);"></select>
</div>

							  </td>


							</tr>


							<input name="trade_type_code" type="hidden" value="1039"/>


							<input name="menu_id" id="menu_id" type="hidden" value=""/>


							<input name="cust_id" id="cust_id" type="hidden" value="<%=cust_id%>"/>


							<tr>


								<td


									style="background-color:#ffffff; color:#000000;  font-size:12px;"


									colspan=2 align="center">


									<INPUT name="advshow" type="checkbox" value="0"


										onclick="check_none(resumeForm)">


									<bean:message key="str3374"/>


								</td>


							</tr>


							<tr>


								<td


									style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;padding-top:10px;padding-bottom:10px;"


									align="center" colspan=2>


									<input class="hsan" name="submit1" type="button" value="" disabled="true" onclick="confirmsub(resumeForm)">


								</td>


							</tr>


					  </table>


					</td>


				</tr>


				<tr>


					<td height="13"></td>


				</tr>


			</table>


		</form>


	</body>


</html>


