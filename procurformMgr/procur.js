Ext.onReady(function(){
     initProcur();
  });
				function initProcur(){
				//数据源
			 	var data_url='J_data.jsp';
			 	
			 	 Ext.QuickTips.init();   
			 	//显示位置
			 	var div_show="grid";
			 	
			 	//列表标题
			 	var title='采购单列表';
			 	
			 	//字段[***************************************************************]
			 	//此字段是与表头里出现的列数相对应
			 	var fields=new Array({name : 'quo_id'},{name : 'quo_name'},{name : 'rsrv_str4'},{name : 'rsrv_str3'},{name : 'give_addr'});
			 	
			 	//数据源[其格式固定不变]
			 	var dds=new Ext.data.Store({proxy : new Ext.data.HttpProxy({url : data_url}),reader : new Ext.data.JsonReader({totalProperty : 'totalCount',root : 'root',fields:fields })});
				//列表宽度
				var gridWidth=740;
				
				//是否显示行号
				var rm=new Ext.grid.RowNumberer();
				//是否有复选框
			 	var sm=new Ext.grid.CheckboxSelectionModel();
			 	
			 	//表头,有多少列，就写多个列，按自己的需要，像id等不要显示出来，但要用到其值，可以将[hidden:true]
			 	/**
			 	var cm = new Ext.grid.ColumnModel([
			 	rm,sm,
			 	{header:'编号',dataIndex:'quo_id',sortable : true,hidden:true,width:100},
			 	{header:'采购单名称',dataIndex:'quo_name',sortable : true,width:100},
			 	{header:'物品名称',dataIndex : 'rsrv_str4',sortable : true,width:200},
			 	{header:'销售客户名',dataIndex : 'rsrv_str3',sortable : true,width:200},
			 	{header:'交货地点',dataIndex : 'give_addr',sortable : true,width:200}
			 	]);
			 	**/
			 	var headField= new Array();
             	headField.push(rm);
             	headField.push(sm);
             	headField.push({header:'编号',dataIndex:'quo_id',sortable : true,hidden:true,width:100});                                                                                            
             	headField.push({header:'采购单名称',dataIndex:'quo_name',sortable : true,width:100});                                                                                                
             	headField.push({header:'物品名称',dataIndex : 'rsrv_str4',sortable : true,width:200});                                                                                               
             	headField.push({header:'销售客户名',dataIndex : 'rsrv_str3',sortable : true,width:200});                                                                                             
             	headField.push({header:'交货地点',dataIndex : 'give_addr',sortable : true,width:200});                                                                                               
             	var cm = new Ext.grid.ColumnModel(headField);
			 	//一页显示多少条
			 	var pageSize=10;
			 	
			 	//工具条[按用户自已的需要进行扩展]
			 	
			 	var toolsBar=new Array();
			 	toolsBar.push({text: '查看详细',iconCls:'details',handler : function(){
			 		 window.open ("customerList.jsp");
			 	}});
			 	toolsBar.push({text: '修改采购单',iconCls:'add',handler : function(){alert('修改用户')}});
			 	toolsBar.push({text: '删除采购单',iconCls:'remove',handler : function(){
			 		alert(11);
			        var record = this.grid.GridPanel.prototype.getSelectionModel().getSelected();// 返回值为 Record 类型
			       
					if(!record)
					{
							alert("XSaaS 提示!"+"请先选择要删除的采购单!");
							return;
					}
					else
					{
    					var quo_id=record.get('quo_id');
    					if(window.confirm('确定要删除此采购单？')){
    					  document.relationForm.action="/doTradeReg.do?quo_id="+quo_id+"&trade_type_code=0855";
    					  document.relationForm.submit();
					}
					}
			    }});
			 	//开始调用方法
			 	CreateGridPanal(toolsBar,cm,sm,div_show,title,dds,gridWidth,pageSize);
				}
				