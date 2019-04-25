<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"

"http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>

<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>

<%@ page import="java.util.*"%>

<%@ page import="java.text.SimpleDateFormat"%>

<%@ page import="java.util.Date"%>

<%@ page contentType="text/html;charset=GBK"%>

<%@ page import="com.saas.biz.commen.ParamethodMgr"%>

<%@ page import="com.saas.biz.userMgr.UserInfo"%>

<jsp:useBean id="bean" class="com.saas.biz.commen.commMethodMgr" scope="page"/>

<%

    String date = new SimpleDateFormat("yyyy-MM-dd").format(new Date());

    String user_id="";

    String user_name="",passwd="",passwd_answer="",pspt_id="",pspt_end_date=date,pspt_addr="",birthday=date,local_native_code="",

    post_addr="",phone="",home_addr="",community_id="",job="",email="";

     ParamethodMgr paramCom=new ParamethodMgr();

     if (request.getParameter("user_id") != null)

    {

        user_id = request.getParameter("user_id");

        UserInfo userOjb=new UserInfo();

        ArrayList userList=userOjb.getUserInfoByUserId(user_id);

        if(userList !=null && userList.size()>0)

        {

           HashMap map=(HashMap)userList.get(0);

           if(map.get("user_name")!=null)

           {

             user_name=map.get("user_name").toString();

           }

           if(map.get("passwd")!=null)

           {

             passwd=map.get("passwd").toString();

           }

           if(map.get("passwd_answer")!=null)

           {

             passwd_answer=map.get("passwd_answer").toString();

           }

            if(map.get("pspt_id")!=null)

           {

             pspt_id=map.get("pspt_id").toString();

           }

           if(map.get("pspt_end_date")!=null)

           {

             pspt_end_date=map.get("pspt_end_date").toString();

             if(pspt_end_date.length()>10)

             {

              pspt_end_date=pspt_end_date.substring(0,10);

             }

           }

            if(map.get("pspt_addr")!=null)

           {

             pspt_addr=map.get("pspt_addr").toString();

           }

           if(map.get("birthday")!=null)

           {

             birthday=map.get("birthday").toString();

             if(birthday.length()>10)

             {

              birthday=birthday.substring(0,10);

             }

           }

            if(map.get("local_native_code")!=null)

           {

             local_native_code=map.get("local_native_code").toString();

           }

            if(map.get("post_addr")!=null)

           {

             post_addr=map.get("post_addr").toString();

           }

            if(map.get("phone")!=null)

           {

             phone=map.get("phone").toString();

           }

           if(map.get("community_id")!=null)

           {

             community_id=map.get("community_id").toString();

           }

            if(map.get("home_addr")!=null)

           {

             home_addr=map.get("home_addr").toString();

           }

            if(map.get("job")!=null)

           {

             job=map.get("job").toString();

           }

            if(map.get("email")!=null)

           {

             email=map.get("email").toString();

           }

        }

    }

	ArrayList  passReqList =paramCom.getCompareInfo("CRM","passwd_ques");

	ArrayList  departList=paramCom.getCompareInfo("CRM","depart_code");

	ArrayList  creditList=paramCom.getCompareInfo("CRM","pspt_type_code");

	ArrayList  eparchyList=paramCom.getCompareInfo("CRM","eparchy_code");

	ArrayList  cityList=paramCom.getCompareInfo("CRM","city_code");

	ArrayList  folkList=paramCom.getCompareInfo("CRM","folk_code");

	ArrayList workList=paramCom.getCompareInfo("CRM","work_name");

	ArrayList workDeparts=paramCom.getCompareInfo("CRM","work_depart");

	ArrayList degreeList=paramCom.getCompareInfo("CRM","work_depart");

%>

<html>

<head>

<title>�������</title>

<link href="/style/layout.css" rel="stylesheet" type="text/css">


<script language="JavaScript" src="/www/fuction/public.js"></script>

<script src="/www/fuction/calendar.js" type="text/javascript"></script>

<script language="JavaScript">

function Check_Value()

{

	if (cTrim(document.Userform.passwd.value,0) == "" || document.Userform.passwd.value == null) 

	{                                                                                         

		alert("���벻����Ϊ�գ�");                                                             

		document.Userform.passwd.focus();                                                    

		return false;                                                                            

	} 

	if (cTrim(document.Userform.passwd1.value,0) == "" || document.Userform.passwd1.value == null) 

	{                                                                                         

		alert("ȷ�����벻����Ϊ�գ�");                                                             

		document.Userform.passwd1.focus();                                                    

		return false;                                                                            

	}    

	if (document.Userform.passwd.value !=document.Userform.passwd1.value) 

	{                                                                                         

		alert("�������벻һ�£�");                                                             

		document.Userform.passwd.focus();                                                    

		return false;                                                                            

	}                                                                                             

	if (cTrim(document.Userform.passwd_answer.value,0) == "" || document.Userform.passwd_answer.value == null) 

	{                                                                                         

		alert("������ʾ����𰸲�����Ϊ�գ�");                                                             

		document.Userform.passwd_answer.focus();                                                    

		return false;                                                                            

	}                                                                                        

	if (cTrim(document.Userform.pspt_id.value,0) == "" || document.Userform.pspt_id.value == null) 

	{                                                                                         

		alert("֤�����벻����Ϊ�գ�");                                                             

		document.Userform.pspt_id.focus();                                                    

		return false;                                                                            

	}                                                                                      

	if (cTrim(document.Userform.local_native_code.value,0) == "" || document.Userform.local_native_code.value == null) 

	{                                                                                         

		alert("���᲻����Ϊ�գ�");                                                             

		document.Userform.local_native_code.focus();                                                    

		return false;                                                                            

	}                                                                                        

	if (cTrim(document.Userform.phone.value,0) == "" || document.Userform.phone.value == null) 

	{                                                                                         

		alert("��ϵ�绰������Ϊ�գ�");                                                             

		document.Userform.phone.focus();                                                    

		return false;                                                                            

	}                                                                                        

	if (cTrim(document.Userform.job.value,0) == "" || document.Userform.job.value == null) 

	{                                                                                         

		alert("ְλ������Ϊ�գ�");                                                             

		document.Userform.job.focus();                                                    

		return false;                                                                            

	}                                                                                   

	if (cTrim(document.Userform.community_id.value,0) == "" || document.Userform.community_id.value == null) 

	{                                                                                         

		alert("��ᱣ�ϺŲ�����Ϊ�գ�");                                                             

		document.Userform.community_id.focus();                                                    

		return false;                                                                            

	}                                                                                      

 	    return true;

}

function check_none(current_obj)

{

      if (current_obj.advshow.checked)

      {

  	    current_obj.submit1.disabled=false;        	     

  	  }

  	 else

  	 {

  	    current_obj.submit1.disabled=true;

  	 }

}

function exit()

{

    window.location.reload();

}

function confirmsub(formobj)

{

  if(window.confirm('��ȷ��Ҫ�ύ��')) 

  {

      if (!Check_Value())

      {

           return;

      }    	            	           

      formobj.submit();    	         

  }

  else

  {

      return;

  }

}

</script>

<script language="javascript" src="/js/Calendar_Ly.js"></script>



</head>

<body>

<table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">

  <tr>

    <td height="26" background="/img/bg-1.gif">&nbsp;</td>

  </tr>

  <tr>

    <td background="/img/bg-2.gif">

	<table width=100% border=0 cellpadding=5 cellspacing=1  bgcolor="#dddddd"  align="center">

        <form name=Userform action=/doTradeReg.do method=post>

       <input type=hidden name=trade_type_code value=0110>

       <input name=user_id type=hidden value=<%=user_id%>>

	 <tr>

	  <td class="line1" align="left" colspan="2">�޸��û���Ϣ</td>

	 </tr>

     <tr>

      <td  style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;" align=right width="25%">�û���(Ӣ��)</td>

      <td  style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left  width="75%"><%=user_name%></td>

    </tr>

    <tr>

      <td  style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;" align=right>����</td>

      <td  style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left><div class="ping1"><input type=password name=passwd value="<%=passwd%>"></div></td>

    </tr>

    <tr>

      <td  style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;" align=right>ȷ������</td>

      <td  style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left><div class="ping1"><input type=password name=passwd1 value="<%=passwd%>"></div></td>

    </tr>

    <tr>

      <td  style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;" align=right>������ʾ����</td>

      <td  style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left><select name=passwd_ques>

               <%

					if(passReqList != null && passReqList.size()>0)

					{

						for(int i=0;i<passReqList.size();i++)

						{

							HashMap map=(HashMap)passReqList.get(i);

							String value=map.get("para_code1").toString();

							String name=map.get("para_code2").toString();

							%>

                               <option value="<%= value %>"><%= name %></option>

                               <%

						}

					} %>

        </select>

     </td>

    </tr>

    <tr>

      <td  style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;" align=right>������ʾ�����</td>

      <td  style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left><input type=text name=passwd_answer value="<%=passwd_answer%>"></td>

    </tr>

    <tr>

      <td  style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;" align=right>��������</td>

      <td  style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left><select name=depart_code>

          <%

					if(departList != null && departList.size()>0)

					{

						for(int i=0;i<departList.size();i++)

						{

							HashMap map=(HashMap)departList.get(i);

							String value=map.get("para_code1").toString();

							String name=map.get("para_code2").toString();

							%>

                               <option value="<%= value %>"><%= name %></option>

                               <%

						}

					} %>

        </select></td>

    </tr>

    <tr>

      <td  style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;" align=right>�Ƿ������½�Ż�</td>

      <td  style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left><select name=web_login_tag>

          <option value=1>����</option>

          <option value=0>������</option>

        </select></td>

    </tr>

    <tr>

      <td  style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;" align=right>���б���</td>

      <td  style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left><select name=eparchy_code>

          <%

					if(eparchyList != null && eparchyList.size()>0)

					{

						for(int i=0;i<eparchyList.size();i++)

						{

							HashMap map=(HashMap)eparchyList.get(i);

							String value=map.get("para_code1").toString();

							String name=map.get("para_code2").toString();

							%>

                               <option value="<%= value %>"><%= name %></option>

                               <%

						}

					} %>

        </select></td>

    </tr>

    <tr>

      <td  style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;" align=right>���ر���</td>

      <td  style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left><select name=city_code>

          <%

					if(cityList != null && cityList.size()>0)

					{

						for(int i=0;i<cityList.size();i++)

						{

							HashMap map=(HashMap)cityList.get(i);

							String value=map.get("para_code1").toString();

							String name=map.get("para_code2").toString();

							%>

                               <option value="<%= value %>"><%= name %></option>

                               <%

						}

					} %>

        </select></td>

    </tr>

    <tr>

      <td  style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;" align=right>֤�����</td>

      <td  style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left><select name=pspt_type_code>

          <%

					if(creditList != null && creditList.size()>0)

					{

						for(int i=0;i<creditList.size();i++)

						{

							HashMap map=(HashMap)creditList.get(i);

							String value=map.get("para_code1").toString();

							String name=map.get("para_code2").toString();

							%>

                               <option value="<%= value %>"><%= name %></option>

                               <%

						}

					} %>

        </select></td>

    </tr>

    <tr>

      <td  style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;" align=right>֤������</td>

      <td  style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left><input type=text name=pspt_id value="<%=pspt_id%>"></td>

    </tr>

    <tr>

      <td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;" align=right>֤����Ч��</td>

      <td style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left><input name="pspt_end_date" type="text"  id="pspt_end_date" onfocus="setday(this);"  value="<%=pspt_end_date%>">(yyyy-MM-dd)</td>

    </tr>

    <tr>

      <td  style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;" align=right>֤����ַ</td>

      <td  style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left><input type=text name=pspt_addr value=<%=pspt_addr%>></td>

    </tr>

    <tr>

      <td  style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;" align=right>�û��Ա�</td>

      <td  style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left><select name=sex>

          <option value=1>Ů��</option>

          <option value=0>����</option>

        </select></td>

    </tr>

    <tr>

      <td  style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;" align=right>����</td>

      <td style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left><input name="birthday" type="text"  id="birthday" onfocus="setday(this);"  value="<%=birthday%>" >(yyyy-MM-dd)</td>

    </tr>

    <tr>

      <td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;" align=right>����</td>

      <td  style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left><input type=text name=local_native_code value="<%=local_native_code%>"></td>

    </tr>

    <tr>

      <td  style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;" align=right>����</td>

      <td  style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left><select name=folk_code>

        <%

					if(folkList != null && folkList.size()>0)

					{

						for(int i=0;i<folkList.size();i++)

						{

							HashMap map=(HashMap)folkList.get(i);

							String value=map.get("para_code1").toString();

							String name=map.get("para_code2").toString();

							%>

                               <option value="<%= value %>"><%= name %></option>

                               <%

						}

					} %>

        </select></td>

    </tr>

    <tr>

      <td  style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;" align=right>��ϵ�绰</td>

      <td  style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left><input type=text name=phone value="<%=phone%>"></td>

    </tr>

    <tr>

      <td  style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;" align=right>ͨ�ŵ�ַ</td>

      <td  style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left><input type=text name=post_addr value="<%=post_addr%>"></td>

    </tr>

    <tr>

      <td  style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;" align=right>��ͥ��ַ</td>

      <td  style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left><input type=text name=home_addr value="<%=home_addr%>"></td>

    </tr>

    <tr>

      <td  style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;"  align=right>�����ʼ�</td>

      <td  style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left><input type=text name=email value="<%=email%>"></td>

    </tr>

    <tr>

      <td  style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;" align=right>������λ</td>

      <td  style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left><select name=work_name>

          <%

					if(workList != null && workList.size()>0)

					{

						for(int i=0;i<workList.size();i++)

						{

							HashMap map=(HashMap)workList.get(i);

							String value=map.get("para_code1").toString();

							String name=map.get("para_code2").toString();

							%>

                               <option value="<%= value %>"><%= name %></option>

                               <%

						}

					} %>

        </select></td>

    </tr>

    <tr>

      <td  style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;" align=right>��������</td>

      <td  style="background-color:#ffffff; color:#000000;  font-size:12px;"  align=left><select name=work_depart>

           <%

					if(workDeparts != null && workDeparts.size()>0)

					{

						for(int i=0;i<workDeparts.size();i++)

						{

							HashMap map=(HashMap)workDeparts.get(i);

							String value=map.get("para_code1").toString();

							String name=map.get("para_code2").toString();

							%>

                               <option value="<%= value %>"><%= name %></option>

                               <%

						}

					} %>

        </select></td>

    </tr>

    <tr>

      <td  style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;" align=right>ְλ</td>

      <td  style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left><input type=text name=job value="<%=job%>"></td>

    </tr>

    <tr>

      <td  style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;" align=right>�����̶�</td>

      <td  style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left><select name=educate_degree_code>

          <%

					if(degreeList != null && degreeList.size()>0)

					{

						for(int i=0;i<degreeList.size();i++)

						{

							HashMap map=(HashMap)degreeList.get(i);

							String value=map.get("para_code1").toString();

							String name=map.get("para_code2").toString();

							%>

                               <option value="<%= value %>"><%= name %></option>

                               <%

						}

					} %>

        </select></td>

    </tr>

    <tr>

      <td  style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;" align=right>����</td>

      <td  style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left><select name=marriage>

          <option value=0>δ��</option>

          <option value=1>�ѻ�</option>

        </select></td>

    </tr>

    <tr>

      <td  style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;" align=right>��ᱣ�Ϻ�</td>

      <td  style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left><input type=text name=community_id value="<%=community_id%>"></td>

    </tr>

    <tr>   

    </td>

      <td style="background-color:#ffffff; color:#000000;  font-size:12px;"   align=center colspan=2><INPUT id=advcheck name=advshow type=checkbox value=0 onclick=check_none(Userform)>

        ����������ȷ����<input type=hidden name=rsrv_num1 value=0>

      </td>

	</tr>

    <tr>

      <td  style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px; padding-top:10px;padding-bottom:10px;"align=center  colspan=2><input name=submit1 type=button value=ȷ�� disabled=true onclick=confirmsub(Userform)>

        <input name=button1 type=button value=ȡ�� onclick=exit()></td>

    </tr>

  

 </table></td>

  </tr>

  <tr>

    <td height="46" background="/img/bg-3.gif">&nbsp;</td>

  </tr>

</table>

</body>

</html>

