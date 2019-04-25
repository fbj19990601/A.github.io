// 自动加载脚本

window.onload = function() {
	var strUrl = top.location.href;
	if (strUrl != null && strUrl != "") {
		if (strUrl.indexOf("supply") > 0) {
			$("top_dh1").className = "top4";
			$("top_dh0").className = "top3";
			$("top_dh2").className = "top3";
			$("top_dh4").className = "top3";
			$("top_dh5").className = "top3";
			$("top_dh6").className = "top3";
			$("top_dh7").className = "top3";
			$("top_dh8").className = "top3";
			$("top_dh9").className = "top3";
		} else if (strUrl.indexOf("stock") > 0) {
			$("top_dh2").className = "top4";
			$("top_dh0").className = "top3";
			$("top_dh1").className = "top3";
			$("top_dh4").className = "top3";
			$("top_dh5").className = "top3";
			$("top_dh6").className = "top3";
			$("top_dh7").className = "top3";
			$("top_dh8").className = "top3";
			$("top_dh9").className = "top3";
		} else if (strUrl.indexOf("enterprise") > 0) {
			$("top_dh0").className = "top3";
			$("top_dh1").className = "top3";
			$("top_dh2").className = "top3";
			$("top_dh4").className = "top3";
			$("top_dh5").className = "top3";
			$("top_dh6").className = "top3";
			$("top_dh7").className = "top3";
			$("top_dh8").className = "top3";
			$("top_dh9").className = "top3";
		} else if (strUrl.indexOf("news") > 0) {
			$("top_dh4").className = "top4";
			$("top_dh0").className = "top3";
			$("top_dh1").className = "top3";
			$("top_dh2").className = "top3";
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
			$("top_dh4").className = "top3";
			$("top_dh6").className = "top3";
			$("top_dh7").className = "top3";
			$("top_dh8").className = "top3";
			$("top_dh9").className = "top3";
		} else if (strUrl.indexOf("school") > 0) {
			$("top_dh6").className = "top4";
			$("top_dh0").className = "top3";
			$("top_dh1").className = "top3";
			$("top_dh2").className = "top3";
			$("top_dh4").className = "top3";
			$("top_dh5").className = "top3";
			$("top_dh7").className = "top3";
			$("top_dh8").className = "top3";
			$("top_dh9").className = "top3";
		} else if (strUrl.indexOf("school") > 0) {
			$("top_dh7").className = "top4";
			$("top_dh0").className = "top3";
			$("top_dh1").className = "top3";
			$("top_dh2").className = "top3";
			$("top_dh4").className = "top3";
			$("top_dh5").className = "top3";
			$("top_dh6").className = "top3";
			$("top_dh8").className = "top3";
			$("top_dh9").className = "top3";
		} else if (strUrl.indexOf("school") > 0) {
			$("top_dh8").className = "top4";
			$("top_dh0").className = "top3";
			$("top_dh1").className = "top3";
			$("top_dh2").className = "top3";
			$("top_dh4").className = "top3";
			$("top_dh5").className = "top3";
			$("top_dh6").className = "top3";
			$("top_dh7").className = "top3";
			$("top_dh8").className = "top3";
		} else if (strUrl.indexOf("school") > 0) {
			$("top_dh9").className = "top4";
			$("top_dh0").className = "top3";
			$("top_dh1").className = "top3";
			$("top_dh2").className = "top3";
			$("top_dh4").className = "top3";
			$("top_dh5").className = "top3";
			$("top_dh6").className = "top3";
			$("top_dh7").className = "top3";
			$("top_dh8").className = "top3";
		} else {
			$("top_dh0").className = "top4";
		}
	} else {
		$("top_dh0").className = "top4";
	}
}
