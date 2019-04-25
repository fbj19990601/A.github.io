<%@ page contentType="text/html; charset=gb2312" language="java"%>
<jsp:useBean id="chart" scope="page" class="com.saas.biz.commen.CreateChart"></jsp:useBean>
<%@ page import="java.util.*" %>
<%@ page import="org.jfree.chart.ChartFactory" %> 
<%@ page import="org.jfree.chart.ChartUtilities" %> 
<%@ page import="org.jfree.chart.JFreeChart " %> 
<%@ page import="org.jfree.chart.plot.PiePlot" %> 
<%@ page import="org.jfree.data.category.DefaultCategoryDataset" %> 
<%
    ArrayList datalist = new ArrayList();
    HashMap datamap = new HashMap();
    datamap.put("title","西北地区");
    datamap.put("value","80");
    datalist.add(datamap);
    HashMap datasmap = new HashMap();
    datasmap.put("title","华北地区");
    datasmap.put("value","10");
    datalist.add(datasmap);
    
    DefaultCategoryDataset dataset = chart.createCategoryDataset(datalist);  
    JFreeChart freeChart = chart.createCategory(dataset,"客户地区分布图");
    chart.saveAsFile(freeChart, "/usr/www/soft.xsaas.com/pie12s.png", 800, 600);

%>
<img src="/pie123.png">