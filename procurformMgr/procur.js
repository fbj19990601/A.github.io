Ext.onReady(function(){
     initProcur();
  });
				function initProcur(){
				//����Դ
			 	var data_url='J_data.jsp';
			 	
			 	 Ext.QuickTips.init();   
			 	//��ʾλ��
			 	var div_show="grid";
			 	
			 	//�б����
			 	var title='�ɹ����б�';
			 	
			 	//�ֶ�[***************************************************************]
			 	//���ֶ������ͷ����ֵ��������Ӧ
			 	var fields=new Array({name : 'quo_id'},{name : 'quo_name'},{name : 'rsrv_str4'},{name : 'rsrv_str3'},{name : 'give_addr'});
			 	
			 	//����Դ[���ʽ�̶�����]
			 	var dds=new Ext.data.Store({proxy : new Ext.data.HttpProxy({url : data_url}),reader : new Ext.data.JsonReader({totalProperty : 'totalCount',root : 'root',fields:fields })});
				//�б���
				var gridWidth=740;
				
				//�Ƿ���ʾ�к�
				var rm=new Ext.grid.RowNumberer();
				//�Ƿ��и�ѡ��
			 	var sm=new Ext.grid.CheckboxSelectionModel();
			 	
			 	//��ͷ,�ж����У���д����У����Լ�����Ҫ����id�Ȳ�Ҫ��ʾ��������Ҫ�õ���ֵ�����Խ�[hidden:true]
			 	/**
			 	var cm = new Ext.grid.ColumnModel([
			 	rm,sm,
			 	{header:'���',dataIndex:'quo_id',sortable : true,hidden:true,width:100},
			 	{header:'�ɹ�������',dataIndex:'quo_name',sortable : true,width:100},
			 	{header:'��Ʒ����',dataIndex : 'rsrv_str4',sortable : true,width:200},
			 	{header:'���ۿͻ���',dataIndex : 'rsrv_str3',sortable : true,width:200},
			 	{header:'�����ص�',dataIndex : 'give_addr',sortable : true,width:200}
			 	]);
			 	**/
			 	var headField= new Array();
             	headField.push(rm);
             	headField.push(sm);
             	headField.push({header:'���',dataIndex:'quo_id',sortable : true,hidden:true,width:100});                                                                                            
             	headField.push({header:'�ɹ�������',dataIndex:'quo_name',sortable : true,width:100});                                                                                                
             	headField.push({header:'��Ʒ����',dataIndex : 'rsrv_str4',sortable : true,width:200});                                                                                               
             	headField.push({header:'���ۿͻ���',dataIndex : 'rsrv_str3',sortable : true,width:200});                                                                                             
             	headField.push({header:'�����ص�',dataIndex : 'give_addr',sortable : true,width:200});                                                                                               
             	var cm = new Ext.grid.ColumnModel(headField);
			 	//һҳ��ʾ������
			 	var pageSize=10;
			 	
			 	//������[���û����ѵ���Ҫ������չ]
			 	
			 	var toolsBar=new Array();
			 	toolsBar.push({text: '�鿴��ϸ',iconCls:'details',handler : function(){
			 		 window.open ("customerList.jsp");
			 	}});
			 	toolsBar.push({text: '�޸Ĳɹ���',iconCls:'add',handler : function(){alert('�޸��û�')}});
			 	toolsBar.push({text: 'ɾ���ɹ���',iconCls:'remove',handler : function(){
			 		alert(11);
			        var record = this.grid.GridPanel.prototype.getSelectionModel().getSelected();// ����ֵΪ Record ����
			       
					if(!record)
					{
							alert("XSaaS ��ʾ!"+"����ѡ��Ҫɾ���Ĳɹ���!");
							return;
					}
					else
					{
    					var quo_id=record.get('quo_id');
    					if(window.confirm('ȷ��Ҫɾ���˲ɹ�����')){
    					  document.relationForm.action="/doTradeReg.do?quo_id="+quo_id+"&trade_type_code=0855";
    					  document.relationForm.submit();
					}
					}
			    }});
			 	//��ʼ���÷���
			 	CreateGridPanal(toolsBar,cm,sm,div_show,title,dds,gridWidth,pageSize);
				}
				