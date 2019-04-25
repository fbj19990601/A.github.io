/*
 * Ext JS Library 2.1
 * Copyright(c) 2006-2008, Ext JS, LLC.
 * licensing@extjs.com
 * 
 * http://extjs.com/license
 */

Ext.onReady(function(){
    var win;
    Ext.QuickTips.init();
    Ext.form.Field.prototype.msgTarget = 'side';
    var button = Ext.get('show-btn');
    var form1 = new Ext.FormPanel({
        labelWidth: 75, // label settings here cascade unless overridden
        url:'/doTradeReg.do?trade_type_code=1160',
        frame:true,
        bodyStyle:'padding:5px 5px 0',
        width: 350,
        items: [{
            xtype:'fieldset',
            title: '����д�����Ϣ��',
            collapsible: true,
            autoHeight:true,
            defaults: {width: 210},
            defaultType: 'textfield',
            items :[{
                    fieldLabel: 'ϵͳ�ʺ�',
                    name: 'user_name',
                    allowBlank:false,
                    blankText:'����дϵͳ�ʺţ�'
                },{
                    fieldLabel: '�ͻ�����',
                    name: 'cust_name',
                    allowBlank:false,
                    blankText:'����д�ͻ����ƣ�'
                },{
                    fieldLabel: '��������',
                    allowBlank:false,
				    blankText:'�����������ַ��ϵͳ�����뷢�͵�������䣡',
                    name: 'email',
                    vtype:'email'
                }
            ]
        }]
    });
    button.on('click', function(){
        if(!win){
            win = new Ext.Window({
                el:'hello-win',
                layout:'fit',
                width:370,
                autoScroll:true,
                title:'�һ�����',
                maximizable :true,
                height:210,
                frame:true,
                closeAction:'hide',
                plain: true,
                items:form1,
		        buttons: [{
		            text: '�ύ',
		            handler:submitform
			        },{
			            text: 'ȡ��',
			            handler:function(){
			             win.hide();
			            }
			        }]
	            });
	        }
        win.show(this);
    });
    function submitform(){
    	var user_name=form1.form.getValues().user_name;
    	if(user_name =="" || user_name==null){
    	 Ext.MessageBox.alert("XSaaS ��ʾ","����дϵͳ�ʺţ�");
    	 form1.form.user_name.focus();
    	 return;
    	}
    	var cust_name=form1.form.getValues().cust_name;
    	if(cust_name =="" || cust_name==null){
    	 Ext.MessageBox.alert("XSaaS ��ʾ","����д�ͻ����ƣ�");
    	 return;
    	}
    	var email=form1.form.getValues().email;
    	if(email =="" || email==null){
    	 Ext.MessageBox.alert("XSaaS ��ʾ","����дע��ʱ�õ������ַ��ϵͳ����ȷ�������뷢�͵������䣡��");
    	 return;
    	}
    	form1.form.submit();
    }
});