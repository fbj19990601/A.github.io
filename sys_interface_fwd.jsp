<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ page import="java.util.*" %> 
<html>
<title><bean:message key="system.tittle"/></title>
<head> 
    <logic:iterate id="result1" name="result" scope="request">	
        <bean:define id="fwd" name="result1" property="interfacedir" type="java.lang.String"/>	
            <meta http-equiv="refresh" content="0;url=<%=fwd%>">
            <script>
                var i=0;
                var n=0;
                var url='<%=fwd%>'; //转
                var min = '10'; //进度速度
                function loading() {
                var l='320'; //总长度 该了 div 也要改
                var t='40'; //进度条长度
                var h='20'; //进度条高度度
                if(i<l) { if(i>=l-t) { i<l ? i++ : i=1; n=l-i; } else { if(n>t) i<l ? i++ : i=1; else n++; } } else { i=0; n=0; location.href=url }
                document.getElementById('loading').innerHTML='<div style="BACKGROUND: #A0E000; MARGIN-LEFT: '+i+'px; WIDTH: '+n+'px; HEIGHT: ' + h + 'px; OVERFLOW: hidden;"/>';
                
                }
                function debug() {
                var debug='<div style="BACKGROUND: #001000; WIDTH: 100%; HEIGHT: '+document.body.clientHeight+'px; FILTER: alpha(opacity=75);"></div>'+
                '<div class="debug" style="POSITION: absolute; TOP: '+((document.body.clientHeight/2)-32)+'px; LEFT: '+((document.body.clientWidth/2)-180)+'px;">'+
                '<div style="PADDING: 10px; FONT-WEIGHT: bold;FONT-size:13px;color:#FFF">Loading..</div>'+
                '<div id="loading" style="BACKGROUND: #EEEEEE; WIDTH: 320px; PADDING: 1px; BORDER: #AAAAAA 1px solid; TEXT-ALIGN: left;"></div>'+
                '<div style="PADDING: 10px; TEXT-ALIGN: right;FONT-size:13px;color:#FFF">Loading interface, please wait..</div>'+
                '</div>';
                setInterval( 'loading()', min );
                document.getElementById('debug').innerHTML = debug;
                }
            </script>
    </logic:iterate>

</head>
<body onload="debug();"  scroll="no" margin="0">
     <div style="POSITION: absolute; TOP: 0px; LEFT: 0px;" id="debug"></div>
</body>
</html>
		