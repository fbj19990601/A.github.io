<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.Map.Entry"%>
<%@ page import="com.saas.biz.levelMgr.LevelInfo"%>
<%@ page contentType="text/html;charset=GBK"%>
<jsp:useBean id="bean" class="com.saas.biz.commen.ParamethodMgr" scope="page" />
<%
    HttpSession  logsession = request.getSession();
    String cust_id = "";
    String iStart ="0";
    String meun_idx="";
    String code="0",entity="",keyword="";
    if (request.getParameter("level_name") != null)
    {
       keyword = request.getParameter("level_name");
       keyword=new String(keyword.getBytes("ISO-8859-1"),"GBK");
    }
    if (request.getParameter("entity_type") != null)
    {
       entity = request.getParameter("entity_type");
    }
	   if (request.getParameter("code") != null)
	   {
	       code = request.getParameter("code");
	   }
    if (request.getParameter("iStart") != null)
    {
        iStart = request.getParameter("iStart");
    }
    if (logsession.getAttribute("SESSION_CUST_ID") != null)
    {
        cust_id = logsession.getAttribute("SESSION_CUST_ID").toString();
    }
    if (request.getParameter("menu_id") != null)
    {
        meun_idx = request.getParameter("menu_id");
        logsession.setAttribute("menu_id",meun_idx);
    }
    if( logsession.getAttribute("menu_id")!= null)
    {
       meun_idx=(String)logsession.getAttribute("menu_id");
    }
    
   LevelInfo levelObj=new LevelInfo();
   ArrayList levelList =new ArrayList();
   if(code=="0" || code.equals("0"))
   {
    levelList=levelObj.getLevelInfoByCust_id(Integer.valueOf(iStart).intValue(),cust_id);
   }
   else if(code=="1" || code.equals("1"))
   {

     levelList=levelObj.getLevelByLevelName(cust_id,keyword);

   }
   else if(code=="2" || code.equals("2"))
   {
    	levelList=levelObj.getLevelByEnitity(cust_id,entity);
   }
    HashMap typeMap=bean.getCompareInfoByCode("CRM","entity_type");
    int counter=levelObj.getLevelCount(cust_id);
    int pages=0;
    if(counter%20==0)
    {
     pages=counter/20;
    }
    else
    {
     pages=counter/20+1;
    }
	int pageUp=0,pageDown=0;
	int currenPage=Integer.valueOf(iStart).intValue();
	if(pages>currenPage)
	{
	   if(currenPage>0)
	   {
			pageUp=currenPage-1;		
	   }
		pageDown=currenPage+1;
	}
  else if(pages==currenPage)
	{
	   pageUp=currenPage-1;
	   pageDown=currenPage;
  }

%>
<html>
<head>
<title><bean:message key="str2689"/></title>
<link href="/style/css.css" rel="stylesheet" type="text/css">
<style type="text/css">
.line6 {width:72spx; width:70spx!important;border:#ffcb99 1px solid;  background-color:#fff8ee;
text-align:left; padding-left: 20px;padding-top: 10px;padding-bottom: 10px; color:#000000; margin-top:13px;}
/*横栏样式6---- 头部提醒1*/
.line6 .img{width:53px; height:53px; float:left; margin-right:20px;}
.line6 .title {font-size:14px; font-weight:bold; color:#ff5400;}
.line1 {border-left:#ff7300 3px solid; background-color:#e2e2e2; color:#333333;text-align:left;
font-size:12px;}  /*横栏样式1*/
</style>
<script language="javascript">
  function chechIfo()
  {
		 if(confirm('是否确认删除该级别？'))
		 {
				return true;
		 }
		 else
		 {
			 return false;
		 }
  }

	function checkRaleType(type)
	{
    if(type!="a")
    {
      document.getElementById("code").value="2";
      sumbimtData();
    }
  }

  function checkRelation()
  {
    if(document.getElementById("level_name").value!="")
    {
       document.getElementById("code").value="1";
       sumbimtData();
    }
    else
    {
      alert('请输入正确的级别名称，否则会影响你的查询结果！');
      document.getElementById("level_name").focus();
    }
  }

	function sumbimtData()
	{
    document.levelForm.submit();
  } 
 </script>
</head>

<body>
	<table width="727" border="0" cellspacing="0" cellpadding="0">
	  <tr>
	    <td height="13" align="left">
         <form name="levelForm" id="levelForm" action="levelListIndex.jsp" method="post">
            <div style="margin-left: 12px;margin-top: 5px;margin-bottom: 5px">
             <bean:message key="str2690"/>&nbsp;
	         <select name="entity_type" id="entity_type"  class="login_textarea" onclick="checkRaleType(this.value)">
	             <option value="a"><bean:message key="str2655"/></option>
			      	<%
							if (typeMap != null && typeMap.size() > 0)
							{
							  Iterator iter=typeMap.entrySet().iterator();
							  while (iter.hasNext())
							  {
								Entry enty = (Entry) iter.next();
								Object value = enty.getKey();
								Object name = enty.getValue();
				       %>
						<option value="<%=value%>"> <%=name%> </option>
				   <%
					  }
					}
				  %>
			</select>
<br>
				<input type="hidden" name="code" id="code" value="0">
				&nbsp;&nbsp;<bean:message key="str2691"/>&nbsp;
				<input type="text" maxlength="50" name="level_name" id="level_name">&nbsp;&nbsp;&nbsp;&nbsp;
				<input class="cxan" type="button" value="" onclick="checkRelation()" style="cursor: hand">
      </div>
      </form>
     </td>
 	  </tr>
 	  <tr>
 	    <td>
 		     <table width="100%" border=0 cellpadding=2 cellspacing=1 align=center bgcolor="#e7e7e7">
 		        <tr>
 			        <td class="line1" style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align="center" width="20%"><bean:message key="str2692"/></td>
 					    <td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align="center" width="15%"><bean:message key="str2693"/></td>
              <td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align="center" width="15%"><bean:message key="str2694"/></td>
              <td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align="center" width="15%"><bean:message key="str2695"/></td>
              <td valign="top"><br></td><td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align="center" width="35%"><bean:message key="str2696"/></td>
 		        </tr>
 		        <%
		            if(levelList != null && levelList.size()>0)
		            {
	              	 for (Iterator it = levelList.iterator(); it.hasNext();)
		               {
						        HashMap map = (HashMap) it.next();
						        String level_name="";
						        String entity_type="";
						        String start_date="";
						        String end_date="";
						        String level_code="";
						        if(map.get("level_name") != null)
						        {
						           level_name=map.get("level_name").toString();
						        }
						        if(map.get("entity_type") != null)
						        {
						           entity_type=map.get("entity_type").toString();
						           if(typeMap!=null && typeMap.size()>0){
						             entity_type=typeMap.get(entity_type).toString();
						           }
						        }
						        if(map.get("level_code") != null)
						        {
						           level_code=map.get("level_code").toString();
						        }
						        if(map.get("start_date") != null)
						        {
						           start_date=map.get("start_date").toString();
						           if(start_date.length()>10){
						             start_date=start_date.substring(0,10);
						           }
						        }
						        if(map.get("end_date") != null)
						        {
						           end_date=map.get("end_date").toString();
						           if(end_date.length()>10)
						           {
						             end_date=end_date.substring(0,10);
						           }
						        }
						        %>
						        <tr style="background-color:#f9f9f9; " id="changcolor_tr<%=cust_id%>" onmouseover="MM_changeProp('changcolor_tr<%=cust_id%>','','backgroundColor','#ffffff','DIV')" onmouseout="MM_changeProp('changcolor_tr<%=cust_id%>','','backgroundColor','#f9f9f9','DIV')">
					              <td  style=" color:#000000; padding:3px 5px;" align=left><%=level_name%><br></td>
					              <td  style=" color:#000000;" align=center><%=entity_type%><br></td>
					              <td  style=" color:#000000;" align=center><%=start_date%><br></td>
					              <td  style=" color:#000000;" align=center><%=end_date%><br></td>
					              <td valign="top"><br></td><td  style=" color:#000000;" align=center>
					                <a href=updateLeveInfo.jsp?level=<%=level_code%>&cust=<%=cust_id%> TARGET=appwin onclick="mydefss()">
					                	<img src=/img/edit.gif width=16 height=16 border=0 alt="修改级别">
					                </a>&nbsp;&nbsp;&nbsp;
					                <a href=/doTradeReg.do?cust_id=<%=cust_id%>&trade_type_code=1033&level_code=<%=level_code%> target="_self"  onClick="return chechIfo()">
					                	<img src=/img/del.gif width=16 height=16 border=0 alt="删除级别">
					                </a>
					              </td>
					            </tr>
						   <%
					       }
                 if(code=="0" || code.equals("0"))
                 {
					     %>
					     <tr>

							<td  align="left" colspan="2" style="font-weight:normal; padding:2px 5px;"><bean:message key="str3988"/><%=counter%><bean:message key="str611"/> &nbsp;<bean:message key="str759"/><%=Integer.parseInt(iStart)+1 %><bean:message key="str1029"/>&nbsp;&nbsp;<bean:message key="str3988"/><%=pages%><bean:message key="str1029"/></td>

							<td  align="right" colspan="3"  style=" padding:2px 5px;">
							<a href="levelListIndex.jsp?iStart=0&menu_id=<%=meun_idx%>"><bean:message key="str1030"/> </a>&nbsp; &nbsp;
							<% 
								if(Integer.parseInt(iStart)>0){
							%>
								<a href="levelListIndex.jsp?iStart=<%=pageUp%>&menu_id=<%=meun_idx%>"><bean:message key="str1031"/></a> &nbsp;
							<%
								}
								if(Integer.parseInt(iStart)<pages-1){
							%>
								<a href="levelListIndex.jsp?iStart=<%=pageDown%>&menu_id=<%=meun_idx%>"><bean:message key="str1032"/> </a>&nbsp; 
							<%
								}
							%>
							<a  href="levelListIndex.jsp?iStart=<%=pages-1%>&menu_id=<%=meun_idx%>"><bean:message key="str1033"/></a></td>

				         </tr>
					     <%}
		            }
		        %>
		    </table>
	     </td>
	  </tr>
	  <tr>
	    <td height="13">&nbsp;</td>
	  </tr>
	</table>
</body>
</html>

