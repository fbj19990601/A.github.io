
/**
 * ��ҳjs
 */

// ȫ������
function checkSearchWEBValue() {
	var info_type = "";
	if ($("supply").checked) {		 
		info_type = "0141";
	} else if ($("stock").checked) {
		info_type = "0154";
	} else if ($("customer").checked) {
		info_type = "0139";
	} else if ($("news").checked) {
		info_type = "0161";
	}
	var s_key = $F("s_key");
	s_key = delAllSpace(s_key);
	if (s_key == "" || s_key == null) {
		alert("��������ȷ�Ĺؼ��֣�");
		$("s_key").focus();
	} else {
		window.open("/searchListpage.jsp?p=0&info_type=" + info_type + "&key="
				+ s_key);
		
	}
}

// �ؼ��ּ���
function checkKeyWord(key) {
	var keyWord = delAllSpace(key);
	if (keyWord == "" || keyWord == null) {
		$(s_key).value = "������ؼ��֣�";
	}
}
/**
 * ɾ�����пո�
 */
function delAllSpace(str) {
	return str.replace(/^\s+|\s+$/g, "")
}

// ȡ����ǰʱ�估����
function getDate() {
	var now = new Date(); // ��ȡϵͳ����
	var yy = now.getYear(); // ��ȡ��
	var mm = now.getMonth() + 1; // ��ȡ��
	var week = getWeek(now.getDay()); // ��ȡ���������ֵ
	var dd = now.getDate();
	var date_time = yy + "-" + mm + "-" + dd + " " + week;
	return date_time;
}
function getWeek(week) {
	var weekDay = "";
	if (week == "0") {
		weekDay = "������";
	} else if (week == "1") {
		weekDay = "����һ";
	} else if (week == "2") {
		weekDay = "���ڶ�";
	} else if (week == "3") {
		weekDay = "������";
	} else if (week == "4") {
		weekDay = "������";
	} else if (week == "5") {
		weekDay = "������";
	} else {
		weekDay = "������";
	}
	return weekDay;
}

// �Զ����ؽű�

window.onload = function() {
 
	var strUrl = top.location.href;
	if (strUrl != null && strUrl != "") 
	{	
/**
		if (strUrl.indexOf("supply") > 0) 
		{
			$("supply").checked = true;
			$("top_dh1").className = "top4";
			$("top_dh0").className = "top3";
			$("top_dh2").className = "top3";
			$("top_dh3").className = "top3";
			$("top_dh4").className = "top3";
			$("top_dh5").className = "top3";
			$("top_dh6").className = "top3";
			setAdervtise(1);
		}
		 else if (strUrl.indexOf("stock") > 0) 
		{
			$("stock").checked = true;
			$("top_dh2").className = "top4";
			$("top_dh0").className = "top3";
			$("top_dh1").className = "top3";
			$("top_dh3").className = "top3";
			$("top_dh4").className = "top3";
			$("top_dh5").className = "top3";
			$("top_dh6").className = "top3";
			setAdervtise(2);
		} else if (strUrl.indexOf("enterprise") > 0) {
			$("customer").checked = true;
			$("top_dh3").className = "top4";
			$("top_dh0").className = "top3";
			$("top_dh1").className = "top3";
			$("top_dh2").className = "top3";
			$("top_dh4").className = "top3";
			$("top_dh5").className = "top3";
			$("top_dh6").className = "top3";
			setAdervtise(3);
		} else if (strUrl.indexOf("news") > 0) {
			$("news").checked = true;
			$("top_dh4").className = "top4";
			$("top_dh0").className = "top3";
			$("top_dh1").className = "top3";
			$("top_dh2").className = "top3";
			$("top_dh3").className = "top3";
			$("top_dh5").className = "top3";
			$("top_dh6").className = "top3";
			setAdervtise(4);
		} else if (strUrl.indexOf("talents") > 0) {
			$("top_dh5").className = "top4";
			$("top_dh0").className = "top3";
			$("top_dh1").className = "top3";
			$("top_dh2").className = "top3";
			$("top_dh3").className = "top3";
			$("top_dh4").className = "top3";
			$("top_dh6").className = "top3";
			setAdervtise(5);
		} else if (strUrl.indexOf("school") > 0) {
			if($("top_dh6")!=null){
			$("top_dh6").className = "top4";
			$("top_dh0").className = "top3";
			$("top_dh1").className = "top3";
			$("top_dh2").className = "top3";
			$("top_dh3").className = "top3";
			$("top_dh4").className = "top3";
			$("top_dh5").className = "top3";
			}
		} else {
			 
			$("top_dh0").className = "top4";
			setAdervtise(0);
			getStockImage('img-1',1);
			getStockImage('img-2',2);
			getStockContent('stock-7');
			sendLeave( 'leaveWords' );
		}**/
	} else {
		setAdervtise(0);
		getStockImage('img-1',1);
		getStockImage('img-2',2);
		getStockContent('stock-7');
		sendLeave( 'leaveWords' );
	}
}

// ���ù����Ϣ
function setAdervtise(range) {
	ParamethodMgr.getAdvertiseNumber('109', range,function(number){
		for (var i = 1; i <= number; i++) {
		var adv = 'adv-' + i;
		if ($(adv) != null && $(adv) != 'undefined') {
			getAdvertiseContent(adv, range, i);
		}
	}
	});
}

// ȡ���������
function getAdvertiseContent(adv_div, range, no) {
	var data = Math.round(Math.random() * 10000);
	var myAjax = new Ajax.Updater(adv_div,
			'/zone_b2b/comm/advertiseInfo.jsp?range=' + range + "&no=" + no
					+ "&data=" + data, {
				method : 'get',
				evalScripts : true
			});
}

function getStockImage(img_div,n) {
	 
	var data = Math.round(Math.random() * 10000);
	var myAjax = new Ajax.Updater(img_div,
			'/zone_b2b/comm/stockImage.jsp?n=' + n
					+ "&data=" + data, {
				method : 'get',
				evalScripts : true
			});
}

function getStockContent(title_div) {
	var data = Math.round(Math.random() * 10000);
	var myAjax = new Ajax.Updater(title_div,
			'/zone_b2b/comm/stockTitle.jsp?data=' + data, {
				method : 'get',
				evalScripts : true
			});
}
function sendLeave(title_div) {
	var data = Math.round(Math.random() * 10000);
	var myAjax = new Ajax.Updater(title_div,
			'/zone_b2b/comm/leaveWords.jsp?data=' + data, {
				method : 'get',
				evalScripts : true
			});

}
