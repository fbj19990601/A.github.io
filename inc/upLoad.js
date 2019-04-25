function checkImage() {
	var imag = document.getElementById('files').value;
	if (imag == null || imag == "") {
		alert("Please choose to upload the annex!");
		return false;
	} else {
		var pos = imag.lastIndexOf(".");
		var lastname = imag.substring(pos, imag.length)
		if (lastname.toLowerCase() == ".exe"
				|| lastname.toLowerCase() == ".bat"
				|| lastname.toLowerCase() == ".sh"
				|| lastname.toLowerCase() == ".so"
				|| lastname.toLowerCase() == ".dll") {
			alert("You upload the file type for the" + lastname + "£¬Annex is not the right type of format£¡");
			return false;
		}
	}
	 return true;
}

  function createCustomer(imag,idx){
	var data=Math.round(Math.random()*10000);
   	var custAjax=new Ajax.Request(
	 '/inc/uploadAttr.jsp?idx='+idx+"&file="+imag+"&datas="+data,{
	  method:'post',
	  onSuccess:showResponse,
	  onFailure: function(){ alert('Failed to upload...') } 
	 }
	);
   }

   Ext.onReady(function(){
    var win;
    var button = Ext.get('up_laod');
    button.on('click', function(){
     var data=Math.round(Math.random()*10000);
    	var idx=document.getElementById("attach_root_id").value;
        if(!win){
            win = new Ext.Window({
                el:'hello-win',
                layout:'fit',
                width:450,
                autoScroll:true,
                title:'Upload annex information',
                maximizable :true,
                height:220,
                frame:true,
                closeAction:'hide',
                plain: true,
                items:[{
                    autoLoad: {url: '/inc/uploadAttr.jsp', params: "idx="+idx+"&data="+data}               	
                }],
                buttons: [{
			            text: 'Upload finished',
			             handler:function(){
			             win.hide();
			             showUpLoadFile(idx);
			            }
			        }]
	            });
	           win.show();
	        }else{
              win.show();
	        }
    });
   });
   function showUpLoadFile(root_id){
   	 var data=Math.round(Math.random()*10000);
     var custAjax=new Ajax.Request(
	 '/inc/attachInfo.jsp?idx='+root_id+"&datas="+data,{
	  method:'post',
	  onSuccess:showResponse,
	  onFailure: function(){document.getElementById("attr-div").innerHTML="Annex read the information failed!";} 
	 }
	);
   }
  function showResponse(response){
    document.getElementById("attr-div").innerHTML=response.responseText;
   }