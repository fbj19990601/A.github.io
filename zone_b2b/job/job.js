
// ���ó�����Ϣ
function setCityInfo(prov_id) {
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

// ���ؼ���
function checkKey_Word() {
	var job_key = $F("job_key");
	job_key = delAllSpace(job_key);
	if (job_key == "" || job_key == null) {
		$("job_key").value = "������ؼ���";
	}
}

// ��ʼ����
function searchJob() {
	var province = DWRUtil.getText('prov_1');
	if (province == 'ʡ����Ϣ') {
		province = "";
	}
	var city = DWRUtil.getText('city_l');
	if (city == '������Ϣ..') {
		city = "";
	}
	var pub_job = DWRUtil.getValue('pub_job');
	var pub_date = $F('pub_date');
	var job_key = $F("job_key");
	if (job_key == '������ؼ���') {
		alert('������ؼ���');
		$('job_key').focus();
		return false;
	}
	window.open('/zone_b2b/job/searchjobList.jsp?job_key='+job_key+'&pro='+province+'&city_1='+city+'&pub_job='+pub_job+'&pub_date='+pub_date);

}

/**
 * ɾ�����пո�
 */
function delAllSpace(str) {
	return str.replace(/^\s+|\s+$/g, "")
}