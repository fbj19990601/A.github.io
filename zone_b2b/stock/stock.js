
// ���ó�����Ϣ
function setCityInfo(prov_id) {
	if (prov_id != "0") {
		AreaInfo.getAreaByParent(prov_id, function(data) {
			DWRUtil.removeAllOptions("city");
			var fectureArray = new Array();
			fectureArray = ['������Ϣ..'];
			DWRUtil.addOptions("city", fectureArray);
			DWRUtil.addOptions("city", data);
		});
	} else {
		DWRUtil.removeAllOptions("city");
		var fectureArray = new Array();
		fectureArray = ['������Ϣ..'];
		DWRUtil.addOptions("city", fectureArray);
	}
}

// ������Ӧ��Ϣ
function searchSupply() {
	alert('1111111');
	var prov = $F("prov");
	var city = $F("city");
	alert(prov + "====" + city);
	return true;
}

// �����ı������ֵ
function setTextValue() {
	var key = $F("key");
	key = delAllSpace(key);
	if (key == '' || key == null) {
		$('key').value = '�������Ʒ���ƻ�ؼ���';
	}
}
// �Զ�����ҳ��
function autoLoad(page, type) {
	secBoard(type);
}

// ��Ӧ��Ϣ�б�ҳ��
function saleList(page) {
	changeShow(0);
	var data = Math.round(Math.random() * 10000);
	var myAjax = new Ajax.Updater('sale-list', 'stockList.jsp?sys_code=0&page='
			+ page + "&data=" + data, {
		method : 'get',
		evalScripts : true
	});
}

// ���¹�Ӧ��Ϣ�б�ҳ��
function saleNewList(page) {
	changeShow(1);
	var data = Math.round(Math.random() * 10000);
	var myAjax = new Ajax.Updater('sale-new-list',
			'stockOrderList.jsp?sys_code=1&page=' + page + "&data=" + data, {
				method : 'get',
				evalScripts : true
			});
}

// ��Ӧ��Ϣ�����¹�Ӧ��Ϣ�б�֮���ת��
function secBoard(n) {
	if (n == 0) {
		$("sale-list").style.display = 'block'
		$("sale-new-list").style.display = 'none'
		$("td0").className = 'ec4';
		$("td1").className = 'ec3';
	} else {
		$("sale-list").style.display = 'none'
		$("sale-new-list").style.display = 'block'
		$("td0").className = 'ec3'
		$("td1").className = 'ec4'
	}
}

// �ı���ʾ��ʽ
function changeShow(n) {
	if (n == 0) {
		$("sale-list").style.display = 'block'
		$("sale-new-list").style.display = 'none'
		$("td0").className = 'ec4';
		$("td1").className = 'ec3';
	} else {
		$("sale-list").style.display = 'none'
		$("sale-new-list").style.display = 'block'
		$("td0").className = 'ec3'
		$("td1").className = 'ec4'
	}
}
// ���¹�Ӧ��Ϣ�Ƚ�
function orderCompare() {
	var compara = "";
	var size = $F("n_size");
	if (size > 0) {
		for (var i = 0; i < size; i++) {
			var obj = "sale_n" + i;
			var product = $(obj);
			if (product.checked) {
				compara = compara + $F(obj) + "|";
			}
		}
		if (compara == null || compara == "") {
			alert("��ѡ��Ҫ���жԱȵ���Ϣ��");
			return false;
		}else{
			$("idx").value=compara
			$("commpara").submit();
		}
	} else {
		alert("û��Ҫ���жԱȵ���Ϣ!");
		return false;
	}
}
// ��Ӧ��Ϣ�Ƚ�
function saleCompare() {
	var compara = "";
	var size = $F("s_size");
	if (size > 0) {
		for (var i = 0; i < size; i++) {
			var obj = "sale_" + i;
			var product = $(obj);
			if (product.checked) {
				compara = compara + $F(obj) + "|";
			}
		}
		if (compara == null || compara == "") {
			alert("��ѡ��Ҫ���жԱȵ���Ϣ��");
			return false;
		}else{
			$("idx").value=compara
			$("commpara").submit();
		}
	} else {
		alert("û��Ҫ���жԱȵ���Ϣ!");
		return false;
	}
}
/**
 * ɾ�����пո�
 */
function delAllSpace(str) {
	return str.replace(/^\s+|\s+$/g, "")
}