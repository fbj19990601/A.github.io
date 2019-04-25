Ext.onReady(function() {

	var sm = new Ext.grid.CheckboxSelectionModel();
	
	function changetype(type){
		if(type=="0"){
			type="�˻�";
		}else{
			type="����";
		}
		return type;
	}
	
	function updateRecord(){
             var record = grid.getSelectionModel().getSelected();// ����ֵΪ Record ����
                
                if(!record){
					Ext.Msg.alert("��ʾ","����ѡ��Ҫ�޸ĵļ�¼!");
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
		header : "���",
		dataIndex : "form_id",
		hidden : true
	},
    {
		header : "���",
		dataIndex : "sale_quo_id",
		hidden : true
	},
	{
		header : "���",
		dataIndex : "id",
		hidden : true
	},
	{
		header : "��/�������뵥����",
		dataIndex : "quo_name",
		sortable : true,
		width:150
	},

	{
		header : "��/��������",
		dataIndex : "back_type",
		renderer: changetype,
		sortable : true,
		width:100
	},
	{
	    header : "��������",
		dataIndex : "give_date",
		sortable : true,
		width:100
	},
    {
	    header : "������ַ",
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
		
		title:"��/�������뵥�б�",
		sm:sm,
        clicksToEdit:1,
        selModel: new Ext.grid.RowSelectionModel({singleSelect:false}),
		tbar:[
		{
            text: '�޸�',
			iconCls:'edit',
			 
            handler : updateRecord
        },
		
		{
            text: 'ɾ��',
			iconCls:'remove',
            handler : function(){
                var record = grid.getSelectionModel().getSelected();// ����ֵΪ Record ����
                
                if(!record){
					Ext.Msg.alert("��ʾ","����ѡ��Ҫɾ���ļ�¼!");
					return;
				}
			
				// �����Ի��򾯸�
				if(record) {
					Ext.MessageBox.confirm('ȷ��ɾ��', 
		    	    	'ȷ��Ҫɾ����ѡ�еļ�¼��?', 
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

			displayMsg : '��ʾ{0}��{1}����¼���ܹ�{2}����¼',

			emptyMsg : 'û�м�¼'

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
