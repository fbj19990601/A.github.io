<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="java.util.*"%>
<%@ page import="com.saas.biz.commen.commMethodMgr"%>
<%@ page import="com.saas.biz.rightMgr.*"%>
<%@ page import="com.saas.biz.custMgr.Custinfo"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%
    ArrayList resultlist = new ArrayList();
    ArrayList interfList = new ArrayList();
    ArrayList queryList = new ArrayList();
    ArrayList properList = new ArrayList();
	Custinfo custInfo=new Custinfo();
	HttpSession tempsession = request.getSession();
	String cust_id=(String)tempsession.getAttribute("SESSION_CUST_ID");
	String cust_name=custInfo.getCustomerNameById(cust_id);
    int properSize=0;
	String date_time=new SimpleDateFormat("yyyyMMdd").format(new Date()).toString();
    TradeInterface interFace = new TradeInterface();
    commMethodMgr commen = new commMethodMgr();
    resultlist = (ArrayList) request.getAttribute("result");
    if(resultlist !=null && resultlist.size()==2)
      {
       if (resultlist == null) return;
         interfList = (ArrayList) resultlist.get(0);
       if (interfList == null) return;
        queryList = (ArrayList) resultlist.get(1);
       if (queryList == null) return;
      }
     else if(resultlist !=null && resultlist.size()==3)
      {
       if (resultlist == null) return;
         interfList = (ArrayList) resultlist.get(0);
       if (interfList == null) return;
        queryList = (ArrayList) resultlist.get(1);
       if (queryList == null) return;
        properList=(ArrayList) resultlist.get(2);
      }
%>

<html>
	<head>
        <title><bean:message key="system.tittle"/></title>
        <link href="style/css.css" rel="stylesheet" type="text/css"> 
        <script language="JavaScript" src="www/fuction/public.js"></script>
         <script src="www/fuction/calendar.js" type="text/javascript"></script>
       <script language="JavaScript">
        function Check_Value()
	{
    <%
    	String trade_type_code="";
    	String element_name="";
    	String fields_name="";
    	String element_type="";
    	String element_view="";
    	String element_no="";
    	String needed_tag="";
    	String element_label="";
     String element_len="";
       
    	for (Iterator it = interfList.iterator(); it.hasNext();)
    	{
    		HashMap elementMap = (HashMap) it.next();
    		 
    		if (elementMap.get("trade_type_code")!=null) trade_type_code=elementMap.get("trade_type_code").toString();
    		if (elementMap.get("element_name")!=null) element_name=elementMap.get("element_name").toString();
    		if (elementMap.get("fields_name")!=null) fields_name=elementMap.get("fields_name").toString();
    		if (elementMap.get("element_type")!=null) element_type=elementMap.get("element_type").toString(); 
    		if (elementMap.get("element_view")!=null) element_view=elementMap.get("element_view").toString(); 
    		if (elementMap.get("needed_tag")!=null) needed_tag=elementMap.get("needed_tag").toString();
    		if (elementMap.get("element_label")!=null) element_label=elementMap.get("element_label").toString(); 
    		if (elementMap.get("element_len")!=null) element_len=elementMap.get("element_len").toString();
    		if (needed_tag.equalsIgnoreCase("1") && Integer.parseInt(element_len) < 200)
    		{
    		    
        		out.print("if (cTrim(document.form1."+element_name+".value,0) == \"\" || document.form1."+element_name+".value == null) \n");
        		out.print("{                                                                                         \n");
        		out.print("	alert(\""+element_label+"不可以为空！\");                                                             \n");
        		out.print("	document.form1."+element_name+".focus();                                                    \n");
        		out.print("	return false;                                                                            \n");
        		out.print("}else{                                                                                         \n");
        		out.print("}                                                                                         \n");
    		}
    		if (needed_tag.equalsIgnoreCase("1") && Integer.parseInt(element_len) >= 200)
    		{
    		    
        		out.print("if ("+element_name+".getText()==\"\" || document.form1."+element_name+".value == null) \n");
        		out.print("{                                                                                         \n");
        		out.print("	alert(\""+element_label+"不可以为空！\");                                                             \n");
        		out.print("	document.form1."+element_name+".focus();                                                    \n");
        		out.print("	return false;                                                                            \n");
        		out.print("}else{                                                                                         \n");
        		out.print("}                                                                                         \n");
    		}
    	}
    	
    %>
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
    	    window.close();
    	}
    	function confirmsub(formobj)
    	{
    	    if(window.confirm('你确定要提交吗？')) 
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
	</head>
<body>
    <table  width=850 border="0" cellpadding="10" cellspacing="1" align="center" bordercolor="#D1D1D1">
        <form name=form1 action=doTradeReg.do method=post target="blank">
        <%
            if (interfList != null && queryList != null)
            {
                Iterator it = queryList.iterator();
                HashMap queryMap= (HashMap) it.next();
                String inStr = "";
	            for (Iterator iit = interfList.iterator(); iit.hasNext();)
	            {	
	            	out.print("<tr>");
	            	HashMap interfMap= (HashMap) iit.next();
	            	String elementName = interfMap.get("element_name").toString();
	            	String fieldsName = interfMap.get("fields_name").toString().toLowerCase();
	            	if (elementName.equalsIgnoreCase("trade_type_code"))
	            	{
	            	    out.print("<input type=hidden name="+fieldsName+" value="+interfMap.get("trade_type_code").toString()+">");
	            	} 
	            	//1：可修改，可显示
	            	else if (interfMap.get("element_view").toString().trim().equalsIgnoreCase("1"))
    	        	{
    	            	out.print("<td  class=grayD align=left>");    	                		
    	            	out.print(interfMap.get("element_label").toString());
    	            	out.print("</td>");
    	            	out.print("<td  class=grayD align=left>");   
    	            	 
        	        	int len = new Integer(interfMap.get("element_len").toString()).intValue();
        	        	if (queryMap.get(elementName) != null)
        	        	{
                    		if (len > 100)
                    		{
                    		    out.print("<textarea name="+fieldsName+" style=display:none>"+queryMap.get(elementName)+"</textarea>"); 
                    		    out.print("<iframe ID="+fieldsName+" src=www/ewebeditor/ewebeditor.htm?id="+fieldsName+"&style=coolblue"+inStr+" frameborder=0 scrolling=no width=500 HEIGHT=350></iframe>");
                    		}
                    		else
                    		{               		
            	        	    out.print("<input type=text name="+fieldsName+" value="+queryMap.get(elementName)+">");
            	        	}        	            	
        	        	}
        	            else
        	            {
                    		if (len > 100)
                    		{
                    		    out.print("<textarea name="+fieldsName+" style=display:none></textarea>"); 
                    		    out.print("<iframe ID="+fieldsName+" src=www/ewebeditor/ewebeditor.htm?id="+fieldsName+"&style=coolblue"+inStr+" frameborder=0 scrolling=no width=500 HEIGHT=350></iframe>");
                    		}
                    		else
                    		{               		
            	        	    out.print("<input type=text name="+fieldsName+">");
            	        	}        	                
        	            }
    	            	out.print("</td>");
    	            }
    	            //2：日期
    	            else if (interfMap.get("element_view").toString().trim().equalsIgnoreCase("2"))
        	        {        	        	
            	         out.print("<td  class=grayD align=left>");    	          
                        out.print(interfMap.get("element_label").toString());     
                        out.print("</td>");    
            			out.print("<td class=grayD align=left>                  \r\n");
            			out.print("    <input name=\""+elementName+"\" type=\"text\" value="+date_time+" >");				
            			out.print(" <A onclick=event.cancelBubble=true;href=\"javascript:showCalendar('"+elementName+"',false,'"+elementName+"',null);\"><IMG\r\n"); 
                        out.print("         id="+elementName+" height=21                                                                               \r\n");
                        out.print("         src=\"img/button.gif\" width=34                                                                        \r\n");
                        out.print("         align=absMiddle border=0></A> \r\n");
            			out.print(" </td>");            	        	 
        	        }
    	            //0：作为隐藏字段传送到后台
    	            else  if (interfMap.get("element_view").toString().trim().equalsIgnoreCase("0"))
    	            {
    	                out.print("<input type=hidden name="+fieldsName+" value="+queryMap.get(elementName).toString()+">");
    	                inStr = inStr + "&root_id="+queryMap.get(elementName).toString();
    	            }
    	            //4：只显示不可以修改
    	            else if (interfMap.get("element_view").toString().trim().equalsIgnoreCase("4"))
        	        {
        	            out.print("<td  class=grayD align=left>");    	                		
        	        	out.print(interfMap.get("element_label").toString());
        	        	out.print("</td>");
        	        	out.print("<td  class=grayD align=left>");
        	        	if (queryMap.get(elementName) != null )
        	        	{
        	        	     out.print(queryMap.get(elementName));
        	        	}
        	            else
        	            {
        	                 out.print("");
        	            }   
        	        	out.print("</td>");
        	        }
        	        //5:只修改不可以显示
    	            else if (interfMap.get("element_view").toString().trim().equalsIgnoreCase("5"))
        	        {
    	                out.print("<td  class=grayD align=left>");    	                		
        	        	out.print(interfMap.get("element_label").toString());
        	        	out.print("</td>");
        	        	out.print("<td  class=grayD align=left>");   
        	        	int len = new Integer(interfMap.get("element_len").toString()).intValue();
                		if (len > 100)
                		{
                		    out.print("<textarea  name="+fieldsName+" style=display:none></textarea>");
                		    out.print("<iframe ID="+fieldsName+" src=www/ewebeditor/ewebeditor.htm?id="+fieldsName+"&style=coolblue"+inStr+" frameborder=0 scrolling=no width=500 HEIGHT=350></iframe>"); 
                		}
                		else
                		{               		
        	        	    out.print("<input type=text name="+fieldsName+">");
        	        	}
        	        	out.print("</td>");
        	        }        
        	        //6：文件上传，只在修改页面出现	                
    	            else  if (interfMap.get("element_view").toString().trim().equalsIgnoreCase("6"))
    	            {
    	                out.print("<td  class=grayD align=left>");    	                		
    	            	out.print(interfMap.get("element_label").toString());
    	            	out.print("</td>");
    	            	out.print("<td  class=grayD align=left>"); 
    	            	if (queryMap.get(elementName) != null )
    	            	{  
    	                     out.print("");
    	                }
    	                else
    	                {
    	                    out.print("<input type=file name="+fieldsName+">");
    	                }
    	                out.print("</td>");
    	            }
    	            //7：select 只在修改页面出现
    	            else  if (interfMap.get("element_view").toString().trim().equalsIgnoreCase("7"))
        	        {
        	            out.print("<td  class=grayD align=left>");    	                		
        	        	out.print(interfMap.get("element_label").toString());
        	        	out.print("</td>");
        	        	out.print("<td  class=grayD align=left>");   
        	            out.print("<select name="+elementName+">");
        	            out.print(interFace.genOption(elementName));
        	            out.print("</select>");
        	            out.print("</td>");
        	        }
        	        //8：select 只在修改页面出现
        	        else  if (interfMap.get("element_view").toString().trim().equalsIgnoreCase("8"))
        	        {
        	            out.print("<td  class=grayD align=left>");    	                		
        	        	out.print(interfMap.get("element_label").toString());
        	        	out.print("</td>");
        	        	out.print("<td  class=grayD align=left>");   
        	            out.print("<select name="+elementName+">");
        	            out.print(interFace.genSpecOption(elementName));
        	            out.print("</select>");
        	            out.print("</td>");
        	        }
        	        //9：自动生成的业务序列
        	        else if (interfMap.get("element_view").toString().trim().equalsIgnoreCase("9"))
        	        {
        	        	out.print("<input name="+elementName+" type=hidden value="+commen.GenTradeId()+">");
        	         }
        	        //翻译
        	       else if (interfMap.get("element_view").toString().trim().equalsIgnoreCase("a"))//需要将代码翻译成名称
    	           {
    	           		out.print("<td  class=grayD align=left>");    	                		
        	        	out.print(interfMap.get("element_label").toString());
        	        	out.print("</td>");
        	        	out.print("<td  class=grayD align=left>");
        	        	if(interfMap.get("rsrv_str6")!=null)
    	                out.print(interFace.codeToName(interfMap.get("rsrv_str6").toString(),queryMap.get(elementName).toString()));
    	                else
    	                out.print(interFace.codeToName(interfMap.get("element_name").toString(),queryMap.get(elementName).toString()));
    	                out.print("</td>");
    	           }  
				   //2007年9月28日 星期五 刘阳
				   else if(interfMap.get("element_view").toString().trim().equalsIgnoreCase("c"))
					{
                        out.print("<td  class=grayD align=left>");    	                		
        	        	out.print(interfMap.get("element_label").toString());
        	        	out.print("</td>");
        	        	out.print("<td  class=grayD align=left>");
				 out.print("<input type=text name="+fieldsName+" value="+cust_name+" size=50 disabled=true >");
						out.print("</td>");
					}
        	        //其他未定义类型的字段       	                
    	            else
    	            {
    	                out.print("<td  class=grayD align=left>");    	                		
    	            	out.print(interfMap.get("element_label").toString());
    	            	out.print("</td>");
    	            	out.print("<td  class=grayD align=left>");   
    	            	out.print("未知的显示模式！");    	                	
    	            	out.print("</td>");
    	            }                    
	                out.print("</tr>");
		       }    
		      if(properList!=null && properList.size()>0)
    	          {
	    	          int index=0;
	    	          properSize=properList.size();
	    	           for(Iterator pit = properList.iterator(); pit.hasNext();)
	    	            {
	    	                String name="";
	    	                String describ="";
	    	                HashMap pmap=(HashMap)pit.next();
	    	                if(pmap.get("attr_name")!=null)
	    	                 {
	    	                   name=pmap.get("attr_name").toString();
	    	                 }
	    	                 if(pmap.get("attr_desc")!=null)
	    	                 {
	    	                   describ=pmap.get("attr_desc").toString();
	    	                 }
	    	                 if(name !=null || !name.trim().equals(""))
	    	                 {
								   out.print("<tr>"); 
								   out.print("<td  class=grayD align=left>");
								   out.print(name);
								   out.print("</td>");
								   out.print("<td  class=grayD align=left>");
								   out.print("<input type=text name=rsrv_str"+index+" value="+describ+">");
								   out.print("<input type=hidden name=rsrv_idx"+index+" value="+pmap.get("attr_id").toString()+">");
								   out.print("</td>");
								   out.print("</tr>");
	    	                  }
	    	                       index++;
	    	            }
    	         }
			   out.print("<tr>"); 
			   out.print("<input type=hidden name=rsrv_num1 value="+properSize+">");
			   out.print(" <td class=grayE colspan=5>"); 
			   out.print("     <INPUT id=advcheck name=advshow type=checkbox value=0 onclick=check_none(form1)>"); 
			   out.print("     以上资料正确无误。"); 
			   out.print("<td>"); 
			   out.print("</tr>"); 
			   out.print("<tr>");
			   out.print("<td  class=grayD align=left>");    	                		
    	       out.print("</td>");
    	       out.print("<td  class=grayD align=right>");    	                		
    	       out.print("<input name=submit1 type=button value=确定 disabled=true onclick=confirmsub(form1)>");
    	       out.print("<input name=button1 type=button value=取消 onclick=exit()></td>");
    	       out.print("</tr>");
           }
        %>
    </form>
    </table>
</body>

</html>