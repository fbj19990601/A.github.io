<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.util.*"%>
<jsp:useBean id="classInfo" class="com.saas.biz.productclassMgr.Productclass" scope="page" />
<table width="100%" border="0" cellspacing="1" cellpadding="0" class="rencei_table_xian">
<%
//class_type=0 ��ҵ���� class_type=4 �ɹ�����  class_type=5 ���۷���  
  String class_type="",id="",paran="";
  if(request.getParameter("type")!=null){
     class_type=request.getParameter("type");
  }
  if(class_type=="3" || class_type.equals("3")){
   paran="&enterprise=1";
  }else if(class_type=="4" || class_type.equals("4")){
   paran="&stock=1";
  }else if(class_type=="5" || class_type.equals("5")){
    paran="&supply=1";
  }
  if(request.getParameter("id")!=null){
     id=request.getParameter("id");
  }
  ArrayList catalogList=classInfo.getClassInfoByUpClassId(class_type,id);
  if(catalogList!=null && catalogList.size()>0){
    int size=catalogList.size();
    
    int rows=0;
    if(size%5==0){
      rows=size/5;
    }else{
      rows=size/5+1;
    }
    int index=0;
    for(int i=0;i<rows;i++){
      out.print("<tr>");
      for(int j=0;j<5;j++){
        out.print("<td width='20%' align=left>");
        HashMap map=new HashMap();
        if(catalogList.size()>index){
          map=(HashMap)catalogList.get(index++);
        }
        String class_name="",class_id="",up_id="";
        if(map.get("class_name")!=null){class_name=map.get("class_name").toString();}
        if(map.get("class_id")!=null){class_id=map.get("class_id").toString();}
        if(map.get("up_class_id")!=null){up_id=map.get("up_class_id").toString();}
        if(class_id!=null && !class_id.equals("")){
        out.print("&nbsp;<a href=/zone_b2b/calalogList.jsp?type="+class_type+paran+"&class_id="+class_id+paran+" class=cpbt>"+class_name+"</a>");
        }
        out.print("</td>");
      }
      out.print("</tr>");
    }
  }
%>
 </table>

			