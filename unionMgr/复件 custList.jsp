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
<title>客户关系管理</title>
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
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
	  <tr>
	    <td height="13" align="left">
	     <form name="relationForm" id="relationForm" action="myCustList.jsp" method="post">
	     <div style="margin-left: 12px;margin-top: 5px;margin-bottom: 5px">
	         请选择：&nbsp;
	         <select name="relation_type_code" id="relation_type_code"  class="login_textarea" onclick="checkRaleType(this.value)">
	             <option value="0">请选择...</option>
				<%
					if (custRelation != null && custRelation.size() > 0)
					{
					  for (int i = 0; i < custRelation.size(); i++)
					  {
						HashMap map = (HashMap) custRelation.get(i);
						String value = map.get("para_code1").toString();
						String name = map.get("para_code2").toString();
				       %>
						<option value="<%=value%>">
							<%=name%>
						</option>
				       <%
					  }
					}
				%>
			</select>
			&nbsp;&nbsp;客户名称:&nbsp;<input type="text" maxlength="50" name="cust_name" id="cust_name">&nbsp;&nbsp;&nbsp;&nbsp;<input class="cxan" type="button" value="" onclick="checkRelation()" style="cursor: hand">
        </div>
          <input type="hidden" name="code" id="code" value="0"> 
        </form>
	    </td>
	  </tr>
	  <tr>
	    <td>
		     <table width=100% border=0 cellpadding=5 cellspacing=1 align=center  bgcolor="#e7e7e7">
		        <tr>
			        <td style="background-color:#F9EEC6; color:#000000;  font-weight:bold; font-size:13px;" align=center width="11%" rowspan="2">推荐链接</td>
			        <td style="background-color:#F9EEC6; color:#000000;  font-weight:bold; font-size:13px;text-align:left" align=center width="80%">
			            <input type="text" name=link value="<script src='http://soft.xsaas.com/union.jsp?id=<%=mycode%>&style=a' language='JavaScript' charset='gb2312'></script>" size="80"><br><font style="font-size:12px">您可以将此链接放置到您的推广平台，即可获得自己的推荐客户</font>
			           
			        </td>
			        
     	        </tr>
     	        <tr>
			         
			        <td align=left width="100%" style="background-color:#FFF;"><br>
			            <script src='http://soft.xsaas.com/union.jsp?id=<%=mycode%>&style=a' language='JavaScript' charset='gb2312'></script>
			        </td>
     	        </tr>
		    </table>
		</td>
	</tr>
	 
	  <tr style="display:none">
	    <td>
		     <jsp:include page="/inc/help.jsp">
                <jsp:param name="menu_id" value="<%=meun_idx%>" />
             </jsp:include>	
		     <table width=100% border=0 cellpadding=2 cellspacing=1 align=center  bgcolor="#e7e7e7" >
		        <tr>
			        <td class="line1" style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="21%">推荐码</td>
			        <td  style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="16%">客户名称</td>
					<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="48%">推荐链接</td>
					<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="15%">联系电话</td>
					 

		        </tr>
		        <%
		            if(relationList != null && relationList.size()>0)
		            {    int i=0;
		              	 for (Iterator it = relationList.iterator(); it.hasNext();)
		                  {
						        HashMap map = (HashMap) it.next();
						        String obj_cust_id=map.get("obj_cust_id").toString();
						        String cust_name="";
						        String relation_type_code="";
						        String group_contact_phone="";
						        String start_date="";
						        String remark="";
						        String cust_code="";
						        if(map.get("remark") != null)
						        {
						           remark=map.get("remark").toString();
						        }
						        if(map.get("develope_man") != null)
						        {
						           cust_code=map.get("develope_man").toString();
						        }
						        if(map.get("cust_name") != null)
						        {
						           cust_name=map.get("cust_name").toString();
						        }
						        if(map.get("group_contact_phone") != null)
						        {
						           group_contact_phone=map.get("group_contact_phone").toString();
						        }
						        if(map.get("relation_type_code") != null)
						        {
						           relation_type_code=map.get("relation_type_code").toString();
						           if(typeMap.get(relation_type_code) !=null)
						           {
						             relation_type_code=typeMap.get(relation_type_code).toString();
						           }
						        }
						        if(map.get("start_date") != null)
						        {
						           start_date=map.get("start_date").toString();
						           if(start_date.length()>10)
						           {
						             start_date=start_date.substring(0,10);
						           }
						        }
						        %>
						        
						        <tr style="background-color:#f9f9f9; " id="changcolor_tr<%=i%>" onmouseover="MM_changeProp('changcolor_tr<%=i%>','','backgroundColor','#ffffff','DIV')" onmouseout="MM_changeProp('changcolor_tr<%=i%>','','backgroundColor','#f9f9f9','DIV')">
					              <td  style=" color:#000000;" class="ping1" align=left><%=cust_code%></td>
					              <td  style=" color:#000000;" class="ping1" align=left><%=cust_name%></td>
					              <td  style=" color:#000000;" align=center>
					              <input type="text" name=link value="<a href=http://soft.xsaas.com/interface.jsp?code=<%=cust_code%>><img src=http://www.xsaas.com/images/logo.gif border=0></a>" size="50">
					              </td>
					              <td  style=" color:#000000;" class="ping1" align=left><%=group_contact_phone%></td>
					               
					            </tr>
						        
						        <%i++;
					     }
					     if(code=="0" || code.equals("0")){
					     %>
					     
					     <tr>
							<td  align="left" colspan="2">共<%=counter%>条 &nbsp;共<%=pages%>页</td>
							<td  align="left" colspan="3"><a href="myCustList.jsp?iStart=0&menu_id=<%=meun_idx%>&code=0">首页 </a>&nbsp; &nbsp;<a href="myCustList.jsp?iStart=<%=pageUp%>&menu_id=<%=meun_idx%>&code=0">上一页</a> &nbsp;<a href="myCustList.jsp?iStart=<%=pageDown%>&menu_id=<%=meun_idx%>&code=0">下一页 </a>&nbsp; <a  href="myCustList.jsp?iStart=<%=pages%>&menu_id=<%=meun_idx%>&code=0">尾页</a></td>
				         </tr>
					     
					     <%}
		            }
		        %>
		    </table>
	     </td>
	  </tr>
	  <tr>
	    <td height="13"></td>
	  </tr>
	</table>
</body>
</html>