// �Զ�����
window.onload = function() {
	var cust_id = $F('root_id');
	loadCustomerLeave(cust_id);
}
// �ͻ�����ҳ��
function loadCustomerLeave(cust_id) {
	var strUrl = top.location.href;
	var iStart=strUrl.substring(strUrl.length-1,strUrl.length);
    if(iStart>0){
    	iStart=iStart;
    }else{
    	iStart=1;
    }
	var data = Math.round(Math.random() * 10000);
	var myAjax = new Ajax.Updater('commentDIV',
			'/zone_b2b/comm/sendCustLeave.jsp?cust_id=' + cust_id+"&iStart="+iStart + "&data="
					+ data, {
				method : 'get',
				evalScripts : true
			});
}

function checkValue() {
	var rsrv_str3 = $F("rsrv_str3");
	rsrv_str3 = delAllSpace(rsrv_str3);
	if (rsrv_str3 == "" || rsrv_str3 == null) {
		alert("��������Ĵ�����");
		$("rsrv_str3").focus();
		return false;
	}
	var mail = $F("rsrv_str5");
	if (mail.charAt(0) == "." || mail.charAt(0) == "@"
			|| mail.indexOf('@', 0) == -1 || mail.indexOf('.', 0) == -1
			|| mail.lastIndexOf("@") == mail.length - 1
			|| mail.lastIndexOf(".") == mail.length - 1) {
		alert("Email�ĸ�ʽ����ȷ��");
		$("rsrv_str5").focus();
		return false;
	}
	var content = $F("content");
	content = delAllSpace(content);
	if (content == "" || content == null) {
		alert("����������Ϣ��");
		$("content").focus();
		return false;
	} else if (content.length < 10) {
		alert("�������ݲ�������10���ַ���");
		$("content").focus();
		return false;
	}else if(content.length > 2500){
		alert("��������̫�࣡���ᵼ�¶������ݶ�ʧ��");
		$("content").focus();
		return false;
	}
	return true;
}
function delAllSpace(str) {
	return str.replace(/^\s+|\s+$/g, "")
}