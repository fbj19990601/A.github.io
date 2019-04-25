<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="java.util.*"%>
<%@ page import="com.saas.biz.relationccMgr.RelationCcInfo"%>
<%@ page import="com.saas.biz.commen.ParamethodMgr"%>
<%@ page import="com.saas.biz.custMgr.*"%>
<%@ page contentType="text/html;charset=GBK"%>

<html>
<head>
<title><bean:message key="str4092"/></title>
<link href="/style/css.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="/ext/adapter/ext/ext-base.js"></script>
<script type="text/javascript" src="/ext/ext-all.js"></script>
<link rel="stylesheet" type="text/css" href="/ext/resources/css/ext-all.css"/>
<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/UserInfo.js'></script> 
<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/engine.js'></script>  
<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/util.js'></script> 
<style type="text/css">
.line6 {width:72spx; width:70spx!important;border:#ffcb99 1px solid;  background-color:#fff8ee; text-align:left; padding-left: 20px;padding-top: 10px;padding-bottom: 10px; color:#000000; margin-top:13px;}   /*横栏样式6---- 头部提醒1*/
.line6 .img{width:53px; height:53px; float:left; margin-right:20px;}
.line6 .title {font-size:14px; font-weight:bold; color:#ff5400;}
.line1 {border-left:#ff7300 3px solid; background-color:#e2e2e2; color:#333333;text-align:left; font-size:12px;}  /*横栏样式1*/
</style>
<script language="javascript">
  function chechIfo(obj_id)
  {
    var result=new Boolean(false);
	if(confirm('是否确认要执行本操作？')) 
	{
	    return true;
	}
	else
	{
		return false;
	}
  }
  function checkRaleType(type){
    if(type!="0"){
      document.getElementById("code").value="2";
      sumbimtData();
    }
  }
  function checkRelation(){
    if(document.getElementById("cust_name").value!=""){
       document.getElementById("code").value="1";
       sumbimtData();
    }else{
      alert('请输入正确的客户名称，否则会影响你的查询结果！');
      document.getElementById("cust_name").focus();
    }
  }
  function sumbimtData(){
    document.relationForm.submit();
  }
  
</script>
</head>
<body>
<%
   HttpSession  logsession = request.getSession(); 
    String cust_id = "";
    String iStart ="1";
    String meun_idx="";
    String code="0";
    String mycode="";
   String keyword="",type_code="";
   if (request.getParameter("code") != null)
   {
       code = request.getParameter("code");
   }
   if (request.getParameter("cust_name") != null)
   {
       keyword = request.getParameter("cust_name");
       keyword=new String(keyword.getBytes("ISO-8859-1"),"GBK");  
   }
   if (request.getParameter("relation_type_code") != null)
   {
       type_code = request.getParameter("relation_type_code");
   }
    if (request.getParameter("iStart") != null)
    {
        iStart = request.getParameter("iStart");
    }
    if (logsession.getAttribute("SESSION_CUST_ID") != null)
    {
        cust_id = logsession.getAttribute("SESSION_CUST_ID").toString();
    }
    if (request.getParameter("menu_id") != null)
    {
        meun_idx = request.getParameter("menu_id");
        logsession.setAttribute("menu_id",meun_idx);
    }
    if( logsession.getAttribute("menu_id")!= null)
    {
       meun_idx=(String)logsession.getAttribute("menu_id");
    }
  RelationCcInfo relation=new RelationCcInfo();
  ArrayList relationList =new ArrayList();
  try
  {  
	   if(code=="0" || code.equals("0")){
	     relationList=relation.getRelationByCustId(Integer.valueOf(iStart).intValue(),cust_id);
	    }else if(code=="1" || code.equals("1")){
	     relationList=relation.getRelationByCustName(cust_id,keyword);
	    }
	    else if(code=="2" || code.equals("2")){
	     relationList=relation.getRelationByRelaType(cust_id,type_code);
	    }
  }
  catch(Exception ex)
  {
    out.print(ex.getMessage());
  }
   ParamethodMgr paramObj=new ParamethodMgr();
   HashMap typeMap=paramObj.getCompareInfoByCode("CRM","relation_type_code");
   ArrayList custRelation = paramObj.getCompareInfo("CRM", "relation_type_code");
    int counter=relation.getRelationNumber(cust_id);
    int pages=counter/30+1;
	int pageUp=0,pageDown=0;
	int currenPage=Integer.valueOf(iStart).intValue();
	if(pages>currenPage)
	{
	   if(currenPage>0)
	   {
		pageUp=currenPage-1;
	   }
		pageDown=currenPage+1;
	}
    else if(pages==currenPage)
	{
	   pageUp=currenPage-1;
	   pageDown=currenPage;
	}
	ArrayList custlist = new ArrayList();
	Custinfo custmgr =  new Custinfo();
	custlist = custmgr.genSpecCustInfo(cust_id);
	if (custlist != null && custlist.size() > 0)
    {
        Iterator it = custlist.iterator(); it.hasNext();
        HashMap map = (HashMap) it.next();
        if (map.get("develope_man")!=null) mycode = map.get("develope_man").toString();
    
    }
%>
	<table width="120%" border="0" cellspacing="0" cellpadding="0">
	  <tr>
	    <td height="13" align="left">
		<select name="selectx" onChange="changex()" disabled> 
			<option value="1" selected> <bean:message key="str4104"/> </option>
			<option value="2">  <bean:message key="str4105"/></option>
	      </select>
	  
	    </td>
	  </tr>
	 
	  
		  <tr  >
	    <td>
                <table width=100% border=0 cellpadding=5 cellspacing=1 align=center  bgcolor="#e7e7e7">
                  <tr>
                    <td style="background-color:#F9EEC6; color:#000000;  font-weight:bold; font-size:13px;" align=center width="11%" rowspan="2"><bean:message key="str4106"/></td>
                    <td style="background-color:#F9EEC6; color:#000000;  font-weight:bold; font-size:13px;text-align:left" align=center width="80%">
                      <input type="text" name=link2 value="<script src='http://soft.xsaas.com/union.jsp?id=<%=mycode%>&style=c' language='JavaScript' charset='gb2312'></script>" size="100">
                      <br>
                      <font style="font-size:12px"><bean:message key="str4107"/></font> </td>
                  </tr>
                  <tr>
                    <td align=left width="100%" style="background-color:#FFF;"><bean:message key="str4108"/>
                        
                    </td>
                  </tr>
                  <tr>
                    <td style="background-color:#F9EEC6; color:#000000;  font-weight:bold; font-size:13px;" align=center>&nbsp;</td>
                    <td align=left style="background-color:#FFF;"><br>
				<p>
				<script src='/union.jsp?id=<%=mycode%>&style=c' language='JavaScript' charset='gb2312'></script>
				</p><br>
				</td>
                  </tr>
				              <tr>
              <td colspan="2" style="background-color:#F9EEC6; color:#000000;  font-weight:bold; font-size:13px;" align=center>&nbsp;</td>
             
            </tr>
                </table>                
        </td>
	  </tr>
	
			  <tr  >
	    <td>
                <table width=100% border=0 cellpadding=5 cellspacing=1 align=center  bgcolor="#e7e7e7">
                  <tr>
                    <td style="background-color:#F9EEC6; color:#000000;  font-weight:bold; font-size:13px;" align=center width="11%" rowspan="2"><bean:message key="str4111"/></td>
                    <td style="background-color:#F9EEC6; color:#000000;  font-weight:bold; font-size:13px;text-align:left" align=center width="80%">
                      <input type="text" name=link2 value="<script src='http://soft.xsaas.com/union.jsp?id=<%=mycode%>&style=d' language='JavaScript' charset='gb2312'></script>" size="100">
                      <br>
                      <font style="font-size:12px"><bean:message key="str4107"/></font> </td>
                  </tr>
                  <tr>
                    <td align=left width="100%" style="background-color:#FFF;"><bean:message key="str4109"/>
                        
                    </td>
                  </tr>
                  <tr>
                    <td style="background-color:#F9EEC6; color:#000000;  font-weight:bold; font-size:13px;" align=center>&nbsp;</td>
                    <td align=left style="background-color:#FFF;"><br>
				<p>
				<script src='/union.jsp?id=<%=mycode%>&style=d' language='JavaScript' charset='gb2312'></script>
				</p><br>
				</td>
                  </tr>
				              <tr>
              <td colspan="2" style="background-color:#F9EEC6; color:#000000;  font-weight:bold; font-size:13px;" align=center>&nbsp;</td>
             
            </tr>
                </table>                
        </td>
	  </tr>    
	  
	  			  <tr  >
	    <td>
                <table width=100% border=0 cellpadding=5 cellspacing=1 align=center  bgcolor="#e7e7e7">
                  <tr>
                    <td style="background-color:#F9EEC6; color:#000000;  font-weight:bold; font-size:13px;" align=center width="11%" rowspan="2"><bean:message key="str4110"/></td>
                    <td style="background-color:#F9EEC6; color:#000000;  font-weight:bold; font-size:13px;text-align:left" align=center width="80%">
                      <input type="text" name=link2 value="<script src='http://soft.xsaas.com/union.jsp?id=<%=mycode%>&style=e' language='JavaScript' charset='gb2312'></script>" size="100">
                      <br>
                      <font style="font-size:12px"><bean:message key="str4107"/></font> </td>
                  </tr>
                  <tr>
                    <td align=left width="100%" style="background-color:#FFF;"><bean:message key="str4112"/>
                        
                    </td>
                  </tr>
                  <tr>
                    <td style="background-color:#F9EEC6; color:#000000;  font-weight:bold; font-size:13px;" align=center>&nbsp;</td>
                    <td align=left style="background-color:#FFF;"><br>
				<p>
				<script src='/union.jsp?id=<%=mycode%>&style=e' language='JavaScript' charset='gb2312'></script>
				</p><br>
				</td>
                  </tr>
				              <tr>
              <td colspan="2" style="background-color:#F9EEC6; color:#000000;  font-weight:bold; font-size:13px;" align=center>&nbsp;</td>
             
            </tr>
                </table>                
        </td>
	  </tr>  
	  
	  	  			  <tr  >
	    <td>
                <table width=100% border=0 cellpadding=5 cellspacing=1 align=center  bgcolor="#e7e7e7">
                  <tr>
                    <td style="background-color:#F9EEC6; color:#000000;  font-weight:bold; font-size:13px;" align=center width="11%" rowspan="2"><bean:message key="str4113"/></td>
                    <td style="background-color:#F9EEC6; color:#000000;  font-weight:bold; font-size:13px;text-align:left" align=center width="80%">
                      <input type="text" name=link2 value="<script src='http://soft.xsaas.com/union.jsp?id=<%=mycode%>&style=f' language='JavaScript' charset='gb2312'></script>" size="100">
                      <br>
                      <font style="font-size:12px"><bean:message key="str4107"/></font> </td>
                  </tr>
                  <tr>
                    <td align=left width="100%" style="background-color:#FFF;"><bean:message key="str4112"/>
                        
                    </td>
                  </tr>
                  <tr>
                    <td style="background-color:#F9EEC6; color:#000000;  font-weight:bold; font-size:13px;" align=center>&nbsp;</td>
                    <td align=left style="background-color:#FFF;"><br>
				<p>
				<script src='/union.jsp?id=<%=mycode%>&style=f' language='JavaScript' charset='gb2312'></script>
				</p><br>
				</td>
                  </tr>
				              <tr>
              <td colspan="2" style="background-color:#F9EEC6; color:#000000;  font-weight:bold; font-size:13px;" align=center>&nbsp;</td>
             
            </tr>
                </table>                
        </td>
	  </tr>  
	  
	   <tr>
	    <td>        <form name="form1" method="post" action="">
	      <table width=100% border=0 cellpadding=5 cellspacing=1 align=center  bgcolor="#e7e7e7">
            <tr>
              <td style="background-color:#F9EEC6; color:#000000;  font-weight:bold; font-size:13px;" align=center width="11%" rowspan="2"><bean:message key="str4115"/></td>
              <td style="background-color:#F9EEC6; color:#000000;  font-weight:bold; font-size:13px;text-align:left" align=center width="80%">
                <input type="text" name=link value="<script src='http://soft.xsaas.com/union.jsp?id=<%=mycode%>&style=a' language='JavaScript' charset='gb2312'></script>" size="100">
                <br>
                <font style="font-size:12px"><bean:message key="str4107"/></font> </td>
            </tr>
            <tr>
              <td align=left width="100%" style="background-color:#FFF;"> 
                  <bean:message key="str4116"/> 
              </td>
            </tr>
            <tr>
              <td style="background-color:#F9EEC6; color:#000000;  font-weight:bold; font-size:13px;" align=center>&nbsp;</td>
              <td align=left style="background-color:#FFF;"><br><p>
			  <script src='/union.jsp?id=<%=mycode%>&style=a' language='JavaScript' charset='gb2312'></script>
			  </p><br>
			  </td>
            </tr>
            <tr>
              <td colspan="2" style="background-color:#F9EEC6; color:#000000;  font-weight:bold; font-size:13px;" align=center>&nbsp;</td>
             
            </tr>
          </table>
        </form></td>
	</tr>
	 
	  <tr  >
	    <td>
                <table width=100% border=0 cellpadding=5 cellspacing=1 align=center  bgcolor="#e7e7e7">
                  <tr>
                    <td style="background-color:#F9EEC6; color:#000000;  font-weight:bold; font-size:13px;" align=center width="11%" rowspan="2"><bean:message key="str4117"/></td>
                    <td style="background-color:#F9EEC6; color:#000000;  font-weight:bold; font-size:13px;text-align:left" align=center width="80%">
                      <input type="text" name=link2 value="<script src='http://soft.xsaas.com/union.jsp?id=<%=mycode%>&style=b' language='JavaScript' charset='gb2312'></script>" size="100">
                      <br>
                      <font style="font-size:12px"><bean:message key="str4107"/></font> </td>
                  </tr>
                  <tr>
                    <td align=left width="100%" style="background-color:#FFF;"><bean:message key="str4118"/>
                        
                    </td>
                  </tr>
                  <tr>
                    <td style="background-color:#F9EEC6; color:#000000;  font-weight:bold; font-size:13px;" align=center>&nbsp;</td>
                    <td align=left style="background-color:#FFF;"><br>
				<p>
				<script src='/union.jsp?id=<%=mycode%>&style=b' language='JavaScript' charset='gb2312'></script>
				</p><br>
				</td>
                  </tr>
				              <tr>
              <td colspan="2" style="background-color:#F9EEC6; color:#000000;  font-weight:bold; font-size:13px;" align=center>&nbsp;</td>
             
            </tr>
                </table>                
        </td>
	  </tr>
	  <tr>
	    <td height="13"></td>
	  </tr>
	</table>
</body>
</html>