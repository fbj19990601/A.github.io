<!DOCTYPE HTML PUBLIC "-/W3C/DTD HTML 4.01 Transitional/EN"
"http:/www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page contentType="text/html;charset=gbk"%>
<link rel="stylesheet" type="text/css" href="/zone_b2b/css/oocl_css.css" />
<link href="/zone_b2b/css/css.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/zone_b2b/js/index.js"></script>
<table width="980" border="0" align="center" cellpadding="0" cellspacing="0"><tr><td>
<div class="head">
		<div class="qucik-leftlink"><a href="#" onClick="this.style.behavior='url(#default#homepage)';this.setHomePage(top.location.href);" class="hui-link">Set as your home page</a> | <a href="javascript:window.external.AddFavorite(top.location.href)" class="hui-link">Bookmark</a> | <span id="date-time"></span></div>
		<div class="qucik-rightlink"><a href="/index.jsp" class="hui-link">Login now</a> | <a href="#" class="hui-link">Contact us</a> | <a href="#" class="hui-link">Help</a></div>
		<div class="dhbg" style="clear:both;">
			<div class="logon"><a href="/"><img src="/zone_b2b/images/en/oocllogon.gif"  border="0" /></a></div>
				<div class="inof">
					<div class="inof_link"><a href="/zone_b2b/supply/"><img src="/zone_b2b/images/en/buy.gif"  border="0" /></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="/zone_b2b/stock/"><img src="/zone_b2b/images/en/sell.gif"  border="0" /></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#"><img src="/zone_b2b/images/en/cv.gif"  border="0" /></a></div>
						<div class="dh_link">
							<ul>                                                                   
								<!-- class="dh1"--><li class="dh1" style="width:70px;"><a href="/">Home</a></li>
								<!-- class="dh2"--><li style="width:91px;"><a href="/zone_b2b/enterprise/">Enterprise</a></li>
								<!-- class="dh3"--><li style="width:75px;"><a href="/zone_b2b/stock/">Buyers</a></li>
								<!-- class="dh4"--><li style="width:88px;"><a href="/zone_b2b/supply/">Suppliers</a></li>
								<!-- class="dh5"--><li style="width:68px;"><a href="/zone_b2b/news/">News</a></li>
								<!-- class="dh6"--><li style="width:98px;"><a href="/index.jsp">My Account</a></li>
							</ul>
						</div>
				</div>
				<div class="inof_search">
					<table width="980" border="0" align="center" cellpadding="0" cellspacing="0">
					  <tr>
					    <td><table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
					      <tr>
					        <td width="8%">&nbsp;</td>
					        <td width="42%" class="baise">
					          <input type="radio" name="redio_bnt" id="supply" value="radiobutton" checked />
					          Supply
					          <input type="radio" name="redio_bnt" id="stock" value="radiobutton"  onclick="checkR('stock')";/>
					          Buying
					          <input type="radio" name="redio_bnt" id="customer" value="radiobutton" onclick="checkR('customer')";/>
					          Enterprises
					          <input type="radio" name="redio_bnt" id="news" value="radiobutton" onclick="checkR('news')";/>
					          Information</td>
					        <td width="12%">&nbsp;</td>
					        <td width="38%"align="right"class="baise"></td>
					      </tr>
					      <tr>
					        <td class="baise STYLE1">Search</td>
					        <td><input name="s_key" id="s_key" type="text" class="cs" value="enter your keywords" size="48" onmousedown="javascript:this.value=''" onblur="checkKeyWord(this.value)" /></td>
					        <td class="baise"><input type="button" name="s_search" value="Search" onclick="checkSearchWEBValue()" /></td>
					        <td class="baise"></td>
					      </tr>
					    </table></td>
					  </tr>
					</table>
				</div>
		</div>
</div>
</td></tr></table>