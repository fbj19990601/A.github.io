  Ext.onReady(function(){
     initRealtion();
  });
   function initRealtion(){
     Ext.QuickTips.init();   
     Ext.debug;
 	//����Դ
 	var data_url='rel_json.jsp';
 	
 	//��ʾλ��
 	var div_show="rel-div";
 	
 	//�б����
 	var title="�ͻ���ϵ�б�";
 	
 	//�ֶ�[***************************************************************]
 	//���ֶ������ͷ����ֵ��������Ӧ
 	var fields=new Array({name : 'obj_cust_id'},{name : 'cust_name'},{name : 'group_contact_phone'},{name : 'email'},{name:'start_date'});
 	
 	//����Դ[���ʽ�̶�����]
 	var dds=new Ext.data.Store({proxy : new Ext.data.HttpProxy({url : data_url}),reader : new Ext.data.JsonReader({totalProperty : 'totalCount',root : 'root',fields:fields })});
	//�б���
	var gridWidth=600;
	
	//�Ƿ���ʾ�к�
	var rm=new Ext.grid.RowNumberer();
	//�Ƿ��и�ѡ��
 	var sm=new Ext.grid.CheckboxSelectionModel();
 	
 	//��ͷ,�ж����У���д����У����Լ�����Ҫ����id�Ȳ�Ҫ��ʾ��������Ҫ�õ���ֵ�����Խ�[hidden:true]
 	//
 	var headField= new Array();
 	headField.push(rm);
 	headField.push(sm);
 	headField.push({header : '���',dataIndex:'obj_cust_id',sortable : true,hidden:true,width:100});
 	headField.push({header : '�ͻ�����',dataIndex : 'cust_name',sortable : true,width:150});
 	headField.push({header : '��ϵ�绰',dataIndex : 'group_contact_phone',sortable : true,width:100});
 	headField.push({header : '�ʼ���ַ',dataIndex : 'email',sortable : true,width:200});
 	headField.push({header : '��������',dataIndex : 'start_date',sortable : true,width:100});
 	var cm = new Ext.grid.ColumnModel(headField);
 	
 	//һҳ��ʾ������
 	var pageSize=20;
 	var toolsBar=new Array();
 	//toolsBar.push({text: '�鿴�û�',iconCls:'details',handler : function(){alert('�鿴�û�')}});
 	//toolsBar.push({text: '�޸��û�',iconCls:'add',handler : function(){alert('�޸��û�')}});
 	toolsBar.push({text: '�����ϵ',iconCls:'delCust',handler : function(){
        var record = grid.getSelectionModel().getSelected();// ����ֵΪ Record ����
		if(!record){
				alert("XSaaS ��ʾ!"+"����ѡ��Ҫ�����ϵ�Ŀͻ���¼!");
				return;
		}else{
			var obj_id=record.get('obj_cust_id');
			if(window.confirm('ȷ��Ҫ�����ϵ��')){
			  document.relationForm.action="/doTradeReg.do?obj_cust_id="+obj_id+"&trade_type_code=0815";
			  document.relationForm.submit();
			}
		}
    }});
 	
  //��ʼ���÷���
    CreateGridPanal(toolsBar,cm,sm,div_show,title,dds,gridWidth,pageSize);
    }