
// ���ؼ���
function set_entKey() {
	var ent_name = $F('ent_name');
	ent_name = delAllSpace(ent_name);
	if (ent_name == "" || ent_name == null) {
		$('ent_name').value = '��������ҵ����';
	}
}

// �����ؼ���
function searchEnterprise() {
	var cust_name = $F('ent_name');
	cust_name = delAllSpace(cust_name);
	if (cust_name == '' || cust_name == null) {
		alert('��������ҵ����');
		return false;
	} else if (cust_name == '��������ҵ����') {
		alert('��������ҵ����');
		return false;
	}
	var province = DWRUtil.getValue('prov_1');
	var eparchy_code = DWRUtil.getValue('city_l');
	var part = DWRUtil.getValue('part');
	if (province == 'ȫʡ��Ϣ') {
		province = '';
	}
	if (eparchy_code == '������Ϣ..') {
		eparchy_code = '';
	}
	window.open("/zone_b2b/searchEnterprise.jsp?enterprise=1&province="+province+"&city="+eparchy_code+"&cust_name="+cust_name+"&group="+part);
}
// ���ó�����Ϣ
function setCityInfo_left(prov_id) {
	if (prov_id != "0") {
		AreaInfo.getAreaByParent(prov_id, function(data) {
			DWRUtil.removeAllOptions("city_l");
			var fectureArray = new Array();
			fectureArray = ['������Ϣ..'];
			DWRUtil.addOptions("city_l", fectureArray);
			DWRUtil.addOptions("city_l", data);
		});
	} else {
		DWRUtil.removeAllOptions("city_l");
		var fectureArray = new Array();
		fectureArray = ['������Ϣ..'];
		DWRUtil.addOptions("city_l", fectureArray);
	}
}

// ɾ�����пո�
function delAllSpace(str) {
	return str.replace(/^\s+|\s+$/g, "")
}