<%@ page contentType="text/html;charset=GBK" language="java"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<html>
	<head>
		<title><bean:message key="str674"/></title>
		<link href="/zone_b2b/css/css.css" rel="stylesheet" type="text/css" />
		<style type="text/css">
			#load{width:500px;height:25px;border:1px #000 solid;}
			#loading{position:absolute;z-index:2;height:23;filter:progid:DXImageTransform.microsoft.gradient(gradienttype=1,startColorStr=white,endColorStr=#39867b);}
			#loadtext{position:absolute;z-index:3;width:100%;height:100%;line-height:23px;text-align:center;}
		</style>
		<script type="text/javascript" src="build.js"></script>
		<script type="text/javascript" src="/js/prototype.js"></script>
	</head>
	<body>
		<table align="center">
			<tr id="process">
				<td style="background-color:#ffffff; color:#000000;  font-size:12px;" width="100%" colspan="2">
					<div id="load" style="display: block">
						<div id="loading"></div>
						<div id="loadtext">
							1%
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:12px;text-align:right" width="100%" colspan="2">
				<span style="text-align: left;display: none;padding-top:5px" id="finsh"><bean:message key="str678"/><a href="javascript:window.close()" style="color: blue;"><bean:message key="str679"/></a></span>
				</td>
			</tr>
		</table>
		<table width=50% border=0 cellpadding=5 cellspacing=1 align=center bgcolor="#dddddd">
			<tr>
				<td>
			<table width="30%" border="0" align="center" cellpadding="0" cellspacing="0" style="display:none">
			  <tr>
			    <td align="center"><bean:message key="str675"/></td>
			  </tr>
			  <tr>
			    <td align="center" style="border-bottom:1px dashed #CCCCCC;">&nbsp;</td>
			  </tr>
			  <tr>
			    <td align="center">&nbsp;</td>
			  </tr>
			  <tr>
			    <td align="center">&nbsp;</td>
			  </tr>
			</table>
			<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" style="display:none">
			  <tr>
			    <td width="25%" align="center"><img src="/zone_b2b/images/entimages/0.jpg" width="166" height="166" /></td>
			    <td width="25%" align="center"><img src="/zone_b2b/images/entimages/7.jpg" width="166" height="166" /></td>
			    <td width="25%" align="center"><img src="/zone_b2b/images/entimages/9.jpg" width="166" height="166" /></td>
			    <td width="25%" align="center"><img src="/zone_b2b/images/entimages/10.jpg" width="166" height="166" /></td>
			  </tr>
			  <tr>
			    <td width="25%" height="27" align="center" valign="bottom"><table width="50%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:5px;">
			      <tr>
			        <td width="25%" align="center" valign="bottom"><input type="radio" name="type0" id="type0" value="templates/enterprise/default/" onclick="createCustomerWeb(this.value)"/></td>
			        <td width="75%" align="left" valign="bottom"> <bean:message key="str675"/>001</td>
			      </tr>
			    </table></td>
			    <td width="25%" align="center" valign="bottom"><table width="50%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:5px;">
			      <tr>
			        <td width="25%" align="center" valign="bottom"><input type="radio" name="type1" id="type1" value="templates/enterprise/style4/" onclick="createCustomerWeb(this.value)"/></td>
			        <td width="75%" align="left" valign="bottom"><bean:message key="str675"/> 002</td>
			      </tr>
			    </table></td>
			    <td width="25%" align="center" valign="bottom"><table width="50%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:5px;">
			      <tr>
			        <td width="25%" align="center" valign="bottom"><input type="radio" name="type2" id="type2" value="templates/enterprise/style6/" onclick="createCustomerWeb(this.value)"/></td>
			        <td width="75%" align="left" valign="bottom"><bean:message key="str675"/>003</td>
			      </tr>
			    </table></td>
			    <td width="25%" align="center" valign="bottom"><table width="50%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:5px;">
			      <tr>
			        <td width="25%" align="center" valign="bottom"><input type="radio" name="type3" id="type3" value="templates/enterprise/style7/" onclick="createCustomerWeb(this.value)"/></td>
			        <td width="75%" align="left" valign="bottom"><bean:message key="str675"/> 004</td>
			      </tr>
			    </table></td>
			  </tr>
			  <tr>
			    <td width="25%" align="center">&nbsp;</td>
			    <td width="25%" align="center"></td>
			    <td width="25%" align="center"></td>
			    <!--td width="25%" align="center"></td-->
			  </tr>
			  <tr>
			    <td width="25%" align="center">&nbsp;</td>
			    <td width="25%" align="center"></td>
			    <td width="25%" align="center"></td>
			    <!--td width="25%" align="center"></td-->
			  </tr>
			</table>
			<table width="30%" border="0" align="center" cellpadding="0" cellspacing="0">
			  <tr>
			    <td align="center" ><bean:message key="str676"/></td>
			  </tr>
			  <tr>
			    <td align="center" style="border-bottom:1px dashed #CCCCCC;">&nbsp;</td>
			  </tr>
			  <tr>
			    <td align="center">&nbsp;</td>
			  </tr>
			   <tr>
			    <td align="center">&nbsp;</td>
			  </tr>
			</table>
			<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
			  <tr align="center">
			    <td width="30%" align="center"><img src="/zone_b2b/images/entimages/4.jpg" width="166" height="166" /></td>
			    <td width="30%" align="center"><img src="/zone_b2b/images/entimages/5.jpg" width="166" height="166" /></td>
			    <td width="30%" align="center"><img src="/zone_b2b/images/entimages/6.jpg" width="166" height="166" /></td>
			  </tr>
			  <tr> 
			    <td width="25%" height="27" align="center" valign="bottom"><table width="50%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:5px;">
			      <tr>
			        <td width="25%" align="center" valign="bottom"><input type="radio" name="type4" id="type4" value="templates/enterprise/style2/" onclick="createCustomerWeb(this.value)"/></td>
			        <td width="75%" align="left" valign="bottom"> <bean:message key="str676"/>001</td>
			      </tr>
			    </table></td>
			    <td width="25%" align="center" valign="bottom"><table width="50%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:5px;">
			      <tr>
			        <td width="25%" align="center" valign="bottom"><input type="radio" name="type5" id="type5" value="templates/enterprise/style5/" onclick="createCustomerWeb(this.value)"/></td>
			        <td width="75%" align="left" valign="bottom"><bean:message key="str676"/>002</td>
			      </tr>
			    </table></td>
			    <td width="25%" align="center" valign="bottom"><table width="50%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:5px;">
			      <tr>
			        <td width="25%" align="center" valign="bottom"><input type="radio" name="type6" id="type6" value="templates/enterprise/style3/" onclick="createCustomerWeb(this.value)"/></td>
			        <td width="75%" align="left" valign="bottom"> <bean:message key="str676"/>003</td>
			      </tr>
			    </table></td>
			    <!--td width="25%" align="center" valign="bottom"><table width="50%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:5px;">
			      <tr>
			        <td width="25%" align="center" valign="bottom"><input type="radio" name="type7" id="type7" value="/usr/www/b2b.xsaas.com/zone_b2b/templates/enterprise/style8/" onclick="createCustomerWeb(this.value)"/></td>
			        <td width="75%" align="left" valign="bottom"><bean:message key="str676"/>004</td-->
			      </tr>
			    </table></td>
			  </tr>
			  <tr>
			    <td width="30%" align="center">&nbsp;</td>
			    <td width="30%" align="center"></td>
			    <td width="30%" align="center"></td>
			    <!--td width="25%" align="center"--></td>
			</tr>
			<tr>
			    <td width="30%" align="center">&nbsp;</td>
			    <td width="30%" align="center"></td>
			    <td width="30%" align="center"></td>
			    <!--td width="25%" align="center"></td-->
			</tr>
			</table>
			<table width="30%" border="0" align="center" cellpadding="0" cellspacing="0">
			  <tr>
			    <td align="center" ><bean:message key="str677"/></td>
			  </tr>
			  <tr>
			    <td align="center"style="border-bottom:1px dashed #CCCCCC;">&nbsp;</td>
			  </tr>
			  <tr>
			    <td align="center">&nbsp;</td>
			  </tr>
			  <tr>
			    <td align="center">&nbsp;</td>
			  </tr>
			</table>
			<!--table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
			  <tr>
			    <td width="25%" align="center"><img src="/zone_b2b/images/entimages/8.jpg" width="166" height="166" /></td>
			    <td width="25%" align="center"><img src="/zone_b2b/images/entimages/9.jpg" width="166" height="166" /></td>
			    <td width="25%" align="center"><img src="/zone_b2b/images/entimages/10.jpg" width="166" height="166" /></td>
			    <td width="25%" align="center"><img src="/zone_b2b/images/entimages/11.jpg" width="166" height="166" /></td>
			  </tr>
			  <tr>
			    <td width="25%" height="27" align="center" valign="bottom"><table width="50%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:5px;">
			      <tr>
			        <td width="25%" align="center" valign="bottom"><input type="radio" name="type7" id="type7" value="/usr/www/b2b.xsaas.com/zone_b2b/templates/enterprise/style9/" onclick="createCustomerWeb(this.value)"/></td>
			        <td width="75%" align="left" valign="bottom"><bean:message key="str677"/>001</td>
			      </tr>
			    </table></td>
			    <td width="25%" align="center" valign="bottom"><table width="50%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:5px;">
			      <tr>
			        <td width="25%" align="center" valign="bottom"><input type="radio" name="type7" id="type7" value="/usr/www/b2b.xsaas.com/zone_b2b/templates/enterprise/style10/" onclick="createCustomerWeb(this.value)"/></td>
			        <td width="75%" align="left" valign="bottom"><bean:message key="str677"/> 002</td>
			      </tr>
			    </table></td>
			    <td width="25%" align="center" valign="bottom"><table width="50%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:5px;">
			      <tr>
			        <td width="25%" align="center" valign="bottom"><input type="radio" name="type7" id="type7" value="/usr/www/b2b.xsaas.com/zone_b2b/templates/enterprise/style11/" onclick="createCustomerWeb(this.value)"/></td>
			        <td width="75%" align="left" valign="bottom"> <bean:message key="str677"/> 003 </td>
			      </tr>
			    </table></td>
			    <td width="25%" align="center" valign="bottom"><table width="50%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:5px;">
			      <tr>
			        <td width="25%" align="center" valign="bottom"><input type="radio" name="type7" id="type7" value="/usr/www/b2b.xsaas.com/zone_b2b/templates/enterprise/style12/" onclick="createCustomerWeb(this.value)"/></td>
			        <td width="75%" align="left" valign="bottom"><bean:message key="str677"/> 004</td>
			      </tr>
			    </table></td>
			  </tr>
			  <tr>
			    <td width="25%" align="center">&nbsp;</td>
			    <td width="25%" align="center"></td>
			    <td width="25%" align="center"></td>
			    <td width="25%" align="center"></td>
			</tr>
			<tr>
			    <td width="25%" align="center">&nbsp;</td>
			    <td width="25%" align="center"></td>
			    <td width="25%" align="center"></td>
			    <td width="25%" align="center"></td>
			</tr>
			</table>
			</td>
			</tr>
		</table-->
	</body>
</html>
