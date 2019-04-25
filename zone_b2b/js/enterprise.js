
// 检测关键字
function set_entKey() {
	var ent_name = $F('ent_name');
	ent_name = delAllSpace(ent_name);
	if (ent_name == "" || ent_name == null) {
		$('ent_name').value = '请输入企业名称';
	}
}

// 搜索关键字
function searchEnterprise() {
	var cust_name = $F('ent_name');
	cust_name = delAllSpace(cust_name);
	if (cust_name == '' || cust_name == null) {
		alert('请输入企业名称');
		return false;
	} else if (cust_name == '请输入企业名称') {
		alert('请输入企业名称');
		return false;
	}
	var province = DWRUtil.getValue('prov_1');
	var eparchy_code = DWRUtil.getValue('city_l');
	var part = DWRUtil.getValue('part');
	if (province == '全省信息') {
		province = '';
	}
	if (eparchy_code == '地市信息..') {
		eparchy_code = '';
	}
	window.open("/zone_b2b/searchEnterprise.jsp?enterprise=1&province="+province+"&city="+eparchy_code+"&cust_name="+cust_name+"&group="+part);
}
// 设置城市信息
function setCityInfo_left(prov_id) {
	if (prov_id != "0") {
		AreaInfo.getAreaByParent(prov_id, function(data) {
			DWRUtil.removeAllOptions("city_l");
			var fectureArray = new Array();
			fectureArray = ['地市信息..'];
			DWRUtil.addOptions("city_l", fectureArray);
			DWRUtil.addOptions("city_l", data);
		});
	} else {
		DWRUtil.removeAllOptions("city_l");
		var fectureArray = new Array();
		fectureArray = ['地市信息..'];
		DWRUtil.addOptions("city_l", fectureArray);
	}
}

// 删除所有空格
function delAllSpace(str) {
	return str.replace(/^\s+|\s+$/g, "")
}