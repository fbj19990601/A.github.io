/*
 * Ext JS Library 2.0.2
 * Copyright(c) 2006-2008, Ext JS, LLC.
 * licensing@extjs.com
 * 
 * http://extjs.com/license
 */

function showWindow() {
	 Ext.QuickTips.init(); 
	 Ext.form.Field.prototype.msgTarget = 'side';
	 var window;
	 var form;
	 if(!window){
	 	form = new Ext.form.FormPanel({
	        baseCls: 'x-plain',
	        labelWidth: 55,
			height:200,
			autoHeight:true,
	        url:'save-form.php',
	        defaultType: 'textfield',
	
	        items: [{
	            fieldLabel: '��ַ',
	            name: 'to',
				allowBlank:false,
				blankText:'�������ַ��',
	            anchor:'50%'  
	        },{
	            fieldLabel: '����',
	            name: 'subject',
				allowBlank:false,
				blankText:'��������⣡',
	            anchor: '80%'  
	        }, {
				fieldLabel: '����',
	            xtype: 'textarea',
	            hideLabel: false,
				allowBlank:false,
				blankText:'���������ݣ�',
	            name: 'msg',
				autoHeight:false,
				maxLength:50,
	            anchor: '100%'  
	        },{
			xtype:'fieldset',
            title: 'Phone Number',
            collapsible: true,
            autoHeight:true,
            defaults: {width: 210},
            defaultType: 'textfield',
            items :[{
                    fieldLabel: 'Home',
                    name: 'home',
                    value: '(888) 555-1212'
                },{
                    fieldLabel: 'Business',
                    name: 'business'
                },{
                    fieldLabel: 'Mobile',
                    name: 'mobile'
                },{
                    fieldLabel: 'Fax',
                    name: 'fax'
                }
            ]
         }
			]
       });
	var comboxWithPanel = new Ext.form.ComboBox({   
	    store:new Ext.data.SimpleStore({fields:[],data:[[]]}),   
	    editable:false,   
	    mode: 'local',   
	    triggerAction:'all',   
	    maxHeight: 200,   
	    tpl: '<div style="height:200px"><div id="panel"></div></div>',   
	    selectedClass:'',   
	    onSelect:Ext.emptyFn   
	});   
	comboxWithPanel.render('comboxWithPanel');   
	var tree2 = new Ext.tree.TreePanel({   
	    loader: new Ext.tree.DWRTreeLoader({dwrCall:Tmplt.getTmpltTree}),   
	    border:false,   
	    autoScroll:true,   
	    root:new Ext.tree.AsyncTreeNode({text: 'ģ���Ŀ¼',id:'0'})   
	    });   
	var border = new Ext.Panel({   
	    title:'���title',   
	    layout:'fit',   
	    border:false,   
	    height :200,   
	    tbar:[{text:'ȷ��һ'},'-',new Ext.form.TextField({id: 'paramCnName',width:60}),{text:'����һ'}],   
	    bbar:[{text:'ȷ����'},'-',new Ext.form.TextField({id: 'aa',width:60}),{text:'���Ҷ�'}],   
	    items: tree2   
	    });   
	comboxWithPanel.on('expand',function(){   
	    border.render('panel');   
	    });  

	     window = new Ext.Window({
	        title: '��ṫ��',
	        width: 500,
			iconCls:'root-Img',
	        autoHeight:true,
	        minWidth: 300,
	        minHeight: 200,
	        layout: 'fit',
	        plain:true,
	        bodyStyle:'padding:5px;',
	        buttonAlign:'center',
	        items: form,
	        buttons: [{
	            text: '����',
				handler:saveInfo
	        },{
	            text: '�ر�',
				handler:closeWind
	        }]
	    });
		window.show();
	}else{
		window.show();
	}
	function closeWind(){
		window.hide();
	}
	function saveInfo(){
		var addr=form.form.getValues().to;
		var title=form.form.getValues().subject;
		var content=form.form.getValues().msg;
		Ext.MessageBox.alert('saas',addr+"  "+title+"  "+content);	
	}
}