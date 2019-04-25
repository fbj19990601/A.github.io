<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="java.util.*" %> 
<%@ page import="com.ahbay.bookMgr.*" %>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%@ page import="javax.servlet.http.*" %> 
<!--%@ taglib uri="/WEB-INF/struts-html" prefix="html" %-->
<!-------------------------------------------------------------------
                          标准JavaScript库引用
--------------------------------------------------------------------->
<script language="JavaScript" src="public.js"></script>
<!--------------------------------------------------------------------
   当前页面JavaScript函数部分，包括提交验证，页面动作，具体目标等代码
---------------------------------------------------------------------->
<script language="JavaScript" type="text/javascript">

	   var maximum_activated=6;

	   var minimum_activated=0;

	   var total_activated=minimum_activated;

	   var confirm_message="你确定要删除吗？"
	
function count_activated(current_checkbox){
	    if (current_checkbox.checked){
		total_activated++;
		}
		else
		total_activated--;
		
}
	   
function Check_del(){
       	if(total_activated < 1)
       	{
       		alert("你至少选择一个");
			return false;		
		}
		else
		{		
			return confirm(confirm_message);
			form1.submit();
		}
		
		
}

</script>

<!--------------------------------------------------------------------
                          页面HTML表现部分    
---------------------------------------------------------------------->
<html>
<head>
<title>网站后台综合管理系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK REL="stylesheet" HREF="./style.css" TYPE="text/css">
<link href="css.css" rel="stylesheet" type="text/css">
<style>
　BODY { 
　SCROLLBAR-FACE-COLOR: #DBF2E6;
　SCROLLBAR-HIGHLIGHT-COLOR:#DBF2E6; 
　SCROLLBAR-SHADOW-COLOR: #DBF2E6; 
　SCROLLBAR-ARROW-COLOR: #26b501;
　SCROLLBAR-BASE-COLOR:#26b501; 
　SCROLLBAR-DARKSHADOW-COLOR: #26b501
　} 
</style> 
</head>
<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width=95% border=0 cellpadding="0" cellspacing="0" align="center" >
  <tr> 
    <td height="33" align=left> <div align="left">
        <table width="152" border="0" align="left" cellpadding="0" cellspacing="0">
          <tr> 
            <td width="23"><img src="img/title1.gif" width="23" height="33"></td>
            <td width="106" background="img/title3.gif"><div align="center"><strong><font size="3"> 
                订单管理</font></strong></div></td>
            <td width="23"><img src="img/title2.gif" width="23" height="33"></td>
          </tr>
        </table>
        <strong></strong> </div></td>
  </tr>
</table>
 
<div align="center"> 
  <form name="form1"  method="post" onSubmit="return Check_del();" action="del_yp.jsp">
    <table width="90%" border="0" cellspacing="1" cellpadding="5" align="center" bordercolor="#009900" bgcolor="#009900">
      <tr> 
        <td colspan="3" class=tablebg_top> <font color="#FFFFFF">订单列表</font></td>
        <td colspan="2" align=center> <br> </td>
      </tr>
      <tr bgcolor="#CCFFFF"> 
        <td width=15% class=tablebg_left> <div align="center">预订类型</div></td>
        <td width=40% class=tablebg_left> <div align="center">预订内容</div></td>
        <td width=10% class=tablebg_left><div align="center">顾客名称</div></td>
        <td width=10% class=tablebg_left><div align="center">电子邮件</div></td>
        <td width=10% class=tablebg_left><div align="center">联系地址</div></td>
        <td width=10% class=tablebg_left><div align="center">电话</div></td>
        <td width=10% class=tablebg_left><div align="center">处理状态</div></td>
        <td width=10% class=tablebg_left><div align="center">选中</div></td>
      </tr>
      <%
		com.ahbay.bookMgr.bookMgr books=new com.ahbay.bookMgr.bookMgr();
        ArrayList DisplaybookArray=books.GetBookList();       	   	
        com.ahbay.bookMgr.bookMgr[] booksDisPlay=books.BookList(DisplaybookArray);          	 
        for (int i=0;i<booksDisPlay.length;i++)
        {
	  		out.println("<tr bgcolor=#DBF2E6>                                                                                                                                   ");          
     		if (booksDisPlay[i].getBooktype().toString().equalsIgnoreCase("0"))
     		{
     			out.println("   <td  bgcolor=#DBF2E6 class=tablebg_left> <div align=center>新车预订<font size=2></font></div></td>");
     		}
     		if (booksDisPlay[i].getBooktype().toString().equalsIgnoreCase("1"))
     		{
     			out.println("   <td  bgcolor=#DBF2E6 class=tablebg_left> <div align=center>零配件预订<font size=2></font></div></td>");
     		}

     		
     		
     		out.println("   <td bgcolor=#DBF2E6 class=tablebg_left> <div align=center><font size=2><a href=application_details.jsp?id="+booksDisPlay[i].getId().toString()+">"+booksDisPlay[i].getContent().toString()+"</a></font></div></td>");
     		out.println("   <td  bgcolor=#DBF2E6 class=tablebg_left><font size=2>"+booksDisPlay[i].getMyname().toString()+"</font></td>                                                             ");
     		out.println("   <td bgcolor=#DBF2E6 class=tablebg_left><div align=center>"+booksDisPlay[i].getEmail().toString()+"</div></td>                                                                ");
     		out.println("   <td  bgcolor=#DBF2E6 class=tablebg_left><div align=center>"+booksDisPlay[i].getAddress().toString()+"</div></td>                                                                        ");
     		out.println("   <td bgcolor=#DBF2E6 class=tablebg_left><div align=center>"+booksDisPlay[i].getPhone().toString()+"</div></td>                                                                        ");
     		out.println("   <td  bgcolor=#DBF2E6 class=tablebg_left><div align=center>");
     		if (booksDisPlay[i].getOpertype().toString().equalsIgnoreCase("0"))
     		{
     			out.println("<font color=red>未处理</font>");
     		}
     		if (booksDisPlay[i].getOpertype().toString().equalsIgnoreCase("1"))
     		{
     			out.println("已处理");
     		}

     		out.println("</div></td>                                                                        ");
     		out.println("   <td  bgcolor=#DBF2E6 class=tablebg_left><div align=center>                                                                             ");
     		
     		out.println("       <input name=del_xx2 type=checkbox class=s1 value="+booksDisPlay[i].getId().toString()+" onClick=count_activated(this);>                                               ");
     		out.println("     </div></td>                                                                                                                                         ");
     		out.println("</tr>                                                                                                                                                    ");

		}
      %>
       
     
      <tr bgcolor="#DBF2E6"> 
        <td colspan="3" bgcolor="#DBF2E6" class=tablebg_top>&nbsp; </td><td colspan="3" bgcolor="#DBF2E6" class=tablebg_top>&nbsp; </td>
        <td colspan="2" align=center class=tablebg_top> &nbsp;&nbsp; <input type="submit" name="delete" value="批量删除" > 
        </td>
      </tr>
    </table>
  </form>
  <p>&nbsp;</p>
</div><br></body>
</html>
