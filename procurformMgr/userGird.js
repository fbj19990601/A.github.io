var grid_user = null;
function createUserGird(){
	var sm = null;
	var cm = null;
	var ds = null;
	var data = null;
	var isReady = false;
	if(!grid_user){
    sm = new Ext.grid.CheckboxSelectionModel();
    cm = new Ext.grid.ColumnModel([
        new Ext.grid.RowNumberer(),
         sm,
        {header:'���',dataIndex:'id',width: 100,hidden:true},
        {header:'Ա������',dataIndex:'name',width: 150},
        {header:'�ʼ���ַ',dataIndex:'email',width: 150},
        {header:'��ϵ�绰',dataIndex:'phone',width: 100},
        {header:'��ϵ��ַ',dataIndex:'addr',width: 150}
    ]);
    cm.defaultSortable = true;
    ds = new Ext.data.Store({
        proxy: new Ext.data.HttpProxy({url:'userStore.jsp'}),
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

    grid_user = new Ext.grid.GridPanel({
        el: 'grid5',
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
    grid_user.render();
    grid_user.getSelectionModel().selectFirstRow();
    isReady = true;
	}else{
		grid_user.show();
	}
}



///
function showUserWind(){
///////////
	//document.getElementById("bnt").disabled=true;
  createUserGird();
  var userWind;
  if(!userWind){
        userWind=new Ext.Window({
        title:'Ա���б�',
        width:610,
        maximizable :true,
        minimizable :true,
        iconCls :'cust-Img',
        modal:true,
        plain:true,
        autoHeight:true,
		items: grid_user,
		 buttons:[
		 { 
		   text:'�ύ',
           disabled:false,
           handler:function(){
			var record = grid_user.getSelectionModel().getSelected();// ����ֵΪ Record ����
			if(!record){
				Ext.MessageBox.alert("��ʾ","����ѡ��Ա��!");
				return;
			}
			// �����Ի��򾯸�
			if(record) {
			 document.getElementById("sale_user_name").value=record.get("name");
			 document.getElementById("sale_user_id").value=record.get("id");
			 userWind.hide();
			 userWind.hide();
			}
           }
         },
         {
         	text:'ȡ��',
         	handler: function(){
            userWind.hide();
            grid_user.hide();
           }
         }
		 ]   
	    });
	      userWind.show();
        }else{
	      userWind.show();
 }
///////////
}


