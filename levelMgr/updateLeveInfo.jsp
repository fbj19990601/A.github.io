<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"



"http://www.w3.org/TR/html4/loose.dtd">



<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>



<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>



<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>



<%@ page import="java.util.*"%>



<%@ page contentType="text/html;charset=GBK"%>



<jsp:useBean id="bean" class="com.saas.biz.commen.ParamethodMgr" scope="page" />



<jsp:useBean id="level" class="com.saas.biz.levelMgr.LevelInfo" scope="page" />



<%



	ArrayList list=bean.getCompareInfoByAttr("46");



	String cust_id="",level_code="",level_name="",remark="",entity_type="",start_Date="",end_Date="";



	cust_id=request.getParameter("cust");



	level_code=request.getParameter("level");



	ArrayList levelList=level.getLevelInfoByCode(cust_id,level_code);



	if(levelList!=null && levelList.size()>0){



	  HashMap roleMap=(HashMap)levelList.get(0);



	  level_name=roleMap.get("level_name").toString();



	  remark=roleMap.get("remark").toString();



	  entity_type=roleMap.get("entity_type").toString();



	  start_Date=roleMap.get("start_date").toString();



	  end_Date=roleMap.get("end_date").toString();



	}



%>



<html>



	<head>



		<title><bean:message key="str2689"/></title>



		<link href="/style/layout.css" rel="stylesheet" type="text/css">





<script language="javascript" src="/js/Calendar_Ly.js"></script>
<script type="text/javascript" src="/js/public_b2b.js"></script>



<script language="JavaScript">



    function Check_Value()



	{



	    if(document.getElementById("level_name").value==""){



	      alert("级别名称不能为空！");



	      document.getElementById("level_name").focus();



	      return false;



	    }

        if(!checkDate(document.getElementById("start_date").value,document.getElementById("end_date").value)){
		     return false;
		   }

 	    return true;



	}



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



    	        if (Check_Value())



    	        {



    	            formobj.submit();   	



    	        }



    	    }



    	    else



    	    {



    	        return;



    	    }



    	}






</script>



	</head>



	<body>



		<form name=resumeForm action=/doTradeReg.do method=post>



			<table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">



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



									<bean:message key="str2691"/>



								</td>



								<td



									style="background-color:#ffffff; color:#000000;  font-size:12px; padding:3px 5px;"



									align=left width=85%>



									<input name="level_name" type="text" id="level_name" size=30



										maxlength=30 value="<%=level_name%>">



								</td>



							</tr>



								<input name="level_code" id="level_code" type="hidden" value="<%=level_code%>">



							<tr>



								<td



									style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;"



									align=right>



									<bean:message key="str2698"/>



								</td>



								<td



									style="background-color:#ffffff; color:#000000;  font-size:12px; padding:3px 5px;"



									align=left>



                                   <select name="entity_type" id="entity_type">



                                   <%



                                     if(list!=null && list.size()>0){



                                       for(int i=0;i<list.size();i++){



                                         HashMap map=(HashMap)list.get(i);



                                         String id=map.get("para_code1").toString();



                                         String name=map.get("para_code2").toString();



                                         if(id==entity_type || id.equals(entity_type)){



                                         %>



                                         <option value="<%=id%>" checked><%=name%></option>



                                         <%



                                         }else{



                                          %>



                                         <option value="<%=id%>"><%=name%></option>



                                         <%



                                         }



                                       }



                                     }



                                   %>



                                   </select>



								</td>



							</tr>



							<tr>



								<td



									style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;"



									align=right>



									<bean:message key="str2700"/>



								</td>



								<td



									style="background-color:#ffffff; color:#000000;  font-size:12px; padding:3px 5px;"



									align=left>



										<input name="start_date" type="text" id="start_date" value="<%=start_Date%>" size="16" maxlength="16" onfocus="setday(this);" />



								</td>



							</tr>



							<tr>



								<td



									style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;"



									align=right>



									<bean:message key="str2701"/>



								</td>



								<td



									style="background-color:#ffffff; color:#000000;  font-size:12px; padding:3px 5px;"



									align=left>



										<input name="end_date" type="text" id="end_date" value="<%=end_Date%>" size="16" maxlength="16" onfocus="setday(this);" />



								</td>



							</tr>



							<tr>



								<td



									style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;"



									align=right>



									<bean:message key="str2810"/>



								</td>



								<td



									style="background-color:#ffffff; color:#000000;  font-size:12px; padding:3px 5px;"



									align=left>



									<input name="remark" id="remark" type="text" size=30



										maxlength="500" value="<%=remark%>"/>



								</td>



							</tr>



							<input name="trade_type_code" type="hidden" value="1034"/>



							<tr>



								<td



									style="background-color:#ffffff; color:#000000;  font-size:12px; padding:3px 5px;"



									colspan=2 align="center">



									<INPUT name="advshow" type="checkbox" value="0"



										onclick="check_none(resumeForm)">



									<bean:message key="str3006"/>



								</td>



							</tr>



							<tr>



								<td



									style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;padding-top:10px;padding-bottom:10px;"



									align="center" colspan=2>



									<input class="tjan" name="submit1" type="button" value="" disabled="true" onclick="confirmsub(resumeForm)">



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



