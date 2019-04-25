<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 <%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
 <%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
 <%@ page import="java.util.*"%>
<%
com.xsaas.util.DBConnection dbc = new com.xsaas.util.DBConnection(true);
com.xsaas.util.Charset charset = new com.xsaas.util.Charset();
 
dbc.getConnection();
String spage= request.getParameter("p"),q= request.getParameter("q"),mp= request.getParameter("mp"),stmp="0",content="",h= request.getParameter("h");
//out.println("ss "+q);
String mytitle ="";
String con = "";

    if(spage==null) spage="0";
    else{
    	stmp = Integer.toString(Integer.parseInt(spage)*10);
    	}

        if(mp==null){
        	mp="";
        	q="";
        }
        else{
        	if(mp.indexOf("0")>=0){
        		mp="";
        	}
        }
        
        if(q!=null){
        	if(h!=null){
        		//q = java.net.URLDecoder.decode(q);
        	//	out.println(1);
        //		q = new com.xsaas.util.Charset().ISO_2_GBK(q);
        //		mp = new com.xsaas.util.Charset().ISO_2_GBK(mp);
        mytitle=q;
        		}
	    else
	    {
		    q = new com.xsaas.util.Charset().ISO_2_GBK(q);
		    mp = new com.xsaas.util.Charset().ISO_2_GBK(mp);
            mytitle=q;
	}
}



%>
<html>

	<head>

		<title><bean:message key="str2559"/></title>
		<link href="/style/layout.css" rel="stylesheet" type="text/css">
		<link href="/style/daohang.css" rel="stylesheet" type="text/css">
		<link href="/style/manager.css" rel="stylesheet" type="text/css">
		<link href="/css/new.css" rel="stylesheet" type="text/css" />
	</head>

	<body> 
		<table width="100%" border="0" cellpadding="0" cellspacing="0">
			<jsp:include page="/inc/top.jsp" />
			<tr>
				<!-- 中间 -->
				<td align="center">
					<div id="manager_body">
						<!--左边菜单-->
						<div id="manager_body_left">
							<jsp:include page="/info/menu.jsp" />
						</div>
						<div id="manager_body_right">							 
                           <div class="newlblefttwo1">
                                  <div class="newlbone"><div class="newlbtwo2 lblj"><b><bean:message key="str2563"/></b></div></div>
                                  <table width="640" border="0" cellspacing="0" cellpadding="0" style=" margin:0px; padding:0px;">
                                    <tr>
                                        <td  align="center" style=" border-bottom:1px solid #abd4f7;border-top:1px solid #abd4f7; ">
                						  <form name="form" method="post" action="getpricedate.jsp">
                                    <font style="font-size:13px;color:#FD801A;margin:19px;"><bean:message key="str2564"/></font><input name="q" type="text" value="<%= q %>" onClick="this.form.q.value=''" size="30" maxlength="30" />
                                    <%@include file="/inc/marketplace.jsp"%>
                                    <input type="submit" name="Submit" value="  搜索价格  " />
                                  </form>
                						<div class="newlbone"><div class="newlboneright"></div></div>
                						</td>
                                      </tr>
                                      
                                    <tr>
                                      <td><table width="99%"  border="0" cellpadding="3" cellspacing="0" style="margin-bottom:30px;">
                                <tr>
                                <td style="font-size:13px;color:#FD801A"><strong><bean:message key="str2565"/></strong></td>
                                <td style="font-size:13px;color:#FD801A"><strong><bean:message key="str2566"/></strong></td>
                                <td style="font-size:13px;color:#FD801A"><strong><bean:message key="str2567"/></strong></td>
                                <td style="font-size:13px;color:#FD801A"><strong><bean:message key="str2568"/></strong></td>
                                <td style="font-size:13px;color:#FD801A"><strong><bean:message key="str2569"/></strong></td>
                                </tr>
                                            <%
                            
                            if(q!=null){
                            	if(q.length()>0)
                            	con = " where title = '"+q+"'";
                            else
                            	con = " where 1=1 ";
                            	}
                            else{
                            	q="";
                            	con = " where 1=1 ";
                            	}
                            	
                            	if(mp.length()>0) con = con+" and marketplace='"+mp+"' ";
                            
                            if(spage==null) spage="0";
                            else{
                            	stmp = Integer.toString(Integer.parseInt(spage)*10);
                            	}
                             String sqltext = "select id,title,marketplace,midprice,xunit,pubdate from saasnews.agriprice "+con+" order by id desc limit "+stmp+",50";
                            //out.println(sqltext);
                            
                            String title = "",markerplace="",midprice="",xunit="";
                            java.sql.ResultSet rs = dbc.getRS(charset.GBK_2_ISO(sqltext));
                            while(rs.next()){
                             %><tr>
                            				  <td><%= charset.ISO_2_GBK(rs.getString(2))%></td>
                            				  <td><%= charset.ISO_2_GBK(rs.getString(3))%></td>
                            				  <td><%= charset.ISO_2_GBK(rs.getString(4))%></td>
                            				  <td><%= charset.ISO_2_GBK(rs.getString(5))%></td>
                            				  <td><%= charset.ISO_2_GBK(rs.getString(6))%></td>
                            				</tr>
                                            <%
                            	}
                            	rs=null;
                            dbc.close();
                            
                            if(q.length()<1) q="输入查询的农产品名称，如 大米";
                            /**/
                            %>
                              </table></td>
                                                  </tr>
                                                  
                            					
                                                </table><div class="newlbtwo lbg" style="text-align:center;">
                            					 <%
                            out.println(dbc.getPageList(dbc," saasnews.agriprice ","  ","getpricedate.jsp?p=",spage,6,20));
                            
                            %></div>
                            			   </div>
                            			   
                            			 </div>
                            	      </div>
						</div>

						<!--右边 主体部分结束  -->

					</div>

				</td>

				<!-- 中间 结束 -->

			</tr>

			<tr>

				<!-- 底部 -->

				<td align="center">

					<jsp:include page="/bottom.jsp"/>

				</td>

			</tr>

			<!-- 底部结束 -->

		</table>

	</body>

</html>

