<%@ page import="java.util.*" %> 
<table  border="1" cellpadding="10" cellspacing="1" align="left" bordercolor="#D1D1D1" >
    <tr>
        <td class="grayD" width="100" onMouseover="this.className='grayE';" onMouseout="this.className='grayD'">
            <%
                String userId = (String) session.getAttribute("staffId");  
                HashMap itemsListmap=new HashMap();
                itemsListmap.put("ThisItemLevel","1");
                itemsListmap.put("ThisItemName","");  
                itemsListmap.put("ThisItemId","");
                itemsListmap.put("Modify_Tag","0");					
                itemsListmap.put("StaffId",userId);
                request.setAttribute("itemsListmap",itemsListmap);
            %>
            <html:link action="/GetItemInfoByLevel" name="itemsListmap" target="right">新增栏目</html:link>
        </td>
        <td class="grayD"  width="100" onMouseover="this.className='grayE';" onMouseout="this.className='grayD'">
            <%
            	HashMap modifyListmap=new HashMap();
          		modifyListmap.put("ThisItemLevel","1");
          		modifyListmap.put("ThisItemName","");  
          		modifyListmap.put("ThisItemId","");					
          		modifyListmap.put("StaffId",userId);
          		modifyListmap.put("Modify_Tag","1");	
          		request.setAttribute("modifyListmap",modifyListmap);		
            %> 
            <html:link action="/GetItemInfoByLevel" name="modifyListmap" target="right">删除修改栏目</html:link>
                         
        </td>
    </tr>
</table><br> 
<hr>