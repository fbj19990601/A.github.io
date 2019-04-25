<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<jsp:useBean id="param" scope="page" class="com.saas.biz.commen.ParamethodMgr"></jsp:useBean>
<jsp:useBean id="server" scope="page" class="com.saas.biz.serverMgr.ServerInfo"></jsp:useBean>
<%@ page import="java.util.*" %>
<%
    String type = "";
    if (request.getParameter("type") != null) type = request.getParameter("type");
    String view1 ="none";
    String view2 ="none";
    String view3 ="none";
    if (type.equals("1")) view1 = "";
    if (type.equals("2")) view2 = "";
    if (type.equals("3")) view3 = "";
    
%>
<HTML>
<head>
<title><bean:message key="str4435"/></title>
<link href="css/layout.css" rel="stylesheet" type="text/css" />
<script type='text/javascript'src='<%=request.getContextPath()%>/dwr/engine.js'></script>
<script type='text/javascript'src='<%=request.getContextPath()%>/dwr/util.js'></script>
<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/UserInfo.js'></script> 
<script type="text/javascript">
   function checkInfo(){
    if(document.getElementById("v_rcvname").value==""){
      alert("联系人姓名不能为空！");
      document.getElementById("v_rcvname").focus();
      return false;
    }else{
      var name=document.getElementById("v_rcvname").value;
      UserInfo.getCustIdByUserName(name,function(data){
        if(data.length==0){
          alert("用户名不存在，请认真填写！");
          document.getElementById("v_rcvname").value="";
          document.getElementById("v_rcvname").focus();
          document.getElementById("next").value="0";
          return false;
        }else{
          document.getElementById("cust_id").value=data;
          document.getElementById("next").value="1";
        }
      });
    }  
    if(document.getElementById("v_rcvname").value==""){
      alert("联系人姓名不能为空！");
      document.getElementById("v_rcvname").focus();
      return false;
    }
    if(document.getElementById("v_rcvaddr").value==""){
      alert("地址不能为空！");
      //document.getElementById("v_rcvaddr").focus();
      return false;
    }   
    if(document.getElementById("v_rcvtel").value==""){
      alert("电话不能为空！");
      //document.getElementById("v_rcvtel").focus();
      return false;
    }  
    if(document.getElementById("v_orderemail").value==""){
      alert("邮件地址不能为空！");
      //document.getElementById("v_orderemail").focus();
      return false;
    }else {
      var regexp=/^[a-zA-Z0-9_]{2,25}[@][a-zA-z0-9-]{1,100}[.]([a-zA-Z]{2,4}|[a-zA-Z]{2,4}[.][a-zA-Z]{2})$/g;
      if(!regexp.test(document.getElementById("v_orderemail").value)){
         alert("请输入合法的邮件地址！");
         //document.getElementById("v_orderemail").focus();
        return false;
      }
    }  
    sumInfo();
    var sums=parseFloat(document.getElementById("v_amount").value);
    if(parseFloat(sums)==0.0){
      alert("请选择你订购的服务！");
      return false;
    }
    //alert(document.getElementById("cust_id").value);
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
 ArrayList servList=server.getServersByCustId(cust_id,"0");
 if(servList !=null && servList.size()>0){
     HashMap map=(HashMap)servList.get(0);
     server_id=map.get("server_id").toString();
 }
%>

 <table width="760" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td valign="top">
	<!--头部信息-->
	    <!--iframe src="top.html" height="111px" width="100%" frameborder="0"></iframe-->
		<div class="container">
	      <div class="header">
		    <div class="headerleft"><img src="images/logo.gif" width="332" height="43" /></div>
			<div class="headerright" style="font-size:12px;">
			  <div class="headerright1"><bean:message key="str4436"/><a href="/index.jsp"><bean:message key="str4437"/></a>&nbsp;&nbsp;<bean:message key="str4438"/>&nbsp;&nbsp;<a href="/Newcregister.jsp"><bean:message key="str4439"/></a></div>
			  <div class="headerright2" style="color:#ccc;"><bean:message key="str4440"/></div>
			</div>
		  </div>
		  <div class="header">
		    <div class="header-dh">
			    <a class="header-dh2" href="index.html"><bean:message key="str613"/></a>
				<a class="header-dh1" href="rjzx.html"><bean:message key="str3143"/></a>
				<a class="header-dh2" href="qdjm.html"><bean:message key="str3144"/></a>
				<!--a class="header-dh2" href="bzzx.html">帮助中心</a-->
				<a class="header-dh2" href="index.jsp" target="_blank"><bean:message key="str3145"/></a>			 </div>
		  </div>
	   </div>
    <!--头部结束-->
	</td>
  </tr>
  <tr>
    <td valign="top">
	<!--中间信息-->
	   <div class="containermid">
	     <div class="mid"><img src="images/rjbanner.gif" width="760" height="100" /></div>
         <div class="mid">
	       <div style="width:760px; height:250px;">
               <form name=formbill action=/doTradeServe.do method="post">
				<TABLE cellSpacing=0 cellPadding=0 width=760 align=center bgColor=#666666 border=0>
				    <TBODY>
				      <TR> 
				        <TD bgColor=#ffffff> <TABLE cellSpacing=0 cellPadding=2 width=750 bgColor=#666666 border=0>
				            <TBODY>
				              <TR> 
				                <TD width="480" bgColor=#ffffff><B><bean:message key="str4444"/></B>
				                  <table width="760" cellpadding="4" cellspacing="1" align="center" bordercolor="#000000" style="font-size:12px;">
				                    <TBODY>
				                       <TR style="display:none"> 
				                        <TD height=23 align=left><bean:message key="str4445"/></TD>
				                        <TD height=23 align=left><bean:message key="str4446"/>
				                           <input type="checkbox" name="check1" id="check1" onClick="sumInfo()"><bean:message key="str4447"/><input type="hidden" name="sev1" id="sev1" value="50"><input type="text" name="b2b" value="1" id="b2b" size="5" onKeyUp="if(isNaN(value))execCommand('undo')" onBlur="sumInfo()"><bean:message key="str4448"/></TD>
				                      </TR>
				                      
									  <TR style="display:none"> 
				                        <TD height=23 align=left><bean:message key="str4449"/></TD>
				                        <TD height=23 align=left><bean:message key="str4446"/>
				                           <input type="checkbox" name="check2" id="check2" onClick="sumInfo()"><bean:message key="str4447"/><input type="hidden" name="sev2" id="sev2" value="50"><input type="text" name="com" value="1" id="com" size="5" onKeyUp="if(isNaN(value))execCommand('undo')" onBlur="sumInfo()"><bean:message key="str4448"/></TD>
				                      </TR>
				                      
									  <TR style="display:<%=view1%>"> 
				                        <TD height=23 align=left><bean:message key="str4450"/></TD>
				                        <TD height=23 align=left><bean:message key="str4451"/>
				                           <input type="checkbox" name="check3" id="check3" onClick="sumInfo()"><bean:message key="str4447"/>
				                           <input type="hidden" name="sev3" id="sev3" value="2500">
				                           <input type="text" name="oa" value="1" id="oa" size="5" onKeyUp="if(isNaN(value))execCommand('undo')" onBlur="sumInfo()">月<bean:message key="str4453"/>
				                           <bean:message key="str4452"/>
				                           </TD>
				                      </TR>
				                      
									  <TR style="display:<%=view2%>"> 
				                        <TD height=23 align=left><bean:message key="str4450"/></TD>
				                        <TD height=23 align=left><bean:message key="str4410"/>
				                           <input type="checkbox" name="check4" id="check4" onClick="sumInfo()"><bean:message key="str4410"/>
				                           <input type="hidden" name="sev4" id="sev4" value="1800">
				                           <input type="text" name="bss" value="1" id="oa" size="5" onKeyUp="if(isNaN(value))execCommand('undo')" onBlur="sumInfo()"><bean:message key="str4410"/>
				                             <bean:message key="str4455"/>
				                           </TD>
				                      </TR>
				                      
									  <TR style="display:<%=view3%>"> 
				                        <TD height=23 align=left><bean:message key="str4450"/></TD>
				                        <TD height=23 align=left><bean:message key="str4446"/>
				                           <input type="checkbox" name="check5" id="check5" onClick="sumInfo()"><bean:message key="str4447"/>
				                           <input type="hidden" name="sev5" id="sev5" value="400"><input type="text" name="oa" value="1" id="hrm" size="5" onKeyUp="if(isNaN(value))execCommand('undo')" onBlur="sumInfo()"><bean:message key="str4410"/>
				                              <bean:message key="str4456"/>
				                           </TD>
				                      </TR>
				                      
									  <TR style="display:none"> 
				                        <TD height=23 align=left><bean:message key="str4457"/></TD>
				                        <TD height=23 align=left><bean:message key="str4446"/>
				                           <input type="checkbox" name="check6" id="check6" onClick="sumInfo()"><bean:message key="str4447"/><input type="hidden" name="sev6" id="sev6" value="50"><input type="text" name="crm" value="1" id="crm" size="5" onKeyUp="if(isNaN(value))execCommand('undo')" onBlur="sumInfo()"><bean:message key="str4448"/></TD>
				                      </TR>
				                      <TR > 
				                        <TD height=23 align=left><bean:message key="str4458"/></TD>
				                        <TD height=23 ><input id="v_rcvname" name="v_rcvname" type="text" value="">
				                          &nbsp;&nbsp; <font color="#FF0000"></TD>
				                      </TR>
				                      <TR> 
				                        <TD align=left height=23><bean:message key="str4459"/></TD>
				                        <TD height=23><input name="v_rcvaddr" type="text" id="v_rcvaddr"  value="">
				                          &nbsp;&nbsp; <font color="#FF0000"></TD>
				                      </TR>
				                      <TR> 
				                        <TD align=left height=23><bean:message key="str4460"/></TD>
				                        <TD height=23><input name="v_rcvtel" type="text" id="v_rcvtel"  value="">
				                          &nbsp;&nbsp; <font color="#FF0000"></TD>
				                      </TR>
				                      <TR>
				                        <TD align=left height=23><bean:message key="str4461"/></TD>
				                        <TD height=23><input name="v_orderemail" type="text" id="v_orderemail" value="">
				                          &nbsp;&nbsp; <font color="#FF0000"></TD>
				                      </TR>
				                      <TR>
				                        <TD align=left height=24><bean:message key="str4462"/></TD>
				                        <TD height=24><input name="v_amount" id="v_amount" type=text value="0.00" readonly onKeyUp="if(isNaN(value))execCommand('undo')">
				                         </TD>
				                      </TR>
				                      <input name="v_oid" type="hidden" maxlength="64" value="<%=server_id%>"/>
				                      <input name="v_rcvemail" type="hidden" maxlength="64" value="sj@wanglong.cc"/>
				                      <input name="cust_id" id="cust_id" type="hidden" maxlength="64" value=""/>
				                      <input name="next" id="next" type="hidden" maxlength="64" value=""/>
				                      <input name="server_name" type="hidden" id="server_name" maxlength="64" value=""/>
				                      <input name="trade_type_code" type="hidden" id="trade_type_code" value="1027"/>
				                      <TR id="comit"> 
				                        <TD align=left height=24>&nbsp;</TD>
				                        <TD valign="top"><input type="submit" name="Submit" value=" 确认 " onClick="return checkInfo()"></TD>
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
				</form>
		   </div>
         </div>
	   </div>
    <!--中间结束--> 
	</td>
  </tr>
  <tr>
    <td valign="top">
	   <!--底部信息-->
	      <div class="containerbottom" style="font-size:12px;">
		     <div class="footer"><bean:message key="str4463"/>&nbsp;2004-2007&nbsp;SOFT.XSAAS.COM&nbsp;All&nbsp;Rights&nbsp;Reserved<BR />
		       <bean:message key="str4585"/></div>
		  </div>
       <!--底部结束-->
	</td>
  </tr>
</table>
</BODY>
</HTML>
