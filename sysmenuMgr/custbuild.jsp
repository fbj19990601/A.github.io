  <%@ page import="com.base.db.DBConnectorBase,
                 com.base.db.DBConnectionManager,
                 com.base.config.ProjectConfig,
                 java.util.Vector,
                 com.saas.biz.commen.config,
                 com.bean.ProductClassInfo,
                 com.buildhtml.*"%>
<%@ page contentType="text/html;charset=GBK" language="java" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="com.base.config.ProjectConfig"%>
<html>
 <HEAD>
  <TITLE><bean:message key="str116"/></TITLE>
 </HEAD>
 <BODY>
 	<center>
 		<h4>  
		   
<%
    DBConnectorBase conn = DBConnectionManager.getInstance().getConnection(ProjectConfig.DBTITLE);
    config configFile= new config();
    configFile.init();
    //String rootpath = "/usr/www/saas/";//getServletConfig().getServletContext().getRealPath("/");
	String rootpath = configFile.getString("mysqlbase.rootpath");
	String  createType="";
	int number=0;
	if(request.getParameter("createType")!=null)
	{
		 createType=request.getParameter("createType");
	}
    if(request.getParameter("num")!=null)
	{
		number= Integer.parseInt(request.getParameter("num"));
	}
    //��ʼ�ж��û�����
    try 
    {
	if(createType!="" && createType!=null)
	{
	       CreateJs.buildAllJs(rootpath);
		   if(createType=="0" || createType.equals("0"))
			{
				CreateIndexHtml cindex = new CreateIndexHtml();
				out.println("<br>����������ҳ............");
				cindex.buildIndex(conn,rootpath);
				cindex.buildEnterpriseIndex(conn,rootpath);
				cindex.buildOrderIndex(conn,rootpath);
				cindex.buildSupplyIndex(conn,rootpath);
				CreateProductHtml cproduct = new CreateProductHtml();
				cproduct.builderProductDetail(conn,rootpath,number);
				out.println("<br>������ҳ����............");
			 
		        //������ҵ�����ҳ��
		        CreateCustomerHtml ccustomer = new CreateCustomerHtml();
				ccustomer.createCustomer(conn,rootpath,number);
		     
			    //���ɹ�Ӧ���ҳ��
		        out.println("�������ɹ�Ӧ���ҳ��............");
		        CreateSaleInfoHtml csale = new CreateSaleInfoHtml();
		        csale.builderSaleInfoDetail(conn,rootpath,number);
		        out.println("���ɹ�Ӧ���ҳ�����............");
		     
		        //���������ҳ��
		        out.println("�������������ҳ��............");
		        CreateStockInfoHtml cstock = new CreateStockInfoHtml();
		        cstock.builderProductDetail(conn,rootpath,number);
		        cstock.builderBiddingDetail(conn,rootpath,number);
		        out.println("���������ҳ�����............");
		     
				//�����˲ſ����ҳ��
		        CreateHrHtml chr = new CreateHrHtml();
		        chr.buildHrIndex(conn,rootpath);
		        chr.buildJobList(conn,rootpath);
		        chr.buildRecJobList(conn,rootpath);
		        chr.buildResumeDetail(conn,rootpath,number);
		        chr.buildResumeList(conn,rootpath);
		        chr.buildEnterpriseDetail(conn,rootpath,number);
		        out.println("�����˲ſ����ҳ�����............");
		     
		        //������Ѷ���ҳ��
		        out.println("����������Ѷ���ҳ��............");
		        CreateNewsHtml cnews= new CreateNewsHtml();
		        cnews.buildIndex(conn,rootpath);
		        for(int i=1;i <=29 ;i++)
		        {
		            cnews.buildList(conn,rootpath,String.valueOf(i));
		        }
		        cnews.buildDetail(conn,rootpath,number);
		        out.println("������Ѷ���ҳ�����............");
		      
		        CreateSchoolHtml cschool = new CreateSchoolHtml();
		        cschool.buildIndex(conn,rootpath);
		        cschool.buildDetail(conn,rootpath,number);
		        ProductClassInfo pinfo = new ProductClassInfo();
		        Vector rvec = pinfo.getProductClassInfoVectorByClassType(conn,"8");
		        for(int i=0;i < rvec.size();i++)
		        {
		            ProductClassInfo pcinfo = (ProductClassInfo)rvec.get(i);
		            cschool.buildList(conn,rootpath,pcinfo.class_id);
		        }
		        for(int i=1;i < 4;i++)
		        {
		            cschool.buildThreeList(conn,rootpath,"0",i);
		        }
		        out.println("����ѧԺ���ҳ�����............");
		      
			    //���ɲ�Ʒ��ϸҳ��
			     
	            cproduct.builderProductDetail(conn,rootpath,number);
		      
		        //��Ӧ��Ϣ��ϸҳ��
		           
                csale.builderSaleInfoDetail(conn,rootpath,number);
		      
		        //����Ϣ��ϸҳ��
 
                cstock.builderProductDetail(conn,rootpath,number);
		      
			    //��Ƹ��Ϣ��ϸҳ��
			      
	            chr.buildEnterpriseDetail(conn,rootpath,number);
		      
		        //�б���Ϣ��ϸҳ��
			      
	            cstock.builderBiddingDetail(conn,rootpath,number);
		      
		        //��ְ��Ϣ��ϸҳ��
		        
                chr.buildResumeDetail(conn,rootpath,number);
		      
		        //��Ѷ��Ϣ��ϸҳ��
		         
                cnews.buildDetail(conn,rootpath,number);
		      
		        //ѧԺ��Ϣ��ϸҳ��
		        
                cschool.buildDetail(conn,rootpath,number);
		     } 
	}
   } catch (NumberFormatException e) {
        out.println("e = " + e.toString());
}
   out.println("<SCRIPT LANGUAGE=\"JAVASCRIPT\">\n"+"setTimeout('window.opener=null;window.close();',1000);"+"</SCRIPT>");
%>
</h4>
<center>
 </BODY>
</HTML>
<%DBConnectionManager.getInstance().freeConnection(ProjectConfig.DBTITLE, conn);%>
