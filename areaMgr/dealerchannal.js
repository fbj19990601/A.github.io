 function Check_Value()
 { 
        var name=document.getElementById("channels_name").value;
 	    return true;
}
function selectLevel(val){
	  if(val=="2"){
	    document.getElementById("upShow").style.display="block";
		document.getElementById("channels_level").value="1";
	  }else{
	    document.getElementById("upShow").style.display="none";
	    document.getElementById("up_channels_id").value="000000000000000";
		document.getElementById("channels_level").value="0";
	  }
}
Ext.onReady(function(){ 
   ///////////////////////////////////////////////////////////////////////////////////////////////////
 var tree = new Ext.tree.TreePanel({   
    	el:"tree-div",   
        autoScroll:false,
        animate:true,
        width:'30%',
        height:'300px',
        enableDD:true,
        containerScroll: true, 
        loader: new Ext.tree.TreeLoader({
            dataUrl:'json_data.jsp'            
        })
    });
      var resizeable = new Ext.Resizable('tree-div', {
            pinned:true,
            autoWidth:true,
            autoHeight:true,
            handles: 'e',
            widthIncrement:50,
            minWidth: 50,
			maxWidth:450,
            dynamic: true
        });
	   tree.on("click",function(node,event){
		 document.getElementById("channels_id").value=node.id;
		 document.getElementById("channles_name").value=node.text;
		 setAreaDiv(node.id);
		});
    var root = new Ext.tree.AsyncTreeNode({
        text:'����Ƭ���滮',
        draggable:false,
        iconCls:'root-Img',
        id:'000000000000000'
    });
    tree.setRootNode(root);
   	tree.render();
   	root.expand();
  	tree.expandAll();
   });
 
//////////////////////////////////////////////////////////////
 function setAreaDiv(channels_id){
   	document.getElementById('loading').style.display="block";
	document.getElementById('dealer-area-div').innerHTML="";
	var data=Math.round(Math.random()*10000);
   	var custAjax=new Ajax.Request(
	 'dealer_area.jsp?channels_id='+channels_id+"&datas="+data,{
	  method:'get',
	  onComplete:showResponse
	 }
	);
   }
   
   function showResponse(response){
   	 document.getElementById('loading').style.display="none";
   	 document.getElementById('dealer-area-div').innerHTML=response.responseText;
   }
   
  function seleAll(){
  	var count= document.getElementById('count').value;
	if(document.getElementById('checkAll').checked){
	for(var i=0;i<count;i++){
		var obj='ckbx'+i;
		document.getElementById(obj).checked=true;
	}
	}else{
		for(var i=0;i<count;i++){
		var obj='ckbx'+i;
		document.getElementById(obj).checked=false;
	  }
	}
  }
  
  function addAll(){
  	var count= document.getElementById('join').value;
	if(document.getElementById('checkjoin').checked){
	for(var i=0;i<count;i++){
		var obj='ckbxj'+i;
		document.getElementById(obj).checked=true;
	}
	}else{
		for(var i=0;i<count;i++){
		var obj='ckbxj'+i;
		document.getElementById(obj).checked=false;
	  }
	}
  }
  
  //��Ӿ�����Ƭ����¼
 function addCustomer(){
	var count= document.getElementById('join').value;
	if(count==0){
		Ext.MessageBox.alert('XSaas ��ʾ','û��Ҫ��ӵľ�����Ƭ����¼');
		return;
	  }else{
		     var res=-1;
		     for(var i=0;i<count;i++){
				var obj='ckbxj'+i;
				 if(document.getElementById(obj).checked){
				   res=i;
				 }
		    }
		   
		    if(res>-1){
		      	 if(confirm('ȷ��Ҫ�����ѡ�еľ�������')){
		      	 	var idxes="";
		      	 	     for(var i=0;i<count;i++){
							var obj='ckbxj'+i;
							 if(document.getElementById(obj).checked){
							   idxes=document.getElementById(obj).value+"|"+idxes;
							 }
					    }
					    
					   	document.getElementById('trade_type_code').value='1200';
						document.getElementById('channels_id_grp').value=idxes;
						document.getElementById("rsrv_str1").value="0";
						document.resumeForm.submit();
		     	 }
		    }
		    else{
		      Ext.MessageBox.alert('XSaas ��ʾ','��ѡ��Ҫ��ӵľ�����Ƭ����¼');
		    }
	    }
}
//ɾ��������Ƭ����¼
  function delCustomer(){
	var count= document.getElementById('count').value;
	if(count==0){
		Ext.MessageBox.alert('XSaas ��ʾ','û��Ҫɾ���ľ�����Ƭ����¼');
		return;
	  }else{
		     var res=-1;
		     for(var i=0;i<count;i++){
				var obj='ckbx'+i;
				 if(document.getElementById(obj).checked){
				   res=i;
				 }
		    }
		   
		    if(res>-1){
		      	 if(confirm('ȷ��Ҫɾ����ѡ�еľ�����Ƭ����¼��')){
		      	 	var idxes="";
		      	 	     for(var i=0;i<count;i++){
							var obj='ckbx'+i;
							 if(document.getElementById(obj).checked){
							   idxes=document.getElementById(obj).value+"|"+idxes;
							 }
					    }
					   	document.getElementById('trade_type_code').value='1201';
						document.getElementById('channels_id_grp').value=idxes;
						document.getElementById("rsrv_str1").value="";
						document.resumeForm.submit();
		     	 }
		    }
		    else{
		      Ext.MessageBox.alert('XSaas ��ʾ','��ѡ��Ҫɾ���ľ�����Ƭ����¼');
		    }
	    }
}
   