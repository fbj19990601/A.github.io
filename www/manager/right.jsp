<%@ include file="fuction/dbconn.jsp" %> 
<%@ page contentType="text/html;charset=GBK" %>
<html>
<head>
<title>网站后台综合管理系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
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
    <td width="321" height="33" align=left> <div align="left">
        <table width="118" border="0" align="left" cellpadding="0" cellspacing="0">
          <tr> 
            <td width="23"><img src="img/title1.gif" width="23" height="33"></td>
            <td width="172" background="img/title3.gif"><div align="center"><strong><font size="3">信息统计</font></strong></div></td>
            <td width="23"><img src="img/title2.gif" width="23" height="33"></td>
          </tr>
        </table>
        <strong></strong> </div></td>
  </tr>
</table>
<table width="95%" border="0" cellpadding="10" cellspacing="1" align="center" bordercolor="#009900" >
  <tr> 
    <td colspan="2" ><img src="img/icon1.gif" width="23" height="24"> 信息总数：
    <font color=#0066FF><b>
    <%
    	String sql="select * from xxsjk_it.XWXXB where gslmbs<>''";
        sqlrst=sqlstmt.executeQuery(sql);          		
        sqlrst.last();   
        out.println(sqlrst.getRow());
        
    %></b></font> 
      条 </td>
  </tr>
  <tr> 
    <td>
<table width="100%" border="0" cellspacing="1" cellpadding="5" align="center" bordercolor="#009900" bgcolor="#009900">
        <tr   class=tablebg_top> 
          <td height="16" colspan="5"> <div align="center"><font color="#FFFFFF"><img src="img/icon2.gif" width="16" height="16"> 
              信息统计表</font></div></td>
        </tr>
        <tr   bgcolor="#FFFFFF"> 
          <td width="107"> <div align="center">栏目名称</div></td>
          <td width="154"> <div align="center">信息分布</div></td>
          <td width="130"> <div align="center">已审核</div></td>
          <td width="138"> <div align="center">未审核</div></td>
          <td width="121"> <div align="center">发布公告数量</div></td>
        </tr>
    <%
        String sqlcount="select a.lmmc,b.gslmbs,count(b.xwbs) from xxsjk_it.XWXXB b,xxsjk_it.LMXXB a where a.lmbs=b.gslmbs group by gslmbs";
        sqlrst=sqlstmt.executeQuery(sqlcount);          		
       	ResultSet sqlrstsh;
       	Statement sqlstmtsh;
       	ResultSet sqlrstwsh;
       	Statement sqlstmtwsh;
       	ResultSet sqlrstgg;
       	Statement sqlstmtgg;
        while(sqlrst.next()){
        	String lmbs=sqlrst.getString("gslmbs");
        	String lmmc=sqlrst.getString("lmmc");
        	String count=sqlrst.getString(3);
        	out.println("<tr bgcolor=#DBF2E6  class=tablebg_main>                                          ");
        	out.println("  <td width=107 > <div align=center>"); 
        	out.println("      "+lmmc+"</div></td>                                                           ");
        	out.println("  <td width=154> <div align=center><font color=#0066FF><b>"+count+"</b></font>              ");
        	out.println("      条</div></td>                                                                 ");
        	
        	sqlstmtsh=conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);	
        	String sqlsh="select count(*) from xxsjk_it.XWXXB where gslmbs='"+lmbs+"' and by4='1'";
        	sqlrstsh=sqlstmtsh.executeQuery(sqlsh); 
        	sqlrstsh.first();
        	String countsh=sqlrstsh.getString(1);
        	out.println("  <td width=130> <div align=center><font color=#0066FF><b>"+countsh+"</b></font>              ");
        	out.println("      条</div></td>                                                                 ");
        	sqlstmtwsh=conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);	
        	String sqlwsh="select count(*) from xxsjk_it.XWXXB where gslmbs='"+lmbs+"' and by4='0'";        	 
        	sqlrstwsh=sqlstmtwsh.executeQuery(sqlwsh); 
        	sqlrstwsh.first();
        	String countwsh=sqlrstwsh.getString(1);
        	out.println("  <td width=138> <div align=center><font color=#0066FF><b>"+countwsh+"</b></font>              ");
        	out.println("      条</div></td>                                                                 ");
        	sqlstmtgg=conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);	
        	String sqlgg="select count(*) from xxsjk_it.GGXXB where gslmbs='"+lmbs+"'";        	 
        	sqlrstgg=sqlstmtgg.executeQuery(sqlgg); 
        	sqlrstgg.first();
        	String countgg=sqlrstgg.getString(1);
        	out.println("  <td width=121> <div align=center><font color=#0066FF><b>"+countgg+"</b></font>              ");
        	out.println("      条</div></td>                                                                 ");
       	 	out.println("</tr>");
        }
        %>
              </table> </td>
  </tr>
</table>
</body>
</html>
