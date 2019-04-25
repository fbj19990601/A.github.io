	Ext.onReady(function(){
	
	function toggleDetails(btn, pressed){
	   var view = grid.getView();
	   view.showPreview = pressed;
	   view.refresh();
	}
	
	var ds= new Ext.data.Store({
		proxy: new Ext.data.ScriptTagProxy({url:'JsonData.jsp'}),
		reader: new Ext.data.JsonReader({totalProperty:'totalProperty', root:'root'},
		[{name: 'id'},{name: 'name'},{name: 'phone'}])
	});
	
	var cbsm=new Ext.grid.CheckboxSelectionModel();
	var cm=new Ext.grid.ColumnModel(
	  [ new Ext.grid.RowNumberer(),
	    cbsm,
	   {header: '选择', dataIndex: 'id', sortable: true},
	   {header: '姓名', dataIndex: 'name',sortable: true},
	   {header: '电话', dataIndex: 'phone',sortable: true}
	  ]
	);
	var grid=new Ext.grid.GridPanel({
	    el:'grid-div',
	    ds:ds,
	    cm:cm,
	    sm:cbsm,
		width:400,
		autoHeight:true,
		title:'员工姓名列表',		
		bbar: new Ext.PagingToolbar({
				pageSize: 4,
				store: ds,
				displayInfo: true,
				displayMsg: '当前显示 {0} - {1} 条  共 {2}',
				emptyMsg: "没有数据"
			})
	});
	  grid.render();
	  ds.load({params:{start:0,limited:9}});
	});