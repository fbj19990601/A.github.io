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
					//开始判断用户请求
					try {
						if (createType != "" && createType != null) {
							//CreateJs.buildAllJs( rootpath );
							if (createType == "0" || createType.equals("0")) {
								CreateOOCLIndexHtml cindex = new CreateOOCLIndexHtml();
								out.println("<br>正在生成首页............");
								cindex.buildIndex(rootpath);
								out.println("<br>生成首页结束............");
							}
							else if (createType == "1" || createType.equals("1")) {
								//生成供应相关页面
								CreateSupplyInfoHtml csupply = new CreateSupplyInfoHtml();
								out.println("<br>正在生成供应相关页面............");
								csupply.buildSupplyIndex(rootpath);
								out.println("<br>生成供应相关页面结束............");
							}
							else if (createType == "2" || createType.equals("2")) {
								//生成求购相关页面
								out.println("<br>正在生成求购相关页面............");
								CreateStockInfoHtml cstock = new CreateStockInfoHtml();
								cstock.buildStockIndex(rootpath);
								out.println("<br>生成求购相关页面结束............");
							}
							else if (createType == "3" || createType.equals("3")) {
								//生成企业库相关页面
								CreateEnterpriseHtml centerprise = new CreateEnterpriseHtml();
								out.println("<br>正在生成企业相关页面............");
								centerprise.createEnterpriseIndex(rootpath);
								out.println("<br>生成企业相关页面结束............");
							}
							else if (createType == "4" || createType.equals("4")) {
								//生成资讯相关页面
								 out.println("<br>正在生成资讯相关页面............");
								 CreateNewsHtml cnews= new CreateNewsHtml();
								 cnews.buildIndex( rootpath );
								 out.println("<br>生成资讯相关页面结束............");
							}
							
							else if (createType == "5" || createType.equals("5")) {
								//生成人才库相关页面
								out.println("<br>正在生成人才库相关页面............");
								CreateJobResumeHtml chr = new CreateJobResumeHtml();
								chr.buildIndex( rootpath );
								out.println("<br>生成人才库相关页面结束............");
							}
							
							 else if(createType=="6" || createType.equals("6"))
							 {
							   out.println("<br>正在生成学院相关页面............");
								 CreateSchoolHtml cschool = new CreateSchoolHtml();
								 cschool.buildIndex( rootpath );
								 out.println("<br>生成学院相关页面结束............");
							 }
							 else if(createType=="7" || createType.equals("7"))
							 {
							 	 out.println("<br>正在生成企业管理相关页面............");
								 CreateCustomerHtml cscustomer = new CreateCustomerHtml();
								 cscustomer.createCustomer( rootpath );
								 out.println("<br>生成企业管理相关页面结束............");
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
