<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
 <%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
 <%@ page import="java.util.*"%>

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
            			      <div class="newlbone"><div class="newlbtwo2 lblj"><b><bean:message key="str2562"/></b></div></div>
            				  <div class="newlbtwo">
            				  <%
                                com.xsaas.util.DBConnection dbc = new com.xsaas.util.DBConnection(true);
                                 
                                dbc.getConnection();
                                String spage= request.getParameter("p"),type= request.getParameter("type"),stmp="0",content="";
                                String con = "";
                                
                                if(type!=null)
                                	con = "";
                                
                                if(spage==null) spage="0";
                                else{
                                	stmp = Integer.toString(Integer.parseInt(spage)*10);
                                	}
                                String sqltext = "select * from saasnews.agriyp "+con+" order by xtime desc limit "+stmp+",10";
                                //out.println(sqltext);
                                String title = "";
                                com.xsaas.util.Charset charset = new com.xsaas.util.Charset();
                                java.sql.ResultSet rs = dbc.getRS(charset.GBK_2_ISO(sqltext));
                                while(rs.next())
                                {
                                     
                             %>
                                  <div class="newlbtwo1">
                                    <div class="newlbtwo2 lblj"><a href='showbiz.jsp?id=<%= rs.getString(1) %>' target='_self'>·
                                    <%
                                    title = charset.ISO_2_GBK(rs.getString(2)) ;
                                    
                                    if(title.length()>30)
                                    {
                                    	title=title.substring(0,30)+"...";
                                    }
                                    out.println(title);
                                   %>
                                  </a>
                                  <font style="font-size:12px;color:gray">
                                        [<%=rs.getString("website")%>]</font>
                                  </div>
                                  
                                  <div class="newlbtwo4">
                                  <% 
                                      content = charset.ISO_2_GBK(rs.getString("xbrief"));
                                      content= com.xsaas.util.ETTagsSequence.getBody((content),false).trim();
                                      
                                      if((content!=null)&&(content.length()>100))
                                      {
                                      	  	content=content.substring(0,100);
                                      }
                                      out.println(content);
                                
                             %>
                                     ...<br>
                                      <font style="color:green"><%=rs.getString("xurl")%></font> <a href="<%=rs.getString("xurl")%>" target="_blank"><bean:message key="str2571"/></a>
                                     </div>
                                				   </div>
                             <%
                                }
                                	rs=null;
                                    dbc.close();
                              %>
                              </div>
                                <div class="newlbtwo lbg" style="text-align:center;">
                                <%
                                    out.println(dbc.getPageList(dbc," saasnews.agriinfo ","  ","getbizdate.jsp?p=",spage,6,20));
                                %>
                                </div>
            			   </div>
            			 </div>
            	      </div>
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

