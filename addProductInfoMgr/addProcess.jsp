<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="java.util.*"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="com.saas.biz.commen.ParamethodMgr"%>
<jsp:useBean id="bean" class="com.saas.biz.commen.commMethodMgr" scope="page" />
<%@ page import="com.saas.biz.commen.commMethodMgr"%>


<html>
	<head>
		<title><bean:message key="str190"/></title>
		<link href="/style/layout.css" rel="stylesheet" type="text/css">
		<script src="/js/UrlEncode.js" language="jscript" type="text/jscript"></script>
		<script src="/js/sale.js" language="jscript" type="text/jscript"></script>
		<script language="javascript" src="/js/Calendar_Ly.js"></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/Hello.js'></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/engine.js'></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/util.js'></script>
		<script type='text/javascript' src='/js/hello.js'></script>
		<script type="text/javascript" src="/js/public_b2b.js"></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/Productclass.js'></script>
		<script language="javascript">
window.onload=setOneClass;
function checkInfo()
{
	  if(document.getElementById("category_title").value.replace(/\s*/g,"")=="" || document.getElementById("category_title").value.replace(/\s*/g,"")==null)
				{
					alert("<bean:message key='str5122'/>");
					document.getElementById("category_title").focus();
					return false;
				}
		if (document.classForm.sort1.value == "" ||document.classForm.sort1.value.length<1)
		{
			alert("Please select a Product Category!");
			document.classForm.sort1.focus(); 
			return false;
		} 
		var str=category_abstract.getText();
		str=str.replace(/\s*/g,""); 
		if(str == ""  )
		{
			alert("Please fill out the classification of products introduced!");
			return false;
		} 
	
	var str=category_desc.getText();
		str=str.replace(/\s*/g,""); 
		if(str == ""  )
		{
			alert("Please fill out a description of classified information!");
			return false;
		} 
	
      if(document.getElementById("start_date").value.replace(/\s*/g,"")=="" || document.getElementById("start_date").value.replace(/\s*/g,"")==null)
				{
					alert("Start date can not be empty!!!");
					document.getElementById("start_date").focus();
					return false;
				}
			  if(document.getElementById("end_date").value.replace(/\s*/g,"")=="" || document.getElementById("end_date").value.replace(/\s*/g,"")==null)
				{
					alert("End date can not be empty!!!");
					document.getElementById("end_date").focus();
					return false;
				} 
	   //////////////////判断时间是否合理////////////////
		   if(!checkDate(document.getElementById("start_date").value,document.getElementById("end_date").value)){
		     return false;
		   }
		   ///////////////////////////////////////////////
	
			if (document.classForm.category_addr.value == ""||document.classForm.category_addr.value == null)
			{
				alert("Products can not address is empty!");
				document.classForm.category_addr.focus(); 
				return false;
			}
  	return true;
	
}
function   isNum(str)
{   
  return   (str.search(/^\d+(\.\d+)?$/)!=-1);   
}   
//设置一级分类
	function setOneClass()
	{
		Productclass.getProductClassByUpId("000000000000000","4",setSort1);
	}
	function setSort1(map_data)
	{
		DWRUtil.removeAllOptions("sort1");
		DWRUtil.addOptions("sort1",map_data);
		document.getElementById("sort2").style.display="none";
		document.getElementById("sort3").style.display="none"; 
		document.getElementById("nextElement").style.display="none"; 
	}
	//设置二级分类
	function setSecondClass(val)
	{
		var up_class_id=val;
		var type="4";
		document.getElementById("rsrv_str1").value="1";
		Productclass.getProductClassByUpId(up_class_id,type,setSort2);
	}
	function setSort2(map_data)
	{
		DWRUtil.removeAllOptions("sort2");
		DWRUtil.addOptions("sort2",map_data);
		document.getElementById("sort3").style.display="none";
		document.getElementById("nextElement").style.display="none"; 
		 var item=document.getElementById("sort2").length;
	     if(item==0)
	    {
	    	document.getElementById("sort2").style.display="none";
	    }
	    else
	    	{
	    		document.getElementById("sort2").style.display="block";
	    	}
	}
	//设置三级分类
	function setTherdClass(val)
	{
		var up_class_id=val;
		var type="4";
		document.getElementById("rsrv_str1").value="2";
		Productclass.getProductClassByUpId(up_class_id,type,setSort3);
	}
	function setSort3(map_data)
	{
		if(map_data!=null)
		{
			 DWRUtil.removeAllOptions("sort3");
		     DWRUtil.addOptions("sort3",map_data);
		     var item=document.getElementById("sort3").length;
		     if(item==0)
		     {
		    	document.getElementById("sort3").style.display="none";
		    	document.getElementById("nextElement").style.display="none"; 
		     }
		     else
	     	 {
	     		document.getElementById("sort3").style.display="block";
	     	 }
		}
	}
	function setTypeName(obj)
	{
		//var idx=obj.value;
		//document.getElementById("class_id").value=idx;
		//document.getElementById("class_name").value=DWRUtil.getText(obj.name);
		//document.getElementById("count").value=obj.name;
	}
	 //动态生成下级分类信息
	function cretateSelect(index,value)
	{
	    document.getElementById("nextElement").style.display="block";
	    var type="4";
	 	document.getElementById("rsrv_str1").value="3";
	 	var divId=parseInt(index)+parseInt(1);
	 	document.getElementById("index_s").value=index;
	 	document.getElementById(index).innerHTML="<select name=sort"+index+" id=sort"+index+" onchange=cretateSelect("+divId+",this.value) size=3  style=width:130px></select><div id="+divId+"></div>";
	 	DWRUtil.removeAllOptions("sort"+index);
	 	Productclass.getProductClassByUpId(value,type,setNewSelect);
    }
    //回调函数
     function setNewSelect(map_data){
      var id=document.getElementById("index_s").value;
      DWRUtil.addOptions("sort"+id,map_data);
        var item=document.getElementById("sort"+id).length;
	    if(item==0)
	    {
	    	document.getElementById(id).style.display="none"; 
	    }
	     else
	   	{
	   		document.getElementById(id).style.display="block";
	   	}
    }

</script>

	</head>
	<body>
		<%
			HttpSession logsession = request.getSession();
			String cust_id = "", user_id = "", user_name = "";
			if (logsession.getAttribute("SESSION_CUST_ID") != null) {
				cust_id = logsession.getAttribute("SESSION_CUST_ID").toString();
			}
			if (logsession.getAttribute("SESSION_USER_ID") != null) {
				user_id = logsession.getAttribute("SESSION_USER_ID").toString();
			}
			String fbtime = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
			String sale_id = bean.GenTradeId();
			ParamethodMgr paramCom = new ParamethodMgr();
			ArrayList webList = paramCom.getCompareInfo("CRM", "web_id");
			commMethodMgr commen = new commMethodMgr();
			String idx = commen.GenTradeId();
			String category_id = commen.GenTradeId();
			String category_type=paramCom.getSelectItems("105");
		%>
		<form name="classForm" method="post" action="/doTradeReg.do" target="_self">
			<table width="100%" border="0" cellpadding="5" cellspacing="1" align="center" bgcolor="#dddddd" style="margin-top:10px;">
				<tr>
					<td align="right" style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;">
						<bean:message key="str697"/>
					</td>
					<td align="left" style="background-color:#ffffff; color:#000000;  font-size:12px;">
						<div class="ping">
							<input name="category_title" type="text" maxlength="100">
						</div>
					</td>
				</tr>
				<tr>
					<td align="right" style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;">
						<bean:message key="str698"/>
					</td>
					<td align="left" style="background-color:#ffffff; color:#000000;  font-size:12px;">
						<div class="ping1">
							<select name="category_type" maxlength="25">
								<%=category_type%>
							</select>
						</div>
					</td>
				</tr>

				<tr style="display:none">
					<td height="30" align="right" style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;">
						<bean:message key="str698"/>
					</td>
					<td align="left" style="background-color:#ffffff; color:#000000;  font-size:12px;">
						<div class="ping1">
							<select name="web_id" maxlength="25">
								<%
										if (webList != null && webList.size() > 0) {
										for (int i = 0; i < webList.size(); i++) {
											HashMap map = (HashMap) webList.get(i);
											String value = map.get("para_code1").toString();
											String name = map.get("para_code2").toString();
								%>
								<option value="<%=value%>">
									<%=name%>
								</option>
								<%
									}
									}
								%>
							</select>
						</div>
					</td>
				</tr>
				<tr>
					<td height="30" align="right" style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;" valign="top">
						<bean:message key="str700"/>
					</td>
					<td align="left" style="background-color:#ffffff; color:#000000;  font-size:12px;">
						<div class="ping">
							<table border="0" cellpadding="0" cellspacing="0" style="margin-left:15px">
								<tr>
									<td style="background-color:#ffffff; color:#000000;  font-size:12px;">
										<select name="sort1" size="10" style="width: 130px" onChange="setSecondClass(this.value);" onclick="setTypeName(this)">
											<option selected value="0">
												<bean:message key="str318"/>
											</option>
										</select>
									</td>
									<td style="background-color:#ffffff; color:#000000; font-size:12px;">
										<select name="sort2" size="10" style="width: 130px; display: none" onChange="setTherdClass(this.value);" onclick="setTypeName(this)">
											<option value="0">
												<bean:message key="str318"/>
											</option>
										</select>
									</td>
									<td style="background-color:#ffffff; color:#000000;  font-size:12px;">
										<select name="sort3" size="10" style="width: 130px; display: none" onclick="setTypeName(this)" onchange="cretateSelect('4',this.value)">
											<option value="0">
												<bean:message key="str318"/>
											</option>
										</select>
									</td>
									<td>
										<div id="nextElement">
											<div id="4" style="width;100px; float:left;display:inline;white-space:nowrap"></div>
											<input type="hidden" name="index_s" id="index_s" value="4">
										</div>
									</td>
								</tr>
							</table>
						</div>
					</td>
				</tr>
				<tr>
					<td align=right style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;">
						<bean:message key="str701"/>
					</td>

					<td align=left style="background-color:#ffffff; color:#000000;  font-size:12px;">
						<div class="ping">
							<textarea name="category_abstract" style=display:none></textarea>
							<iframe ID=category_abstract src=/www/ewebeditor/ewebeditor.htm?id=category_abstract&style=coolblue frameborder=0 scrolling=no width=600 HEIGHT=350></iframe>
						</div>
					</td>
				</tr>
				<tr>
					<td align=right style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;">
						<bean:message key="str702"/>
					</td>
					<td align=left style="background-color:#ffffff; color:#000000;  font-size:12px;">
						<div class="ping">
							<textarea name="category_desc" style=display:none></textarea>
							<iframe ID=category_desc src=/www/ewebeditor/ewebeditor.htm?id=category_desc&style=coolblue frameborder=0 scrolling=no width=600 HEIGHT=350></iframe>
						</div>
					</td>
				</tr>
				<tr>
					<td align=right style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;">
						<bean:message key="str703"/>
					</td>
					<td align=left style="background-color:#ffffff; color:#000000;  font-size:12px;">
						<div class="ping1">
							<input name="category_unit" type="text" size="10" onkeyup="if(isNaN(value))execCommand('undo')">
							<bean:message key="str704"/>
						</div>
					</td>
				</tr>
				<tr>
					<td align="right" style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;">
						<bean:message key="str705"/>
					</td>
					<td align="left" style="background-color:#ffffff; color:#000000;  font-size:12px;">
						<div class="ping">
							<input name="start_date" type="text" id="start_date" onfocus="setday(this);" size="10" />
							(yyyy-mm-dd)
						</div>
					</td>
				</tr>
				<tr>
					<td align="right" style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;">
					       <bean:message key="str706"/>
					</td>
					<td align="left" style="background-color:#ffffff; color:#000000;  font-size:12px;">
						<div class="ping">
							<input name="end_date" type="text" id="end_date" onfocus="setday(this);" size="10" />
							(yyyy-mm-dd)
						</div>
					</td>
				</tr>
				<tr>
					<td align="right" style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;">
						   <bean:message key="str707"/>
					</td>
					<td align="left" style="background-color:#ffffff; color:#000000;  font-size:12px;">
						<div class="ping">
							<input name="category_addr" type="text" size="50">
						</div>
					</td>
				</tr>
				<input name="category_id" type="hidden" value="<%=category_id%>">
				<input name="cust_id" type="hidden" value="<%=cust_id%>">
				<input name="user_id" type="hidden" value="<%=user_id%>">
				<!--input name="publish_date" type="hidden" value=""-->
				<input name="remark" type="hidden" value="">
				<input name="trade_type_code" type="hidden" value="2103">
				<input name="rsrv_str1" id="rsrv_str1" type="hidden" value="0">
				<tr>
					<td height="30" colspan="2" align="center" style="background-color:#f6f6f6; color:#000000;  font-size:12px;">
						<input class="tjan" type="submit" value="" onClick="return checkInfo()">
					</td>
				</tr>
			</table>
		</form>
		<script language="jscript" type="text/jscript">
	getSubitems(document.classForm.bigsort, "", "Please select...", "");
	getSubitems(document.classForm.sort1, "");
</script>
	</body>
</html>

