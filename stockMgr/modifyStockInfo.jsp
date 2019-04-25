<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.saas.biz.stockorderMgr.Stockorderinfo"%>
<%
	String date = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
	String stock_id = "";
	String title = "";
	String content = "";
	String stock_addr = "";
	String start_date = date;
	String end_date = date;
	if (request.getParameter("stock_id") != null) {
		stock_id = request.getParameter("stock_id");
	}
	Stockorderinfo stockObj = new Stockorderinfo();
	ArrayList stockList = new ArrayList();
	if (stock_id != null && !stock_id.equals("")) {
		stockList = stockObj.genOneStockorder(stock_id);
		if (stockList != null && stockList.size() > 0) {
			HashMap map = (HashMap) stockList.get(0);
			stock_id = map.get("stock_id").toString();
			if (map.get("title") != null) {
		title = map.get("title").toString();
			}
			if (map.get("content") != null) {
		content = map.get("content").toString();
			}
			if (map.get("stock_addr") != null) {
		stock_addr = map.get("stock_addr").toString();
			}
			if (map.get("start_date") != null) {
		start_date = map.get("start_date").toString();
		if (start_date.length() > 10) {
			start_date = start_date.substring(0, 10);
		}
			}
			if (map.get("end_date") != null) {
		end_date = map.get("end_date").toString();
		if (end_date.length() > 10) {
			end_date = end_date.substring(0, 10);
		}
			}
		}
	}
	
	HttpSession sesion = request.getSession();
	String user_id = (String) sesion.getAttribute("SESSION_USER_ID");
%>
<html>
	<head>
		<title><bean:message key="str190"/></title>
		<link href="/style/layout.css" rel="stylesheet" type="text/css">
		<script language="javascript" src="/js/Calendar_Ly.js"></script>
		<link href="/style/layout.css" rel="stylesheet" type="text/css">
		<link href="/style/daohang.css" rel="stylesheet" type="text/css">
		<link href="/style/manager.css" rel="stylesheet" type="text/css">
		<link href="/style/css.css" rel="stylesheet" type="text/css">
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/engine.js'></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/util.js'></script>
		<script type='text/javascript' src='/js/hello.js'></script>
		<script type="text/javascript" src="/js/public_b2b.js"></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/Productclass.js'></script>
		<script language="JavaScript">
    function checkValue()
	  {
	  	 if(document.getElementById("title").value.replace(/\s*/g,"")=="" )
				{
					alert("采购主题不可以为空!!!");
					document.getElementById("title").focus();
					return false;
				}
				
	  	  var str=content.getHTML();
				str=str.replace(/\s*/g,""); 
				if(str == ""  )
				{
					alert("请填写采购说明！");
					return false;
				}
		    if(document.getElementById("start_date").value.replace(/\s*/g,"")=="" )
				{
					alert("开始日期不能为空!!!");
					document.getElementById("start_date").focus();
					return false;
				}
				if(document.getElementById("end_date").value.replace(/\s*/g,"")=="" )
				{
					alert("结束日期不能为空!!!");
					document.getElementById("end_date").focus();
					return false;
				}
                                //////////////////判断时间是否合理////////////////
		                if(!checkDate(document.getElementById("start_date").value,document.getElementById("end_date").value)){
		                         return false;
		                 }
		                ///////////////////////////////////////////////
				if(document.getElementById("stock_addr").value.replace(/\s*/g,"")=="" )
				{
						alert("采购地点不可以为空! ");
						document.getElementById("stock_addr").focus();
						return false;
		                 }
				if (document.classForm.sort1.value == "")
				{
					alert("请选择采购分类！");
					document.classForm.sort1.focus(); 
					return false;
				} 
		  
 	      return true;
	   }
    	function exit()
    	{
    	    window.close();
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
		var idx=obj.value;
		document.getElementById("class_id").value=idx;
		document.getElementById("class_name").value=DWRUtil.getText(obj.name);
		document.getElementById("count").value=obj.name;
	}
	 //动态生成下级分类信息
	function cretateSelect(index,value)
	{
	 document.getElementById("nextElement").style.display="block";
	 var type="4";
	 document.getElementById("rsrv_str1").value="3";
	 var divId=parseInt(index)+parseInt(1);
	 document.getElementById("index_s").value=index;
	 document.getElementById(index).innerHTML="<select name=sort"+index+" id=sort"+index+" onchange=cretateSelect("+divId+",this.value) size=3 onclick=setTypeName(this) style=width:130px></select><div id="+divId+"></div>";
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
	<body onload="setOneClass()">

		<form name=form1 action=/doTradeReg.do method=post target="_self">
			<table width="725" border=0 cellpadding=5 cellspacing=1 align=center bgcolor="#dddddd">
				<tr>
					<td class="line1" align="left" colspan="2">
						<bean:message key="str383"/>
						<input type=hidden name=trade_type_code value=0343>
						<input type=hidden name=stock_id value="<%=stock_id%>">
					</td>
				</tr>
				<tr>
				</tr>
				<tr>
					<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;" align=right width="15%">
						<bean:message key="str3817"/>
					</td>
					<td style="background-color:#ffffff; color:#000000;  font-size:12px; padding:3px 5px;" align=left width="85%">
						<div class="ping">
							<input type=text name=title value=<%=title%> maxlength="100">
						</div>
					</td>
				</tr>
				<tr>
					<td height="30" align="right" style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;" valign="top">
						<bean:message key="str4089"/>
					</td>
					<td align="left" style="background-color:#ffffff; color:#000000;  font-size:12px;">
						<div class="ping1">
							<table border="0" cellpadding="0" cellspacing="0" style="margin-left:15px">
								<tr>
									<td style="background-color:#ffffff; color:#000000;  font-size:12px;">
										<select name="sort1" id="sort1" size="10" onChange="setSecondClass(this.value);" onclick="setTypeName(this)">
											<option selected value="0">
												<bean:message key="str160"/>
											</option>
										</select>
									</td>
									<td style="background-color:#ffffff; color:#000000; font-size:12px;">
										<select name="sort2" size="10" style="width: 130px; display: none" onChange="setTherdClass(this.value);" onclick="setTypeName(this)">
											<option value="0">
												<bean:message key="str160"/>
											</option>
										</select>
									</td>
									<td style="background-color:#ffffff; color:#000000;  font-size:12px;">
										<select name="sort3" size="10" style="width: 130px; display: none" onclick="setTypeName(this)" onchange="cretateSelect('4',this.value)">
											<option value="0">
												<bean:message key="str160"/>
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
					<td align="right" style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;" valign="top">
						<bean:message key="str384"/>
					</td>
					<td align="left" style="background-color:#ffffff; color:#000000;  font-size:12px;">
						<div class="ping">
							<textarea name="content" style=display:none>
								<%=content%>
							</textarea>
							<iframe ID=content src=/www/ewebeditor/ewebeditor.htm?id=content&style=coolblue&root_id=<%=stock_id%> frameborder=0 scrolling=no width=600 HEIGHT=350></iframe>
						</div>
					</td>
				</tr>
				<tr>
					<td align=right style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;">
						<bean:message key="str385"/>
					</td>
					<td align=left style="background-color:#ffffff; color:#000000;  font-size:12px;">
						<div class="ping1">
							<iframe src="/inc/uploadImg.jsp?root_id=<%=stock_id%>" width="100%" height="180px" marginwidth="0"  frameborder=0 marginheight="0" scrolling="no"></iframe>
						</div>
					</td>
				</tr>
				<tr>
					<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;" align=right>
						<bean:message key="str705"/>
					</td>
					<td style="background-color:#ffffff; color:#000000;  font-size:12px; padding:3px 5px;" align=left>
						<div class="ping">
							<input name="start_date" id="start_date" type="text" size="10" value="<%=start_date%>" onfocus="setday(this);">
							(yyyy-MM-dd)
						</div>
					</td>
				</tr>
				<tr>
					<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;" align=right>
						<bean:message key="str706"/>
					</td>
					<td style="background-color:#ffffff; color:#000000;  font-size:12px; padding:3px 5px;" align=left>
						<div class="ping">
							<input name="end_date" id="end_date" type="text" size="10" value="<%=end_date%>" onfocus="setday(this);">
							(yyyy-MM-dd)
						</div>
					</td>
				</tr>
				<tr>
					<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;" align=right>
						<bean:message key="str3827"/>
					</td>
					<td style="background-color:#ffffff; color:#000000;  font-size:12px; padding:3px 5px;" align=left>
						<div class="ping">
							<input type="text" name="stock_addr" value="<%=stock_addr%>" size="30" maxlength="100"><bean:message key="str3828"/>
						</div>
						<input name="rsrv_str1" id="rsrv_str1" type="hidden" value="0">
						<input name="root_id" id="root_id" type="hidden" value="<%=stock_id%>">
						<input name="user_id" id="user_id" type="hidden" value="<%=user_id%>">
						<input name="stock_id" id="stock_id" type="hidden" value="<%=stock_id%>">
						<input name="trade_type_code" type="hidden" value="0233">
						<input name="class_id" id="class_id" type="hidden" value="">
						<input name="class_name" id="class_name" type="hidden" value="">
						<input name="class_name_grp" id="class_name_grp" type="hidden" value="">
						<input name="class_id_grp" id="class_id_grp" type="hidden" value="">
						<input name="count" id="count" type="hidden" value="sort1">
					</td>
				</tr>
				<tr>
					<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px; padding-top:10px;padding-bottom:10px;" align="center" colspan="2">
						<input class="xgan" name=submit1 type=submit value="" onclick="return checkValue()">
					</td>
				</tr>
			</table>
	</body>
</html>
