  Ext.onReady(function(){
     initRealtion();
  });
   function initRealtion(){
     Ext.QuickTips.init();   
     Ext.debug;
 	//数据源
 	var data_url='rel_json.jsp';
 	
 	//显示位置
 	var div_show="rel-div";
 	
 	//列表标题
 	var title="客户关系列表";
 	
 	//字段[***************************************************************]
 	//此字段是与表头里出现的列数相对应
 	var fields=new Array({name : 'obj_cust_id'},{name : 'cust_name'},{name : 'group_contact_phone'},{name : 'email'},{name:'start_date'});
 	
 	//数据源[其格式固定不变]
 	var dds=new Ext.data.Store({proxy : new Ext.data.HttpProxy({url : data_url}),reader : new Ext.data.JsonReader({totalProperty : 'totalCount',root : 'root',fields:fields })});
	//列表宽度
	var gridWidth=600;
	
	//是否显示行号
	var rm=new Ext.grid.RowNumberer();
	//是否有复选框
 	var sm=new Ext.grid.CheckboxSelectionModel();
 	
 	//表头,有多少列，就写多个列，按自己的需要，像id等不要显示出来，但要用到其值，可以将[hidden:true]
 	//
 	var headField= new Array();
 	headField.push(rm);
 	headField.push(sm);
 	headField.push({header : '编号',dataIndex:'obj_cust_id',sortable : true,hidden:true,width:100});
 	headField.push({header : '客户名称',dataIndex : 'cust_name',sortable : true,width:150});
 	headField.push({header : '联系电话',dataIndex : 'group_contact_phone',sortable : true,width:100});
 	headField.push({header : '邮件地址',dataIndex : 'email',sortable : true,width:200});
 	headField.push({header : '建立日期',dataIndex : 'start_date',sortable : true,width:100});
 	var cm = new Ext.grid.ColumnModel(headField);
 	
 	//一页显示多少条
 	var pageSize=20;
 	var toolsBar=new Array();
 	//toolsBar.push({text: '查看用户',iconCls:'details',handler : function(){alert('查看用户')}});
 	//toolsBar.push({text: '修改用户',iconCls:'add',handler : function(){alert('修改用户')}});
 	toolsBar.push({text: '解除关系',iconCls:'delCust',handler : function(){
        var record = grid.getSelectionModel().getSelected();// 返回值为 Record 类型
		if(!record){
				alert("XSaaS 提示!"+"请先选择要解除关系的客户记录!");
				return;
		}else{
			var obj_id=record.get('obj_cust_id');
			if(window.confirm('确定要解除关系？')){
			  document.relationForm.action="/doTradeReg.do?obj_cust_id="+obj_id+"&trade_type_code=0815";
			  document.relationForm.submit();
			}
		}
    }});
 	
  //开始调用方法
    CreateGridPanal(toolsBar,cm,sm,div_show,title,dds,gridWidth,pageSize);
    }