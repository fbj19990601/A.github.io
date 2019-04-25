<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="com.saas.biz.custMgr.Custinfo"%>
<%@ page import="com.saas.biz.actionMgr.ActionMgr"%>
<%@ page import="com.saas.biz.relationUuMgr.RelationUUInfo"%>
<jsp:useBean id="bean" class="com.saas.biz.commen.ParamethodMgr" scope="page" />
<%@ page contentType="text/html;charset=GBK"%>

<html>
<head>
<title><bean:message key="str116"/></title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
-->
</style>
<link href="/css/tablecss.css" rel="stylesheet" type="text/css" />
</head>
<body>
<!--选项开始-->
<!--一、JavaScript部分-->
<SCRIPT>
		var aId=1;//当前
		function clickT(obj,sId){
			if(obj.className=="loginButton"){
				obj.className="loginCurrent";
				document.getElementById("item"+aId).className="loginButton";
				document.getElementById("chag"+aId).style.display="none";
				document.getElementById("chag"+sId).style.display="block";
				aId=sId;
			}
		}
	</SCRIPT>
	<!--HTML部分-->
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="655"><table width="440" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="2"><img src="/images/ti_03.gif" width="2" height="33"></td>
        <td align="center" background="/images/ti_04.gif" class="loginCurrent" id="item1" onmouseover="clickT(this,1)" style="padding-top:2"><span class="biaoti"><bean:message key="str4707"/></span></td>
        <td width="2" align="center" background="/images/ti_04.gif"><span class="biaoti"><img src="/images/ti_06.gif" width="2" height="33" align="absmiddle"></span></td>
        <!--  
        <td align="center" background="/images/ti_04.gif" class="loginButton" id="item2" onmouseover="clickT(this,2)" style="padding-top:2"><span class="biaoti"><bean:message key="str1835"/></span></td>
        <td width="2" align="center" background="/images/ti_04.gif"><span class="biaoti"><img src="/images/ti_06.gif" width="2" height="33" align="absmiddle"></span></td>
        -->
        <td align="center" background="/images/ti_04.gif" class="loginButton" id="item3" onmouseover="clickT(this,3)" style="padding-top:2"><span class="biaoti"><bean:message key="str2786"/></span></td>
        <td align="center" background="/images/ti_04.gif"><span class="biaoti"><img src="/images/ti_06.gif" width="2" height="33" align="absmiddle"></span></td>
        <td align="center" background="/images/ti_04.gif" class="loginButton" id="item4" onmouseover="clickT(this,4)" style="padding-top:2"><span class="biaoti"><bean:message key="str2787"/></span></td>
        <!--  
        <td align="center" background="/images/ti_04.gif"><span class="biaoti"><img src="/images/ti_06.gif" width="2" height="33" align="absmiddle"></span></td>
        <td align="center" background="/images/ti_04.gif" class="loginButton" id="item5" onmouseover="clickT(this,5)" style="padding-top:2"><span class="biaoti"><bean:message key="str1838"/></span></td>
        -->
        <td width="2"><img src="/images/ti_08.gif" width="2" height="33"></td>
      </tr>
    </table></td>
  </tr>
</table>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="2" background="/images/kehu_list_03.gif" height="8"></td>
    <td width="704" background="/images/kehu_list_04.gif" height="8"></td>
    <td width="2" background="/images/kehu_list_06.gif" height="8"></td>
  </tr>
</table>

<!--最新客户-->
<% 
	HttpSession logsession = request.getSession();
	String cust_id = "";
	String user_id = "";
	if (logsession.getAttribute("SESSION_USER_ID") != null)
    {
        user_id = logsession.getAttribute("SESSION_USER_ID").toString();
    }
	if (logsession.getAttribute("SESSION_CUST_ID") != null) {
		cust_id = logsession.getAttribute("SESSION_CUST_ID").toString();
	}
	Custinfo custInfo = new Custinfo();
	ArrayList custList = custInfo.getIncludeJspByCustId(cust_id,"1");
	
	RelationUUInfo relation=new RelationUUInfo();
    ArrayList relationList =new ArrayList();
    relationList=relation.getNewContactList(user_id,"1");
%>
<table width="100%" border="0" cellspacing="0" cellpadding="0" id="chag1">
  <tr>
    <td><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="30" background="/images/xi_06.gif"><table width="100%" border="0" cellspacing="0" cellpadding="3" >
            <tr>
              <td width="40%">
              		&nbsp;<span class="biaoti"><bean:message key="str4708"/></span>
              		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              		<span class="list_news"><a href="/contactMgr/modify_index.jsp" TARGET=appwin onclick="mydefss()" title="点击查看所有客户"><bean:message key="str2074"/>&gt;&gt;</a></span>
              </td>
              <td width="20%" align="center" class="table_left_right_xian"><span class="biaoti"><bean:message key="str3290"/></span></td>
              <td width="16%" align="center"><span class="biaoti"><bean:message key="str1853"/></span></td>
              <td width="24%" align="center" class="table_left_right_xian"><span class="biaoti"> Email</span></td>
            </tr>
        </table></td>
      </tr>
    </table>
      <table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="E8E8E8">
        <tr>
          <td valign="top" bgcolor="#FFFFFF"><!--//重复-->
              <table width="100%" border="0" cellspacing="0" cellpadding="3" class="table_xian">
                <% 
			  	if(relationList!=null && relationList.size()>0){
			  		for(int i = 0;i<relationList.size();i++){
			  			HashMap contactMap = (HashMap)relationList.get(i);
				        String cust_name="";
				        String contact_phone="";
				        String email="";
				        String home_addr="";
				        String obj_cust_id="",start_date="";
				        String user="";
				        if(contactMap.get("cust_name") != null){cust_name=contactMap.get("cust_name").toString();}
				        if(contactMap.get("cust_id") != null){cust_id=contactMap.get("cust_id").toString();}
				        if(contactMap.get("user_id") != null){user=contactMap.get("user_id").toString();}
				        if(contactMap.get("start_date") != null){
				           start_date=contactMap.get("start_date").toString().substring(0,10);
				        }
				        if(contactMap.get("phone") != null){
				        	contact_phone=contactMap.get("phone").toString();
				        }
				        if(contact_phone.equals("")){
				        	contact_phone="暂无！";
				        }
				        if(contactMap.get("email") != null){email=contactMap.get("email").toString();}
				        if(email.equals("")){
				        	email="暂无！";
				        }
				        if(contactMap.get("home_addr") != null){home_addr=contactMap.get("home_addr").toString();}
				        if(home_addr.equals("")){
				        	home_addr="暂无！";
				        }
			  %>
                <tr>
                  <td width="40%">&nbsp;<span class="list_news"><a href="/contactMgr/modifyUserInfo.jsp?cust_id=<%=obj_cust_id%>&user_id=<%=user%>&view=view" TARGET=appwin onclick="mydefss()" title="点击查看联系详细资料"><%=cust_name %></a></span></td>
                  <td width="20%" align="center" bgcolor="F9F9F9" class="table_left_right_xian"><%=contact_phone %></td>
                  <td width="16%" align="center"><%=start_date %></td>
                  <td width="24%" align="center" bgcolor="F9F9F9" class="table_left_right_xian">
                  	<span  class="shanchu">
                  		<% 
                  			if(email!="暂无！"){
                  				
                  		%>
                  			<a href=mailto:<%=email %>  title="点击发送邮件">
                  		<%	
                  			}
                  		%>
                  		
                  			<%=email %>
                  		<% 
                  			if(email!="暂无！"){
                  		%>
                  			</a>
                  		<%	
                  			}
                  		%>	
                  		
                  	</span>
                  </td>
                </tr>
                <%
			  		}
			  	}
			  %>   
              </table>
            <!--重复//-->
          </td>
        </tr>
      </table></td>
  </tr>
</table>

<!--最新竞争对手-->
<% 
	ArrayList custNewOppList = custInfo.getIncludeJspByCustId(cust_id,"2");
%>
<table width="100%" border="0" cellspacing="0" cellpadding="0" id="chag2" style="display: none">
  <tr>
    <td><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="30" background="/images/xi_06.gif"><table width="100%" border="0" cellspacing="0" cellpadding="3" >
            <tr>
              <td width="40%">&nbsp;<span class="biaoti"><bean:message key="str1841"/></span>
              		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              		<span class="list_news"><a href="/opponentMgr/indexList.jsp" TARGET=appwin onclick="mydefss()" title="点击查看所有竞争对手"><bean:message key="str2074"/>&gt;&gt;</a></span>
              </td>
              <td width="20%" align="center" class="table_left_right_xian"><span class="biaoti"><bean:message key="str3290"/></span></td>
              <td width="16%" align="center"><span class="biaoti"><bean:message key="str3453"/></span></td>
              <td width="24%" align="center" class="table_left_right_xian"><span class="biaoti"> Email</span></td>
            </tr>
        </table></td>
      </tr>
    </table>
      <table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="E8E8E8">
        <tr>
          <td valign="top" bgcolor="#FFFFFF"><!--//重复-->
              <table width="100%" border="0" cellspacing="0" cellpadding="3" class="table_xian">
                <% 
			  	if(custNewOppList!=null && custNewOppList.size()>0){
			  		String obj_cust_id6="",cust_name6="",update_time6="",phone6="",com_addr6="",email6="",start_date6="";
			  		for(int i = 0;i<custNewOppList.size();i++){
			  			HashMap custNewOppMap = (HashMap)custNewOppList.get(i);
			  			if(custNewOppMap.get("cust_id")!=null){obj_cust_id6=custNewOppMap.get("cust_id").toString();}
			  			if(custNewOppMap.get("cust_name")!=null){cust_name6=custNewOppMap.get("cust_name").toString();}
			  			if(custNewOppMap.get("update_time")!=null){update_time6=custNewOppMap.get("update_time").toString();}
			  			if(custNewOppMap.get("group_contact_phone")!=null){phone6=custNewOppMap.get("group_contact_phone").toString();}
			  			if(custNewOppMap.get("email")!=null){email6=custNewOppMap.get("email").toString();}
			  			if(custNewOppMap.get("company_address")!=null){com_addr6=custNewOppMap.get("company_address").toString();}
			  			if(custNewOppMap.get("start_date")!=null){start_date6=custNewOppMap.get("start_date").toString().substring(0,10);}
			  %>
                <tr>
                  <td width="40%">&nbsp;<span class="list_news"><a href="/customerMgr/Custinfo.jsp?obj_cust_id=<%=obj_cust_id6 %>" TARGET=appwin onclick="mydefss()" title="点击查看竞争对手详细资料"><%=cust_name6 %></a></span></td>
                  <td width="20%" align="center" bgcolor="F9F9F9" class="table_left_right_xian"><%=phone6 %></td>
                  <td width="16%" align="center"><%=start_date6 %></td>
                  <td width="24%" align="center" bgcolor="F9F9F9" class="table_left_right_xian"><span  class="shanchu"><a href=mailto:<%=email6 %> title="点击发送邮件"><%=email6 %></a></span></td>
                </tr>
                <%
			  		}
			  	}
			  %>   
              </table>
            <!--重复//-->
          </td>
        </tr>
      </table></td>
  </tr>
</table>

<!--最新客户动态-->
<% 
	ActionMgr action = new ActionMgr();
	ArrayList custActionList = action.getNewAction(cust_id,"1");
%>
<table width="100%" border="0" cellspacing="0" cellpadding="0" id="chag3" style="display: none">
  <tr>
    <td><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="30" background="/images/xi_06.gif"><table width="100%" border="0" cellspacing="0" cellpadding="3" >
            <tr>
              <td width="24%">&nbsp;<span class="biaoti"><bean:message key="str4123"/></span></td>
              <td width="60%" class="table_left_right_xian">&nbsp;<span class="biaoti"><bean:message key="str4485"/></span></td>
              <td width="16%" align="center"><span class="biaoti"><bean:message key="str1843"/></span></td>
            </tr>
        </table></td>
      </tr>
    </table>
      <table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="E8E8E8">
        <tr>
          <td valign="top" bgcolor="#FFFFFF"><!--//重复-->
              <table width="100%" border="0" cellspacing="0" cellpadding="3" class="table_xian">
               <% 
			  	String own_id="",title="",content="",publish_date="",cust_name="",entity_id="";
			  	if(custActionList!=null && custActionList.size()>0){
			  		for(int i = 0;i<custActionList.size();i++){
			  			HashMap custActionMap = (HashMap)custActionList.get(i);
			  			if(custActionMap.get("publish_date")!=null){publish_date=custActionMap.get("publish_date").toString().substring(0,10);}
			  			if(custActionMap.get("content")!=null){content=custActionMap.get("content").toString();}
			  			if(custActionMap.get("title")!=null){title=custActionMap.get("title").toString();}
			  			if(custActionMap.get("entity_id")!=null){entity_id=custActionMap.get("entity_id").toString();}
			  			if(custActionMap.get("own_id")!=null){
			  				own_id=custActionMap.get("own_id").toString();
			  				cust_name = custInfo.getCustNameById(own_id);
			  			}
			  %>
                <tr>
                  <td width="24%"><%=cust_name %></td>
                  <td width="60%" bgcolor="F9F9F9" class="table_left_right_xian">&nbsp;<span class="list_news">
                  			<a href="/actionMgr/disAction.jsp?entity_id=<%=entity_id %>" TARGET=appwin onclick="mydefss()" title="点击查看客户动态内容">
								<%=title %>
							</a></span>
				  </td>
                  <td width="16%" align="center"><%=publish_date %></td>
                </tr>
                <%
			  		}
			  	}
			  %>   
              </table>
            <!--重复//-->
          </td>
        </tr>
      </table></td>
  </tr>
</table>


<!--最新联系人动态-->
<% 
	ArrayList custConList = action.getNewAction(cust_id,"0");
%>
<table width="100%" border="0" cellspacing="0" cellpadding="0" id="chag4" style="display: none">
  <tr>
    <td><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="30" background="/images/xi_06.gif"><table width="100%" border="0" cellspacing="0" cellpadding="3" >
            <tr>
              <td width="18%">&nbsp;<span class="biaoti"><bean:message key="str2316"/></span></td>
              <td width="66%" class="table_left_right_xian">&nbsp;<span class="biaoti"><bean:message key="str2660"/></span></td>
              <td width="16%" align="center"><span class="biaoti"><bean:message key="str1843"/></span></td>
            </tr>
        </table></td>
      </tr>
    </table>
      <table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="E8E8E8">
        <tr>
          <td valign="top" bgcolor="#FFFFFF"><!--//重复-->
              <table width="100%" border="0" cellspacing="0" cellpadding="3" class="table_xian">
                <% 
			  	if(custConList!=null && custConList.size()>0){
			  		String own_id1="",title1="",content1="",publish_date1="",cust_name1="",entity_id1="";
			  		for(int i = 0;i<custConList.size();i++){
			  			HashMap custConMap = (HashMap)custConList.get(i);
			  			if(custConMap.get("publish_date")!=null){publish_date1=custConMap.get("publish_date").toString().substring(0,10);}
			  			if(custConMap.get("content")!=null){content1=custConMap.get("content").toString();}
			  			if(custConMap.get("title")!=null){title1=custConMap.get("title").toString();}
			  			if(custConMap.get("entity_id")!=null){entity_id1=custConMap.get("entity_id").toString();}
			  			if(custConMap.get("own_id")!=null){
			  				own_id1=custConMap.get("own_id").toString();
			  				cust_name1 = custConMap.get("rsrv_str10").toString();//custInfo.getCustNameById(own_id1);
			  			}
			  %>
                <tr>
                  <td width="18%">
                  	<%=cust_name1%>
                  </td>
                  <td width="66%" bgcolor="F9F9F9" class="table_left_right_xian">&nbsp;<span class="list_news">
                  		<a href="/actionMgr/disAction.jsp?entity_id=<%=entity_id1 %>" TARGET=appwin onclick="mydefss()" title="点击查看联系人动态内容">
								<%=title1 %>
						</a>
                  	</td>
                  <td width="16%" align="center"><%=publish_date1 %></td>
                </tr>
                <%
			  		}
			  	}
			  %> 
              </table>
            <!--重复//-->
          </td>
        </tr>
      </table></td>
  </tr>
</table>

<!--最新竞争情报-->
<% 
	ArrayList custOppList = action.getNewAction(cust_id,"2");
%>
<table width="100%" border="0" cellspacing="0" cellpadding="0" id="chag5" style="display: none">
  <tr>
    <td><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="30" background="/images/xi_06.gif"><table width="100%" border="0" cellspacing="0" cellpadding="3" >
          <tr>
            <td width="24%">&nbsp;<span class="biaoti"><bean:message key="str1842"/></span></td>
            <td width="60%" class="table_left_right_xian">&nbsp;<span class="biaoti"><bean:message key="str2268"/></span></td>
            <td width="16%" align="center"><span class="biaoti"><bean:message key="str1843"/></span></td>
          </tr>
        </table></td>
      </tr>
    </table>
      <table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="E8E8E8">
        <tr>
          <td valign="top" bgcolor="#FFFFFF"><!--//重复-->
            <table width="100%" border="0" cellspacing="0" cellpadding="3" class="table_xian">
             <% 
			  	String own_id2="",title2="",content2="",publish_date2="",cust_name2="",entity_id2="";
			  	if(custOppList!=null && custOppList.size()>0){
			  		for(int i = 0;i<custOppList.size();i++){
			  			HashMap custOppMap = (HashMap)custOppList.get(i);
			  			if(custOppMap.get("publish_date")!=null){publish_date2=custOppMap.get("publish_date").toString().substring(0,10);}
			  			if(custOppMap.get("content")!=null){content2=custOppMap.get("content").toString();}
			  			if(custOppMap.get("title")!=null){title2=custOppMap.get("title").toString();}
			  			if(custOppMap.get("entity_id")!=null){entity_id2=custOppMap.get("entity_id").toString();}
			  			if(custOppMap.get("own_id")!=null){
			  				own_id2=custOppMap.get("own_id").toString();
			  				cust_name2 = custInfo.getCustNameById(own_id2);
			  			}
			  %>
              <tr>
                <td width="24%"><%=cust_name2 %></td>
                <td width="60%" bgcolor="F9F9F9" class="table_left_right_xian">&nbsp;<span class="list_news">
                	<a href="/actionMgr/disAction.jsp?entity_id=<%=entity_id2 %>" TARGET=appwin onclick="mydefss()" title="点击查看竞争情报内容">
						<%=title2 %>
					</a></span></td>
                <td width="16%" align="center"><%=publish_date2 %></td>
              </tr>
             <%
			  		}
			  	}
			  %>   
            </table>
            <!--重复//-->
          </td>
        </tr>
      </table></td>
  </tr>
</table>

</body>
</html>
