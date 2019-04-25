/**
 * 数据检测
 */
var type = "5";
function checkInfo() {
	if ($("title").value.replace(/\s*/g, "") == ""
			|| $("title").value.replace(/\s*/g, "") == null) {
		alert("Sales Information name can not be empty!!!"); 
		$("title").focus();
		return false;
	}
    var class_id=$F("class_id");
	if (class_id=="" || class_id==null) {
		alert("Please make a selection of information!");
		document.classForm.sort1.focus();
		return false;
	}

	var str = content.getHTML();
	str = str.replace(/\s*/g, "");
	if (str == "") {
		alert("Please complete description of goods!");
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
	// ////////////////判断时间是否合理////////////////
	if (!checkDate(document.classForm.start_date.value,
			document.classForm.end_date.value)) {
		return false;
	}
	// /////////////////////////////////////////////
	if (document.classForm.sale_price.value == ""
			|| document.classForm.sale_price.value == null) {
		alert("Selling prices can not be empty!");
		document.classForm.sale_price.focus();
		return false;
	} else if (!isNum(document.classForm.sale_price.value)) {
		alert("Please enter the correct figure!");
		document.classForm.sale_price.focus();
		return false;
	}
	if (document.classForm.commodity_price.value == ""
			|| document.classForm.commodity_price.value == null) {
		alert("Price should not be empty!");
		document.classForm.commodity_price.focus();
		return false;
	} else if (!isNum(document.classForm.commodity_price.value)) {
		alert("Please enter the correct figure!");
		document.classForm.commodity_price.focus();
		return false;
	}
	if (document.classForm.sale_addr.value == ""
			|| document.classForm.sale_addr.value == null) {
		alert("Sales address can not be empty!");
		document.classForm.sale_addr.focus();
		return false;
	}

}
// 检测是否为合法数据
function isNum(str) {
	return (str.search(/^\d+(\.\d+)?$/) != -1);
}
// 设置二级分类
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
// 设置三级分类
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
	  var idx=obj.value;
	  $("class_id").value=idx;
}
// 动态生成下级分类信息
function cretateSelect(index, value) {
	$("nextElement").style.display = "block";
	$("rsrv_str1").value = "3";
	var divId = parseInt(index) + parseInt(1);
	$("index_s").value = index;
	$(index).innerHTML = "<select name=sort" + index + " id=sort" + index
			+ " onchange=cretateSelect(" + divId
			+ ",this.value) size=3  style=width:130px></select><div id="
			+ divId + "></div>";
	DWRUtil.removeAllOptions("sort" + index);
	Productclass.getProductClassByUpId(value, type, setNewSelect);
}
// 回调函数
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
