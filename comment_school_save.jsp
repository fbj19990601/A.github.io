<%@ page import="com.base.db.DBConnectorBase,
                 com.base.db.DBConnectionManager,
                 com.base.config.ProjectConfig,
                 java.util.Date,
                 com.bean.LeaveWordsInfo,
                 org.apache.log4j.Logger,
                 tools.util.DateUtils,
                 com.bean.save.LeaveWordsInfoSave"%>
<%@ page contentType="text/html;charset=GBK"%>
<%
    if(request.getParameter("action")!=null && request.getParameter("action").equals("add")){

        LeaveWordsInfo  cinfo = new LeaveWordsInfo();
        try {
            DBConnectorBase conn = DBConnectionManager.getInstance().getConnection(ProjectConfig.DBTITLE);

            cinfo.root_id = request.getParameter("root_id");
            cinfo.content = request.getParameter("content");
            cinfo.user_name = request.getParameter("user_name");
            cinfo.user_id = request.getParameter("user_id");
            cinfo.email = request.getParameter("email");
            cinfo.word_type = request.getParameter("word_type");
            cinfo.in_date = DateUtils.formatDateToString(new Date());

            if(cinfo.user_name.trim().equals("")){
                cinfo.user_name = "сн©м";
            }

            LeaveWordsInfoSave.saverLeaveWordsInfo(conn,cinfo);
            DBConnectionManager.getInstance().freeConnection(ProjectConfig.DBTITLE, conn);
            out.println("<SCRIPT LANGUAGE=\"JAVASCRIPT\">\n"+"window.parent.AddReload();\n"+"</SCRIPT>");
        } catch (Exception e) {
            Logger log = Logger.getLogger(this.getClass().getName());
            log.error(e.toString());
        }
    }
%>