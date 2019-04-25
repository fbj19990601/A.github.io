<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="java.util.*" %> 
<%@ page import="java.net.*" %>
<%@ page import="com.saas.biz.rightMgr.*" %>
<%
     
    HttpSession  logsession = request.getSession(); 
    String user_name = "";
    String cust_name = "";
    String login_cust_id = "";
    String cust_class_name = "";
    String user_class = "";
    String depart_name= "";
    TradeInterface inter = new TradeInterface();
    if (logsession.getAttribute("SESSION_USER_NAME") != null)
    {
        user_name = logsession.getAttribute("SESSION_USER_NAME").toString();
        user_class = logsession.getAttribute("SESSION_CUST_CLASS").toString();
        login_cust_id = logsession.getAttribute("SESSION_CUST_ID").toString();
        cust_class_name = inter.codeToName("cust_type",user_class);
        cust_name = logsession.getAttribute("SESSION_CUST_NAME").toString();
        cust_name = URLDecoder.decode(cust_name);
        depart_name = inter.comCodetoName("org_name",logsession.getAttribute("DEPART_CODE").toString());
    }else{
    response.sendRedirect("/index.jsp");
   }
    
%>
<script type="text/javascript" src="/ext/adapter/ext/ext-base.js"></script>
<script type="text/javascript" src="/ext/ext-all.js"></script>
<style type="text/css"><!--
#svc-toolbar .bgp-fr{background: transparent url(/images/svc_sprite_all.gif) 0 0 no-repeat}
.ttv{background: transparent url(/images/svc_sprite_all.gif) 0 0 no-repeat}
--></style>
<link rel="stylesheet" href="/style/homepage.css" type="text/css">
<script type="text/javascript" src="/js/homepage.js"></script>
<script>
var aaa=r;
aaa.svcToolbarYSpritePosition={a1:"0",a2:"-37px",a3:"-74px",a4:"-111px",a5:"-148px",a6:"-185px",a7:"-222px"};
window.onload=aaa.init;
</script>
<SCRIPT language=javascript>
function MM_changeProp(objId,x,theProp,theValue) { //v9.0
  var obj = null; with (document){ if (getElementById)
  obj = getElementById(objId); }
  if (obj){
    if (theValue == true || theValue == false)
      eval("obj.style."+theProp+"="+theValue);
    else eval("obj.style."+theProp+"='"+theValue+"'");
  }
}
</SCRIPT>
 <SCRIPT language=javascript>
function secBoard(n)
                            {
                            for(i=0;i<secTable.cells.length;i++)
                            secTable.cells[i].className="sec1";
                            secTable.cells[n].className="sec2";
							
                            for(i=0;i<mainTable.tBodies.length;i++)
                            mainTable.tBodies[i].style.display="none";
                            mainTable.tBodies[n].style.display="block";
                            }
function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
</SCRIPT>
<script language="javascript">
	function checkFomr1()
	{
		 if(document.form1.content_Key.value=="")
		 {
		 	 alert("Keyword search can not be empty!");
		 	 document.form1.content_Key.focus();
		 	 return false;
		 }
		 else
		 {
		 	document.form1.submit();
		 }	
	}
	function checkFomr2()
	{
		 if(document.form2.content_Key.value=="")
		 {
		 	 alert("Keyword search can not be empty!");
		 	 document.form2.content_Key.focus();
		 	 return false;
		 }
		 else
		 {
		 	document.form2.submit();
		 }	
	}
	function checkFomr3()
	{
		if(document.form3.content_Key.value=="")
		 {
		 	 alert("Keyword search can not be empty!");
		 	 document.form3.content_Key.focus();
		 	 return false;
		 }
		 else
		 {
		 	document.form3.submit();
		 }	
	}
	function checkFomr4()
	{
		if(document.form4.content_Key.value=="")
		 {
		 	 alert("Keyword search can not be empty!");
		 	 document.form4.content_Key.focus();
		 	 return false;
		 }
		 else
		 {
		 	document.form4.submit();
		 }	
	}
	function checkFomr5()
	{
		if(document.form5.content_Key.value=="")
		 {
		 	 alert("Keyword search can not be empty!");
		 	 document.form5.content_Key.focus();
		 	 return false;
		 }
		 else
		 {
		 	document.form5.submit();
		 }	
	}
	function exitSys(){
	 if(confirm("Keyword search can not be empty!")){
	    window.location.href("/out.jsp"); 
 
	 }else{
	   return false;
	 } 
	}
</script>

<link href="/style/top.css" rel="stylesheet" type="text/css">
<table width="950" border="0" cellspacing="0" cellpadding="0" style="margin-left:26px;">
  <tr>
    <td>
	   <div class="new-top">
	     <div class="logo">
		   <a href="/" target="_top"><img src="/images/manager_logo.gif" width="270" height="73" border="0"></a>
		 </div>
		 <div class="link">
		   <div style="color:#fff;"><bean:message key="str4478"/></div>
		   <div style="margin-bottom:10px;">
		      <a href="/main.jsp">
	<img src="/images/manager_button3_top.gif" id="Image2" onmouseover="MM_swapImage('Image2','','/images/manager_button31_top.gif',1)" onmouseout="MM_swapImgRestore()" style="border:0px;" /></a>
		      <a href="javascript:window.external.AddFavorite('http://soft.xsaas.com', 'Agricultural Information¡¤Software http://soft.xsaas.com')">
	  <img src="/images/manager_button2_top.gif" id="Image3" onmouseover="MM_swapImage('Image3','','/images/manager_button21_top.gif',1)" onmouseout="MM_swapImgRestore()" style="border:0px;" /></a>
		      <a  onclick="var strHref=window.location.href;this.style.behavior='url(#default#homepage)';this.setHomePage('http://soft.xsaas.com');"  style="CURSOR: hand">
	<img src="/images/manager_button1_top.gif" id="Image1" onmouseover="MM_swapImage('Image1','','/images/manager_button11_top.gif',1)" onmouseout="MM_swapImgRestore()" /></a> 
	        </div>
		 </div>
	   </div>
	</td>
  </tr>
  <tr>
    <td>
	  <table width="100%" border="0" cellpadding="0" cellspacing="0" >
            <tr>
                <td align="left"><img src="/images/icon_managerline.gif" /></td>
                <td width=100% align="left" style="background-color:#FF8B00">
                    <table width=100% style="font-size:14px;" class="new-ys">
                        <tr>
                            <td style="text-align:left">
                            <bean:message key="str2510"/>
                            <%=cust_name%>
                            <%=depart_name%>
                            <%=user_name%>
                          <bean:message key="str2511"/><b>soft.xsaas.com </b>                            </td>
                            <td align=right>
                            
                             [ <a href="#" onclick="exitSys()"><bean:message key="str2512"/>(exit)</a> ]                            </td>
                        </tr>
                    </table>                </td>
            </tr>
            <tr>
                <td colspan=2 align="right" style=" background-color:#fff; margin:0px; padding:0px; text-align:right; border-bottom:3px solid #ccc;" >
                    <div id="wrapper" style="border-left:1px solid #FF6600;border-right:1px solid #FF6600;">
                        <table id="svc-toolbar" class="bgp" cellpadding="3" cellspacing="2" border="0">
                        <tr>
				
				  <%
                                RightMenu sysright = new RightMenu();
                                ArrayList syslist = sysright.genSysServByCust(login_cust_id,user_name); 
                                int i = 1;
                                if (syslist != null)
                                {
                                    for(Iterator it = syslist.iterator(); it.hasNext();)
                        		    {
                            			HashMap sysInfo = (HashMap)it.next();
                            			String sysname = "";
                            			String syscode = "";
                            			if (sysInfo.get("para_code1") != null) syscode =sysInfo.get("para_code1").toString();
                            			if (sysInfo.get("para_code2") != null) sysname =sysInfo.get("para_code2").toString();
                            			if (!user_name.equals("admin") && !sysname.equals("¿ò¼ÜÏµÍ³"))
                            			{
                            %>
                                        
                                        <td><a id="a<%=i%>-i" href="/main.jsp?class=1&subsys_code=<%=syscode%>" title="<%=sysname%>"><span class="bgp-fr"></span><span><font style="color:#000;font-size:13px"><%=sysname%></font></span></a></td>
                <%			
                                        }
                                        else if (user_name.equals("admin"))
                                        {
                                        %>
                                        <td><a id="a<%=i%>-i" href="/main.jsp?class=1&subsys_code=<%=syscode%>" title="<%=sysname%>"><span class="bgp-fr"></span><span><font style="color:#000;font-size:13px"><%=sysname%></font></span></a></td>
                <%
                                        }
                                        i = i +1;
                                    }
                            			
                                }
                %>
                 <td><a id="a6-i" href="/info/getinfodate.jsp?type=0&class=1" title="Agriculture intelligence information"><span class="bgp-fr"></span><span><font style="color:#000;font-size:13px"><bean:message key="str2513"/></font></span></a></td>
                </tr>
                        </table>
                    </div>
                        <div id="tt" class="ttm" style="display:none">
                        <div class="ttl"></div>
                        <div class="ttc">
                        	<div class="ttdc">
                        		<div class="ttdl"></div>
                        		<div class="ttdr"></div>
                        	</div>
                        	<div class="tt-text"></div>
                        	<div class="ttdc">
                        		<div class="ttdl"></div>
                        		<div class="ttdr"></div>
                        	</div>
                        </div>
                        <div class="ttl"></div>
                        <div class="ttvc">
                        	<div class="ttv"></div>
                        </div>
                        </div>
                </td>
            </tr>
        </table>
	</td>
  </tr>
</table>
