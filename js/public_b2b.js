
/** **************************************************************
 * 
 *  ����javascript����ΪB2Bƽ̨���õ��Ĺ��÷���
 *  �û������ڱ��ļ��мӲ��Լ��ķ���
 *  
 * ****************************************************************/
/**
 * ɾ�����пո�
 */
function delAllSpace(str) {
	return str.replace(/^\s+|\s+$/g, "")
}
/**
 * ɾ����ߴ���
 */
function delLeftSpace(str) {
	return str.replace(/^\s+/g, "")
}
/**
 * ɾ���ұ߿ո�
 */
function delRightSpace(str) {
	return str.replace(/\s+$/g, "")
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

//���ó�����Ϣ
function setXcityInfo(prov_id) {
	if (prov_id != "0") {
		AreaInfo.getAreaByParent(prov_id, function(data) {
			DWRUtil.removeAllOptions("x_city");
			DWRUtil.addOptions("x_city", fectureArray);
			DWRUtil.addOptions("x_city", data);
		});
	} else {
		DWRUtil.removeAllOptions("x_city");
		var fectureArray = new Array();
		fectureArray = ['��ѡ��..'];
		DWRUtil.addOptions("x_city", fectureArray);
	}
}