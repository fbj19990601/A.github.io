var grid_con = null;
function createContactGrid(){
	var sm = null;
	var cm = null;
	var ds = null;
	var data = null;
	var isReady = false;
	if(!grid_con){
    sm = new Ext.grid.CheckboxSelectionModel();
    cm = new Ext.grid.ColumnModel([
        new Ext.grid.RowNumberer(),
         sm,
        {header:'���',dataIndex:'id',width: 100,hidden:true},
        {header:'��ϵ������',dataIndex:'name',width: 150},
        {header:'�ʼ���ַ',dataIndex:'email',width: 150},
        {header:'��ϵ�绰',dataIndex:'phone',width: 100},
        {header:'��ϵ��ַ',dataIndex:'addr',width: 150}
    ]);
    cm.defaultSortable = true;
    ds = new Ext.data.Store({
        proxy: new Ext.data.HttpProxy({url:'conStore.jsp'}),
        reader: new Ext.data.JsonReader({
            root: 'root',
            totalProperty: 'totalCount'
         }, [
            {name: 'id'},
            {name: 'name'},
            {name: 'email'},
            {name: 'phone'},
            {name: 'addr'}
        ])
    });
	
    ds.load({params:{start:0, limit:10}});

    grid_con = new Ext.grid.GridPanel({
        el: 'grid4',
        ds: ds,
        cm: cm,
        stripeRows: true,
		frame:false,
        sm: sm,
        tbar: new Ext.PagingToolbar({
            pageSize: 10,
            store: ds,
            displayInfo: true,
            displayMsg: '��ʾ�� {0} ���� {1} ����¼��һ�� {2} ��',
            emptyMsg: "û�м�¼"
        }),
        bbar: new Ext.PagingToolbar({
            pageSize: 10,
            store: ds,
            displayInfo: true,
            displayMsg: '��ʾ�� {0} ���� {1} ����¼��һ�� {2} ��',
            emptyMsg: "û�м�¼"
        }),
       
        autoHeight:true,
        width:600
    });
    grid_con.render();
    grid_con.getSelectionModel().selectFirstRow();
    isReady = true;
	}else{
		grid_con.show();
	}
}



///
function showContactWind(){
///////////
	//document.getElementById("bnt").disabled=true;
  createContactGrid();
  var contactWind;
  if(!contactWind){
        contactWind=new Ext.Window({
        title:'��ϵ���б�',
        width:610,
        modal:true,
        autoHeight:true,
        maximizable :true,
        minimizable :true,
        iconCls :'user-Img',
		items: grid_con,
		 buttons:[
		 { 
		   text:'�ύ',
           disabled:false,
           handler:function(){
			var record = grid_con.getSelectionModel().getSelected();// ����ֵΪ Record ����
			if(!record){
				Ext.MessageBox.alert("��ʾ","����ѡ����ϵ��!");
				return;
			}
			// �����Ի��򾯸�
			if(record) {
			 document.getElementById("contact_man").value=record.get("name");
			 contactWind.hide();
			}
           }
         },
         {
         	text:'ȡ��',
         	handler: function(){
            contactWind.hide();
            grid_con.hide();
           }
         }
		 ]   
	    });
	      contactWind.show();
        }else{
	      contactWind.show();
 }
///////////
}


