
// �Զ�����
Ext.BLANK_IMAGE_URL = "../ext/resources/images/default/s.gif"  
var depart_group="";
Ext.onReady(function() {
   var resizeable = new Ext.Resizable('depart-tree', {
            pinned:true,
            autoWidth:true,
            autoHeight:true,
            handles: 'e',
            widthIncrement:50,
            minWidth: 50,
			maxWidth:450,
            dynamic: true
        });
    var tree = null;   
        var Tree = Ext.tree;   
        tree = new Tree.TreePanel({   
            el:'depart-tree',   
            autoScroll:false,   
            animate:true,   
            enableDD:true,  
            autoWidth:true,
            autoHeight:true,
            containerScroll: true,    
            loader: new Tree.TreeLoader({   
                dataUrl:'json_org.jsp'   
            }),   
            rootVisible: false   
        });  
        tree.on('checkchange', function(node, checked) {   
	            node.expand();   
	            node.attributes.checked = checked;  
	            if(checked){
	              var org_idx=$F("depart_group");
	              if(org_idx.indexOf(node.id)==-1){
	              	 $("depart_group").value=$F("depart_group")+node.id+"|";
	              }
        	    }else{
        	      var st=$F("depart_group");
        	      st=st.replace(node.id+"|",'');
        	      $("depart_group").value=st;	
        	    }
	            node.eachChild(function(child) {  
		                child.ui.toggleCheck(checked);   
		                child.attributes.checked = checked;   
		                child.fireEvent('checkchange', child, checked);   
                    });   
                }, tree);   
                var root = new Tree.AsyncTreeNode({   
                    text: '���Žṹ',   
		            draggable:false,
		            iconCls:'root-Img',
		            id:'000000000000000'   
                });   
                tree.setRootNode(root);   
                tree.render();   
                root.expand();   
   	           // tree.expandAll();	
});
function checkCode(code){
	if(code==""|| code==null){
	 alert("��ѡ���������ƣ�")
	 return false;
	}else{
		var data=Math.round(Math.random()*10000);
	   	var custAjax=new Ajax.Request(
		 'checkDefinition.jsp?code='+code+"&datas="+data,{
		  method:'get',
		  onComplete:showResponse
		 }
		);
	}
}
 function showResponse(response){
   	var result=response.responseText;
   	if(parseInt(result)==1){
   	  alert("������������������<br>���Ҫ���в�������ǰ����Ϣ���ᱻ����!");
   	}
}
function checkLevel(type) {
   if(type=="all"){
   	$("leve_group").value="0000000000";
   }else{
	// �������������ֹ����
	var data = Math.round(Math.random() * 10000);
	// ���ɼ����б�
	var myAjax = new Ajax.Updater('level-div', // ���µ�ҳ��Ԫ��
			'level.jsp?type=' + type + "&data=" + data, // �����URL
			{
				method : 'get'
			});
   }
}
function checkRole(type) {
	if(type!="0"){
	// �������������ֹ����
	var data = Math.round(Math.random() * 10000);
	// ���ɼ����б�
	var myAjax = new Ajax.Updater('role-div', // ���µ�ҳ��Ԫ��
			'role.jsp?type=' + type + "&data=" + data, // �����URL
			{
				method : 'get'
			});
	}else if(type=="all"){
		$("role_group").value="0000000000";
	}
}

//���ɷ�����
function createClass(type){
	if(type =="" || type == null){
		alert("��ѡ�����!")
	}else if(type=="all"){
	$("type_group").value="0000000000";
	}else{
		var data = Math.round(Math.random() * 10000);
		var myAjax = new Ajax.Updater(
          'type-tree', 
          'class_type.jsp?type=' + type + "&data=" + data, 
          {
              method: 'get',
              evalScripts: true
          }
      );
	}
}

function check_Value() {
	  if($F("subsys_code")=="" || $F("subsys_code")==null){
    	alert("��ѡ�����ú����������ƣ�")
    	return false;
    }
    if($F("leve_group")=="" || $F("leve_group")==null){
    	 creatLevel();
    	alert("��ѡ�񼶱�Ȩ�ޣ�")
    	return false;
    }
    if($F("depart_group")=="" || $F("depart_group")==null){
    	 alert("��ѡ����Ȩ�ޣ�")
    	 return false;
    }
    if($F("role_group")=="" || $F("role_group")==null){
    	 creatRole();
    	 alert("��ѡ���ɫȨ�ޣ�")
    	 return false
    }
     if($F("type_group")=="" || $F("type_group")==null){
    	 alert("��ѡ�����Ȩ�ޣ�")
    	 return false;
    }
    if($F("start_date")==""){
         alert("����д��ʼʱ�䣡");
         return false;
    }
    if($F("end_date")==""){
         alert("����д����ʱ�䣡");
         return false;
    }
     if(!checkDate($F("start_date"),$F("end_date"))){
		     return false;
		   }
    
	return true;
}

//���ɼ����б�
function creatLevel(){
	var type=$F("leve_sel");
	if(type=="" || type==null){
	  alert("��ѡ�񼶱�")
	  return false;
	}
	var size=$F("size");
    var level="";
    if(size>0){
    	for( var i=1;i<=size;i++){
    	  var obj="check"+i;
    	  if($(obj).checked){
    	    level=level+$F(obj)+"|";
    	  }
    	}
    }
    if(level =="" || level==null){
      alert("��ѡ�񼶱�")
	  return false;
    }
    $("leve_group").value=level;
    return true;
}

//���ɽ�ɫ�б�
function creatRole(){
	var type=$F("role_sel");
	if(type=="0"){
	  alert("��ѡ���ɫ��")
	  return false;
	}
	var size=$F("role");
    var role="";
    if(size>0){
    	for( var i=1;i<=size;i++){
    	  var obj="role"+i;
    	  if($(obj).checked){
    	    role=role+$F(obj)+"|";
    	  }
    	}
    }
    if(role =="" || role==null){
      alert("��ѡ���ɫ��")
	  return false;
    }
    $("role_group").value=role;
    return true;
}