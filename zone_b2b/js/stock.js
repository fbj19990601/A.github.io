
/**
 * �ɹ���Ϣ��ҳ
 */

function secBoard(n) {
	if (n == 0) {
		$("tbo0").style.display = 'block'
		$("tbo1").style.display = 'none'
		$("td0").className = 'ec4';
		$("td1").className = 'ec3';
	} else {
		$("tbo0").style.display = 'none'
		$("tbo1").style.display = 'block'
		$("td0").className = 'ec3'
		$("td1").className = 'ec4'
	}
}

/**
 * �ɹ���Ϣ����
 */
function searchStock() {
	var stock_key = document.getElementById('stock_key').value;
	var part = document.getElementById('part').value;
	var param='';
	if(part==0){
		param='0';
	}else{
		param='1';
	}
	var pro = DWRUtil.getText('prov');
	var city= DWRUtil.getText('city');
	if(pro=='ʡ����Ϣ'){
		pro="";
		alert('Please select provinces!');
		return false;
	}
	if(city=='������Ϣ'){
		city="";
	}
	if(city=='������Ϣ..'){
		city="";
	}
	if(part=='0'){
		alert('Please select classification');
		return false;
	}
	if(stock_key=='�������Ʒ����'){
	    stock_key="";
	} 
	window.open('/zone_b2b/stock/searchStockList.jsp?stock_key='+stock_key+'&pro='+pro+'&city='+city+'&param='+param+'&part='+part+'');
}

/**
 * ���ؼ���
 */
function checkStockKeyWord(){
	var stock_key=$F("stock_key");
	if(stock_key=="" || stock_key==null){
		$("stock_key").value="Please enter the product name";
	}
}

// ���ó�����Ϣ
function setCityInfo(prov_id) {
	if (prov_id != "0") {
		AreaInfo.getAreaByParent(prov_id, function(data) {
			DWRUtil.removeAllOptions("city");
			var fectureArray = new Array();
			fectureArray = ['city information..'];
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
