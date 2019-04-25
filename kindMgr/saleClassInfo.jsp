<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="java.util.*"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="com.saas.biz.commen.ParamethodMgr"%>
<jsp:useBean id="bean" class="com.saas.biz.commen.commMethodMgr" scope="page"/><html>

<head>
<title>B2B management system</title>
<style type="text/css" media="screen">
.line6 {width:72spx; width:70spx!important;border:#ffcb99 1px solid;  background-color:#fff8ee; text-align:left; padding-left: 20px;padding-top: 10px;padding-bottom: 10px; color:#000000; margin-top:13px; margin-bottom:13px;}   /*������ʽ6---- ͷ������1*/
.line6 .img{width:53px; height:53px; float:left; margin-right:20px;}
.line6 .title {font-size:14px; font-weight:bold; color:#ff5400;}
.line1 {border-left:#ff7300 3px solid; background-color:#e2e2e2; color:#333333;text-align:left; font-size:12px;}  /*������ʽ1*/
</style>
		<link href="/style/css.css" rel="stylesheet" type="text/css"> 
		<script type='text/javascript'src='<%=request.getContextPath()%>/dwr/interface/Productclass.js'></script>
		<script type='text/javascript'src='<%=request.getContextPath()%>/dwr/engine.js'></script>
		<script type='text/javascript'src='<%=request.getContextPath()%>/dwr/util.js'></script>
<script src="/js/UrlEncode.js" language="jscript" type="text/jscript"></script>
<script src="/js/sale.js" language="jscript" type="text/jscript"></script>
<script language="javascript" src="/js/Calendar_Ly.js"></script>
<script language="javascript">
function checkInfo()
{
	if(document.classForm.class_name.value.replace(/\s*/g,"")=="" )
	{
		alert("The name of category  can not be empty ��");
		document.classForm.class_name.focus();
		return false;
	}
	 
  /*if(document.classForm.class_desc.value =="" || document.classForm.class_desc.value ==null)
	{
		alert("The Description  of category can not be empty��");
		document.classForm.class_desc.focus();
		return false;
	}*/ 
	if(document.getElementById("classlevel").value=="0"){
	    document.classForm.class_level.value="1";
		document.classForm.up_class_id.value="000000000000000";
	}
	return true;
}
function selectLevel(leveles)
{
     if(leveles=="5")
	 {
	   document.getElementById("typeInfo").style.display ="block";
	   setOneClass("5");
	 }
	 else
	{
	  document.getElementById("typeInfo").style.display ="none";
	} 	
}
//����һ������
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
	//���ö�������
	function setSecondClass(val)
	{
		var up_class_id=val;
		var type="5";
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
	//������������
	function setTherdClass(val)
	{
		var up_class_id=val;
		var type="5";
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
	function setTypeName(classId,leave)
	{
		document.classForm.class_level.value=leave;
		document.classForm.up_class_id.value=classId;
	}
	 //��̬�����¼�������Ϣ
	function cretateSelect(index,value)
	{
	 document.getElementById("nextElement").style.display="block";
	 document.getElementById("class_level").value=index;
	 var type=document.getElementById("class_type").value;
	 var divId=parseInt(index)+parseInt(1);
	 document.getElementById("index_s").value=index;
	 document.getElementById(index).innerHTML="<select name=sort"+index+" id=sort"+index+" onchange=cretateSelect("+divId+",this.value) size=3 onclick=setTypeName(this.value) style=width:130px></select><div id="+divId+"></div>";
	 DWRUtil.removeAllOptions("sort"+index);
	 Productclass.getProductClassByUpId(value,type,setNewSelect);
    }
    //�ص�����
     function setNewSelect(map_data){
      var id=document.getElementById("index_s").value;
       document.getElementById("class_level").value=id;
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
	String fbtime=new SimpleDateFormat("yyyy-MM-dd").format(new Date());
	String class_id=bean.GenTradeId();
	ParamethodMgr paramCom=new ParamethodMgr();
	ArrayList  webList =paramCom.getCompareInfo("CRM","web_id");
%>
<div class="line6">
   <div class="img"><img src="/images/icon3_manager_rightbody.gif" />
    </div>
    <span class="title">Attention</span><br />
      1��When the sale of information without the corresponding classification,you can add a new one��<br />
      2��You can increase the lower level classification ��                          
    </div>
	<form  name="classForm" method="post" action="/doTradeReg.do" target="_self">
     <table width="727" border="0" cellpadding="5" cellspacing="1" align="center"  bgcolor="#dddddd">
	    <tr>    
        <td  class="line1" align="left" colspan="2">New Category
        </td>
        </tr>
        <tr>
		  <td align="right"  style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;">Category</td>
		  <td align="left"  style="background-color:#ffffff; color:#000000;  font-size:12px;">
		        	��
			        <select name="classlevel" id="classlevel" style="width:100px" onChange="selectLevel(this.value)">
                  <option value="0">Main Categories </option>
                  <option value="5">Branch Categories</option>
              </select>
                   
		  </td>
	 </tr>
	 <tr id="typeInfo" style="display:none">
		  <td height="30" align="right"  style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;" valign="top">Please select main categories</td>
         <td  align="left"  style="background-color:#ffffff; color:#000000;  font-size:12px;">
          <table border="0" cellpadding="0" cellspacing="0">
             <tr>
								<td
									style="background-color:#ffffff; color:#000000;  font-size:12px;">
									<select name="sort1" size="10" style="width: 130px"
										onChange="setSecondClass(this.value);"
										onclick="setTypeName(this.value,'2')">
										<option selected value="0">
											Please select ...
										</option>
									</select>
								</td>
								<td
									style="background-color:#ffffff; color:#000000; font-size:12px;">
									<select name="sort2" size="10" style="width: 130px; display: none"
										onChange="setTherdClass(this.value);"
										onclick="setTypeName(this.value,'3')">
										<option value="0">
											Please select...
										</option>
									</select>
								</td>
								<td
									style="background-color:#ffffff; color:#000000;  font-size:12px;">
									<select name="sort3" size="10" style="width: 130px; display: none"
										onclick="setTypeName(this.value,'4')"
										onchange="cretateSelect('5',this.value)">
										<option value="0">
											Please select...
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
              </td>
		</tr>
		<tr>
		  <td align="right"  style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;">Category Name</td>
		  <td class="ping align="left"  style="background-color:#ffffff; color:#000000;  font-size:12px;">��
				 
						<input name="class_name" type="text" maxlength="100">
		  		 
		  </td>
		</tr>
		<tr>
			<td align="right"  style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;" valign="top">Category  Description</td>
			<td align="left"  style="background-color:#ffffff; color:#000000;  font-size:12px;">��
	                <textarea name="class_desc" cols="50" rows="6"></textarea>
	         </td>
        </tr>
		 <input name= "class_id" type="hidden" value="<%=class_id%>">
		 <input name= "enable_tag" type="hidden" value="0">
		 <input name="class_type" type="hidden" value="5">
		 <input type="hidden" name="up_class_id" id="up_class_id"  value="">
		 <input type="hidden" name="class_level" id="class_level"  value="">
		 <input name= "trade_type_code" type="hidden" value="0700">
		 <input name="rsrv_str" id="rsrv_str" type="hidden" value="">
		<!--tr>
			<td align="center"   style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;padding-top:10px;padding-bottom:10px;"  colspan=2>
			 <input type="submit" value="submit" onClick=" return checkInfo()">	
			</td>
    </tr-->
    <tr>
				<td height="30" colspan="2" align="center" style="background-color:#f6f6f6; color:#000000;  font-size:12px;">
					<input class="tjan" type="submit" value="" onClick=" return checkInfo()">
				</td>
		</tr>
</table>
</form>
</body>
</html>
