 function Check_Value()
 { 
        var name=document.getElementById("channels_name").value;
	    if(name=="" || name==null){
	      Ext.MessageBox.alert("XSaaS","Ƭ�����Ʋ���Ϊ�գ�");
	      return false;
	    }
	    if(DWRUtil.getText("province")=="��ѡ��.."){
	      Ext.MessageBox.alert("XSaaS","��ѡ��ʡ�ݣ�");
	      return false;
	    }
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
   function setData(Map){
   	 var channels_name=Map['channels_name'];
    var channels_desc=Map['channels_desc'];
    var enable_tag=Map['enable_tag'];
    var remark=Map['remark'];
    document.getElementById("channels_name").value=channels_name;
    document.getElementById("channels_desc").value=channels_desc;
    document.getElementById("enable_tag").value=enable_tag;
    document.getElementById("remark").value=remark;
   }
   var fectureArray=new Array();
	 fectureArray=['��ѡ��..'];
function setAreas(city_id){
    if(DWRUtil.getValue("eparchy_code")!="��ѡ��.."){
     document.getElementById("area_name").value=DWRUtil.getText("eparchy_code");
     document.getElementById("area_code").value=DWRUtil.getValue("eparchy_code");
     }
	 AreaInfo.getAreaByParent(city_id,function(data){
	 DWRUtil.removeAllOptions("city");
     DWRUtil.addOptions("city",fectureArray);
	 DWRUtil.addOptions("city",data);
	});
}
function setCitys(prov){
   var provence=prov;
   if(DWRUtil.getValue("province")!="��ѡ��.."){
     document.getElementById("area_name").value=DWRUtil.getText("province");
     document.getElementById("area_code").value=DWRUtil.getValue("province");
     }
	 AreaInfo.getAreaByParent(provence,function(data){
	 DWRUtil.removeAllOptions("eparchy_code");
	 DWRUtil.addOptions("eparchy_code",fectureArray);
	 DWRUtil.addOptions("eparchy_code",data);
	 DWRUtil.removeAllOptions("city");
	 DWRUtil.addOptions("city",fectureArray);
	});
}
function setAreaCode(){
  if(DWRUtil.getValue("city")!="��ѡ��.."){
	document.getElementById("area_name").value=DWRUtil.getText("city");
	document.getElementById("area_code").value=DWRUtil.getValue("city");
	}
}
//////////////////////////////////////////////////////////////
 function setAreaDiv(channels_id){
   	document.getElementById('loading').style.display="block";
	document.getElementById('area-div').innerHTML="";
	var data=Math.round(Math.random()*10000);
   	var custAjax=new Ajax.Request(
	 'set_area.jsp?channels_id='+channels_id+"&datas="+data,{
	  method:'get',
	  onComplete:showResponse
	 }
	);
   }
   
   function showResponse(response){
   	 document.getElementById('loading').style.display="none";
   	 document.getElementById('area-div').innerHTML=response.responseText;
   }
   
  function seleAll(){
  	var count= document.getElementById('size').value;
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
 
  function delCustomer(){
	var count= document.getElementById('size').value;
	if(count==0){
		Ext.MessageBox.alert('XSaas ��ʾ','û��Ҫɾ����Ƭ����¼');
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
		      	 if(confirm('ȷ��Ҫɾ����ѡ�е�Ƭ����¼��')){
		      	 	var idxes="";
		      	 	     for(var i=0;i<count;i++){
							var obj='ckbx'+i;
							 if(document.getElementById(obj).checked){
							   idxes=document.getElementById(obj).value+"|"+idxes;
							 }
					    }
					   	document.getElementById('trade_type_code').value='1101';
						document.getElementById('oper_user_id').value=idxes;
						document.resumeForm.submit();
		     	 }
		    }
		    else{
		      Ext.MessageBox.alert('XSaas ��ʾ','��ѡ��Ҫɾ������ϵ�˼�¼');
		    }
	    }
}
   