
// 设置城市信息
function setCityInfo(prov_id) {
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

// 检测关键字
function checkKey_Word() {
	var job_key = $F("job_key");
	job_key = delAllSpace(job_key);
	if (job_key == "" || job_key == null) {
		$("job_key").value = "请输入关键字";
	}
}

// 开始搜索
function searchJob() {
	var province = DWRUtil.getText('prov_1');
	if (province == '省份信息') {
		province = "";
	}
	var city = DWRUtil.getText('city_l');
	if (city == '地市信息..') {
		city = "";
	}
	var pub_job = DWRUtil.getValue('pub_job');
	var pub_date = $F('pub_date');
	var job_key = $F("job_key");
	if (job_key == '请输入关键字') {
		alert('请输入关键字');
		$('job_key').focus();
		return false;
	}
	window.open('/zone_b2b/job/searchjobList.jsp?job_key='+job_key+'&pro='+province+'&city_1='+city+'&pub_job='+pub_job+'&pub_date='+pub_date);

}

/**
 * 删除所有空格
 */
function delAllSpace(str) {
	return str.replace(/^\s+|\s+$/g, "")
}