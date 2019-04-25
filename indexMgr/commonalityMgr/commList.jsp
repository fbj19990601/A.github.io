<jsp:useBean id="comRM" class="com.saas.biz.commodityMgr.CommodityInfo" scope="page"/>
<%@ page contentType="text/html;charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="java.util.*"%>
<%@ page import="com.saas.sys.buffer.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title></title>
<link href="style/tj.css" type="text/css" rel="stylesheet" />
<link href="style/commonality.css" rel="stylesheet" type="text/css" />
<link href="style/list.css" rel="stylesheet" type="text/css" />
<link href="css/layout.css" rel="stylesheet" type="text/css">
<link href="css/daohang.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="top">
  <a  onclick="var strHref=window.location.href;this.style.behavior='url(#default#homepage)';this.setHomePage('http://soft.xsaas.com');"  style="CURSOR: hand"><bean:message key="str2522"/></a> 
  |　
  <a href="javascript:window.external.AddFavorite('http://soft.xsaas.com', '企业信息化服务平台(http://soft.xsaas.com)')"><bean:message key="str2523"/></a>　
  |　
  <html:link page="Newcregister.jsp"><bean:message key="str2520"/></html:link> 
  |
  <a href="/crm"><bean:message key="str2521"/></a>
  <!--| 
    帮助 --></div>
<!--头部容器----->
<div class="container">
  <div class="header">
    <div class="logo"><a href="http://www.madeinglobal.com" target="_top"><img src="images/logo.gif" width="225" height="66" border="0"></a></div>
<%
	ArrayList resultlist = new ArrayList();
	ArrayList resultlistRM = new ArrayList();
	resultlistRM=comRM.genCommodityRM();
	if(resultlistRM!=null && resultlistRM.size()>0)
	 {
	  request.setAttribute("resultlistRM",resultlistRM);//热门
	 }
	ArrayList linklist = new ArrayList();
	resultlist = (ArrayList) request.getAttribute("result");
	if (resultlist == null) 
	{
%>
<iframe frameBorder="0" scrolling=no src="advListTemp.jsp" width="768" height="89"></iframe>
<div class="tjad"></div>
<div class="tjBody">
	<div class="tjlbLeft">
		<div class="leftlbTop2"><bean:message key="str2524"/></div>
		<div class="leftlbBody1">
		  <table width="100%" border="0" cellspacing="0" cellpadding="0">	
		    <tr bgcolor="#EFEFEF">
			   <td height="25" align="center"></td>
			   <td align="left">
			      <bean:message key="str2525"/>
			   </td>
			</tr>
          </table>
		</div>
  </div>
	<div class="tjRight" style="display:none">
	
		<div class="ad" style="display:none"><img src="images/ad_1.jpg" width="214" height="65"></div>
	
		<div class="rightTop" style="display:none"><h2><bean:message key="str2526"/></h2></div>
		<div class="rightBody" style="display:none"></br></br></br></br></br></br></br></div>
		<div class="rightBottom" style="display:none"><tr></div>
		
		<div class="rightTop" style="display:none"><h2><bean:message key="str2527"/></h2></div>
		<div class="rightBody" style="display:none">
			<logic:notEmpty name="resultlistRM" >
			<logic:iterate id="result2" name="resultlistRM" length = "8">
			<div id="tp1">
			<logic:notEmpty name="result2" property="pic_path">
			<html:link href="../Commoditylist.do?trade_type_code=0157"  name="result2" target="blank"><img border="0" <bean:write name="result2" property="pic_path"></bean:write>><br><bean:write name="result2" property="commodity_name"/></html:link>
			</logic:notEmpty>
		</div>
		</logic:iterate>
		</logic:notEmpty>
		</div>
		<div class="rightBottom"><tr></div>
	</div>
</div>


<%@ include file="bottom.jsp" %>
</body>
</html>		    
<%
	return;
	}
	Map  QueryMap=(Map) request.getAttribute("query");
	Buffers outbuffer= (Buffers) request.getAttribute("outBuffer");
	String[]  iOldstarts = (String[]) QueryMap.get("start");
	String[]  iTradeTypeCodes = (String[]) QueryMap.get("trade_type_code");
	String iOldstart = iOldstarts[0];
	String iTradeTypeCode = iTradeTypeCodes[0];
	if (iTradeTypeCode.equalsIgnoreCase("0187"))
	{
	    String[]  iNewstypes = (String[]) QueryMap.get("news_type");
	    String  iNewstype = iNewstypes[0];
	    iTradeTypeCode = iTradeTypeCode +"&news_type="+iNewstype;
	}
	if (resultlist == null ) return;
	for (Iterator it = resultlist.iterator(); it.hasNext();)
	{
			Object obj=it.next();
			if ( obj instanceof ArrayList) {
				ArrayList list=(ArrayList)obj;
				for (Iterator its = list.iterator(); its.hasNext();) {
				HashMap jobMaps = (HashMap)its.next();
	            HashMap tradeMaps = new HashMap();
	            tradeMaps.put("title",jobMaps.get("title"));		
	            tradeMaps.put("pic_path",jobMaps.get("pic_path"));
	            tradeMaps.put("ref",jobMaps.get("ref"));
	            tradeMaps.put("linkstr",jobMaps.get("linkstr"));
	           linklist.add(tradeMaps);
				}
			} else if (obj instanceof HashMap) {
				HashMap jobMap = (HashMap)obj;
	            HashMap tradeMap = new HashMap();
	            tradeMap.put("title",jobMap.get("title"));							
	            tradeMap.put("pic_path",jobMap.get("pic_path"));
	            tradeMap.put("ref",jobMap.get("ref"));
	            tradeMap.put("linkstr",jobMap.get("linkstr"));
	           linklist.add(tradeMap);
			}
	}	
	
	int istart = new Integer(iOldstart).intValue()+30;
	int iupstart = new Integer(iOldstart).intValue()-30;
	if (iupstart <=0 ) iupstart =1;
	String start = String.valueOf(istart);
	String isupstart = String.valueOf(iupstart);
	request.setAttribute("resultMap",linklist);
 %>
<div class="tjad"></div>
<div class="tjBody">
	<div class="tjlbLeft">
		<div class="leftlbTop2"><bean:message key="str2528"/></div>
		<div class="leftlbBody1">
		  <table width="100%" border="0" cellspacing="0" cellpadding="0">
		    <%
		        if (outbuffer.getString("DISPALY_STYLE").equals("1"))
		        {
		    %>
        		    <logic:notEmpty name="resultMap" scope="request">
                        <logic:iterate id="result1" name="resultMap" scope="request">
                           <div id="list1">
                        	   <div class="ad2" style="float:left; margin-left:20px;">
                        	        <bean:write name="result1" property="pic_path" filter="false"></bean:write>
                        	   </div>
                        	   <div class="text1" style="width:750px; height:85px;  float:left;margin-left:30px; ">
                        		     <h5>
                        		        <a href=<bean:write name="result1" property="linkstr"/>>
        			                        <bean:write name="result1" property="title" filter="false"/>
        			                    </a>
        			                </h5>
                                   <bean:write name="result1" property="ref" filter="false"/>								   
                               </div>
                           </div>
                        </logic:iterate>
                    </logic:notEmpty>
		    <%
		        }
		        else 
		        {int i=0;
		    %>  
    		        <logic:notEmpty name="resultMap" scope="request">
        			<logic:iterate id="result1" name="resultMap" scope="request">
					     <%
		                  if (i%2==0)
		                      {i++;
		                         %>
        			     <tr class="list_tr"  style="background-image: url(../images/bg1_list_td.gif); background-repeat: repeat-x;">
			          	  <%
           		        }
	           	        else 
		                 {i++;
	             	    %>
						  <tr class="list_tr"  style="background-image: url(../images/bg2_list_td.gif); background-repeat: repeat-x;">
						<%
		                  }
		               %>
        			        <td height="25" align="center"><img src="images/zsku.gif" width="8" height="8" /></td>
        			        <td align="left" class="list_td">
        				        <logic:notEmpty name="result1" property="title" >
        				           <a href=<bean:write name="result1" property="linkstr"/>>
        				                <bean:write name="result1" property="title"/>
        				           </a>				           
        				        </logic:notEmpty>
        				    </td>
        				 </tr>
        		    </logic:iterate>
        		    </logic:notEmpty>
		    <%
		        }
		    %>
		        <tr bgcolor="#EFEFEF">
			        <td height="25" align="center"></td>
			        <td align="left">
			            <a href="../list.do?trade_type_code=<%=iTradeTypeCode%>&start=<%=isupstart%>"> <bean:message key="str1031"/></a>
				        |
				        <a href=../list.do?trade_type_code=<%=iTradeTypeCode%>&start=<%=start%>><bean:message key="str1032"/> </a>
				    </td>
				 </tr>
          </table>
		</div>
  </div>
  
	<div class="tjRight" style="display:none">
	
		<div class="ad" style="display:none"></div>
	
		<div class="rightTop" style="display:none"><h2><bean:message key="str2526"/> </h2></div>
		<div class="rightBody" style="display:none"></br></br></br></br></br></br></br></div>
		<div class="rightBottom" style="display:none"><tr></div>
		
		<div class="rightTop" style="display:none"><h2><bean:message key="str2527"/> </h2></div>
		<div class="rightBody" style="display:none">
			<logic:notEmpty name="resultlistRM" >
			<logic:iterate id="result2" name="resultlistRM" length = "8">
			<div id="tp1">
			<logic:notEmpty name="result2" property="pic_path">
			<html:link href="../Commoditylist.do?trade_type_code=0157"  name="result2" target="blank">
			<img border="0" <bean:write name="result2" property="pic_path"></bean:write>><br>
			<bean:write name="result2" property="commodity_name"/></html:link>
			</logic:notEmpty>
		</div>
		</logic:iterate>
		</logic:notEmpty>
		</div>
		<div class="rightBottom"><tr></div>
	</div>
</div>
<%@ include file="bottom.jsp" %>
  </div>
</div>
</body>
</html>
