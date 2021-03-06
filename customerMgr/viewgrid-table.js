
	function check()
	{
		if(document.getElementById("class_id").value=="" || document.getElementById("class_id").value=="000000000000000")
		{
			alert("请选择客户分类！");
			return false;
		}
		if(document.getElementById("user_idx").value=="")
		{
			alert("选择客户！");
			return false;
		}else{
		    var result="";
			var obj=document.getElementById("user_idx");
			for(var i=0;i<obj.length;i++){
			  if(obj.options[i].selected){
			   result=result+obj.options[i].value+"|";
			  }
			}
			document.getElementById("user_id").value=result;
		}
		return true;
	}
		
	//生成树形组织结构
	var tree = new Ext.tree.TreePanel({   
    	el:"tree-div",   
        autoScroll:false,
        animate:true,
        width:'30%',
        height:'300px',
        enableDD:true,
        containerScroll: true, 
        loader: new Ext.tree.TreeLoader({
            dataUrl:'/tree.html'            
        })
    });
		
    Ext.onReady(function(){ 
	
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
	
    var cust=document.getElementById("cust_id").value;
    var org_idx="000000000000000";
    var root_name="客户分类";
	tree.on("click",function(node,event){
	   $("class_id").value=node.id;
	   $("class_name").value=node.text;
	   var cust=document.getElementById("cust_id").value;
	   var own=document.getElementById("own_id").value;
	   var type='0';
	   $('class_name').value=node.text;
	     createCustomer(cust,node.id,"0");
	 });
    var root = new Ext.tree.AsyncTreeNode({
        text: root_name,
        draggable:false,
        iconCls:'root-Img',
        id:org_idx
    });
    tree.setRootNode(root);
	tree.render();
   	root.expand();
   	var id=root.id;
   	var type="0";
   	EntityClassInfo.getEntityByUpClassMap(cust,id,type,function(data){
	for(var j=0;j<data.length;j++){ 
       var obj=data[j];
        callBackFunction(obj,tree.getNodeById(id));
      }
   	});
   	tree.expandAll();
   });
   
   //生成客户数据
   function createCustomer(cust_id,class_id,iStart){
   	document.getElementById('load-div').style.display="block";
	document.getElementById('custListDiv').innerHTML="";
	document.getElementById('class_id').value=class_id;
	var data=Math.round(Math.random()*10000);
   	var custAjax=new Ajax.Request(
	 'clientViewByType.jsp?cust_id='+cust_id+"&iStart="+iStart+"&class_id="+class_id+"&group_type=0&datas="+data,{
	  method:'get',
	  onComplete:showResponse
	 }
	);
   }
   function showResponse(response){
   	 document.getElementById('load-div').style.display="none";
   	 document.getElementById('custListDiv').innerHTML=response.responseText;
   }
   var  handle={
   	onCreate: function(){
	 Element.show('loading');
	},
	onComplete: function(){
		if(Ajax.activeRequestCount==0){
			 Element.hide('loading');
		}
	}
   }
   Ajax.Responders.register(handle);
   //三级节点
   function callBackFunction(obj,node){
    var cust=document.getElementById("cust_id").value;
    var type="0";
	for(var org_id in obj){ 
         var org_name=obj[org_id];
         if(org_id!='extend'){
         var nodex = new Ext.tree.TreeNode({text:org_name,draggable:false,iconCls:'Tree-Img',id:org_id});
         node.appendChild(nodex);
         EntityClassInfo.getEntityByUpClassMap(cust,org_id,type,function(data){
	      for(var i=0;i<data.length;i++){ 
			var objx=data[i];
			for(var orgid in objx){
			    if(orgid!='extend'){  
			         var orgname=objx[orgid];
			         var tree_nodex= new Ext.tree.TreeNode({text:orgname,draggable:false,iconCls:'Tree-Img',id:orgid});
			         nodex.appendChild(tree_nodex);
			         EntityClassInfo.getEntityByUpClassMap(cust,orgid,type,function(data){
			          for(var i=0;i<data.length;i++){ 
                        var obj=data[i];
                         callBackFunction(obj,tree_nodex);
                      }
			         });
		         }
	         }
	      }
	   });
	   }
     }
   }
  function seleAll(){
  	var count= $('count').value;
	if($('checkAll').checked){
	for(var i=0;i<count;i++){
		var obj='ckbx'+i;
		$(obj).checked=true;
	}
	}else{
		for(var i=0;i<count;i++){
		var obj='ckbx'+i;
		$(obj).checked=false;
	  }
	}
  }
  function addAll(){
  	var count= $F('join');
	if($('checkjoin').checked){
	for(var i=0;i<count;i++){
		var obj='ckbxj'+i;
		$(obj).checked=true;
	}
	}else{
		for(var i=0;i<count;i++){
		var obj='ckbxj'+i;
		$(obj).checked=false;
	  }
	}
  }
//添加客户操作
function addCustomer(){
	var count= $F('join');
	if(count==0){
		Ext.MessageBox.alert('XSaas 提示','没有要添加的客户记录');
		return;
	  }else{
		     var res=-1;
		     for(var i=0;i<count;i++){
				var obj='ckbxj'+i;
				 if($(obj).checked){
				   res=i;
				 }
		    }
		   
		    if(res>-1){
		      	 if(confirm('确定要添加所选中的客户吗？')){
		      	 	var idxes="";
		      	 	     for(var i=0;i<count;i++){
							var obj='ckbxj'+i;
							 if($(obj).checked){
							   idxes=$F(obj)+"|"+idxes;
							 }
					    }
					    
					   	$('trade_type_code').value='1052';
						$('user_id').value=idxes;
						document.departForm.submit();
		     	 }
		    }
		    else{
		      Ext.MessageBox.alert('XSaas 提示','请选中要添加的客户记录');
		    }
	    }
}
//删除客户操作
function delCustomer(){
	var count= $F('count');
	if(count==0){
		Ext.MessageBox.alert('XSaas 提示','没有要删除的客户记录');
		return;
	  }else{
		     var res=-1;
		     for(var i=0;i<count;i++){
				var obj='ckbx'+i;
				 if($(obj).checked){
				   res=i;
				 }
		    }
		   
		    if(res>-1){
		      	 if(confirm('确定要删除所选中的客户吗？')){
		      	 	var idxes="";
		      	 	var class_id=$F('class_id');
		      	 	     for(var i=0;i<count;i++){
							var obj='ckbx'+i;
							 if($(obj).checked){
							   idxes=$F(obj)+"|"+idxes;
							 }
					    }
					   	$('trade_type_code').value='1054';
						$('user_id').value=idxes;
						document.departForm.submit();
		     	 }
		    }
		    else{
		      Ext.MessageBox.alert('XSaas 提示','请选中要删除的客户记录');
		    }
	    }
}

function getpages(iStart){
  var cust_id=$F("cust_id");
  var class_id=$F("class_id");
  createCustomer(cust_id,class_id,iStart)
}
