//������Ϣ����
var type = "4";

function checkValue() {
	if (document.getElementById("title").value.replace(/\s*/g, "") == ""
			|| document.getElementById("title").value.replace(/\s*/g, "") == null) {
		alert("Procurement theme can not be empty!!!");
		document.getElementById("title").focus();
		return false;
	}
	if (document.classForm.sort1.value == "") {
		alert("Please select the procurement request!");
		document.classForm.sort1.focus();
		return false;
	}
	var str = content.getText();
	str = str.replace(/\s*/g, "");
	if (str == "") {
		alert("That can not be empty!");
		return false;
	}

	if (document.classForm.start_date.value.replace(/\s*/g, "") == "") {
		alert("Effective start time can not be empty!");
		document.classForm.start_date.focus();
		return false;
	}
	if (document.classForm.end_date.value.replace(/\s*/g, "") == "") {
		alert("Effective cut-off time can not be empty!");
		document.classForm.end_date.focus();
		return false;
	}

	if (document.classForm.stock_addr.value.replace(/\s*/g, "") == "") {
		alert("Procurement region can not be empty!");
		document.classForm.stock_addr.focus();
		return false;
	}
	var objName = document.getElementById("count").value;
	var start = 4, end = objName.length;
	var objLeng = objName.substring(start, end);
	var name_grp = "", id_grp = "";
	for (var i = 1; i <= objLeng; i++) {
		var obj = "sort" + i;
		name_grp = name_grp + DWRUtil.getText(obj) + "|";
		id_grp = id_grp + DWRUtil.getValue(obj) + "|";
	}
	document.getElementById("class_name_grp").value = name_grp;
	document.getElementById("class_id_grp").value = id_grp;
	// ////////////////�ж�ʱ���Ƿ����////////////////
	if (!checkDate(document.classForm.start_date.value,
			document.classForm.end_date.value)) {
		return false;
	}
	// /////////////////////////////////////////////
	return true;
}

// ���ö�������
function setSecondClass(val) {
	var up_class_id = val;
	document.getElementById("rsrv_str1").value = "1";
	Productclass.getProductClassByUpId(up_class_id, type, setSort2);
}
function setSort2(map_data) {
	DWRUtil.removeAllOptions("sort2");
	DWRUtil.addOptions("sort2", map_data);
	document.getElementById("sort3").style.display = "none";
	document.getElementById("nextElement").style.display = "none";
	var item = document.getElementById("sort2").length;
	if (item == 0) {
		document.getElementById("sort2").style.display = "none";
	} else {
		document.getElementById("sort2").style.display = "block";
	}
}
// ������������
function setTherdClass(val) {
	var up_class_id = val;
	document.getElementById("rsrv_str1").value = "2";
	Productclass.getProductClassByUpId(up_class_id, type, setSort3);
}
function setSort3(map_data) {
	if (map_data != null) {
		DWRUtil.removeAllOptions("sort3");
		DWRUtil.addOptions("sort3", map_data);
		var item = document.getElementById("sort3").length;
		if (item == 0) {
			document.getElementById("sort3").style.display = "none";
			document.getElementById("nextElement").style.display = "none";
		} else {
			document.getElementById("sort3").style.display = "block";
		}
	}
}
function setTypeName(obj) {
	var idx = obj.value;
	document.getElementById("class_id").value = idx;
	document.getElementById("count").value = obj.name;
}
// ��̬�����¼�������Ϣ
function cretateSelect(index, value) {
	document.getElementById("nextElement").style.display = "block";
	document.getElementById("rsrv_str1").value = "3";
	var divId = parseInt(index) + parseInt(1);
	document.getElementById("index_s").value = index;
	document.getElementById(index).innerHTML = "<select name=sort"
			+ index
			+ " id=sort"
			+ index
			+ " onchange=cretateSelect("
			+ divId
			+ ",this.value) size=3 onclick=setTypeName(this) style=width:130px></select><div id="
			+ divId + "></div>";
	DWRUtil.removeAllOptions("sort" + index);
	Productclass.getProductClassByUpId(value, type, setNewSelect);
}
// �ص�����
function setNewSelect(map_data) {
	var id = document.getElementById("index_s").value;
	DWRUtil.addOptions("sort" + id, map_data);
	var item = document.getElementById("sort" + id).length;
	if (item == 0) {
		document.getElementById(id).style.display = "none";
	} else {
		document.getElementById(id).style.display = "block";
	}
}