var grid = null;
function createGrid(){
	var sm = null;
	var cm = null;
	var ds = null;
	var data = null;
	var isReady = false;
	if(!grid){
    sm = new Ext.grid.CheckboxSelectionModel();
    cm = new Ext.grid.ColumnModel([
        new Ext.grid.RowNumberer(),
         sm,
        {header:'���',dataIndex:'id',width: 100,hidden:true},
        {header:'�ͻ�����',dataIndex:'name',width: 150},
        {header:'�ʼ���ַ',dataIndex:'email',width: 150},
        {header:'��ϵ�绰',dataIndex:'phone',width: 100},
        {header:'��������',dataIndex:'date',width: 100}
    ]);
    cm.defaultSortable = true;
    ds = new Ext.data.Store({
        proxy: new Ext.data.HttpProxy({url:'/salesFormMgr/custStore.jsp'}),
        reader: new Ext.data.JsonReader({
            root: 'root',
            totalProperty: 'totalCount'
         }, [
            {name: 'id'},
            {name: 'name'},
            {name: 'email'},
            {name: 'phone'},
            {name: 'date'}
        ])
    });
	
    ds.load({params:{start:0, limit:10}});

    grid = new Ext.grid.GridPanel({
        el: 'grid3',
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
        autoWidth:true//510
    });
    grid.render();
    grid.getSelectionModel().selectFirstRow();
    isReady = true;
	}else{
		grid.show();
	}
}



///
function showWindow(){
///////////
	//document.getElementById("bnt").disabled=true;
  createGrid();
  var scoketNewsWin;
  if(!scoketNewsWin){
        scoketNewsWin=new Ext.Window({
        title:'���ۿͻ��б�',
        width:530,
        modal:true,
        autoHeight:true,
        maximizable :true,
        minimizable :true,
        iconCls :'user-Img',
		items: grid,
		 buttons:[
		 { 
		   text:'�ύ',
           disabled:false,
           handler:function(){
			var record = grid.getSelectionModel().getSelected();// ����ֵΪ Record ����
			if(!record){
				Ext.MessageBox.alert("��ʾ","����ѡ�����ۿͻ�!");
				return;
			}
			// �����Ի��򾯸�
			if(record) {
			 document.getElementById("obj_cust_name").value=record.get("name");
			 document.getElementById("obj_cust_id").value=record.get("id");
			 scoketNewsWin.hide();
			}
           }
         },
         {
         	text:'ȡ��',
         	handler: function(){
            scoketNewsWin.hide();
            grid.hide();
           }
         }
		 ]   
	    });
	      scoketNewsWin.show();
        }else{
	      scoketNewsWin.show();
 }
///////////
}


