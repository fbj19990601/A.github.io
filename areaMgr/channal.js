 function Check_Value()
 { 
        var up_id=document.getElementById("up_channels_id").value;
	    if(up_id=="" || up_id==null){
	     alert("片区分类不能为空！");
	      return false;
	    }
	    var name=document.getElementById("channels_name").value;
	    if(name=="" || name==null){
	     alert("片区名称不能为空！");
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
	    document.getElementById("up_channels_id").value="";
		document.getElementById("channels_level").value="0";
	  }
}
Ext.onReady(function(){ 

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
		document.getElementById("up_channels_id").value=node.id;
		
	//	var cust_id = document.getElementById("cust_id").value;
		//NewAreaList.getAreaById(cust_id,node.id,setData);
		});
    var root = new Ext.tree.AsyncTreeNode({
        text:'渠道片区规划',
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