<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"

"http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.saas.biz.advertiseMgr.AdvertiseInfo"%>
<jsp:useBean id="bean" class="com.saas.biz.commen.ParamethodMgr" scope="page" />
<%
    String adv_id="";
    String content="";
    String show_no="";
    String adv_type="";
    String own_range="";
    if(request.getParameter("adv_id")!=null){
      adv_id=request.getParameter("adv_id");
    }
    SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd");
	String start_date = format.format(new Date());
	Calendar cal=Calendar.getInstance();
	cal.add(Calendar.MONTH,3);
	String end_date=format.format(cal.getTime());
	 AdvertiseInfo adverObj=new AdvertiseInfo();
     ArrayList advertList=adverObj.genOneAdvertise(adv_id);
	 if(advertList!=null && advertList.size()>0){
	   HashMap map=(HashMap)advertList.get(0);
	   if(map.get("content")!=null){content=map.get("content").toString();}
       if(map.get("show_no")!=null){ show_no=map.get("show_no").toString();}
       if(map.get("own_range")!=null){own_range=map.get("own_range").toString();}
       if(map.get("adv_type")!=null){adv_type=map.get("adv_type").toString();}
       if(map.get("start_date")!=null){start_date=map.get("start_date").toString();
       if(start_date.length()>10)
         {
           start_date=start_date.substring(0,10);
         }
       }
       if(map.get("end_date")!=null)
       {
         end_date=map.get("end_date").toString();
         if(end_date.length()>10)
         {
           end_date=end_date.substring(0,10);
         }
       }
	 }
	 adv_type = bean.getItemsBySelected("11",adv_type);
	 own_range = bean.getItemsBySelected("109",own_range);
%>
<html>
	<head>
		<title><bean:message key="str150"/></title>
		<link href="/style/css.css" rel="stylesheet" type="text/css">
		<style type="text/css">
		 form {padding:0px; margin:0px;}
		.line6 {width:72spx; width:70spx!important;border:#ffcb99 1px solid;  background-color:#fff8ee; text-align:left; padding-left: 20px;padding-top: 10px;padding-bottom: 10px; color:#000000; margin-top:13px; margin-bottom:13px;}   /*横栏样式6---- 头部提醒1*/
		.line6 .img{width:53px; height:53px; float:left; margin-right:20px;}
		.line6 .title {font-size:14px; font-weight:bold; color:#ff5400;}
		.line1 {border-left:#ff7300 3px solid; background-color:#e2e2e2; color:#333333;text-align:left; font-size:13px; font-weight:bold; padding-left: 20px; padding-top: 5px;padding-bottom: 5px; }  /*横栏样式1*/
		</style>
		<link href="/style/layout.css" rel="stylesheet" type="text/css">
		<link href="/style/daohang.css" rel="stylesheet" type="text/css">
		<link href="/style/manager.css" rel="stylesheet" type="text/css">
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/ParamethodMgr.js'></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/engine.js'></script>
		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/util.js'></script>
		<script type="text/javascript" src="/js/prototype.js"></script>
		<script language="javascript" src="/js/Calendar_Ly.js"></script>
		<script language="JavaScript">
    	 function confirmsub()
    	 {
    	    var adv_type=$F("adv_type");
    	    if (adv_type=="" || adv_type==null) 
			{                                                                                         
				alert("选择广告类型！");                                                             
				$("adv_type").focus();                                                    
				return false;                                                                            
			}                                                                                      
            var own_range=$F("own_range");
			if (own_range =="" || own_range==null) 
			{                                                                                         
				alert("选择出现的范围！");                                                             
				$("own_range").focus();                                                    
				return false;                                                                            
			}
			var no=$F("show_no");
			var oldNo=$F("adv_no");
			if(no!=oldNo){
			  if(window.confirm("广告出现的位置("+no+")与修改前("+oldNo+")不一置，是否确认要修改？")){
			    return true;
			  }else{
			    return false;
			  }
			}
			if(content.getHTML()== "")
			{
				alert("内容不可以为空！");  
				return false;     
			}
    	       return true;         
    	   }
    	  function setShowNo(no){
           if(no =="" || no ==null){
             alert("请选择投放广告的频道！");
           }else{
             ParamethodMgr.getAdvertiseNumber('109',no,createShowNo);
           }
         }
         function createShowNo(num){
            var array=new Array();
            DWRUtil.removeAllOptions("show_no");
            var hashmap=new Hash();
            for(var i=1;i<=num;i++){
             hashmap.set(i,i);
            }
            DWRUtil.addOptions("show_no",hashmap.values());
         }
  </script>
	</head>
	<body>
		<form name="formQuery" id="formQuery" action=/doTradeReg.do method="post" target="_self">
			<table width=727 border=0 cellpadding=5 cellspacing=1 align=center bgcolor="#e7e7e7">
				<tr>
				 <td colspan="2"style="background-color:#ffffff; color:#000000;  font-size:12px;">&nbsp;</td>
				</tr>
				<tr>
					<td width="100" align=right style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;">
						<bean:message key="str1018"/>
						<input name=adv_id type=hidden value="<%=adv_id%>">
						<input name=trade_type_code type=hidden value=0918>
					</td>
					<td width="604" align=left style="background-color:#ffffff; color:#000000;  font-size:12px;">
						<div class="ping">
							<select name=adv_type>
							    <option value=""><bean:message key="str1019"/></option>
								<%=adv_type%>
							</select>
						</div>
					</td>
				</tr>
				<tr>
					<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
						<bean:message key="str1020"/>
					</td>
					<td style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left>
						<div class="ping">
							<select name="own_range" onchange="setShowNo(this.value)">
								<%=own_range%>
							</select>
						</div>
					</td>
				</tr>
				<tr>
					<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>
						<bean:message key="str3919"/>
					</td>
					<td style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left>
						<div class="ping">
						  <select id="show_no" name="show_no">
						    <option value="<%=show_no%>"><%=show_no%></option>
						  </select>
						</div>
						<input type="hidden" name="adv_no" id="adv_no" value="<%=show_no%>">
					</td>
				</tr>
				<tr>
					<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align="right" valign="middle">
						<bean:message key="str3920"/>
					</td>
					<td style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left>
						<div class="ping">
							<textarea name=content style=display:none><%=content%></textarea>
							<iframe id="content" src="/www/ewebeditor/ewebeditor.htm?id=content&style=coolblue&root_id=<%=adv_id%>" frameborder=0 scrolling=no width=600 height=350></iframe>
					</td>
				</tr>
				<tr>
					<td align="right" style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;">
						<bean:message key="str162"/>
					</td>
					<td align="left" style="background-color:#ffffff; color:#000000;  font-size:12px;">
						<div class="ping1">
							<input name="start_date" id="start_date" type="text" value="<%=start_date%>" onfocus="setday(this);" style="width:93px">(yyyy-mm-dd)
						</div>
					</td>
				</tr>
				<tr>
					<td align="right" style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;">
						<bean:message key="str163"/>
					</td>
					<td align="left" style="background-color:#ffffff; color:#000000;  font-size:12px;">
						<div class="ping1">
							<input name="end_date" id="end_date" type="text" value="<%=end_date%>" onfocus="setday(this);" style="width:93px">(yyyy-mm-dd)
						</div>
					</td>
				</tr>
				<tr>
					<td height="30" colspan="2" align="center" style="background-color:#f6f6f6; color:#000000;  font-size:12px;">
						<input class="xgan" type="submit" value="" onClick=" return confirmsub()">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
