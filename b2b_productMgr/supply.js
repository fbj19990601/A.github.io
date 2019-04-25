 function Check_Value()
 { 
        var name=document.getElementById("product_name").value;
	   if(name=="" || name==null){
	      Ext.MessageBox.alert("XSaaS","Product names can not be empty!");
	      return false;
	   }
	   if(document.getElementById("product_type")=="" || document.getElementById("product_type")==null){
	      Ext.MessageBox.alert("XSaaS","Product can not be empty!");
	      return false;
	   }
	    var size=document.getElementById("size").value;
	    var values="";
	    for(var i=0;i<size;i++){
	      var obj="attr_value"+i;
	      values=values+document.getElementById(obj).name+"#"+document.getElementById(obj).value+"|";
	    }
	    document.getElementById("rsrv_str1").value=values;
 	    return true;
}
function selectLevel(val){
	  if(val=="2"){
	    document.getElementById("upShow").style.display="block";
		document.getElementById("class_level").value="1";
	  }else{
	    document.getElementById("upShow").style.display="none";
	    document.getElementById("up_class_id").value="000000000000000";
		document.getElementById("class_level").value="0";
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
	    document.getElementById("product_class").value=node.id;
		setProductDiv(node.id);
		});
    var root = new Ext.tree.AsyncTreeNode({
        text:'Product Categories',
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
   	var class_name=Map['class_name'];
    var class_desc=Map['class_desc'];
    var enable_tag=Map['enable_tag'];
    var remark=Map['remark'];
    document.getElementById("class_name").value=channels_name;
    document.getElementById("class_desc").value=channels_desc;
    document.getElementById("enable_tag").value=enable_tag;
    document.getElementById("remark").value=remark;
   }
   function setProductDiv(class_id){
   	document.getElementById('loading').style.display="block";
	document.getElementById('product-div').innerHTML="";
	var data=Math.round(Math.random()*10000);
   	var custAjax=new Ajax.Request(
	 'add_attr_list.jsp?class_id='+class_id+"&datas="+data,{
	  method:'get',
	  onComplete:showResponse
	 }
	);
   }
   
   function showResponse(response){
   	 document.getElementById('loading').style.display="none";
   	 document.getElementById('product-div').innerHTML=response.responseText;
   }
   
/**
 * 数据检测
 */
var type = "2";

// 设置二级分类
function setSecondClass(val) {
	var up_class_id = val;
	$("rsrv_str1").value = "1";
	Productclass.getProductClassByUpId(up_class_id, type, setSort2);
}
function setSort2(map_data) {
	DWRUtil.removeAllOptions("sort2");
	DWRUtil.addOptions("sort2", map_data);
	$("sort3").style.display = "none";
	$("nextElement").style.display = "none";
	var item = $("sort2").length;
	if (item == 0) {
		$("sort2").style.display = "none";
	} else {
		$("sort2").style.display = "block";
	}
}
// 设置三级分类
function setTherdClass(val) {
	var up_class_id = val;
	$("rsrv_str1").value = "2";
	Productclass.getProductClassByUpId(up_class_id, type, setSort3);
}
function setSort3(map_data) {
	if (map_data != null) {
		DWRUtil.removeAllOptions("sort3");
		DWRUtil.addOptions("sort3", map_data);
		var item = $("sort3").length;
		if (item == 0) {
			$("sort3").style.display = "none";
			$("nextElement").style.display = "none";
		} else {
			$("sort3").style.display = "block";
		}
	}
}
function setTypeName(obj) {
	  var idx=obj.value;
	  $("class_id").value=idx;
}
// 动态生成下级分类信息
function cretateSelect(index, value) {
	$("nextElement").style.display = "block";
	$("rsrv_str1").value = "3";
	var divId = parseInt(index) + parseInt(1);
	$("index_s").value = index;
	$(index).innerHTML = "<select name=sort" + index + " id=sort" + index
			+ " onchange=cretateSelect(" + divId
			+ ",this.value) size=3  style=width:130px></select><div id="
			+ divId + "></div>";
	DWRUtil.removeAllOptions("sort" + index);
	Productclass.getProductClassByUpId(value, type, setNewSelect);
}
// 回调函数
function setNewSelect(map_data) {
	var id = $("index_s").value;
	DWRUtil.addOptions("sort" + id, map_data);
	var item = $("sort" + id).length;
	if (item == 0) {
		$(id).style.display = "none";
	} else {
		$(id).style.display = "block";
	}
}
 
