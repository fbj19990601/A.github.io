<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
 <%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
 <%@ page import="java.util.*"%>
<%
    com.xsaas.util.DBConnection dbc = new com.xsaas.util.DBConnection(true);
     
    dbc.getConnection();
    String spage= request.getParameter("p"),stmp="0",content="",x= request.getParameter("class");
    
    String con = "",xtitle="",murl="";
    if(x==null){
    	
    }
    else{
    		con = " and xtype="+x;
    		if(x.indexOf("1")>=0) xtitle="ũҵ���߷��� �б� -";
    		else if(x.indexOf("2")>=0) xtitle="ũҵ��ҵ�ȵ����� �б� -";
    		else if(x.indexOf("3")>=0) xtitle="ũҵ�������� �б� -";
    		else if(x.indexOf("4")>=0) xtitle="ũҵ����������֪ͨ���� �б� -";
    		else if(x.indexOf("5")>=0) xtitle="ũҵ�бꡢ������Ϣ �б� -";
    		else if(x.indexOf("6")>=0) xtitle="ũҵר��Ԥ����� �б� -";
    		else if(x.indexOf("7")>=0) xtitle="��ᴫ�桢������Ѷ �б� -";
    		else if(x.indexOf("8")>=0) xtitle="�����鱨 �б� -";
    		else if(x.indexOf("9")>=0) xtitle="ũ��Ʒ�۸����� �б� -";
    		
    		murl="&class="+x;	
    		
    	}
    
    if(spage==null) spage="0";
    else{
    	stmp = Integer.toString(Integer.parseInt(spage)*10);
    	}
        String sqltext = "select * from saasnews.agrinews where 1=1 "+con+" order by id desc limit "+stmp+",6";
        //out.println(sqltext);
        String title = "";
%>

<html>

	<head>

		<title><bean:message key="str2559"/></title>
	<link href="/css/new.css" rel="stylesheet" type="text/css" />
	<link href="/style/layout.css" rel="stylesheet" type="text/css">
	</head>

	<body> 
		<table width="100%" border="0" cellpadding="0" cellspacing="0">
			<jsp:include page="/inc/top.jsp" />
			<tr>
				<!-- �м� -->
				<td align="center">
					<div id="manager_body">
						<!--��߲˵�-->
						<div id="manager_body_left">
							<jsp:include page="/info/menu.jsp" />
						</div>
						<div id="manager_body_right">							 
                            <div class="newlblefttwo1">
                            	
                            	<div class="newlbone"><b><bean:message key="str2560"/></b></div>
                            	<div class="newlbtwo">
                            	<%
                            
                                    com.xsaas.util.Charset charset = new com.xsaas.util.Charset();
                                    java.sql.ResultSet rs = dbc.getRS(sqltext);
                                    while(rs.next())
                                    {
                                    	  content = charset.ISO_2_GBK(rs.getString("content")) ;
                                %>
                            		     <div class="newlbtwo1">
                            		     <div class="newlbtwo2 lblj"><a href='news.jsp?id=<%= rs.getString("id") %>' target='_self'>
                            		         ��
                                        <%
                                        	  title = charset.ISO_2_GBK(rs.getString("title")) ;
                                        	  if(title.length()>22)
                                        	  {
                                        	        title=title.substring(0,22)+"...";
                                        	  }
                                        	  out.println(title);
                                        %>
                                          </a><font style="font-size:12px;color:gray">
                                        [<%=rs.getString("opername")%>]</font>
                                           </div>
                            		       <!--div class="newlbtwo3">2008-02-25&nbsp;&nbsp;�����:127��</div-->
                            		       <div class="newlbtwo4"><% 
                            	            content= com.xsaas.util.ETTagsSequence.getBody((content),false).trim();
                                        
                                            if((content!=null)&&(content.length()>100))
                                            {
                                                content=content.substring(0,100);
                                            }
                                            out.println(content);
                            
                               %>
                                    ...<br>
                                    <font style="color:green"><%=rs.getString("xurl")%></font>  <a href="<%=rs.getString("xurl")%>" target="_blank"><bean:message key="str2561"/></a>
                                    </div>
                                        </div>
                                <%
                            	}
                            	rs=null;
                                dbc.close();
                            %>
                            			     </div>
                            				  <div class="newlbtwo lbg" style="text-align:center;"><%
                            out.println(dbc.getPageList(dbc," saasnews.agrinews ","  ","getinfodate.jsp?1=1"+murl+"&p=",spage,6));
                            
                            %>
                            </div>
                            			   </div>
                            			 </div>
                            	      </div>
						</div>

						<!--�ұ� ���岿�ֽ���  -->

					</div>

				</td>

				<!-- �м� ���� -->

			</tr>

			<tr>

				<!-- �ײ� -->

				<td align="center">

					<jsp:include page="/bottom.jsp"/>

				</td>

			</tr>

			<!-- �ײ����� -->

		</table>

	</body>

</html>

