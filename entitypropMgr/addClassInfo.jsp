

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"

"http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>

<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>

<%@ page import="java.util.*"%>

<%@ page contentType="text/html;charset=GBK"%>

<jsp:useBean id="bean" class="com.saas.biz.commen.ParamethodMgr" scope="page" />

<jsp:useBean id="comm" class="com.saas.biz.commen.commMethodMgr" scope="page" />

<%

	ArrayList list=bean.getCompareInfoByAttr("46");

	ArrayList classList=bean.getCompareInfoByAttr("26");

	String class_id=comm.GenTradeId();

	HttpSession httpSess=request.getSession();

	String cust_id=(String)httpSess.getAttribute("SESSION_CUST_ID");
	String param_name="",param_value="";
	if(request.getParameter("param_value")!=null){param_value=request.getParameter("param_value");}
	param_name = bean.getParamNameByValue("46",param_value);
%>

<html>

	<head>

		<title><bean:message key="str1310"/></title>



		<link href="/style/layout.css" rel="stylesheet" type="text/css">


		

		<script language="javascript" src="/js/Calendar_Ly.js"></script>

		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/EntityClassInfo.js'></script>

		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/engine.js'></script>

		<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/util.js'></script>

		<script language="JavaScript">

    function Check_Value()

	{
        if(document.getElementById("entity_type").value==""){
        
         alert("请选择实体类型！");

	      document.getElementById("entity_type").focus();

	      return false;
        
        }
	    if(document.getElementById("class_name").value==""){

	      alert("分类名称不能为空！");

	      document.getElementById("class_name").focus();

	      return false;

	    }

	    if(document.getElementById("up").value=="2"){

	      if(document.getElementById("upclass").value==""){

	       alert("请选择上级分类！");

	       return false;

	      }

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

    	function confirmsub(formobj)

    	{

    	    if(window.confirm('你确定要提交吗？')) 

    	    {  	    	

    	        if (Check_Value())

    	        {

    	            formobj.submit();   	

    	        }

    	    }

    	    else

    	    {

    	        return;

    	    }

    	}

 function selectLevel(type){

   if(type=="0"){

     document.getElementById("upShow").style.display="none";

     document.getElementById("up_class_id").value="000000000000000";

   }else{

     var entity=document.getElementById("entity_type").value;

     if(entity=="a"){

      alert("请选择对象类型!");

     }

     else{

      document.getElementById("upShow").style.display="block";

      var cust=document.getElementById("cust_id").value;

      EntityClassInfo.getClassByUpClassAndEntity(cust,"000000000000000",entity,initUpClassInfo);

     }

   }

 }

 function initUpClassInfo(data){

  DWRUtil.removeAllOptions("upclass");

  DWRUtil.addOptions("upclass",data);

   var item=document.getElementById("upclass").length;

	if(item==0)

	{

	   alert("没有子分类，请重新选择！");

	   document.getElementById("up").options['0'].selected=true;

	   document.getElementById("upShow").style.display="none"; 

	}

	else

	{

	   document.getElementById("upShow").style.display="block";

	}

 }

 

 function createSelect(num,id){

     document.getElementById("up_class_id").value=id;

     var div="next"+num;

     var next=parseInt(1)+parseInt(num);

     var nextDiv="next"+num;

     var cust=document.getElementById("cust_id").value;

     document.getElementById(nextDiv).innerHTML="<select name=org"+num+" id=org"+num+" size=5 onclick=createSelect("+next+",this.value)></select><div id=next"+next+" style=float: left;display:inline;></div>"; 

     document.getElementById("active").value=num;

     EntityClassInfo.getClassInfoByUpClassId(cust,id,setActiveDown);

   }

   function setActiveDown(data){

      var obj="org"+document.getElementById("active").value;

      var objDiv="next"+document.getElementById("active").value;

      DWRUtil.removeAllOptions(obj);

	  DWRUtil.addOptions(obj,data);

	   var item=document.getElementById(obj).length;

	    if(item==0)

	    {

	    	document.getElementById(objDiv).style.display="none"; 

	    }

	     else

	   	{

	   		document.getElementById(objDiv).style.display="block";

	   	}

   }

   function setClasses(){

    document.getElementById("upShow").style.display="none";

    document.getElementById("up").options['0'].selected=true;

   }

</script>

	</head>

	<body>

		<form name=resumeForm action=/doTradeReg.do method=post target="_self">

			<table width="100%" border="0" cellspacing="0" cellpadding="0">

				<tr>

					<td height="2"></td>

				</tr>

				<tr>

					<td valign="top">

						<table width=100% border=0 cellpadding=5 cellspacing=1 align=center bgcolor="#dddddd">

							<tr>

								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>

									<bean:message key="str1318"/>

								</td>

								<td align=left bgcolor="#FFFFFF">
									<div class="ping">
										<select name="entity_type" id="entity_type" onclick="setClasses()">
									<%
											if(param_name.equals("")){
									%>
													<option value="">
														<bean:message key="str1319"/>
													</option>
									<%
											}else{
									%>
											<option value="<%=param_value%>"><%=param_name%></option>
									<%
											}
									%>

											<%

                                     if(list!=null && list.size()>0){

                                       for(int i=0;i<list.size();i++){

                                         HashMap map=(HashMap)list.get(i);

                                         String id=map.get("para_code1").toString();

                                         String name=map.get("para_code2").toString();

                                         %>

											<option value="<%=id%>">
												<%=name%>
											</option>

											<%

                                       }

                                     }

                                   %>

										</select>
										&nbsp;&nbsp;<bean:message key="str1320"/>
									</div>
								</td>

							</tr>

							<tr>

								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right width=15%>

									<bean:message key="str1321"/>

								</td>

								<td width=85% align=left bgcolor="#FFFFFF">
									<div class="ping1">
										<select name="up" id="up" style="width:100px" onChange="selectLevel(this.value)">

											<option value="0">
												<bean:message key="str1322"/>
											</option>

											<option value="2">
												<bean:message key="str1323"/>
											</option>

										</select>
									</div>
								</td>

							</tr>

							<tr id="upShow" style="display:none">

								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right width=15%>

									<bean:message key="str1324"/>

								</td>

								<td width=85% align=left bgcolor="#FFFFFF">
									<div class="ping1">
										<select name="upclass" id="upclass" size=5 style="width:100px;float: left" onclick="createSelect('1',this.value);"></select>

										<div id="next1" style="float: left;display:inline"></div>

										<input name="active" id="active" type="hidden" value="1">
									</div>
								</td>

							</tr>

							<tr>

								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right width=15%>

									<bean:message key="str1325"/>

								</td>

								<td width=85% align=left bgcolor="#FFFFFF">
									<div class="ping">
										<input name="class_name" type="text" id="class_name" size=30 maxlength=50>
									</div>
								</td>

							</tr>

							<input name="class_id" id="class_id" type="hidden" value="<%=class_id%>">

							<input name="cust_id" id="cust_id" type="hidden" value="<%=cust_id%>">

							<input name="up_class_id" id="up_class_id" type="hidden" value="000000000000000">

							<input name="class_level" id="class_level" type="hidden" value="1">

							<tr style="display: none">

								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>

									<bean:message key="str1326"/>

								</td>

								<td align=left bgcolor="#FFFFFF">
									<div class="ping1">
										<select name="class_type" id="class_type">

											<%

                                     if(classList!=null && classList.size()>0){

                                       for(int i=0;i<classList.size();i++){

                                         HashMap map=(HashMap)classList.get(i);

                                         String id=map.get("para_code1").toString();

                                         String name=map.get("para_code2").toString();

                                         %>

											<option value="<%=id%>">
												<%=name%>
											</option>

											<%

                                       }

                                     }

                                   %>

										</select>
									</div>
								</td>

							</tr>



							<tr>

								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>

									<bean:message key="str1327"/>

								</td>

								<td align=left bgcolor="#FFFFFF">
									<div class="ping1">
										<textarea name="class_desc" id="class_desc" cols="50" rows="6"></textarea>
									</div>
								</td>

							</tr>

							<tr style="display:none">

								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>

									<bean:message key="str1304"/>

								</td>

								<td align=left bgcolor="#FFFFFF">
									<div class="ping1">
										<select name="one_tag" id="one_tag">

											<option value="1">

												<bean:message key="str1306"/>

											</option>

											<option value="0">

											<bean:message key="str1631"/>

											</option>

										</select>
									</div>
								</td>



							</tr>

							<input type="hidden" name="one_tag" value="1">

							<tr>

								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>

									<bean:message key="str3266"/>

								</td>

								<td align=left bgcolor="#FFFFFF">
									<div class="ping1">
										<select name="enable_tag" id="enable_tag">

											<option value="0">

												<bean:message key="str352"/>

											</option>

											<option value="1">

												<bean:message key="str353"/>

											</option>

										</select>
									</div>
								</td>

							</tr>

							<tr>

								<td style="background-color:#f6f6f6; color:#000000; font-weight:bold; font-size:12px;text-align: right">

									<bean:message key="str1026"/>

								</td>

								<td align=left bgcolor="#FFFFFF">
									<div class="ping1">
										<input name="remark" id="remark" type="text" size=52 maxlength="50" />
									</div>
								</td>

							</tr>

							<input name="trade_type_code" type="hidden" value="1043" />

							<tr>

								<td style="background-color:#ffffff; color:#000000;  font-size:12px; padding:3px 5px;" colspan=2 align="center">

									<INPUT name="advshow" type="checkbox" value="0" onclick="check_none(resumeForm)">

									<bean:message key="str2448"/>

								</td>

							</tr>

							<tr>

								<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;padding-top:10px;padding-bottom:10px;" align="center" colspan=2>

									<input class="tjan" name="submit1" type="button" value="" disabled="true" onclick="confirmsub(resumeForm)">

								</td>

							</tr>

						</table>

					</td>

				</tr>

				<tr>

					<td height="13"></td>

				</tr>

			</table>

		</form>

	</body>

</html>

