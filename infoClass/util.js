/*******************************************************************************
 * 
 * ����javascript����ΪB2Bƽ̨���õ��Ĺ��÷��� ��������Ķ� 2008-07-29 XSAAS��
 ******************************************************************************/

/**
 * ����htmlԪ��
 */
function createNextClass(classObj) {
	// ��ǰ����ID
	var up_class_id = classObj.value;
	var id = classObj.name.substring(4);
	// ��������
	var class_type = $F("class_type");
	// ��ȡ��һ��Ԫ��
	var upNo = parseInt(parseInt(id) + 1);
	// �����ɵ�Ԫ��
	var newElem = "<select size='10' name='sort"
			+ upNo
			+ "' id='sort"
			+ upNo
			+ "' onChange='createNextClass(this);' onclick='setClassInfo(this)'></select>";
	// �����ɵ�Ԫ����/ID
	var obj = "sort" + upNo;
	Productclass.getProductClassByUpId(up_class_id, class_type, function(
			map_data) {
		DWRUtil.removeAllOptions("sort");
		DWRUtil.addOptions("sort", map_data);
		var size = $G("sort").options.length;
		if (size > 0) {
			if ($G(obj) == null) {
				$("b").append(newElem);
				DWRUtil.removeAllOptions(obj);
				DWRUtil.addOptions(obj, map_data);
				DWRUtil.removeAllOptions("sort");
			} else {
				DWRUtil.removeAllOptions(obj);
				DWRUtil.addOptions(obj, map_data);
			}
		}
	});
}

/**
 * ���÷�����Ϣ
 */
function setClassInfo(classObj) {
	var class_group_id = "000000000000000|";// ��������ϼ�����Ϊ15��0
	var class_group_name = "";
	var id = classObj.name.substring(4);
	$G("class_level").value = id;
	for (var i = 1; i <= id; i++) {
		var obj = "sort" + i;
		var class_id = $F(obj);
		var class_name = $M(obj);
		class_group_id = class_group_id + class_id + "|";
		class_group_name = class_group_name + class_name + "|";
	}
	$G("group_id").value = class_group_id;
	$G("group_name").value = class_group_name;
}
/**
 * ��ȡһ������
 */
function $G(id) {
	var obj = document.getElementById(id);
	if (obj != null) {
		return document.getElementById(id);
	} else {
		return null;
	}
}
/**
 * ��ȡһ�������ֵ
 */
function $F(id) {
	if ($G(id) != null) {
		return $G(id).value;
	} else {
		return "";
	}
}
/**
 * ��ȡһ�������б������ѡ�е�����
 */
function $M(id) {
	if ($G(id) != null) {
		return DWRUtil.getText(id);
	} else {
		return "";
	}
}
/**
 * ��ȡһ�����������
 */
function $N(id) {
	if ($G(id) != null) {
		return $G(id).name;
	} else {
		return "";
	}
}
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