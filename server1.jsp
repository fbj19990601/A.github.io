<%@ page contentType="text/html; charset=gbk" language="java"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<jsp:useBean id="param" scope="page" class="com.saas.biz.commen.ParamethodMgr"></jsp:useBean>
<jsp:useBean id="server" scope="page" class="com.saas.biz.serverMgr.ServerInfo"></jsp:useBean>
<%@ page import="java.util.*" %>
<HTML>
<head>
<title><bean:message key="str4471"/></title>
<link href="/css/layout.css" rel="stylesheet" type="text/css">
    <link href="/css/daohang.css" rel="stylesheet" type="text/css">
    <link href="/css/manager.css" rel="stylesheet" type="text/css">
    <script src="/www/fuction/calendar.js" type="text/javascript"></script>
    <script language="JavaScript" src="/www/fuction/public.js"></script>
    <script type='text/javascript' src='<%=request.getContextPath()%>/dwr/engine.js'></script>
    <script type='text/javascript' src='<%=request.getContextPath()%>/dwr/util.js'></script>
    <script type="text/javascript">
    function checkInfo(){
    if(document.getElementById("v_rcvaddr").value==""){
      alert("地址不能为空！");
      document.getElementById("v_rcvaddr").focus();
      return false;
    }   
    if(document.getElementById("v_rcvtel").value==""){
      alert("电话不能为空！");
      document.getElementById("v_rcvtel").focus();
      return false;
    }  
    if(document.getElementById("v_orderemail").value==""){
      alert("邮件地址不能为空！");
      document.getElementById("v_orderemail").focus();
      return false;
    }else {
      var regexp=/^[a-zA-Z0-9_]{2,25}[@][a-zA-z0-9-]{1,100}[.]([a-zA-Z]{2,4}|[a-zA-Z]{2,4}[.][a-zA-Z]{2})$/g;
      if(!regexp.test(document.getElementById("v_orderemail").value)){
         alert("请输入合法的邮件地址！");
         document.getElementById("v_orderemail").focus();
        return false;
      }
    }  
    sumInfo();
    var sums=parseFloat(document.getElementById("v_amount").value);
    if(parseFloat(sums)==0.0){
      alert("请选择你订购的服务！");
      return false;
    }
    return true;
   }
   function sumInfo(){
      var timeArray =new Array();
      	timeArray[1]=document.getElementById("b2b").value;
      	timeArray[2]=document.getElementById("com").value;
      	timeArray[3]=document.getElementById("oa").value;
      	timeArray[4]=document.getElementById("bss").value;
      	timeArray[5]=document.getElementById("hrm").value;
      	timeArray[6]=document.getElementById("crm").value;
      var nameArray =new Array();
      	nameArray[1]="b2b";
      	nameArray[2]="com";
      	nameArray[3]="oa";
      	nameArray[4]="bss";
      	nameArray[5]="hrm";
      	nameArray[6]="crm";
      var sum="0.0",name="";
      for(var i=1;i<7;i++){
        var id="check"+i;
        var sev="sev"+i;
        if(document.getElementById(id).checked){
           sum=parseFloat(sum)+(parseFloat(document.getElementById(sev).value)*timeArray[i]);
           name=name+nameArray[i]+"|";
        }
      }   
      document.getElementById("v_amount").value=sum;
      document.getElementById("server_name").value=name;
   }
</script>
</head>
<body>
<%
 String cust_id="",server_id="",cust_name="";
 HttpSession sesion=request.getSession();
 if(sesion.getAttribute("SESSION_CUST_ID")!=null){
   cust_id=(String)sesion.getAttribute("SESSION_CUST_ID");
 }
 if(sesion.getAttribute("SESSION_USER_NAME")!=null){
   cust_name=(String)sesion.getAttribute("SESSION_USER_NAME");
 }
// ArrayList comList=param.getCompareInfoByAttr("41");
 ArrayList servList=server.getServersByCustId(cust_id,"0");
 if(servList !=null && servList.size()>0){
     HashMap map=(HashMap)servList.get(0);
     server_id=map.get("server_id").toString();
 }
%>
<TABLE cellSpacing=0 cellPadding=0 width=760 align=center bgColor=#FFFFFF border=0>
<tr><!-- 头部 -->
    <td  align="center">
        <div class="container">
            <div id="manager_top"><div id="manager_logo"><a href="/" target="_top">
                <img src="/images/manager_logo.gif" width="270" height="73" border="0"></a>
	        </div>
            <div id="manager_nav">
                <div class="mid1_left_frame">
                    <TABLE id=secTable cellSpacing=0 cellPadding=0 width=300 border=0 class="css3">
                                <TBODY>
                                <TR align=middle height=23>
                                <TD class=sec2 onmousedown=secBoard(0)><bean:message key="str4472"/></TD> 
                                <TD class=sec1 onmousedown=secBoard(1)><bean:message key="str4473"/></TD>
                                <TD class=sec1 onmousedown=secBoard(2)><bean:message key="str4474"/></TD>    
                                <TD class=sec1 onmousedown=secBoard(3)><bean:message key="str4475"/></TD>      
                                <TD class=sec1 onmousedown=secBoard(4)><bean:message key="str4476"/></TD>      
                                </TR></TBODY></TABLE>
                                <TABLE class=main_tab id=mainTable cellSpacing=0
                                cellPadding=0 width=300 border=0>
                                <!--关于TBODY标记-->
                                <TBODY style="DISPLAY: block">
                                <TR>
                                <TD vAlign=top>
                                <TABLE cellSpacing=0 cellPadding=0  border=0 bgcolor="">
                                <TBODY>
                                <TR>
                                <TD class="mid1_left_frame_body"><form  name="form1" action="/productMgr/searchIndex.jsp">
                                <input type="text" value="请输入您感兴趣的产品名称！" name="content_Key" onClick="this.form.content_Key.value=''"/>&nbsp;
                                <a href="#" onClick="checkFomr1()"><bean:message key="str4477"/></a>                            </TD>
                                </TR></form>
                                </TBODY>
                                </TABLE>
                                </TD></TR></TBODY><!--关于cells集合-->
                                <TBODY style="DISPLAY: none"><form  name="form2" action="/biddingMgr/searchIndex.jsp">
                                <TR>
                                <TD vAlign=top class="mid1_left_frame_body1">
                                <input type="text" value="请输入您感兴趣的商家名称！" name="content_Key" onClick="this.form.content_Key.value=''"/>&nbsp;
                                <a href="#"  onClick="checkFomr2()"><bean:message key="str4477"/></a>                            </TD>
                                </TR></form></TBODY><!--关于tBodies集合-->
                                <TBODY style="DISPLAY: none"><form  name="form3" action="/newsMgr/searchIndex.jsp">
                                <TR>
                                <TD vAlign=top class="mid1_left_frame_body1">
                                <input type="text" value="请输入您所关注的信息！" name="content_Key" onClick="this.form.content_Key.value=''"/>&nbsp;
                                <a href="#" onClick="checkFomr3()"><bean:message key="str4477"/></a></TD>
                                </TR></form></TBODY><!--关于display属性-->
                                <TBODY style="DISPLAY: none"><form  name="form4" action="/saleMgr/searchIndex.jsp">
                                <TR>
                                <TD vAlign=top class="mid1_left_frame_body1">
                                <input type="text" value="请输入您感兴趣的产品名称！"  name="content_Key" onClick="this.form.content_Key.value=''"/>&nbsp;
                                <a href="#" onClick="checkFomr4()">搜索<bean:message key="str4477"/></a></TD>
                                </TR></form></TBODY>
                                <TBODY style="DISPLAY: none"><form  name="form5" action="/stockMgr/searchIndex.jsp">
                                <TR>
                                <TD vAlign=top class="mid1_left_frame_body1">
                                <input type="text" value="请输入您感兴趣的产品名称！ "  name="content_Key" onClick="this.form.content_Key.value=''"/>&nbsp;
                                <a href="#" onClick="checkFomr5()"><bean:message key="str4477"/></a></TD>
                                </TR></form></TBODY>
                    </TABLE>
                </div>
            </div>
            <div id="manager_top_link">
 	            <div style="color:#fff;"><bean:message key="str4478"/></div>
	            <div style="margin-bottom:10px;">
	            	<a href="/server.jsp" target="_blank">
<img src="/images/sev_1.gif" id="Image4" onmouseover="MM_swapImage('Image4','','/images/sev_2.gif',1)" onmouseout="MM_swapImgRestore()" /></a>
	            	  
	                    <img src="/images/manager_button3_top.gif" id="Image2" onmouseover="MM_swapImage('Image2','','/images/manager_button31_top.gif',1)" onmouseout="MM_swapImgRestore()" /></a>
	               <a href="javascript:window.external.AddFavorite('http://soft.xsaas.com', '中国企业信息化服务平台.全心全意致力于中国企业信息化服务')">
	                    <img src="/images/manager_button2_top.gif" id="Image3" onmouseover="MM_swapImage('Image3','','/images/manager_button21_top.gif',1)" onmouseout="MM_swapImgRestore()" /></a>
	               <a  onclick="var strHref=window.location.href;this.style.behavior='url(#default#homepage)';this.setHomePage('http://soft.xsaas.com');"  style="CURSOR: hand">
	                    <img src="/images/manager_button1_top.gif" id="Image1" onmouseover="MM_swapImage('Image1','','/images/manager_button11_top.gif',1)" onmouseout="MM_swapImgRestore()" /></a>
	            </div>
	        </div>  
	    </div>      
	    </td>
	</tr>
</TABLE>
<form name=formbill action=/doTradeServe.do method="post">
<TABLE cellSpacing=0 cellPadding=0 width=760 align=center bgColor=#666666 border=0>
      
    <TBODY>
      <TR> 
        <TD bgColor=#ffffff> <TABLE cellSpacing=0 cellPadding=2 width=750 bgColor=#666666 border=0>
            <TBODY>
              <TR> 
                <TD width="480" bgColor=#ffffff><B><bean:message key="str4479"/></B>
                  <table width="760" cellpadding="4" cellspacing="1" align="center" bordercolor="#000000" >
                    <TBODY>
                       <!--TR> 
                        <TD height=23 align=right>电子商务平台【服务】：</TD>
                        <TD height=23 align=left>50(元/季度)
                           <input type="checkbox" name="check1" id="check1" onclick="sumInfo()">订购<input type="hidden" name="sev1" id="sev1" value="50"><input type="text" name="b2b" value="1" id="b2b" size="5" onkeyup="if(isNaN(value))execCommand('undo')" onblur="sumInfo()">季度</TD>
                      </TR>
                      
					  <TR> 
                        <TD height=23 align=right>社区管理【服务】：</TD>
                        <TD height=23 align=left>50(元/季度)
                           <input type="checkbox" name="check2" id="check2" onclick="sumInfo()">订购<input type="hidden" name="sev2" id="sev2" value="50"><input type="text" name="com" value="1" id="com" size="5" onkeyup="if(isNaN(value))execCommand('undo')" onblur="sumInfo()">季度</TD>
                      </TR-->
                      
					  <TR> 
                        <TD height=23 align=right><bean:message key="str4480"/></TD>
                        <TD height=23 align=left><bean:message key="str4481"/>
                           <input type="checkbox" name="check3" id="check3" onclick="sumInfo()"><bean:message key="str135"/><input type="hidden" name="sev3" id="sev3" value="50"><input type="text" name="oa" value="1" id="oa" size="5" onkeyup="if(isNaN(value))execCommand('undo')" onblur="sumInfo()"><bean:message key="str133"/></TD>
                      </TR>
                      
					  <!--TR> 
                        <TD height=23 align=right>进销存管理系统【服务】：</TD>
                        <TD height=23 align=left>50(元/年)
                           <input type="checkbox" name="check4" id="check4" onclick="sumInfo()">订购<input type="hidden" name="sev4" id="sev4" value="50"><input type="text" name="bss" value="1" id="bss" size="5" onkeyup="if(isNaN(value))execCommand('undo')" onblur="sumInfo()">年</TD>
                      </TR>
                      
					  <TR> 
                        <TD height=23 align=right>人力资源管理系统【服务】：</TD>
                        <TD height=23 align=left>50(元/季度)
                           <input type="checkbox" name="check5" id="check5" onclick="sumInfo()">订购<input type="hidden" name="sev5" id="sev5" value="50"><input type="text" name="hrm" value="1" id="hrm" size="5" onkeyup="if(isNaN(value))execCommand('undo')" onblur="sumInfo()">季度</TD>
                      </TR>
                      
					  <TR> 
                        <TD height=23 align=right>客户关系管理系统【服务】：</TD>
                        <TD height=23 align=left>50(元/季度)
                           <input type="checkbox" name="check6" id="check6" onclick="sumInfo()">订购<input type="hidden" name="sev6" id="sev6" value="50"><input type="text" name="crm" value="1" id="crm" size="5" onkeyup="if(isNaN(value))execCommand('undo')" onblur="sumInfo()">季度</TD>
                      </TR-->
                      <TR> 
                        <TD height=23 align=right><bean:message key="str4458"/></TD>
                        <TD height=23 ><input name="v_rcvname" type="text" value="<%=cust_name%>" readonly>
                          &nbsp;&nbsp; <font color="#FF0000">//</font><bean:message key="str4466"/></TD>
                      </TR>
                      <TR> 
                        <TD align=right height=23><bean:message key="str4459"/></TD>
                        <TD height=23><input name="v_rcvaddr" type="text" id="v_rcvaddr"  value="">
                          &nbsp;&nbsp; <font color="#FF0000">//</font><bean:message key="str4467"/></TD>
                      </TR>
                      <TR> 
                        <TD align=right height=23><bean:message key="str4460"/></TD>
                        <TD height=23><input name="v_rcvtel" type="text" id="v_rcvtel"  value="">
                          &nbsp;&nbsp; <font color="#FF0000">//</font><bean:message key="str4468"/></TD>
                      </TR>
                      <TR>
                        <TD align=right height=23><bean:message key="str4461"/></TD>
                        <TD height=23><input name="v_orderemail" type="text" id="v_orderemail" value="">
                          &nbsp;&nbsp; <font color="#FF0000">//</font><bean:message key="str4469"/></TD>
                      </TR>
                      <TR>
                        <TD align=right height=24><bean:message key="str4470"/></TD>
                        <TD height=24><input name="v_amount" id="v_amount" type=text value="0.00" readonly onkeyup="if(isNaN(value))execCommand('undo')">
                         </TD>
                      </TR>
                      <input name="v_oid" type="hidden" maxlength="64" value="<%=server_id%>"/>
                      <input name="v_rcvemail" type="hidden" maxlength="64" value="sj@wanglong.cc"/>
                      <input name="cust_id" type="hidden" maxlength="64" value="<%=cust_id%>"/>
                      <input name="server_name" type="hidden" id="server_name" maxlength="64" value=""/>
                      <input name="trade_type_code" type="hidden" id="trade_type_code" value="1027"/>
                      <TR id="comit"> 
                        <TD align=right height=24>&nbsp;</TD>
                        <TD valign="top"><input type="submit" name="Submit" value=" 确认 " onclick="return checkInfo()"></TD>
                      </TR>
                  </TABLE>
                </TD>
              </TR>
            </TBODY>
          </TABLE>
        </TD>
      </TR>
  </TBODY>
</TABLE>
 </FORM>
</BODY>
</HTML>
