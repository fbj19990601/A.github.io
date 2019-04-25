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

<%@ page import="com.saas.biz.commen.commMethodMgr"%>



<%

 commMethodMgr commen = new commMethodMgr();
 String idx = commen.GenTradeId();

%>


<html>
<head>
<title><bean:message key="str116"/></title>
<link href="/style/css.css" rel="stylesheet" type="text/css">
<style type="text/css">
.line6 {width:72spx; width:70spx!important;border:#ffcb99 1px solid;  background-color:#fff8ee; text-align:left; padding-left: 20px;padding-top: 10px;padding-bottom: 10px; color:#000000; margin-top:13px; margin-bottom:13px;}   /*横栏样式6---- 头部提醒1*/
.line6 .img{width:53px; height:53px; float:left; margin-right:20px;}
.line6 .title {font-size:14px; font-weight:bold; color:#ff5400;}
.line1 {border-left:#ff7300 3px solid; background-color:#e2e2e2; color:#333333;text-align:left; font-size:13px; font-weight:bold; padding-left: 20px; padding-top: 5px;padding-bottom: 5px; }  /*横栏样式1*/
</style>

<script src="/js/UrlEncode.js" language="jscript" type="text/jscript"></script>

<script src="/js/sale.js" language="jscript" type="text/jscript"></script>

<script language="javascript" src="/js/Calendar_Ly.js"></script>
<script type='text/javascript'src='<%=request.getContextPath()%>/dwr/interface/Productclass.js'></script>
<script type='text/javascript'src='<%=request.getContextPath()%>/dwr/engine.js'></script>
<script type='text/javascript'src='<%=request.getContextPath()%>/dwr/util.js'></script>
<script type='text/javascript' src='/js/hello.js'></script>
<script type='text/javascript'src='<%=request.getContextPath()%>/dwr/interface/Productclass.js'></script>
<script language="javascript">
window.onload=setOneClass;


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
<body ><!--  onload="setOneClass()"-->
<%
	//String fbtime=new SimpleDateFormat("yyyy-MM-dd").format(new Date());
	String repository_id=bean.GenTradeId();
	ParamethodMgr paramCom=new ParamethodMgr();
	ArrayList  webList =paramCom.getCompareInfo("B2B","web_id");
	ArrayList reposeTypeList=paramCom.getCompareInfo("B2B","repository_type");
%>
<form name="classForm" action="/doTradeReg.do" method="post" target="_self">
  <table width="727" border="0" cellspacing="0" cellpadding="0">
       <tr>
          <td height="2"></td>
       </tr>
       <tr>
       <td><table width=727 border=0 cellpadding=5 cellspacing=1 align=center bgcolor="#dddddd">
		 <tr>
            <td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;"  align=right><bean:message key="str2668"/></td>
            <td style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left>
                <input name="title" type="text" size=50 maxlength=50>
            </td>
          </tr>
		  <tr>
			 <td height="30" align="right"  style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;" ><bean:message key="str4392"/></td>
               <td align="left"  style="background-color:#ffffff; color:#000000;  font-size:12px;">
                <select name="web_id"  maxlength="25">
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
               </td>
		  </tr>
          <tr>
            <td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;"  align=right><bean:message key="str2662"/></td>
            <td style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left>
              <select id=repository_type name=repository_type>
                     <%
						if(reposeTypeList != null && reposeTypeList.size()>0)
						{
							for(int i=0;i<reposeTypeList.size();i++)
							{
								HashMap map=(HashMap)reposeTypeList.get(i);
								String value=map.get("para_code1").toString();
								String name=map.get("para_code2").toString();
								%>
	                               <option value="<%= value %>"><%= name %></option>
	                               <%
							}
						} %>
              </select>
            </td>
          </tr>
          <tr>
		      <td height="30" align="right"  style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;"  valign=top><bean:message key="str2663"/></td>
              <td align="left"  style="background-color:#ffffff; color:#000000;  font-size:12px;">
                <table>
                    <tr>
                               <td style="background-color:#ffffff; color:#000000;  font-size:12px;">
									<select name="sort1" size="10" style="width: 130px"
										onChange="setSecondClass(this.value);"
										onclick="setTypeName(this)">
										<option selected value="0">
											<bean:message key="str5307"/>
										</option>
									</select>
								</td>
								<td
									style="background-color:#ffffff; color:#000000; font-size:12px;">
									<select name="sort2" size="10" style="width: 130px; display: none"
										onChange="setTherdClass(this.value);"
										onclick="setTypeName(this)">
										<option value="0">
											<bean:message key="str5307"/>
										</option>
									</select>
								</td>
								<td
									style="background-color:#ffffff; color:#000000;  font-size:12px;">
									<select name="sort3" size="10" style="width: 130px; display: none"
										onclick="setTypeName(this)"
										onchange="cretateSelect('4',this.value)">
										<option value="0">
											<bean:message key="str5307"/>
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
            <td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;"  align=right  valign=top><bean:message key="str2664"/></td>
            <td style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left>
                <textarea name="content" style=display:none></textarea>
                <iframe ID=content src=/www/ewebeditor/ewebeditor.htm?id=content&style=coolblue&root_id=<%=repository_id%>  frameborder=0 scrolling=no width=600 HEIGHT=350></iframe>
            </td>
          </tr>
          
          <tr>

			 <td  style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
				  		<bean:message key="str3937"/>
		     </td>

			 <td bgcolor="#FFFFFF">

			    <div class="ping1">

				<input name="path" id="path" type="hidden" size=40 value="<%=idx%>">

		        <iframe id="saveImag" name="saveImag" style="margin-top:2px" frameborder="0" scrolling="no" hspace="0" WIDTH="330" HEIGHT="25" src="/inc/saveImage.jsp?root_id=<%=idx%>"></iframe>

	           </div>

	         </td>

		  </tr>
				    
		   <input type="hidden"name="idx" value="<%=idx%>">
          
           <input name="repository_id" type="hidden" value=<%=repository_id%>>
           <input name="trade_type_code" type="hidden" value=0271>
           <input name="root_id" type="hidden" value=<%=repository_id%>>
           <input name="class_id" id="class_id" type="hidden" value="">
           <input name="class_name" id="class_name" type="hidden" value="">
           <input name="class_name_grp" id="class_name_grp" type="hidden" value="">
           <input name="class_id_grp" id="class_id_grp" type="hidden" value="">
           <input name="count" id="count" type="hidden" value="sort1">
           <input name="rsrv_str1" id="rsrv_str1" type="hidden" value="0">
           <tr>
            <td  style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px; padding-top:10px;padding-bottom:10px;" align=center colspan=2>
            <input name="submit1" type="button" value="提 交"  onclick="confirmsub(classForm)">
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
