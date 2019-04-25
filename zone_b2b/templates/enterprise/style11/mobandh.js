// 自动加载脚本

window.onload = function() {
	$("date-time").innerHTML = getDate();
	var strUrl = top.location.href;
	if (strUrl != null && strUrl != "") {
		if (strUrl.indexOf("supply") > 0) {
			$("supply").checked = true;
			$("top_dh1").className = "top4";
			$("top_dh0").className = "top3";
			$("top_dh2").className = "top3";
			$("top_dh3").className = "top3";
			$("top_dh4").className = "top3";
			$("top_dh5").className = "top3";
			$("top_dh6").className = "top3";
			$("top_dh7").className = "top3";
			$("top_dh8").className = "top3";
			$("top_dh9").className = "top3";
			setAdervtise(1);
		} else if (strUrl.indexOf("stock") > 0) {
			$("stock").checked = true;
			$("top_dh2").className = "top4";
			$("top_dh0").className = "top3";
			$("top_dh1").className = "top3";
			$("top_dh3").className = "top3";
			$("top_dh4").className = "top3";
			$("top_dh5").className = "top3";
			$("top_dh6").className = "top3";
			$("top_dh7").className = "top3";
			$("top_dh8").className = "top3";
			$("top_dh9").className = "top3";
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
			$("top_dh7").className = "top3";
			$("top_dh8").className = "top3";
			$("top_dh9").className = "top3";
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
			$("top_dh7").className = "top3";
			$("top_dh8").className = "top3";
			$("top_dh9").className = "top3";
			setAdervtise(4);
		} else if (strUrl.indexOf("talents") > 0) {
			$("top_dh5").className = "top4";
			$("top_dh0").className = "top3";
			$("top_dh1").className = "top3";
			$("top_dh2").className = "top3";
			$("top_dh3").className = "top3";
			$("top_dh4").className = "top3";
			$("top_dh6").className = "top3";
			$("top_dh7").className = "top3";
			$("top_dh8").className = "top3";
			$("top_dh9").className = "top3";
			setAdervtise(5);
		} else if (strUrl.indexOf("school") > 0) {
			$("top_dh6").className = "top4";
			$("top_dh0").className = "top3";
			$("top_dh1").className = "top3";
			$("top_dh2").className = "top3";
			$("top_dh3").className = "top3";
			$("top_dh4").className = "top3";
			$("top_dh5").className = "top3";
			$("top_dh7").className = "top3";
			$("top_dh8").className = "top3";
			$("top_dh9").className = "top3";
			setAdervtise(6);
		} else if (strUrl.indexOf("school") > 0) {
			$("top_dh7").className = "top4";
			$("top_dh0").className = "top3";
			$("top_dh1").className = "top3";
			$("top_dh2").className = "top3";
			$("top_dh3").className = "top3";
			$("top_dh4").className = "top3";
			$("top_dh5").className = "top3";
			$("top_dh6").className = "top3";
			$("top_dh8").className = "top3";
			$("top_dh9").className = "top3";
			setAdervtise(7);
		} else if (strUrl.indexOf("school") > 0) {
			$("top_dh8").className = "top4";
			$("top_dh0").className = "top3";
			$("top_dh1").className = "top3";
			$("top_dh2").className = "top3";
			$("top_dh3").className = "top3";
			$("top_dh4").className = "top3";
			$("top_dh5").className = "top3";
			$("top_dh6").className = "top3";
			$("top_dh7").className = "top3";
			$("top_dh8").className = "top3";
			setAdervtise(8);
		} else if (strUrl.indexOf("school") > 0) {
			$("top_dh9").className = "top4";
			$("top_dh0").className = "top3";
			$("top_dh1").className = "top3";
			$("top_dh2").className = "top3";
			$("top_dh3").className = "top3";
			$("top_dh4").className = "top3";
			$("top_dh5").className = "top3";
			$("top_dh6").className = "top3";
			$("top_dh7").className = "top3";
			$("top_dh8").className = "top3";
		} else {
			$("top_dh0").className = "top4";
			setAdervtise(0);
		}
	} else {
		$("top_dh0").className = "top4";
		setAdervtise(0);
	}
}
