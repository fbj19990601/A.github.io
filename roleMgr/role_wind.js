

Ext.onReady(function(){
    var win;
    Ext.QuickTips.init();
    Ext.form.Field.prototype.msgTarget = 'side';
    var button = Ext.get('show-btn');
    button.on('click', function(){
        if(!win){
        	var data = Math.round(Math.random() * 10000);
            win = new Ext.Window({
                el:'role_div',
                layout:'fit',
                width:370,
                autoScroll:true,
                title:'�鿴�з���Ľ�ɫ',
                maximizable :true,
                height:210,
                frame:true,
                closeAction:'hide',
                footer:true, 
                plain: true,
                monitorResize:true,
                autoHeight:false,
                items:[{
					autoLoad:{url:'roles.jsp?data='+data,params:'number=10&data='+data}
				}],
		        buttons: [{
		            text: '�ر�',
		            handler:function(){
						 win.hide();
					}
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
});