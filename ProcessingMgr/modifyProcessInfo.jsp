<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="java.util.*"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>

<%@ page import="com.saas.biz.commen.commMethodMgr"%>
<%@ page import="com.saas.biz.ProcessMgr.ProcessInfo"%>
<%@ page import="com.saas.biz.commen.ParamethodMgr"%>

<html>
	<head>
		<title><bean:message key="str848"/></title>
		<link href="/style/layout.css" rel="stylesheet" type="text/css">
		<script language="javascript" src="/js/Calendar_Ly.js"></script>
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
					alert("标题不能为空!!!");
					document.getElementById("category_title").focus();
					return false;
				}
				if (document.classForm.sort1.value == "" ||document.classForm.sort1.value.length<1)
	{
		alert("请选择产品分类！");
		document.classForm.sort1.focus(); 
		return false;
	} 
		var str=category_abstract.getText();
		str=str.replace(/\s*/g,""); 
		if(str == ""  )
		{
			alert("请填写分类产品的介绍！");
			return false;
		} 
	
	var str=category_desc.getText();
		str=str.replace(/\s*/g,""); 
		if(str == ""  )
		{
			alert("请填写分类信息的描述！");
			return false;
		} 
	
     if(document.getElementById("start_date").value.replace(/\s*/g,"")=="" || document.getElementById("start_date").value.replace(/\s*/g,"")==null)
	 {
		alert("开始日期不能为空!!!");
		document.getElementById("start_date").focus();
		return false;
	 }
	 if(document.getElementById("end_date").value.replace(/\s*/g,"")=="" || document.getElementById("end_date").value.replace(/\s*/g,"")==null)
	 {
		alert("结束日期不能为空!!!");
		document.getElementById("end_date").focus();
		return false;
	} 
	  //////////////////判断时间是否合理////////////////
	 
     ///////////////////////////////////////////////  
		if(!checkDate(document.classForm.start_date.value,document.classForm.end_date.value)){
		     return false;
		}
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
	String date = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
	String cust_id = "";
	String category_id = "";
	String category_title = "";
	String category_abstract = "";
	String category_desc = "";
	String category_addr = "";
	String category_unit="";
	String category_type="";
	String start_date = date;
	String end_date = date;
	String user_id="",remark="";
	commMethodMgr commen = new commMethodMgr();
	String idx = commen.GenTradeId();

	if (request.getParameter("category_id") != null) {
		category_id = request.getParameter("category_id");
	}
	if (request.getParameter("cust_id") != null) {
		cust_id = request.getParameter("cust_id");
	}
	ProcessInfo processObj = new ProcessInfo();
	ArrayList processList = new ArrayList();
	if (category_id != null && !category_id.equals("")) {
		processList = processObj.genOneProcess(category_id);
		if (processList != null && processList.size() > 0) {
			HashMap map = (HashMap) processList.get(0);
			category_id = map.get("category_id").toString();
			if(map.get("category_title") != null) {
		       category_title = map.get("category_title").toString();
			}
			if(map.get("category_abstract") != null) {
		      category_abstract = map.get("category_abstract").toString();
			}
			if(map.get("category_desc") != null) {
		       category_desc = map.get("category_desc").toString();
			}
			if(map.get("category_unit") != null) {
		       category_unit = map.get("category_unit").toString();
			}
			if(map.get("category_addr") != null) {
		       category_addr = map.get("category_addr").toString(); 
			}
			if(map.get("category_type") != null) {
		       category_type = map.get("category_type").toString();
			}
			if(map.get("remark") != null) {
		       remark = map.get("remark").toString();
			}
			if(map.get("start_date") != null) {
		      start_date = map.get("start_date").toString();
			   if(start_date.length() > 10) {
				 start_date = start_date.substring(0, 10);
			    }
			}
			if (map.get("end_date") != null) {
		        end_date = map.get("end_date").toString();
				if(end_date.length() > 10) {
					end_date = end_date.substring(0, 10);
				}
			}

		}
	}
	ParamethodMgr paramCom=new ParamethodMgr();
	category_type=paramCom.getItemsBySelected("105",category_type);
%>
		<form name="classForm" method="post" action="/doTradeReg.do" target="_self">
			<table width="100%" border="0" cellpadding="5" cellspacing="1" align="center" bgcolor="#dddddd" style="margin-top:10px;">
				<tr>
					<td align="right" style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;">
						<bean:message key="str2281"/>
					</td>
					<td align="left" style="background-color:#ffffff; color:#000000;  font-size:12px;">
						<div class="ping">
							<input name="category_title" type="text" maxlength="100" value="<%=category_title%>">
						</div>
					</td>
				</tr>
				<tr>
					<td align="right" style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;">
						<bean:message key="str2282"/>
					</td>
					<td align="left" style="background-color:#ffffff; color:#000000;  font-size:12px;">
						<div class="ping1">
							<select name="category_type" maxlength="25">
							 <%=category_type%>
							</select>
						</div>
					</td>
				</tr>
				<tr>
					<td height="30" align="right" style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;" valign="top">
						<bean:message key="str2283"/>
					</td>
					<td align="left" style="background-color:#ffffff; color:#000000;  font-size:12px;">
						<div class="ping">
							<table border="0" cellpadding="0" cellspacing="0" style="margin-left:15px">
								<tr>
									<td style="background-color:#ffffff; color:#000000;  font-size:12px;">
										<select name="sort1" size="10" style="width: 130px" onChange="setSecondClass(this.value);" onclick="setTypeName(this)">
											<option selected value="0">
												<bean:message key="str2655"/>
											</option>
										</select>
									</td>
									<td style="background-color:#ffffff; color:#000000; font-size:12px;">
										<select name="sort2" size="10" style="width: 130px; display: none" onChange="setTherdClass(this.value);" onclick="setTypeName(this)">
											<option value="0">
												<bean:message key="str2655"/>
											</option>
										</select>
									</td>
									<td style="background-color:#ffffff; color:#000000;  font-size:12px;">
										<select name="sort3" size="10" style="width: 130px; display: none" onclick="setTypeName(this)" onchange="cretateSelect('4',this.value)">
											<option value="0">
												<bean:message key="str2655"/>
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
							<textarea name="category_abstract" style=display:none><%=category_abstract%></textarea>
							<iframe ID=category_abstract src=/www/ewebeditor/ewebeditor.htm?id=category_abstract&style=coolblue frameborder=0 scrolling=no width=600 HEIGHT=350></iframe>
						</div>
					</td>
				</tr>
				<tr>
					<td align=right style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;">
						<bean:message key="str853"/>
					</td>
					<td align=left style="background-color:#ffffff; color:#000000;  font-size:12px;">
						<div class="ping">
							<textarea name="category_desc" style=display:none><%=category_desc%></textarea>
							<iframe ID=category_desc src=/www/ewebeditor/ewebeditor.htm?id=category_desc&style=coolblue frameborder=0 scrolling=no width=600 HEIGHT=350></iframe>
						</div>
					</td>
				</tr>
				<tr>
					<td align=right style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;">
						<bean:message key="str854"/>
					</td>
					<td align=left style="background-color:#ffffff; color:#000000;  font-size:12px;">
						<div class="ping1">
							<input name="category_unit" type="text" size="10" value="<%=category_unit%>" onkeyup="if(isNaN(value))execCommand('undo')">
							<bean:message key="str855"/>
						</div>
					</td>
				</tr>
				<tr>
					<td align="right" style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;">
						<bean:message key="str3820"/>
					</td>
					<td align="left" style="background-color:#ffffff; color:#000000;  font-size:12px;">
						<div class="ping">
							<input name="start_date" type="text" id="start_date" value="<%=start_date%>" onfocus="setday(this);" size="10" />
							(yyyy-mm-dd)
						</div>
					</td>
				</tr>
				<tr>
					<td align="right" style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;">
						<bean:message key="str3821"/>
					</td>
					<td align="left" style="background-color:#ffffff; color:#000000;  font-size:12px;">
						<div class="ping">
							<input name="end_date" type="text" id="end_date" value="<%=end_date%>" onfocus="setday(this);" size="10" />
							(yyyy-mm-dd)
						</div>
					</td>
				</tr>
				<tr>
					<td align="right" style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;">
						<bean:message key="str707"/>
					</td>
					<td align="left" style="background-color:#ffffff; color:#000000;  font-size:12px;">
						<div class="ping1">
							<input name="category_addr" type="text" value=<%=category_addr%> size="50">
						</div>
					</td>
				</tr>
				<tr>
					<td align="right" style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;">
						<bean:message key="str5300"/>
					</td>
					<td align="left" style="background-color:#ffffff; color:#000000;  font-size:12px;">
						<div class="ping1">
							<input name="remark" type="text" value="<%=remark%>" size="50">
						</div>
					</td>
				</tr>
				<input name="category_id" type="hidden" value="<%=category_id%>">
				<input name="cust_id" type="hidden" value="<%=cust_id%>">
				<input name="user_id" type="hidden" value="<%=user_id%>">
				<input name="trade_type_code" type="hidden" value="0887">
				<input name="rsrv_str1" id="rsrv_str1" type="hidden" value="0">
				<tr>
					<td height="30" colspan="2" align="center" style="background-color:#f6f6f6; color:#000000;  font-size:12px;">
						<input class="tjan" type="submit" value="" onClick=" return checkInfo()">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>

