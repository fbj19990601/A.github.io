<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="java.util.*"%>
<script language="JavaScript" src="www/fuction/public.js"></script>
<script language="JavaScript">
    
 
    function Check_Value()
	{
    <%
    	ArrayList resultlist = new ArrayList();
    	ArrayList resultAlist = new ArrayList();
    	ArrayList resultBlist = new ArrayList();
    	resultlist = (ArrayList) request.getAttribute("result");
    	resultAlist = (ArrayList) resultlist.get(0);
    	resultBlist = (ArrayList) resultlist.get(1);
       
    	String trade_type_code="";
    	String element_name="";
    	String fields_name="";
    	String element_type="";
    	String element_view="";
    	String element_no="";
    	String needed_tag="";
    	String element_label="";
    	String element_len="";
    
    	for (Iterator it = resultBlist.iterator(); it.hasNext();)
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
 
    	function confirmsub(formobj)
    	{
    	    if(window.confirm('你确定要提交吗？')) 
    	    {  	    	
    	        if (!Check_Value())
    	        {
    	             return;
    	        }
    	        
    	     	 addparm(formobj);
    	         formobj.submit();   	         
    	    }
    	    else
    	    {
    	        return;
    	    }
    	}
       function  addparm(formobj)
       {
        if(formobj.str_attr)
        {
       		var attr_str="";
       		formobj.str_attr.value="";
			for(var i=0;i<formobj.length;i++)
			{
				if(formobj[i].getAttribute("name").substring(0,4)=="attr")
				{
			 	  attr_str =attr_str + formobj[i].getAttribute("name").substring(4, formobj[i].getAttribute("name").length)+":";
			 	  attr_str = attr_str +formobj[i].getAttribute("value")+"|";
				}
			}
			formobj.str_attr.value=attr_str;
		 }
        }    		
</script>
<html>
	<head>
        <title><bean:message key="system.tittle"/></title>

        <link href="style/css.css" rel="stylesheet" type="text/css"> 
        <script src="www/fuction/calendar.js" type="text/javascript"></script>
	</head>
	<body>	    
	   <table width="818" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="26" background="img/bg-1.gif">&nbsp;</td>
          </tr>
          <tr>
            <td background="img/bg-2.gif">
	        <table width=95% border=0 cellpadding=10 cellspacing=1 align=center bordercolor=#000000>
	        <form name=form1 action=doTradeReg.do method=post >
	        <%
 
		            String display = "";		
		            if (resultAlist != null)
		            {
    	            	for (Iterator it = resultAlist.iterator(); it.hasNext();)
    	            	{	
                    		
                    		display =(String) it.next();
                 %>
                 <%=display%>
                 <%
    	            	}
    	            	 
		             }
		        %>
		      <tr> 
                <td class="grayE" colspan=5>
                    <INPUT name="advshow" type="checkbox" value="0" onclick="check_none(form1)">
                    <bean:message key="str5132"/>
            	<td>
              </tr>
		     <tr>
		        <td class="graymn" align=right></td>
		        <td class="graymn" align=right>
		        <input name="submit1" type="button" value="提交" disabled="true" onclick="confirmsub(form1)">
		        
		        </td>
		     </tr>
		     
		    </form>
		    </table>
		</td>
          </tr>
          <tr>
            <td height="46" background="img/bg-3.gif">&nbsp;</td>
          </tr>
        </table>
</body>
</html>