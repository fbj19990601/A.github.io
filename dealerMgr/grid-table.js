
	function check()
	{
		if(document.getElementById("class_id").value=="" || document.getElementById("class_id").value=="000000000000000")
		{
			alert("请选择经销商分类！");
			return false;
		}
		if(document.getElementById("user_idx").value=="")
		{
			alert("选择经销商！");
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
    var root_name="经销商分类";
	tree.on("click",function(node,event){
	   document.getElementById("class_id").value=node.id;document.getElementById("class_name").value=node.text;
	   var cust=document.getElementById("cust_id").value;
	   var own=document.getElementById("own_id").value;
	   var type='4';
	   document.getElementById('class_name').value=node.text;
	     createCustomer(cust,node.id);
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
   	var type="4";
   	EntityClassInfo.getEntityByUpClassMap(cust,id,type,function(data){
	for(var j=0;j<data.length;j++){ 
       var obj=data[j];
        callBackFunction(obj,tree.getNodeById(id));
      }
   	});
   	tree.expandAll();
   });
   
   //生成经销商数据
   function createCustomer(cust_id,class_id){
   	document.getElementById('loading').style.display="block";
	document.getElementById('custListDiv').innerHTML="";
	document.getElementById('class_id').value=class_id;
	var data=Math.round(Math.random()*10000);
   	var custAjax=new Ajax.Request(
	 'group_data.jsp?cust_id='+cust_id+"&class_id="+class_id+"&group_type=4&datas="+data,{
	  method:'get',
	  onComplete:showResponse
	 }
	);
   }
   function showResponse(response){
   	 document.getElementById('loading').style.display="none";
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
    var type="4";
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
//添加经销商操作
function addCustomer(){
	var count= document.getElementById('join').value;
	if(count==0){
		Ext.MessageBox.alert('XSaas 提示','没有要添加的经销商记录');
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
		      	 if(confirm('确定要添加所选中的经销商吗？')){
		      	 	var idxes="";
		      	 	     for(var i=0;i<count;i++){
							var obj='ckbxj'+i;
							 if(document.getElementById(obj).checked){
							   idxes=document.getElementById(obj).value+"|"+idxes;
							 }
					    }
					    
					   	document.getElementById('trade_type_code').value='1052';
						document.getElementById('user_id').value=idxes;
						document.departForm.submit();
		     	 }
		    }
		    else{
		      Ext.MessageBox.alert('XSaas 提示','请选中要添加的经销商记录');
		    }
	    }
}
//删除经销商操作
function delCustomer(){
	var count= document.getElementById('count').value;
	if(count==0){
		Ext.MessageBox.alert('XSaas 提示','没有要删除的经销商记录');
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
		      	 if(confirm('确定要删除所选中的经销商吗？')){
		      	 	var idxes="";
		      	 	var class_id=document.getElementById('class_id').value;
		      	 	     for(var i=0;i<count;i++){
							var obj='ckbx'+i;
							 if(document.getElementById(obj).checked){
							   idxes=document.getElementById(obj).value+"|"+idxes;
							 }
					    }
					   	document.getElementById('trade_type_code').value='1054';
						document.getElementById('user_id').value=idxes;
						document.departForm.submit();
		     	 }
		    }
		    else{
		      Ext.MessageBox.alert('XSaas 提示','请选中要删除的经销商记录');
		    }
	    }
}
