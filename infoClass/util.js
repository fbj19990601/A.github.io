/*******************************************************************************
 * 
 * 以下javascript代码为B2B平台所用到的公用方法 请勿随意改动 2008-07-29 XSAAS组
 ******************************************************************************/

/**
 * 生成html元素
 */
function createNextClass(classObj) {
	// 当前分类ID
	var up_class_id = classObj.value;
	var id = classObj.name.substring(4);
	// 分类类型
	var class_type = $F("class_type");
	// 获取上一个元素
	var upNo = parseInt(parseInt(id) + 1);
	// 新生成的元素
	var newElem = "<select size='10' name='sort"
			+ upNo
			+ "' id='sort"
			+ upNo
			+ "' onChange='createNextClass(this);' onclick='setClassInfo(this)'></select>";
	// 新生成的元素名/ID
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
 * 设置分类信息
 */
function setClassInfo(classObj) {
	var class_group_id = "000000000000000|";// 根分类的上级分类为15个0
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
 * 获取一个对象
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
 * 获取一个对象的值
 */
function $F(id) {
	if ($G(id) != null) {
		return $G(id).value;
	} else {
		return "";
	}
}
/**
 * 获取一下下拉列表框中所选中的名字
 */
function $M(id) {
	if ($G(id) != null) {
		return DWRUtil.getText(id);
	} else {
		return "";
	}
}
/**
 * 获取一个对象的名称
 */
function $N(id) {
	if ($G(id) != null) {
		return $G(id).name;
	} else {
		return "";
	}
}
/**
 * 删除所有空格
 */
function delAllSpace(str) {
	return str.replace(/^\s+|\s+$/g, "")
}
/**
 * 删除左边窗格
 */
function delLeftSpace(str) {
	return str.replace(/^\s+/g, "")
}
/**
 * 删除右边空格
 */
function delRightSpace(str) {
	return str.replace(/\s+$/g, "")
}

/**
 * @startDay 开始时间
 * @endDay 结束时间
 * @判断开始时间是否小于结束时间
 */
function checkDate(startDay, endDay) {
	var startD1 = startDay + "   " + "00:00";
	var endD1 = endDay + "   " + "23:59";
	var n1 = new Date(startD1.replace(/-/g, "/"));
	var n2 = new Date(endD1.replace(/-/g, "/"));
	var n = n2.getTime() - n1.getTime();
	if (startDay == "" || endDay == "") {
		alert("请选择完整的开始时和结束时间!");
		return false;
	}
	if (n <= 0) {
		alert("开始日期必须大于结束日期，请重新选择！");
		return false;
	}
	return true;
}