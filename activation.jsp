<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="java.util.*"%>
<jsp:useBean id="userObj" scope="page" class="com.saas.biz.userMgr.UserInfo"></jsp:useBean>
<%
  String user_id=request.getParameter("u");
  String check_code=request.getParameter("k");
  String trade="";
  ArrayList list=userObj.genOneUserInfo(user_id);
  if(list!=null && list.size()>0){
    HashMap map=(HashMap)list.get(0);
    if(map.get("rsrv_str2")!=null){
       String code=map.get("rsrv_str2").toString();
       if(check_code==code || check_code.equals(code)){
         trade="0";
       }else{
         trade="1";
       }
    }
  }
%>
<html>
    <head>
    <title>Xsass ƽ̨ ��Ա �ʺż���</title>
	<script language="javascript">
	function autoSubmit(){   
	        var form = document.forms[0];   
	        form.method = 'post';    
	        var trade=document.getElementById("trade").value;
	        if(trade=="0"){
	          form.submit();
	        }else{
	          document.getElementById("isShow").style.display="block";
	        }
	    } 
	</script>
</head>
<body onload="autoSubmit()">
<FORM name="formbill" action="/doTradeActive.do" method=post>
	<input name ="user_id" type="hidden" value="<%=user_id%>"/>
	<input name ="trade" id="trade" type="hidden" value="<%=trade%>"/>
	<input name="trade_type_code" type="hidden" value="4647">
 </form>
<div id="isShow" style="display: none;text-align: center;font-size: 15px;margin-top: 15px;color: blue;">�Բ������ļ������Ѿ�ʧЧ���Ѿ�ʹ�ù����������ʺŻ�û�м����������Ա��ϵ��</div>
</body>
</html>