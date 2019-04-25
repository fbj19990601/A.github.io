
/**
 * 采购信息主页
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
 * 采购信息搜索
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
	if(pro=='省份信息'){
		pro="";
		alert('Please select provinces!');
		return false;
	}
	if(city=='地市信息'){
		city="";
	}
	if(city=='地市信息..'){
		city="";
	}
	if(part=='0'){
		alert('Please select classification');
		return false;
	}
	if(stock_key=='请输入产品名称'){
	    stock_key="";
	} 
	window.open('/zone_b2b/stock/searchStockList.jsp?stock_key='+stock_key+'&pro='+pro+'&city='+city+'&param='+param+'&part='+part+'');
}

/**
 * 检测关键字
 */
function checkStockKeyWord(){
	var stock_key=$F("stock_key");
	if(stock_key=="" || stock_key==null){
		$("stock_key").value="Please enter the product name";
	}
}

// 设置城市信息
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
		fectureArray = ['地市信息..'];
		DWRUtil.addOptions("city", fectureArray);
	}
}
