<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="java.util.*"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="com.base.config.ProjectConfig"%>
<html>
	<head>
		<title><bean:message key="str116"/></title>
		<style type="text/css" media="screen">
.line6 {width:72spx; width:70spx!important;border:#ffcb99 1px solid;  background-color:#fff8ee; text-align:left; padding-left: 20px;padding-top: 10px;padding-bottom: 10px; color:#000000; margin-top:13px; margin-bottom:13px;}   /*横栏样式6---- 头部提醒1*/
.line6 .img{width:53px; height:53px; float:left; margin-right:20px;}
.line6 .title {font-size:14px; font-weight:bold; color:#ff5400;}
.line1 {border-left:#ff7300 3px solid; background-color:#e2e2e2; color:#333333;text-align:left; font-size:12px;}  /*横栏样式1*/
</style>
		<link href="/style/css.css" rel="stylesheet" type="text/css">
		<script src="/js/UrlEncode.js" language="jscript" type="text/jscript"></script>
		<script src="/js/modifyType.js" language="jscript" type="text/jscript"></script>
		<script language="javascript" src="/js/Calendar_Ly.js"></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/Productclass.js'></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/engine.js'></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/util.js'></script>
		<script language="javascript">
		function setTypeName(classId)
		{
			var class_id=classId;
			document.getElementById("class_id").value="";
			if(class_id!=null && class_id.length>10)
			{
			    document.classForm.class_id.value=class_id;
				Productclass.getclassByClassId(class_id,setClassNameAndDesc);
			}
			else
		    {
		    	document.classForm.class_name.value="";
			    document.classForm.class_desc.value="";
		    }
		}
		
		function setClassNameAndDesc(classInfo){
			document.classForm.class_name.value=classInfo['class_name'];
			document.classForm.class_desc.value=classInfo['class_desc'];
		}
		
		function checkInfo()
		{
			
			if(document.classForm.class_type.value  == "0" )
			{
				alert("请选择分类类型！");
				document.classForm.class_type.focus;
				return false;
			} 
			if(document.classForm.class_name.value.replace(/\s*/g,"") == "" )
			{
				alert("请选择分类名称！");
				document.classForm.class_name.focus;
				return false;
			} 
				/*if(document.classForm.class_desc.value=="")
				{
					alert("分类型说明不能为空！");
					document.classForm.class_desc.focus;
					return false;
				}*/
			document.getElementById("trade_type_code").value="0811";
			return true;
		}
		
		function deleteInfo()
		{
			 if(document.classForm.class_type.value  == "0" )
			{
				alert("请选择分类类型！");
				document.classForm.class_type.focus;
				return false;
			} 
			if(document.classForm.class_name.value.replace(/\s*/g,"") == "" )
			{
				alert("请选择分类名称！");
				document.classForm.class_name.focus;
				return false;
			} 
				
			var idx=document.getElementById("class_id").value.replace(/\s*/g,"");
		  if(idx!="")
		  {
		  	 Productclass.checkChildren(idx,checkChildren);
		  }
		  	
			document.getElementById("trade_type_code").value="0812"; 
			return true;
		}
		function checkChildren(data)
		{
		   var hasChildren=data;
		   if(hasChildren=="0")
		   {
		    document.getElementById("trade_type_code").value="0812";
		    document.classForm.submit();
		   }
		   else
		   {
		    alert("不能删除该分类！\n如果确定要删除该分类，请先删除其子分类！");
		    
		   }
		   return false;
		}
	//设置一级分类
	function setOneClass(val)
	{
		var type=val;
		if(type!="0")
		{
		 document.getElementById("typeInfo").style.display="block";
		 Productclass.getProductClassByUpId("000000000000000",type,setSort1);
		}
		else
		{
		 document.getElementById("typeInfo").style.display="none";
		 document.classForm.class_name.value="";
		 document.classForm.class_desc.value="";
		}
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
		var type=document.getElementById("class_type").value;
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
	    	document.getElementById("nextElement").style.display="none"; 
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
		var type=document.getElementById("class_type").value;
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
	
   //动态生成下级分类信息
	function cretateSelect(index,value)
	{
	 document.getElementById("nextElement").style.display="block";
	 var type=document.getElementById("class_type").value;
	 var divId=parseInt(index)+parseInt(1);
	 document.getElementById("index_s").value=index;
	 document.getElementById(index).innerHTML="<select name=sort"+index+" id=sort"+index+" onchange=cretateSelect("+divId+",this.value) size=3 onclick=setTypeName(this.value) style=width:130px></select><div id="+divId+"></div>";
	 DWRUtil.removeAllOptions("sort"+index);
	 Productclass.getProductClassByUpId(value,type,setNewSelect);
  }
    //回调函数
     function setNewSelect(map_data)
     {
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
			<bean:message key="str636"/>
		<div class="line6">
			<div class="img">
				<img src="/images/icon3_manager_rightbody.gif" />
			</div>
			<span class="title"><bean:message key="str637"/></span>
			<br />
			<bean:message key="str638"/>
			<br />
			<bean:message key="str639"/>
		</div>
		<form name="classForm" method="post" action="/doTradeReg.do" target="_self">
			<table width="727" border="0" cellpadding="5" cellspacing="1"
				align="center" bgcolor="#dddddd">
				<tr>
					<td align="right" style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;">
						<bean:message key="str640"/>
					</td>
					<td align="left" style="background-color:#ffffff; color:#000000;  font-size:12px;">
						<div class="ping">
						<select name="class_type" id="class_type" style="width:100px" onChange="setOneClass(this.value)">
							<option value="0">
								<bean:message key="str641"/>
							</option>
							<option value="3">
								<bean:message key="str642"/>
							</option>
							<option value="5">
								<bean:message key="str643"/>
							</option>
							<option value="4">
								<bean:message key="str644"/>
							</option>
							<option value="2">
								<bean:message key="str645"/>
							</option>
							<option value="1">
								<bean:message key="str646"/>
							</option>
							<!--option value="8">
								知识库分类
							</option-->
						</select>
					</div>
					</td>
				</tr>
				<tr id="typeInfo" style="display:none">
					<td height="30" align="right" style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;" valign="top">
						<bean:message key="str630"/>
					</td>
					<td align="left" style="background-color:#ffffff; color:#000000;  font-size:12px;">
						<div class="ping">
						<table border="0" cellpadding="0" cellspacing="0">
							<tr>
								
									<td style="background-color:#ffffff; color:#000000;  font-size:12px;">
									<select name="sort1" id="sort1" size="10" style="width: 130px" onChange="setSecondClass(this.value);" onclick="setTypeName(this.value)">
										<option selected value="0">
											<bean:message key="str318"/>
										</option>
									</select>
								</td>
								<td style="background-color:#ffffff; color:#000000; font-size:12px;">
									<select name="sort2" id="sort2"  size="10" style="width: 130px; display: none" onChange="setTherdClass(this.value );" onclick="setTypeName(this.value)">
										<option value="0">
											<bean:message key="str318"/>
										</option>
									</select>
								</td>
								<td
									style="background-color:#ffffff; color:#000000;  font-size:12px;">
									<select name="sort3" size="10" id="sort3"  style="width: 130px; display: none" onclick="setTypeName(this.value);" onchange="cretateSelect('4',this.value)" >
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
					<td align="right" style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;">
						<bean:message key="str647"/>
					</td>
					<td align="left" style="background-color:#ffffff; color:#000000;  font-size:12px;">
						<div class="ping">
							<input name="class_name" type="text" maxlength="100">
						</div>
					</td>
				</tr>
				<tr>
					<td align="right" style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;" valign="top">
						<bean:message key="str648"/>
					</td>
					<td align="left"
						style="background-color:#ffffff; color:#000000;  font-size:12px;">
						<textarea name="class_desc" cols="50" rows="6"></textarea>
					</td>
				</tr>
				<input name= "class_id" id="class_id" type="hidden" value="">
				<input name= "trade_type_code" id="trade_type_code" type="hidden" value="">
				 
				<tr>
					<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px; padding-top:10px;padding-bottom:10px;" align=center colspan=2>
						<input class="xgan" name="bnt" type="submit" value=""  onclick="return checkInfo()">
						<input class="scan" name="bnt" type="submit" value=""  onclick="return deleteInfo()">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
