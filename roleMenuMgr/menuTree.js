
/***
 *���������װ
 *@B2B���ƽ̨
 */

//ѡ�����

function selectServer(sys_code){
	$("menu_id").value="0";
	var role_code=$F("role_code");
	if(sys_code==""){
		alert("��ѡ��������ƣ�");
		return;
	}
	if(role_code!="0"){
	    var data = Math.round(Math.random() * 10000);
	    var myAjax = new Ajax.Updater('send-tree', 
			'send_menu.jsp?sub_code=' + sys_code + "&code="+role_code+"&data=" + data,
			{
				method : 'get',
				evalScripts: true
			});
	}else{
			alert("��ѡ���ɫ���ƣ�");
	}
}

//δ����˵�
function creatTree(role_code) {
	$("menu_id").value="0";
	var sub_code=$F("sub_code");
	if(sub_code=="0"){
		alert("��ѡ��������ƣ�");
		return;
	}
	if(role_code!="0"){
	    var data = Math.round(Math.random() * 10000);
	    var myAjax = new Ajax.Updater('send-tree', 
			'send_menu.jsp?sub_code=' + sub_code + "&code="+role_code+"&data=" + data,
			{
				method : 'get',
				evalScripts: true
			});
	}else{
	  alert("��ѡ���ɫ����!");
	  return;
	}
}
/***
 * ��������
 */
function check_Value(){
	var sub_code=$F("sub_code");
	if(sub_code=="" || sub_code==null){
		alert("��ѡ��������ƣ�");
		return false;
	}
	var role_code=$F("role_code");
	if(role_code=="" || role_code==null){
		alert("��ѡ���ɫ���ƣ�");
		return false;
	}
	var start_date=$F("start_date");
	if(start_date=="" || start_date==null){
		alert("��ʼʱ�䲻��Ϊ�գ�");
		return false;
	}
	var end_date=$F("end_date");
	if(end_date=="" || end_date==null){
		alert("����ʱ�䲻��Ϊ�գ�");
		return false;
	}
	if(!checkDate(start_date, end_date)){
		return false;
	}
	var menu_id=$F("menu_id");
	if(menu_id=="0"){
		alert("��û�н����κβ���������Ҫ�ύ���ݣ�");
		return false;
	}
	return true;
}
/**
 * @startDay ��ʼʱ��
 * @endDay ����ʱ��
 * @�жϿ�ʼʱ���Ƿ�С�ڽ���ʱ��
 */
function checkDate(startDay, endDay) {
	var startD1 = startDay + "   " + "00:00";
	var endD1 = endDay + "   " + "23:59";
	var n1 = new Date(startD1.replace(/-/g, "/"));
	var n2 = new Date(endD1.replace(/-/g, "/"));
	var n = n2.getTime() - n1.getTime();
	if (startDay == "" || endDay == "") {
		alert("��ѡ�������Ŀ�ʼʱ�ͽ���ʱ��!");
		return false;
	}
	if (n <= 0) {
		alert("��ʼ���ڱ�����ڽ������ڣ�������ѡ��");
		return false;
	}
	return true;
}
 //ɾ�����пո�
 function delAllSpace(str) {
	return str.replace(/^\s+|\s+$/g, "")
 }
