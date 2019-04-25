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
    // 使用者只是随意按下发送按钮，但文本框中沒有文字
    if(msg === "") {
        // 那就重新整理信息区好了
 refreshMessage();
 return;  
    } 
     // 发送信息
    var param = "task=send&msg=" + msg; 
 
    // ajax请求
    ajaxRequest(param); 
    // 清空文本框
    document.getElementById("text").value = "";
 }
    // 定时查询用这个
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
          // 处理显示信息的表格区域
            var table_body = document.getElementById("dynamicUpdateArea");
     var length = table_body.childNodes.length;
            var i;
            for (i = 0; i < length; i++) { 
               // 先移除原有的列（row） 
               table_body.removeChild(table_body.childNodes[0]); 
           }  
          // 处理取回的信息
            var messages = xmlHttp.responseXML.getElementsByTagName("message");  
            length = messages.length;
     for(i = length - 1; i >= 0 ; i--) { 
             var message = messages[i].firstChild.data;  
              // 在表格中新增一列来排列信息
         var row = createRow(message); 
                table_body.appendChild(row); 
             }  
            // 下次2秒后会再查询一下有无新信息
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
