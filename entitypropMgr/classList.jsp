

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

	HttpSession httpSess=request.getSession();

	String cust_id=(String)httpSess.getAttribute("SESSION_CUST_ID");

%>

<html>

	<head>

		<title><bean:message key="str182"/></title>

		
		    <link href="/style/layout.css" rel="stylesheet" type="text/css">


<script language="javascript" src="/js/Calendar_Ly.js"></script>

<script type='text/javascript'src='<%=request.getContextPath()%>/dwr/interface/EntityClassInfo.js'></script>

<script type='text/javascript'src='<%=request.getContextPath()%>/dwr/engine.js'></script>

<script type='text/javascript'src='<%=request.getContextPath()%>/dwr/util.js'></script>

<script language="JavaScript">

    function Check_Value()

	{
         if(document.getElementById("entity_type").value==""){
             
                        alert("请选择实体对象");
                        document.getElementById("entity_type").focus();
                        return false;
                        
             
             
             }
	    if(document.getElementById("class_name").value==""){

	      alert("分类名称不能为空！");

	      document.getElementById("class_name").focus();

	      return false;

	    }

	    document.getElementById("trade_type_code").value="1044";

 	    return true;

	}

   	function update(formobj)

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

//删除分类

function deleteClass(){

 if(window.confirm('你确定要删除吗？')) 

  {  	    	

       if (Check_Value())

       {
            
              
             var cust=document.getElementById("cust_id").value;

			 var id=document.getElementById("class_id").value;

			 EntityClassInfo.getClassInfoByUpClassId(cust,id,hasNextElement); 	

       }

  }

  else

  {

	 return;

  }

}

function hasNextElement(map){

  for(var obj in map){

   if(obj!='extend'){

	alert("请先删除下级分类！");

	return ;

	}

  }

    document.getElementById("trade_type_code").value="1045";

	document.resumeForm.submit();

}

 function selectLevel(){

    var cust=document.getElementById("cust_id").value;

    var entity=document.getElementById("entity_type").value;

    EntityClassInfo.getClassByUpClassAndEntity(cust,"000000000000000",entity,initUpClassInfo);

 }

 function initUpClassInfo(data){

  DWRUtil.removeAllOptions("upclass");

  DWRUtil.addOptions("upclass",data);

  var item=document.getElementById("upclass").length;

	    if(item==0)

	    {

	    	document.getElementById("upShow").style.display="none"; 

	    }

	     else

	   	{

	   		document.getElementById("upShow").style.display="block";

	   	}

 }

 

 function createSelect(num,id){

     document.getElementById("class_id").value=id;

     var div="next"+num;

     var next=parseInt(1)+parseInt(num);

     var nextDiv="next"+num;

     var cust=document.getElementById("cust_id").value;

     document.getElementById(nextDiv).innerHTML="<select name=org"+num+" id=org"+num+" size=5 onclick=createSelect("+next+",this.value)></select></div><div id=next"+next+" style=float: left>"; 

     document.getElementById("active").value=num;

     EntityClassInfo.getClassInfoByUpClassId(cust,id,setActiveDown);

     EntityClassInfo.getClassInfoByIdx(cust,id,setClassNameInfo);

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

   function setClassNameInfo(map){

    var entity_type=map['entity_type']; 

	var class_name=map['class_name'];   

	var one_tag=map['one_tag'];         

	var class_type=map['class_type'];   

	var class_desc=map['class_desc'];   

	var enable_tag=map['enable_tag'];   

	var remark=map['remark'];           

    //document.getElementById("entity_type").options[entity_type].selected=true;

    document.getElementById("class_name").value=class_name;

    document.getElementById("one_tag").options[one_tag].selected=true;

    document.getElementById("class_type").options[class_type].selected=true;

    document.getElementById("class_desc").value=class_desc;

    document.getElementById("remark").value=remark;

    document.getElementById("enable_tag").options[enable_tag].selected=true;

   }

   function setClasses(keys){

    if(keys=="a"){

     document.getElementById("upShow").style.display="none";

     DWRUtil.removeAllOptions("upclass");

     document.getElementById("class_name").value="";

     document.getElementById("class_desc").value="";

     document.getElementById("remark").value="";

    }else{

    document.getElementById("upShow").style.display="block";

    DWRUtil.removeAllOptions("upclass");

     selectLevel();

    }

   }

</script>

	</head>

	<body>

		<form name=resumeForm action=/doTradeReg.do method=post

			target="_self">

			<table width="100%" border="0" cellspacing="0" cellpadding="0">

				<tr>

					<td height="2"></td>

				</tr>

				<tr>

					<td valign="top">

						<table width=100% border=0 cellpadding=5 cellspacing=1 align=center

							bgcolor="#dddddd">

							<tr>

								<td

									style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;"

									align=right>

										<bean:message key="str1298"/>							</td>

							  <td align=left bgcolor="#FFFFFF"><div class="ping"><select name="entity_type" id="entity_type" onclick="setClasses(this.value)">
                                <option value=""><bean:message key="str1299"/></option>
                                <%

                                     if(list!=null && list.size()>0){

                                       for(int i=0;i<list.size();i++){

                                         HashMap map=(HashMap)list.get(i);

                                         String id=map.get("para_code1").toString();

                                         String name=map.get("para_code2").toString();

                                         %>
                                <option value="<%=id%>"><%=name%></option>
                                <%

                                       }

                                     }

                                   %>
                              </select></div></td>
							</tr>

							<tr id="upShow" style="display:none">

								<td

									style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;"

									align=right width=15%>

											<bean:message key="str1300"/>						</td>

								<td width=85% align=left bgcolor="#FFFFFF"><div class="ping1">
								<select name="upclass" id="upclass" size=5 style="width:100px;float: left" onclick="createSelect('1',this.value);">
								  </select>
								<div id="next1" style="float: left"></div>

                                     <input name="active" id="active" type="hidden" value="1">	</div>						  </td>
							</tr>

							<tr>

								<td

									style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;"

									align=right width=15%>

									<bean:message key="str1301"/>								</td>

								<td width=85% align=left bgcolor="#FFFFFF">
<div class="ping">
									<input name="class_name" type="text" id="class_name" size=25

										maxlength=50>			</div>				  </td>
							</tr>

							<input name="class_id" id="class_id" type="hidden" value="">

							<input name="cust_id" id="cust_id" type="hidden" value="<%=cust_id%>">

							<input name="up_class_id" id="up_class_id" type="hidden" value="000000000000000">

							<input name="class_level" id="class_level" type="hidden" value="1">

							<tr style="display: none">

								<td

									style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;"

									align=right>

									<bean:message key="str1302"/>								</td>

								<td align=left bgcolor="#FFFFFF">
<div class="ping1">
                                   <select name="class_type" id="class_type">

                                   <%

                                     if(classList!=null && classList.size()>0){

                                       for(int i=0;i<list.size();i++){

                                         HashMap map=(HashMap)classList.get(i);

                                         String id=map.get("para_code1").toString();

                                         String name=map.get("para_code2").toString();

                                         %>

                                         <option value="<%=id%>"><%=name%></option>

                                         <%

                                       }

                                     }

                                   %>
                                   </select>			</div>				  </td>
							</tr>

							

							<tr>

								<td

									style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;"

									align=right>

									<bean:message key="str1303"/>								</td>

								<td align=left bgcolor="#FFFFFF">

									<div class="ping1"><textarea name="class_desc" id="class_desc" cols="50" rows="6"></textarea>							  </div></td>
							</tr>

							<tr>

								<td

									style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;"

									align=right>

									<bean:message key="str1304"/>								</td>

								<td align=left bgcolor="#FFFFFF">
<div class="ping1">
									<select name="one_tag" id="one_tag">

										<option value="0">

													<bean:message key="str1305"/>								</option>

										<option value="1">

												<bean:message key="str1306"/>									</option>
									</select>						</div>	  </td>
							</tr>

							<tr>

								<td

									style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;"

									align=right>

											<bean:message key="str1307"/>						</td>

								<td align=left bgcolor="#FFFFFF">
<div class="ping1">
									<select name="enable_tag" id="enable_tag">

										<option value="0">

												<bean:message key="str1308"/>									</option>

										<option value="1">

												<bean:message key="str1309"/>									</option>
									</select>						</div>	  </td>
							</tr>

							<tr>

								<td

									style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;"

									align=right>

											<bean:message key="str1569"/>						</td>

								<td align=left bgcolor="#FFFFFF">
<div class="ping1">
									<input name="remark" id="remark" type="text" size=52

										maxlength="50" />		</div>					  </td>
							</tr>

							<input name="trade_type_code" id="trade_type_code" type="hidden" value=""/>

							<tr>

								<td

									style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;padding-top:10px;padding-bottom:10px;"

									align="center" colspan=2>

									<input class="xgan"name="submit1" type="button" value="" onclick="update(resumeForm)">
&nbsp;&nbsp;
									<input class="scan" name="submit1" type="button" value="" onclick="deleteClass()">								</td>
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

