

// ���ó�����Ϣ
function setCityInfo(prov_id) {
	if (prov_id != "0") {
		AreaInfo.getAreaByParent(prov_id, function(data) {
			DWRUtil.removeAllOptions("city");
			var fectureArray = new Array();
			fectureArray = ['city infomation..'];
			DWRUtil.addOptions("city", fectureArray);
			DWRUtil.addOptions("city", data);
		});
	} else {
		DWRUtil.removeAllOptions("city");
		var fectureArray = new Array();
		fectureArray = ['city infomation..'];
		DWRUtil.addOptions("city", fectureArray);
	}
}

function setCityInfo_left(prov_id) {
	if (prov_id != "0") {
		AreaInfo.getAreaByParent(prov_id, function(data) {
			DWRUtil.removeAllOptions("city_l");
			var fectureArray = new Array();
			fectureArray = ['city infomation..'];
			DWRUtil.addOptions("city_l", fectureArray);
			DWRUtil.addOptions("city_l", data);
		});
	} else {
		DWRUtil.removeAllOptions("city_l");
		var fectureArray = new Array();
		fectureArray = ['city infomation..'];
		DWRUtil.addOptions("city_l", fectureArray);
	}
}

// ������Ӧ��Ϣ
function searchSupply() {
	var prov = DWRUtil.getText('prov');
	var city = DWRUtil.getText('city');
	var part = document.getElementById('part').value;
	if(prov=='all province information'){
		prov='';
		alert('Please chose province!');
		return false;
	}
	if(city=='city infomation'||city=='city infomation..'){
		city='';
	}
	if(part=='0'){
		alert('Please chose type��');
		return false;
	}
	var key = document.getElementById('key').value;
	if(key=='Please enter a keyword or theme supply!'){
		key='';
	}
	window.open('/zone_b2b/supply/selectSupplyList.jsp?prov='+prov+'&city='+city+'&key='+key+'&part='+part+'');
	return true;
}

// �����ı������ֵ
function setTextValue() {
	var key = $F("key");
	key = delAllSpace(key);
	if (key == '' || key == null) {
		$('key').value = 'Please enter a product name or keyword!';
	}
}
// �Զ�����ҳ��
function autoLoad(page, type) {
	if (type == "0") {
		saleList(page);
	} else {
		saleNewList(page);
	}
}

// ��Ӧ��Ϣ�б�ҳ��
function saleList(page) {
	changeShow(0);
	var data = Math.round(Math.random() * 10000);
	var myAjax = new Ajax.Updater('sale-list', 'saleList.jsp?sys_code=0&page='
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
			'saleOrderList.jsp?sys_code=1&page=' + page + "&data=" + data, {
				method : 'get',
				evalScripts : true
			});
}

// ��Ӧ��Ϣ�����¹�Ӧ��Ϣ�б�֮���ת��
function secBoard(n) {
	var page = "1";
	if (n == 0) {
		$("sale-list").style.display = 'block'
		$("sale-new-list").style.display = 'none'
		$("td0").className = 'ec4';
		$("td1").className = 'ec3';
		//saleList(page);
	} else {
		$("sale-list").style.display = 'none'
		$("sale-new-list").style.display = 'block'
		$("td0").className = 'ec3'
		$("td1").className = 'ec4'
		//saleNewList(page);
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
			alert("Check to compare!");
			return false;
		}else{
			$("idx").value=compara
			$("commpara").submit();
		}
	} else {
		alert("No comparative information!");
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
			alert("Check to compare the information!");
			return false;
		}else{
			$("idx").value=compara
			$("commpara").submit();
		}
	} else {
		alert("No comparative information!");
		return false;
	}
}
/**
 * ɾ�����пո�
 */
function delAllSpace(str) {
	return str.replace(/^\s+|\s+$/g, "")
}

//���ùؼ���

function setProductKey(){
	var product=$F("product_name");
	product=delAllSpace(product);
	if(product=="" || product==null){
		$("product_name").value="Please enter a keyword or theme supply!";
	}
}

function searchLeft(){
	var product_name = document.getElementById('product_name').value;
	var pro = DWRUtil.getText('prov_1');
	var city= DWRUtil.getText('city_l');
	var pro_city = pro+city;	
	var date_scope = document.getElementById('date').value;
	if(product_name=='' || product_name==null){
		alert('  Please enter a keyword or theme supply! ');
		return false;
	}
	if(product_name=='Please enter a keyword!'){
		alert('Please enter a keyword!');
		return false;
	}
	if(pro_city=='Please select the province of information'){
		alert('Please select the province of information');
		return false;
	}
	if(city=='��ѡ��'){
		alert('Please select the province of information');
		return false;
	}
	if(city=='Please chose type��'){
		alert('Please select the city of information');
		return false;
	}
	if(date_scope=='0'){
		alert('Please select a time!');
		return false;
	}
	var search_1 = document.getElementById('search_1');
	var search_2 = document.getElementById('search_2');
	var param = '';
	if(search_1.checked==true){
		param = 1;
	}else{
		param = 2;	
	}
	window.open('/zone_b2b/supply/searchSupplyList.jsp?product_name='+product_name+'&pro='+pro+'&city='+city+'&date='+date_scope+'&param='+param+'');
}


