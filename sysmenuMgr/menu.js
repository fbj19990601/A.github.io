
//δ����˵�
function sendTree(sub_code) {
	var data = Math.round(Math.random() * 10000);
	
}
//�ѷ���˵�
function refundTree(sub_code) {
	var data = Math.round(Math.random() * 10000);
	
}

function createTree(sub_code){
	$('sub_code').value=sub_code;
	setR_menu1(sub_code);
	setS_menu1(sub_code);
}

//����˵�
function senMenu(){
	var s_menu=$F('menu_id');
	if(s_menu=="" || s_menu==null)
	{
		alert("��ѡ��Ҫ����Ĳ˵���");
		return false;
	}
	$('trade_type_code').value='0905';
	return true;
}

//���ղ˵�
function removeMenu(){
	var r_menu=$F('menu_id');
	if(r_menu=="" || r_menu==null)
	{
		alert("��ѡ��Ҫ���յĲ˵���");
		return false;
	}
	$('trade_type_code').value='0907';
	if(window.confirm('ע�⣡���ղ˵�ʱ���Զ����������¼��˵����Ƿ����������')){
		return true;
	}else{
		return false;
	}
}

function setOper_menu(menu_id){
	$('menu_id').value=menu_id;
}
function setR_menu1(sub_code){
	var class_code=$F('class_code');
	 RightMenu.getRefundMenuMap(class_code,sub_code,function(data){
	 DWRUtil.removeAllOptions("r_menu1");
	 DWRUtil.addOptions("r_menu1",data);
	})
}
function setR_menu2(menu_id){
	var class_code=$F('class_code');
	setOper_menu(menu_id);
   var menu_class='1';
	 RightMenu.getMapMenByUpMenu(class_code,  menu_class, menu_id, true,function(data){
	 DWRUtil.removeAllOptions("r_menu2");
	 DWRUtil.addOptions("r_menu2",data);
	 $('r_menu2').style.display="block";
	})
}
function setR_menu3(menu_id){
	var class_code=$F('class_code');
    var menu_class='1';
    setOper_menu(menu_id);
	 RightMenu.getMapMenByUpMenu(class_code,menu_class, menu_id, true,function(data){
	 DWRUtil.removeAllOptions("r_menu3");
	 DWRUtil.addOptions("r_menu3",data);
	 $('r_menu3').style.display="block";
	})
}


function setS_menu1(sub_code){
	var class_code=$F('class_code');
	 RightMenu.getMenuForSend(class_code,sub_code,function(data){
	 DWRUtil.removeAllOptions("s_menu1");
	 DWRUtil.addOptions("s_menu1",data);
	})
}
function setS_menu2(menu_id){
	var class_code=$F('class_code');
    var menu_class='1';
    setOper_menu(menu_id);
	 RightMenu.getMapMenByUpMenu(class_code,menu_class, menu_id, false,function(data){
	 DWRUtil.removeAllOptions("s_menu2");
	 DWRUtil.addOptions("s_menu2",data);
	 $('s_menu2').style.display="block";
	})
}
function setS_menu3(menu_id){
	var class_code=$F('class_code');
    var menu_class='1';
    setOper_menu(menu_id);
	 RightMenu.getMapMenByUpMenu(class_code,menu_class, menu_id,false,function(data){
	 DWRUtil.removeAllOptions("s_menu3");
	 DWRUtil.addOptions("s_menu3",data);
	 $('s_menu3').style.display="block";
	})
}
