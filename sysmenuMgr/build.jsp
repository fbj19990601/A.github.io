<%@ page contentType="text/html;charset=GBK" language="java"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="com.base.config.ProjectConfig,
								java.util.*,com.saas.biz.commen.config,
								com.buildhtml.*"%>

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
					String rootpath = configFile.getString("mysqlbase.rootpath");
					String createType = "";
					int number = 0;
					if (request.getParameter("createType") != null) {
						createType = request.getParameter("createType");
					}
					if (request.getParameter("num") != null) {
						number = Integer.parseInt(request.getParameter("num"));
					}
					//��ʼ�ж��û�����
					try {
						if (createType != "" && createType != null) {
							//CreateJs.buildAllJs( rootpath );
							if (createType == "0" || createType.equals("0")) {
								CreateOOCLIndexHtml cindex = new CreateOOCLIndexHtml();
								out.println("<br>����������ҳ............");
								cindex.buildIndex(rootpath);
								out.println("<br>������ҳ����............");
							}
							else if (createType == "1" || createType.equals("1")) {
								//���ɹ�Ӧ���ҳ��
								CreateSupplyInfoHtml csupply = new CreateSupplyInfoHtml();
								out.println("<br>�������ɹ�Ӧ���ҳ��............");
								csupply.buildSupplyIndex(rootpath);
								out.println("<br>���ɹ�Ӧ���ҳ�����............");
							}
							else if (createType == "2" || createType.equals("2")) {
								//���������ҳ��
								out.println("<br>�������������ҳ��............");
								CreateStockInfoHtml cstock = new CreateStockInfoHtml();
								cstock.buildStockIndex(rootpath);
								out.println("<br>���������ҳ�����............");
							}
							else if (createType == "3" || createType.equals("3")) {
								//������ҵ�����ҳ��
								CreateEnterpriseHtml centerprise = new CreateEnterpriseHtml();
								out.println("<br>����������ҵ���ҳ��............");
								centerprise.createEnterpriseIndex(rootpath);
								out.println("<br>������ҵ���ҳ�����............");
							}
							else if (createType == "4" || createType.equals("4")) {
								//������Ѷ���ҳ��
								 out.println("<br>����������Ѷ���ҳ��............");
								 CreateNewsHtml cnews= new CreateNewsHtml();
								 cnews.buildIndex( rootpath );
								 out.println("<br>������Ѷ���ҳ�����............");
							}
							
							else if (createType == "5" || createType.equals("5")) {
								//�����˲ſ����ҳ��
								out.println("<br>���������˲ſ����ҳ��............");
								CreateJobResumeHtml chr = new CreateJobResumeHtml();
								chr.buildIndex( rootpath );
								out.println("<br>�����˲ſ����ҳ�����............");
							}
							
							 else if(createType=="6" || createType.equals("6"))
							 {
							   out.println("<br>��������ѧԺ���ҳ��............");
								 CreateSchoolHtml cschool = new CreateSchoolHtml();
								 cschool.buildIndex( rootpath );
								 out.println("<br>����ѧԺ���ҳ�����............");
							 }
							 else if(createType=="7" || createType.equals("7"))
							 {
							 	 out.println("<br>����������ҵ�������ҳ��............");
								 CreateCustomerHtml cscustomer = new CreateCustomerHtml();
								 cscustomer.createCustomer( rootpath );
								 out.println("<br>������ҵ�������ҳ�����............");
							 } 

						}
					}
					catch (NumberFormatException e) {
						out.println("e = " + e.toString());
					}
					out.println("<SCRIPT LANGUAGE=\"JAVASCRIPT\">\n" + "setTimeout('window.opener=null;window.close();',1000);" + "</SCRIPT>");
				%>
			</h4>
			<center>
	</BODY>
</HTML>
