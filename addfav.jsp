<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=GBK" %>
 
<%@ page import="java.net.*"%>


<html>
	<head>
		<meta http-equiv="Content-Type" type="text/html; charset=gb2312" />
		<title>B2B EC-platform</title>
		<link href="/style/css.css" rel="stylesheet" type="text/css">		
		<style type="text/css">		
		form {padding:0px; margin:0px;}		
		.line6 {width:72spx; width:70spx!important;border:#ffcb99 1px solid;  background-color:#fff8ee; text-align:left; padding-left: 20px;padding-top: 10px;padding-bottom: 10px; color:#000000; margin-top:13px; margin-bottom:13px;}   /*������ʽ6---- ͷ������1*/		
		.line6 .img{width:53px; height:53px; float:left; margin-right:20px;}		
		.line6 .title {font-size:14px; font-weight:bold; color:#ff5400;}		
		.line1 {border-left:#ff7300 3px solid; background-color:#e2e2e2; color:#333333;text-align:left; font-size:13px; font-weight:bold; padding-left: 20px; padding-top: 5px;padding-bottom: 5px; }  /*������ʽ1*/
   </style>

<script language="javascript" src="/js/Calendar_Ly.js"></script>

		<script language="JavaScript">

     function check_none()
     {
          if (document.formQuery.advshow.checked)
          {
      	    document.formQuery.submit1.disabled=false;        	     
      	}
      	else
      	{
      	   document.formQuery.submit1.disabled=true;
      	}
  	}
    	function exit()
    	{
    	    window.close();
    	}
    	function confirmsub()
    	{
    	    if(window.confirm('��ȷ��Ҫ�ύ��')) 
    	    {	    	 
						if(document.formQuery.link_desc.value== "" || document.formQuery.link_desc.value == null)
						{
							alert("���ݲ�����Ϊ�գ�");                                                             
							return false;     
						}
						                                                                                    
	      		 document.formQuery.submit();    	         
    	    }
    	    else
    	    {
    	        return;
    	    }
    	    
     	}

  </script>
  <script language="JavaScript" type="text/JavaScript">
		<!--
		//��ȡ����
		function getUrlParam(name)
		{
			nk="";
			var reg=new RegExp("(^|&)"+name+"=([^&]*)(&|$)");
			var r=window.location.search.substr(1).match(reg);
			if (r!=null) return unescape(r[2]);return nk;
		}
		function setvalue()
		{
			document.formQuery.link_desc.value=getUrlParam("it")+'��'+getUrlParam("iu");
			document.formQuery.link_name.value=getUrlParam("it");
			document.formQuery.link.value=getUrlParam("iu");
		}
		-->
		
</script> 
	</head>
<body onload="setvalue()">
	
	<table width="600" border="0" cellspacing="0" cellpadding="0" align="center">

		<form name="formQuery" id="formQuery" action="/addfavinfo.do" method="post" target="_self">

	  
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<p style="font-weight:bold;font-size:14px;text-align:center">����ղ�</p>
	  <tr>

	    <td valign="top">
 				
		     <table width=500 border=0 cellpadding=5 cellspacing=1 align=center bgcolor="#e7e7e7">
				    <tr>
				      <td width="100" align=right  style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;">���⣺</td>				       
		     		  <!-- <input name=trade_type_code type=hidden value=0306>  -->
		     		  <td width="400" align=left  style="background-color:#ffffff; color:#000000;  font-size:12px;"  colspan="3">
				      	<div class="ping1">
				      		  <input name="link_name" id="link_name" type="text" value="" size="50">
				        </div>
				      </td>
           </tr>

           <tr>
				      <td  style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>��ַ��</td>
				      <td  style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left  colspan="3">                  							 
								<div class="ping1"> 
									<input  name="link" id="link" type="text" value="" size="50">
								</div>							 
					    </td>
				    </tr>
						
						<tr>
				      <td  style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align="right" valign="middle">������</td>
				      <td  style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left  colspan="3">
				      	<div class="ping1">
				      		<textarea rows=8 cols=49 name="link_desc" id="link_desc"></textarea>
				        </div>   
				      </td>
				    </tr>				    				     				    				    

				    <tr>
					  <td align="right"  style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;">���ͣ�</td>
					  <td align="left"  style="background-color:#ffffff; color:#000000;  font-size:12px;" colspan="3">
						<div class="ping1">
						<select name="link_type">
						    <option value="1">��ַ�ղ�</option>
						    <option value="0">ϵͳ��ݷ�ʽ</option>						    
						</select>
					    </div>
						</td>

					</tr>
					 	<input name=trade_type_code type=hidden value="0082">				 
				  <tr>
				      <td  style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>�û�����</td>
				      <td  style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left>                  							 
								<div class="ping1"> 
									<input  name="user_name" id="user_name" type="text" value="" style="width:93px">
								</div>							 
					    </td>
					  <td  style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;" align=right>���룺</td>
				      <td  style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left>                  							 
								<div class="ping1"> 
									<input  name="passwd" id="passwd" type="password" value="" style="width:93px">
								</div>							 
					    </td>
				   </tr>
				   			    
				  
				  <tr>
				      <input type=hidden name=rsrv_num1 value=0>
				      <td style="background-color:#ffffff; color:#000000;  font-size:12px;" colspan=4 align=left>
				      	<input id="advshow" name="advshow" type="checkbox" value=0 onclick="check_none()">
				        ����������ȷ����
				      </td>
				  </tr>
				  <tr>
				      <td   align=right colspan=4   style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px; padding-top:10px;padding-bottom:10px;" >
				      	<input class="tjan" name="submit1" type=button value="�ύ�ղ�" disabled=true onclick=confirmsub()>&nbsp;&nbsp;
				      	<input class="qxan" name=button1 type=button value="ȡ��" onclick=exit()></td>

				  </tr>

		    </table>

	     </td>

	  </tr>

	  <tr>

	    <td height="13">&nbsp;</td>

	  </tr>

	  </form>

	</table>
			
</body>	
</html>