<%@ page contentType="text/html;charset=GBK" language="java" %>
<%@ page import="com.base.config.ProjectConfig,
                 java.util.Vector,
                 com.saas.biz.commen.config,
                 com.bean.ProductClassInfo,
                 com.new_buildHtml.*"%>
				
<%@ page import="com.base.config.ProjectConfig"%> 
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<html>
 	<HEAD>
  	<TITLE><bean:message key="str3938"/></TITLE>
  </HEAD>
 <BODY>
 	<center>
 	<h4>  
	  <%
	    config configFile = new config();
	    configFile.init();
	     
			String rootpath = configFile.getString( "mysqlbase.rootpath" );
			String  createType = "";
			int number = 0;
			
			if(request.getParameter( "createType" ) != null)
			{
				 createType=request.getParameter( "createType" );
			}
		  if(request.getParameter( "num" ) != null)
			{
				 number = Integer.parseInt( request.getParameter( "num" ) );
			}
	    //��ʼ�ж��û�����
		  try 
		  {
			  if( createType != "" && createType != null )
			  {
			     //CreateJs.buildAllJs( rootpath );
				   if( createType=="0" || createType.equals("0") )
					 {
						 CreateIndexHtml cindex = new CreateIndexHtml();
						 out.println("<br>����������ҳ............");
						 cindex.buildIndex( rootpath );
						/*cindex.buildEnterpriseIndex(conn,rootpath);
						//cindex.buildOrderIndex(conn,rootpath);
						//cindex.buildSupplyIndex(conn,rootpath);
						//CreateProductHtml cproduct = new CreateProductHtml();
						cproduct.builderProductDetail(conn,rootpath,number);*/
						 out.println("<br>������ҳ����............");
					 }
				   /*else if( createType=="1" || createType.equals("1") )
				   {
				      //������ҵ�����ҳ��
				      CreateCustomerHtml ccustomer = new CreateCustomerHtml();
							ccustomer.createCustomer(conn,rootpath,number);
				   }
				   else if( createType=="2" || createType.equals("2") )
				   {
		        	//���ɹ�Ӧ���ҳ��
	            out.println("�������ɹ�Ӧ���ҳ��............");
	            CreateSaleInfoHtml csale = new CreateSaleInfoHtml();
	            csale.builderSaleInfoDetail(conn,rootpath,number);
	            out.println("���ɹ�Ӧ���ҳ�����............");
				   }
				   else if( createType=="3" || createType.equals("3") )
				   {
	           //���������ҳ��
	            out.println("�������������ҳ��............");
	            CreateStockInfoHtml cstock = new CreateStockInfoHtml();
	            cstock.builderProductDetail(conn,rootpath,number);
	            cstock.builderBiddingDetail(conn,rootpath,number);
	            out.println("���������ҳ�����............");
				    }
				    else if( createType=="4" || createType.equals("4") )
				    {
				        //�����˲ſ����ҳ��
		            CreateHrHtml chr = new CreateHrHtml();
		            chr.buildHrIndex(conn,rootpath);
		            out.println( "�����˲ſ����ҳ�����............" );
				    }
				    else if(createType=="5" || createType.equals("5"))
				    {
		          //������Ѷ���ҳ��
		            out.println("����������Ѷ���ҳ��............");
		            CreateNewsHtml cnews= new CreateNewsHtml();
		            cnews.buildIndex(conn,rootpath);
		            out.println("������Ѷ���ҳ�����............");
				     }
				     else if(createType=="6" || createType.equals("6"))
				     {
		            CreateSchoolHtml cschool = new CreateSchoolHtml();
		            cschool.buildIndex(conn,rootpath);
		            out.println("����ѧԺ���ҳ�����............");
				     }*/
				     
				  }
		   } catch (NumberFormatException e) 
		   {
	        out.println("e = " + e.toString());
	     }
	   out.println("<SCRIPT LANGUAGE=\"JAVASCRIPT\">\n"+"setTimeout('window.opener=null;window.close();',1000);"+"</SCRIPT>");
	%>
</h4>
	<center>
 </BODY>
</HTML>
