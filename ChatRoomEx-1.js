var xmlHttp;
function createXMLHttpRequest() {
     if (window.ActiveXObject) {
        xmlHttp = new ActiveXObject("Microsoft.XMLHTTP"); 
     }else if (window.XMLHttpRequest) {
        xmlHttp = new XMLHttpRequest(); 
     }
}
function sendMessage() {
    var msg = document.getElementById("text").value;   
    // ʹ����ֻ�����ⰴ�·��Ͱ�ť�����ı����Л]������
    if(msg === "") {
        // �Ǿ�����������Ϣ������
 refreshMessage();
 return;  
    } 
     // ������Ϣ
    var param = "task=send&msg=" + msg; 
 
    // ajax����
    ajaxRequest(param); 
    // ����ı���
    document.getElementById("text").value = "";
 }
    // ��ʱ��ѯ�����
    function queryMessage() { 
     var param = "task=query"; 
     ajaxRequest(param);
    }
    function ajaxRequest(param) { 
      var url = "ChatRoomServlet?timeStamp=" + new Date().getTime(); 
      createXMLHttpRequest(); 
      xmlHttp.onreadystatechange = refreshMessage; 
      xmlHttp.open("POST", url);  
      xmlHttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;");
      xmlHttp.send(param);
     }
     function refreshMessage() {
       if(xmlHttp.readyState == 4) { 
          if(xmlHttp.status == 200) {  
          // ������ʾ��Ϣ�ı������
            var table_body = document.getElementById("dynamicUpdateArea");
     var length = table_body.childNodes.length;
            var i;
            for (i = 0; i < length; i++) { 
               // ���Ƴ�ԭ�е��У�row�� 
               table_body.removeChild(table_body.childNodes[0]); 
           }  
          // ����ȡ�ص���Ϣ
            var messages = xmlHttp.responseXML.getElementsByTagName("message");  
            length = messages.length;
     for(i = length - 1; i >= 0 ; i--) { 
             var message = messages[i].firstChild.data;  
              // �ڱ��������һ����������Ϣ
         var row = createRow(message); 
                table_body.appendChild(row); 
             }  
            // �´�2�����ٲ�ѯһ����������Ϣ
      setTimeout(queryMessage, 2000); 
        } 
    }
 }
   function createRow(message) { 
      var row = document.createElement("tr");
      var cell = document.createElement("td"); 
      var cell_data = document.createTextNode(message); 
      cell.appendChild(cell_data);
      row.appendChild(cell);  
      return row;
   }
