/**
 * ���ݼ��
 */
function checkValue() {
	if (window.confirm("ȷ��Ҫ�ύ��?")) {
	} else {
		return false;
	}
}
var fectureArray = new Array();
fectureArray = ['��ѡ��..'];
function setCitys(prov) {
	var provence = prov;
	AreaInfo.getAreaByParent(provence, function(data) {
		DWRUtil.removeAllOptions("eparchy_code");
		DWRUtil.addOptions("eparchy_code", fectureArray);
		DWRUtil.addOptions("eparchy_code", data);
	});
}
var type = "3";
// ����Ƿ�Ϊ�Ϸ�����
function isNum(str) {
	return (str.search(/^\d+(\.\d+)?$/) != -1);
}
// ���ö�������
function setSecondClass(val) {
	var up_class_id = val;
	$("rsrv_str1").value = "1";
	Productclass.getProductClassByUpId(up_class_id, type, setSort2);
}
function setSort2(map_data) {
	DWRUtil.removeAllOptions("sort2");
	DWRUtil.addOptions("sort2", map_data);
	$("sort3").style.display = "none";
	$("nextElement").style.display = "none";
	var item = $("sort2").length;
	if (item == 0) {
		$("sort2").style.display = "none";
	} else {
		$("sort2").style.display = "block";
	}
}
// ������������
function setTherdClass(val) {
	var up_class_id = val;
	$("rsrv_str1").value = "2";
	Productclass.getProductClassByUpId(up_class_id, type, setSort3);
}
function setSort3(map_data) {
	if (map_data != null) {
		DWRUtil.removeAllOptions("sort3");
		DWRUtil.addOptions("sort3", map_data);
		var item = $("sort3").length;
		if (item == 0) {
			$("sort3").style.display = "none";
			$("nextElement").style.display = "none";
		} else {
			$("sort3").style.display = "block";
		}
	}
}
function setTypeName(obj) {
	var idx = obj.value;
	$("class_id").value = idx;
}
// ��̬�����¼�������Ϣ
function cretateSelect(index, value) {
	$("nextElement").style.display = "block";
	$("rsrv_str1").value = "3";
	var divId = parseInt(index) + parseInt(1);
	$("index_s").value = index;
	$(index).innerHTML = "<select name=sort" + index + " id=sort" + index
			+ " onchange=cretateSelect(" + divId
			+ ",this.value) size=3 onclick=setTypeName(this) style=width:130px></select><div id="
			+ divId + "></div>";
	DWRUtil.removeAllOptions("sort" + index);
	Productclass.getProductClassByUpId(value, type, setNewSelect);
}
// �ص�����
function setNewSelect(map_data) {
	var id = $("index_s").value;
	DWRUtil.addOptions("sort" + id, map_data);
	var item = $("sort" + id).length;
	if (item == 0) {
		$(id).style.display = "none";
	} else {
		$(id).style.display = "block";
	}
}
