<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="java.util.*" %> 
<%@ page import="com.ahbay.bookMgr.*" %>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%@ page import="javax.servlet.http.*" %> 
<!-------------------------------------------------------------------
                          ��׼JavaScript������
--------------------------------------------------------------------->
<script language="JavaScript" src="public.js"></script>
<!--------------------------------------------------------------------
   ��ǰҳ��JavaScript�������֣������ύ��֤��ҳ�涯��������Ŀ��ȴ���
---------------------------------------------------------------------->


<!--------------------------------------------------------------------
                          ҳ��HTML���ֲ���    
---------------------------------------------------------------------->
<html>
<head>
<title>��վ��̨�ۺϹ���ϵͳ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK REL="stylesheet" HREF="./style.css" TYPE="text/css">
<link href="css.css" rel="stylesheet" type="text/css">
<style>
��BODY { 
��SCROLLBAR-FACE-COLOR: #DBF2E6;
��SCROLLBAR-HIGHLIGHT-COLOR:#DBF2E6; 
��SCROLLBAR-SHADOW-COLOR: #DBF2E6; 
��SCROLLBAR-ARROW-COLOR: #26b501;
��SCROLLBAR-BASE-COLOR:#26b501; 
��SCROLLBAR-DARKSHADOW-COLOR: #26b501
��} 
</style> 
</head>
<%
	com.ahbay.bookMgr.bookMgr books=new com.ahbay.bookMgr.bookMgr();
	books.id=request.getParameter("id");
	books=books.GetBookInfoById();
%>
<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width=95% border=0 cellpadding="0" cellspacing="0" align="center" >
  <tr> 
    <td height="33" align=left> <div align="left">
        <table width="152" border="0" align="left" cellpadding="0" cellspacing="0">
          <tr> 
            <td width="23"><img src="img/title1.gif" width="23" height="33"></td>
            <td width="106" background="img/title3.gif"><div align="center"><strong><font size="3"> 
                ������ϸ��Ϣ</font></strong></div></td>
            <td width="23"><img src="img/title2.gif" width="23" height="33"></td>
          </tr>
        </table>
        <strong></strong> </div></td>
  </tr>
</table>
 
<div align="center"> 
  <form name="form1" method="post" action="checkdd.jsp">
    <br>
    <TABLE cellSpacing=1 cellPadding=3 width="90%" align=center 
            bgColor=#009900 border=0>
      <TBODY>
        <TR bgcolor="#DBF2E6"> 
          <TD width="24%"> <DIV align=center>Ԥ������</DIV></TD>
          <TD width="38%"><%=books.getContent()%></TD>
          <TD width="8%"><div align="center">�� ��</div></TD>
          <TD width="30%"><%=books.getMyname()%></TD>
        </TR>
        <TR bgcolor="#DBF2E6"> 
          <TD> <DIV align=center>���֤��</DIV></TD>
          <TD><%=books.getSfcode()%></TD>
          <TD><div align="center">ְ ҵ</div></TD>
          <TD><%=books.getJob()%> </TD>
        </TR>
        <TR bgcolor="#DBF2E6"> 
          <TD> <DIV align=center>��λ����</DIV></TD>
          <TD><%=books.getCorpname()%></TD>
          <TD><div align="center">�� ��</div></TD>
          <TD><%=books.getPhone()%></TD>
        </TR>
        <TR bgcolor="#DBF2E6"> 
          <TD> <DIV align=center>�� ַ</DIV></TD>
          <TD><%=books.getAddress()%></TD>
          <TD><div align="center">�� ��</div></TD>
          <TD><%=books.getZip()%></TD>
        </TR>
        <TR bgcolor="#DBF2E6"> 
          <TD> <DIV align=center>�����ʼ�</DIV></TD>
          <TD><%=books.getEmail()%></TD>
          <TD><div align="center"> </div></TD>
          <TD> </TD>
        </TR>
         <TR bgcolor="#DBF2E6"> 
          <TD height=22><div align="center"> </div></TD>
          <TD colspan="3" valign="top">
          <input type=hidden name=id value=<%=request.getParameter("id")%>>
          <input type=submit value="ȷ������">
          </TD>
        </TR>
      </TBODY>
    </TABLE>
  </form>
  <p>&nbsp;</p>
</div><br></body>
</html>
