<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="java.util.*"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="com.saas.biz.commen.ParamethodMgr"%>
<jsp:useBean id="bean" class="com.saas.biz.commen.commMethodMgr" scope="page"/>
<%@ page import="com.base.config.ProjectConfig"%>


<html>
<head>
<title>分类类型</title>
<style type="text/css" media="screen">
        .green {float:left;
        border-color: #485E00;
        border-style: solid;
        background-color: #F7FFDD;
        border-width: 1px;
        font-size: 12px;
        color: #485E00;
        font-family: 宋体;
        padding: 3px 3px;
        }
        .orange {float:left;
        border-color: #FF7300;
        border-style: solid;
        background-color: #FFF5D8;
        border-width: 1px;
        font-size: 12px;
        color: #000000;
        font-family: 宋体;
        padding: 3px 3px;
        }
</style>
<script src="/js/UrlEncode.js" language="jscript" type="text/jscript"></script>
<script src="/js/sale.js" language="jscript" type="text/jscript"></script>
<script language="javascript" src="/js/Calendar_Ly.js"></script>
<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/Hello.js'></script> 
<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/engine.js'></script>  
<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/util.js'></script> 
<script type='text/javascript' src='/js/hello.js'></script>
<script type='text/javascript'src='<%=request.getContextPath()%>/dwr/interface/Productclass.js'></script>
<script language="javascript">
window.onload=setOneClass;
function checkInfo()
{
	if (document.classForm.title.value == ""||document.classForm.title.value == null)
	{
		alert("商品名称不可以为空！");
		document.classForm.title.focus(); 
		return false;
	}
	if (document.classForm.content.value == ""||document.classForm.content.value == null)
	{
		alert("说明不可以为空！");
		document.classForm.content.focus(); 
		return false;
	}     
	if (document.classForm.sort1.value == "" ||document.classForm.content.value.length<1)
	{
		alert("请选择商品分类！");
		document.classForm.sort1.focus(); 
		return false;
	} 
	if (cTrim(document.classForm.start_date.value,0) == "" || document.classForm.start_date.value == null) 
	{                                                                                         
		alert("有效开始时间不可以为空！");                                                             
		document.classForm.start_date.focus();                                                    
		return false;                                                                            
	}                                                                                        
	if (cTrim(document.classForm.end_date.value,0) == "" || document.classForm.end_date.value == null) 
	{                                                                                         
		alert("有效截止时间不可以为空！");                                                             
		document.classForm.end_date.focus();                                                    
		return false;                                                                            
	}    
	if (document.classForm.sale_price.value == ""||document.classForm.sale_price.value == null)
	{
		alert("销售价格不可以为空！");
		document.classForm.sale_price.focus(); 
		return false;
	}
	else if(! isNum(document.classForm.sale_price.value))
	{
		alert("请输入正确的数字！");
		document.classForm.sale_price.focus(); 
		return false;
	}
	if (document.classForm.commodity_price.value == ""||document.classForm.commodity_price.value == null)
	{
		alert("原价不可以为空！");
		document.classForm.commodity_price.focus(); 
		return false;
	}
	else if(! isNum(document.classForm.commodity_price.value))
	{
		alert("请输入正确的数字！");
		document.classForm.commodity_price.focus(); 
		return false;
	}
	if (document.classForm.sale_addr.value == ""||document.classForm.sale_addr.value == null)
	{
		alert("销售地址不可以为空！");
		document.classForm.sale_addr.focus(); 
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
	String fbtime=new SimpleDateFormat("yyyy-MM-dd").format(new Date());
	String sale_id=bean.GenTradeId();
	ParamethodMgr paramCom=new ParamethodMgr();
	ArrayList  webList =paramCom.getCompareInfo("CRM","web_id");
%>
<form  name="classForm" method="post" action="/doTradeReg.do" target="_blank">
<table width="100%" border="0" cellpadding="5" cellspacing="1" align="center"  bgcolor="#dddddd" style="margin-top:10px;">
	    <tr>
		  <td align="right"  style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;">商品名称：</td>
		  <td align="left" style="background-color:#ffffff; color:#000000;  font-size:12px;"><div class="ping"><input name="title" type="text" maxlength="100"></div>
		  </td>
		</tr>
		<tr>
			 <td height="30" align="right"  style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;">行业类型：</td>
               <td align="left"  style="background-color:#ffffff; color:#000000;  font-size:12px;"><div class="ping1"><select name="web_id"  maxlength="25">
                  <%
					if(webList != null && webList.size()>0)
					{
						for(int i=0;i<webList.size();i++)
						{
							HashMap map=(HashMap)webList.get(i);
							String value=map.get("para_code1").toString();
							String name=map.get("para_code2").toString();
							%>
                               <option value="<%= value %>"><%= name %></option>
                               <%
						}
					} %>
                 </select>
                 </div>
                </td>
		</tr>
        <tr>
		  <td height="30" align="right"  style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;" valign="top">请选择分类</td>
              <td  align="left"  style="background-color:#ffffff; color:#000000;  font-size:12px;">
                <table border="0" cellpadding="0" cellspacing="0" style="margin-left:15px">
                  <tr>
                                <td style="background-color:#ffffff; color:#000000;  font-size:12px;">
									<select name="sort1" size="10" style="width: 130px"
										onChange="setSecondClass(this.value);"
										onclick="setTypeName(this)">
										<option selected value="0">
											请选择...
										</option>
									</select>
								</td>
								<td
									style="background-color:#ffffff; color:#000000; font-size:12px;">
									<select name="sort2" size="10" style="width: 130px; display: none"
										onChange="setTherdClass(this.value);"
										onclick="setTypeName(this)">
										<option value="0">
											请选择...
										</option>
									</select>
								</td>
								<td
									style="background-color:#ffffff; color:#000000;  font-size:12px;">
									<select name="sort3" size="10" style="width: 130px; display: none"
										onclick="setTypeName(this)"
										onchange="cretateSelect('4',this.value)">
										<option value="0">
											请选择...
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
							<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
								商品描述：
							</td>
							<td style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left>
								<div class="ping">
									<textarea name="content" style=display:none></textarea>
									<iframe ID=content src=/www/ewebeditor/ewebeditor.htm?id=content&style=coolblue frameborder=0 scrolling=no width=600 HEIGHT=350></iframe>
							</td>
						</tr>
				<tr>
		<tr>
		  <td align="right"  style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;">开始时间：</td>

		  <td align="left"  style="background-color:#ffffff; color:#000000;  font-size:12px;"><div class="ping1"><input name="start_date" type="text"    id="start_date" onfocus="setday(this);" size="15" />(yyyy-mm-dd)</div>

			</td>

		</tr>

		<tr>

		  <td align="right"  style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;">结束时间：</td>

		  <td align="left"  style="background-color:#ffffff; color:#000000;  font-size:12px;"><div class="ping1"><input name="end_date" type="text"   id="end_date" onfocus="setday(this);" size="15" />

			(yyyy-mm-dd)</div></td>

		</tr>

		<tr>

		  <td align="right"  style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;">价格：</td>

		  <td align="left"  style="background-color:#ffffff; color:#000000;  font-size:12px;"><div class="ping1"><input name="sale_price" type="text"></div>

		 </td>

		 <tr>

		  <td align="right"  style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;">原价：</td>

		  <td align="left"  style="background-color:#ffffff; color:#000000;  font-size:12px;"><div class="ping1"><input name="commodity_price" type="text"></div>

		 </td>

		 </tr>

		 <tr>

		   <td align="right"  style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;">价格类型：</td>

		   <td align="left"  style="background-color:#ffffff; color:#000000;  font-size:12px;">
<div class="ping1">
		   <select name="price_type"  maxlength="25">

		   <option value="0">正常价格</option>

			  <option value="1">打折价格</option>

			  </select>
</div>
		   </td>

		 </tr>

		 <tr>

		  <td align="right" style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;">销售地址：</td>

		  <td align="left" style="background-color:#ffffff; color:#000000;  font-size:12px;"><div class="ping1"><input name="sale_addr" type="text">

		 <input name="sale_id" type="hidden" value="<%=sale_id%>">
         <input name="trade_type_code" type="hidden" value="0213">
		 <input name="rsrv_str1" id="rsrv_str1" type="hidden" value="0">
</div>
		 </td>

		</tr>

		<tr>

			<td height="30" colspan="2" align="center"  style="background-color:#f6f6f6; color:#000000;  font-size:12px;">

			 <input class="tjan" type="submit" value="" onClick=" return checkInfo()">		  </td>

        </tr>

</table>

</form>

<script language="jscript" type="text/jscript">

	getSubitems(document.classForm.bigsort, "", "请选择...", "");

	getSubitems(document.classForm.sort1, "");

</script>

</body>

</html>

