<%@ include file="fuction/dbconn.jsp" %>
<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*" %>
<%@ page import="java.lang.*" %>
<%@ page import="java.text.SimpleDateFormat" %>

<%
	String gslm=request.getParameter("gslm");
	String lmmc=request.getParameter("lmmc");
	String check=request.getParameter("check");
	String delete=request.getParameter("delete");
	String[] xwbs=request.getParameterValues("del_xx2");
	String sql="";
	Calendar cal = Calendar.getInstance();
	SimpleDateFormat formatter = new SimpleDateFormat("yyyyMM");
	String sdate=formatter.format(cal.getTime());
	String path=request.getRealPath("");
	path=path + "/web_it/"+sdate+"/";
	String newspath=path+"news/";
	String imagespath=path+"images/";
	String tpwjm="";
	File f,d;
	if (check!=null){
		for (int i=0;i<xwbs.length;i++){
			sql="update xxsjk_it.XWXXB set by4='1' where xwbs='"+xwbs[i]+"'";
			sqlstmt.executeQuery(sql);
		}
	}
	if (delete!=null){
		for (int i=0;i<xwbs.length;i++){
			sql="delete from xxsjk_it.XWXXB where xwbs='"+xwbs[i]+"'";
			sqlstmt.executeQuery(sql);
			f=new File(newspath,xwbs[i]+".txt");
			f.delete();
			sql="select * from xxsjk_it.TPXXB where xwbs='"+xwbs[i]+"'";
			sqlrst=sqlstmt.executeQuery(sql);
			while(sqlrst.next()){
				tpwjm=sqlrst.getString("tpwjm");
				d=new File(imagespath,tpwjm);
				d.delete();
			}			
			sql="delete from xxsjk_it.TPXXB where xwbs='"+xwbs[i]+"'";
			sqlstmt.executeQuery(sql);
		}
	}
	
	out.println("<script language=javascript>alert('²Ù×÷³É¹¦');window.location='lastmanage.jsp?lmbs="+gslm+"&lmmc="+lmmc+"';</script>"); 
%>