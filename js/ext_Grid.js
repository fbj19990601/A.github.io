
/**************************************************************************/
/**************��Ext�����б�ҳ��ķ���**************************************/
/**************************************************************************/
//��ʼ��Ext�б���Ϣ:gridInitalize����Ϊʵ��
 //����ʱ������д��,
 
 //Ext.onReady(function(){uerSelfFunction();});

//������Ա�ɰ��Լ���������к������չ,
 function uerSelfFunction(){
 	//����Դ
 	var data_url='J_data.jsp';
 	
 	//��ʾλ��
 	var div_show="grid";
 	
 	//�б����
 	var title="�����";
 	
 	//�ֶ�[***************************************************************]
 	//���ֶ������ͷ����ֵ��������Ӧ
 	var fields=new Array({name : 'id'},{name : 'name'},{name : 'descn'});
 	
 	//����Դ[���ʽ�̶�����]
 	var dds=new Ext.data.Store({proxy : new Ext.data.HttpProxy({url : data_url}),reader : new Ext.data.JsonReader({totalProperty : 'totalCount',root : 'root',fields:fields })
	
	});
	//�б���
	var gridWidth=450;
	
	//�Ƿ���ʾ�к�
	var rm=new Ext.grid.RowNumberer();
	//�Ƿ��и�ѡ��
 	var sm=new Ext.grid.CheckboxSelectionModel();
 	
 	//��ͷ,�ж����У���д����У����Լ�����Ҫ����id�Ȳ�Ҫ��ʾ��������Ҫ�õ���ֵ�����Խ�[hidden:true]
 	//
 	var headField= new Array();
 	headField.push(rm);
 	headField.push({header : '���',dataIndex:'id',sortable : true,hidden:false,hideable:true,width:100});
 	headField.push({header : '����',dataIndex : 'name',sortable : true,width:150});
 	headField.push({header : '����',dataIndex : 'descn',sortable : true,width:200});
 	var cm = new Ext.grid.ColumnModel(headField);
 	
 	//һҳ��ʾ������
 	var pageSize=10;
 	
 	//������[���û����ѵ���Ҫ������չ]
 	
 	var toolsBar;
 	//=new Array();
 	//toolsBar.push({text: '�鿴�û�',iconCls:'details',handler : function(){alert('�鿴�û�')}});
 	//toolsBar.push({text: '�޸��û�',iconCls:'add',handler : function(){alert('�޸��û�')}});
 	//toolsBar.push({text: 'ɾ���û�',iconCls:'remove',handler : function(){alert('ɾ���û�')}});
 	
 	//��ʼ���÷���
 	CreateGridPanal(toolsBar,cm,sm,div_show,title,dds,gridWidth,pageSize);
 }

var grid;
//�����б��÷���
function CreateGridPanal(toolsBar,cm,sm,div_show,title_msg,dds,gridWidth,pageSize) {
	
	 grid = new Ext.grid.GridPanel({
		el : div_show,
		ds : dds,
		cm : cm,
		autoWidth:true,
		autoHeight:true,
		frame:true,
		title:title_msg,
		sm:sm,
        clicksToEdit:1,
        selModel: new Ext.grid.RowSelectionModel({singleSelect:false}),
		tbar:toolsBar,
		
		bbar : new Ext.PagingToolbar({
			pageSize : pageSize,
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
}
