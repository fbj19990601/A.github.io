function createCustomerWeb(value) {
	if (value == "" || value == null) {
		alert("Please select the site style...");
	} else {
		createCustomerHTML(value);
	}
}

// 生成进度条
var i = 0;
function test() {
	i++;
	document.getElementById("loading").style.width = i + "%";
	document.getElementById("loadtext").innerText = i + "%";
	if (i < 100) {
		setTimeout("test()", 200);
	} else {
		$("finsh").style.display = "block";
		$("type").disabled="disabled"
	}
}
// 生成企业网站
function createCustomerHTML(rootpath) {
	var data = Math.round(Math.random() * 10000);
	var myAjax = new Ajax.Updater('temp',
			'/zone_b2b/comm/createHTML.jsp?rootpath='+rootpath+'&data=' + data, {
				method : 'get',
				evalScripts : true
	});
	$('process').style.display="block";
	window.setTimeout("test()", 200);
}


