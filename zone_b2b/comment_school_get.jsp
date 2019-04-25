<%@ page import="com.base.db.DBConnectorBase,
                 com.base.db.DBConnectionManager,
                 com.base.config.ProjectConfig,
                 java.util.Vector,
                 com.bean.LeaveWordsInfo"%>
<%@ page contentType="text/html;charset=GBK"%>
<%
    response.setHeader("Cache-Control","no-store");
    response.setHeader("Pragrma","no-cache");
    response.setDateHeader("Expires",0);

    DBConnectorBase conn = DBConnectionManager.getInstance().getConnection(ProjectConfig.DBTITLE);
    String repository_id = request.getParameter("sid");
%>
<%
    LeaveWordsInfo lwinfo = new LeaveWordsInfo();
    Vector cvec = lwinfo.getLeaveWordsInfoVector(conn,repository_id);
    if(cvec.size()>0){
 %>
<div class="leftlbBody4">
  <%for(int i=0;i < cvec.size();i++){
      LeaveWordsInfo linfo = (LeaveWordsInfo)cvec.get(i);
  %>
  <div class="bd4_title">
   <img src="/images/zsk_3.gif" width="16" height="16" align="middle" />
   <strong>发言人：</strong><%=linfo.user_name%>
   <strong>时间：</strong> [<%=linfo.in_date%>]
   <strong>E-mail：</strong> <%=linfo.email%>
  </div>
  <div class="bd4_liuya" style="word-wrap: break-word"><%=linfo.content%>
  </div>
  <%}%>
 <%}%>
</div>
<%  DBConnectionManager.getInstance().freeConnection(ProjectConfig.DBTITLE, conn);  %>