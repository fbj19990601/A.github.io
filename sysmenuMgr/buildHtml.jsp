  <%@ page import="com.base.db.DBConnectorBase,
                 com.base.db.DBConnectionManager,
                 com.base.config.ProjectConfig,
                 java.util.Vector,
                 com.bean.ProductClassInfo,
                 com.buildhtml.*"%>

<%@ page contentType="text/html;charset=GBK" language="java" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<HTML>
 <HEAD>
  <TITLE><bean:message key="str116"/></TITLE>
 </HEAD>
 <BODY>
 	<center>
 		<h4>
		   
<%
    DBConnectorBase conn = DBConnectionManager.getInstance().getConnection(ProjectConfig.DBTITLE);
    String rootpath = "/usr/www/saas/";//getServletConfig().getServletContext().getRealPath("/");
  %>
  <input type="text" name="paths" value=<%=rootpath%>>
  <%
    if(request.getParameter("action")!=null && request.getParameter("action").equals("do")){
        ProductClassInfo pinfo = new ProductClassInfo();
        try {
            int productnum = Integer.parseInt(request.getParameter("product"));
            int enterprisenum = Integer.parseInt(request.getParameter("enterprise"));
            int supplynum = Integer.parseInt(request.getParameter("supply"));
            int stocknum = Integer.parseInt(request.getParameter("stock"));
            int biddingnum = Integer.parseInt(request.getParameter("bidding"));
            int jobnum = Integer.parseInt(request.getParameter("job"));
            int zpnum = Integer.parseInt(request.getParameter("zp"));
            int newsnum = Integer.parseInt(request.getParameter("news"));
            int schoolnum = Integer.parseInt(request.getParameter("school"));

            //����ǰ�ĸ�Ƶ����ҳ
            CreateIndexHtml cindex = new CreateIndexHtml();
            out.println("����������ҳ............");
            cindex.buildIndex(conn,rootpath);
            out.println("������ҳ����............");
            out.println("����������ҵ��ҳ............");
            cindex.buildEnterpriseIndex(conn,rootpath);
            out.println("������ҵ��ҳ����............");
            out.println("������������ҳ............");
            cindex.buildOrderIndex(conn,rootpath);
            out.println("��������ҳ����............");
            out.println("�������ɹ�Ӧ��ҳ............");
            cindex.buildSupplyIndex(conn,rootpath);
            out.println("���ɹ�Ӧ��ҳ����............");
            //����ѧԺ���ҳ��
            out.println("��������ѧԺ���ҳ��............");

            CreateSchoolHtml cschool = new CreateSchoolHtml();
            cschool.buildIndex(conn,rootpath);
            cschool.buildDetail(conn,rootpath,schoolnum);
            Vector rvec = pinfo.getProductClassInfoVectorByClassType(conn,"8");
            for(int i=0;i < rvec.size();i++){
                ProductClassInfo pcinfo = (ProductClassInfo)rvec.get(i);
                cschool.buildList(conn,rootpath,pcinfo.class_id);
            }
            for(int i=1;i < 4;i++){
                cschool.buildThreeList(conn,rootpath,"0",i);
            }
            out.println("����ѧԺ���ҳ�����............");
            //������Ѷ���ҳ��
            out.println("����������Ѷ���ҳ��............");
            CreateNewsHtml cnews= new CreateNewsHtml();
            cnews.buildIndex(conn,rootpath);
            for(int i=1;i <=29 ;i++){
                cnews.buildList(conn,rootpath,String.valueOf(i));
            }
            cnews.buildDetail(conn,rootpath,newsnum);
            out.println("������Ѷ���ҳ�����............");

            out.println("���������˲ſ����ҳ��............");
            //�����˲ſ����ҳ��
            CreateHrHtml chr = new CreateHrHtml();
            chr.buildHrIndex(conn,rootpath);
            chr.buildJobList(conn,rootpath);
            chr.buildRecJobList(conn,rootpath);
            chr.buildRecJobList(conn,rootpath);
            chr.buildResumeDetail(conn,rootpath,jobnum);
            chr.buildResumeList(conn,rootpath);
            chr.buildEnterpriseDetail(conn,rootpath,zpnum);
            out.println("�����˲ſ����ҳ�����............");


            out.println("�������������ҳ��............");
            //���������ҳ��
            CreateStockInfoHtml cstock = new CreateStockInfoHtml();
            cstock.builderProductDetail(conn,rootpath,stocknum);
            cstock.builderBiddingDetail(conn,rootpath,biddingnum);
            out.println("���������ҳ�����............");
            //���ɹ�Ӧ���ҳ��
            out.println("�������ɹ�Ӧ���ҳ��............");
            CreateSaleInfoHtml csale = new CreateSaleInfoHtml();
            csale.builderSaleInfoDetail(conn,rootpath,supplynum);

            out.println("���ɹ�Ӧ���ҳ�����............");
            //���ɲ�Ʒ���ҳ��
            out.println("�������ɲ�Ʒ���ҳ��............");
            CreateProductHtml cproduct = new CreateProductHtml();
            cproduct.builderProductDetail(conn,rootpath,productnum);

            out.println("���ɲ�Ʒ���ҳ�����............");
            //������ҵ���ҳ��
            out.println("����������ҵ���ҳ��............");
            CreateCustomerHtml ccustomer = new CreateCustomerHtml();
            ccustomer.createCustomer(conn,rootpath,enterprisenum);
            out.println("������ҵ���ҳ�����............");

            CreateJs.buildAllJs(rootpath);

        } catch (NumberFormatException e) {
            out.println("e = " + e.toString());
        }
    }else{
        if(request.getParameter("action")!=null){
            String action = request.getParameter("action");

            if(action.equals("product")){
                int productnum = Integer.parseInt(request.getParameter("product"));
                CreateProductHtml cproduct = new CreateProductHtml();
                cproduct.builderProductDetail(conn,rootpath,productnum);
            }
            if(action.equals("enterprise")){
                int enterprisenum = Integer.parseInt(request.getParameter("enterprise"));
                CreateCustomerHtml ccustomer = new CreateCustomerHtml();
                ccustomer.createCustomer(conn,rootpath,enterprisenum);
            }
            if(action.equals("supply")){
                int supplynum = Integer.parseInt(request.getParameter("supply"));
                CreateSaleInfoHtml csale = new CreateSaleInfoHtml();
                csale.builderSaleInfoDetail(conn,rootpath,supplynum);
            }
            if(action.equals("stock")){
                int stocknum = Integer.parseInt(request.getParameter("stock"));
                CreateStockInfoHtml cstock = new CreateStockInfoHtml();
                cstock.builderProductDetail(conn,rootpath,stocknum);
            }
            if(action.equals("bidding")){
                int biddingnum = Integer.parseInt(request.getParameter("bidding"));
                CreateStockInfoHtml cstock = new CreateStockInfoHtml();
                cstock.builderBiddingDetail(conn,rootpath,biddingnum);
            }
            if(action.equals("job")){
                int jobnum = Integer.parseInt(request.getParameter("job"));
                CreateHrHtml chr = new CreateHrHtml();
                chr.buildResumeDetail(conn,rootpath,jobnum);
            }
            if(action.equals("zp")){
                int zpnum = Integer.parseInt(request.getParameter("zp"));
                CreateHrHtml chr = new CreateHrHtml();
                chr.buildEnterpriseDetail(conn,rootpath,zpnum);
            }
            if(action.equals("news")){
                int newsnum = Integer.parseInt(request.getParameter("news"));
                CreateNewsHtml cnews= new CreateNewsHtml();
                cnews.buildDetail(conn,rootpath,newsnum);
            }
            if(action.equals("school")){
                int schoolnum = Integer.parseInt(request.getParameter("school"));
                CreateSchoolHtml cschool = new CreateSchoolHtml();
                cschool.buildDetail(conn,rootpath,schoolnum);
            }
             if(action.equals("js")){
                CreateJs.buildAllJs(rootpath);
            }
        }
    }
%>
</h4>
<center>
 </BODY>
</HTML>
<%DBConnectionManager.getInstance().freeConnection(ProjectConfig.DBTITLE, conn);%>
