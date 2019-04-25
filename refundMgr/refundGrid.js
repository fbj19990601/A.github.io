Ext.onReady(function() {

	var sm = new Ext.grid.CheckboxSelectionModel();
	
	function changetype(type){
		if(type=="0"){
			type="退货";
		}else{
			type="换货";
		}
		return type;
	}
	
	function updateRecord(){
             var record = grid.getSelectionModel().getSelected();// 返回值为 Record 类型
                
                if(!record){
					Ext.Msg.alert("提示","请先选择要修改的记录!");
					return;
				}else{
		    	      var form_id=record.get("form_id");
		    	      var quo_id=record.get("id");
		    	      var sale_quo_id=record.get("sale_quo_id");
		    	      document.getElementById("form_id").value=form_id;
		    	      document.getElementById("quo_id").value=quo_id;
		    	      document.getElementById("sale_quo_id").value=sale_quo_id;
		    	      document.re_form.action="editIndex.jsp";
		    	      document.re_form.submit();
				}
    }
	
	var cm = new Ext.grid.ColumnModel([
	
	new Ext.grid.RowNumberer(),
	sm,
	{
		header : "编号",
		dataIndex : "form_id",
		hidden : true
	},
    {
		header : "编号",
		dataIndex : "sale_quo_id",
		hidden : true
	},
	{
		header : "编号",
		dataIndex : "id",
		hidden : true
	},
	{
		header : "退/换货申请单名称",
		dataIndex : "quo_name",
		sortable : true,
		width:150
	},

	{
		header : "退/换货类型",
		dataIndex : "back_type",
		renderer: changetype,
		sortable : true,
		width:100
	},
	{
	    header : "交货日期",
		dataIndex : "give_date",
		sortable : true,
		width:100
	},
    {
	    header : "交货地址",
		dataIndex : "give_addr",
		sortable : true,
		width:250
	}
 ]);
	
	var dds = new Ext.data.Store({

		proxy : new Ext.data.HttpProxy({
			url : 'refundTotal.jsp'
		}),

		reader : new Ext.data.JsonReader({
			totalProperty : 'total',
			root : 'root'

		}, [
			{
				name : "form_id"
			},
			{
				name : "sale_quo_id"
			},
			{
				name : "id"
			},
			{
				name : "quo_name"
			},
			{
				name : "back_type"
			},
			{
				name : "give_date"
			},
			{
				name : "give_addr"
			}
		])

	});

	var grid = new Ext.grid.GridPanel({

		el : "refund-div",

		ds : dds,

		cm : cm,
		
		width:700,
		
		autoHeight:true,
		
		frame:true,
		
		title:"退/换货申请单列表",
		sm:sm,
        clicksToEdit:1,
        selModel: new Ext.grid.RowSelectionModel({singleSelect:false}),
		tbar:[
		{
            text: '修改',
			iconCls:'edit',
			 
            handler : updateRecord
        },
		
		{
            text: '删除',
			iconCls:'remove',
            handler : function(){
                var record = grid.getSelectionModel().getSelected();// 返回值为 Record 类型
                
                if(!record){
					Ext.Msg.alert("提示","请先选择要删除的记录!");
					return;
				}
			
				// 弹出对话框警告
				if(record) {
					Ext.MessageBox.confirm('确认删除', 
		    	    	'确定要删除所选中的记录吗?', 
		    	    	function(btn) {
			    	     if(btn == 'yes') {
			    	      var form_id=record.get("form_id");
			    	      var quo_id=record.get("id");
			    	      var sale_quo_id=record.get("sale_quo_id");
			    	      document.getElementById("form_id").value=form_id;
			    	      document.getElementById("quo_id").value=quo_id;
			    	      document.getElementById("sale_quo_id").value=sale_quo_id;
			    	      document.re_form.action="/doTradeReg.do";
			    	      document.re_form.submit();
			    	     }
						}
					);
				}
				
            }
        }
		],
		
		bbar : new Ext.PagingToolbar({

			pageSize : 10,

			store : dds,

			displayInfo : true,

			displayMsg : '显示{0}到{1}条记录，总共{2}条记录',

			emptyMsg : '没有记录'

		})

	});

	grid.render();

	dds.load({
		params : {
			start : 0,
			limit : 10
		}
	});
	
});
