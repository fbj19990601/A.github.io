
// �ж��û��Ƿ��¼

var W = screen.width;// ȡ����Ļ�ֱ��ʿ��
var H = screen.height;// ȡ����Ļ�ֱ��ʸ߶�

function M(id) {
	return document.getElementById(id);// ��M()��������document.getElementById(id)
}
function MC(t) {
	return document.createElement(t);// ��MC()��������document.createElement(t)
};
// �ж�������Ƿ�ΪIE
function isIE() {
	return (document.all && window.ActiveXObject && !window.opera)
			? true
			: false;
}
// ȡ��ҳ��ĸ߿�
function getBodySize() {
	var bodySize = [];
	with (document.documentElement) {
		bodySize[0] = (scrollWidth > clientWidth) ? scrollWidth : clientWidth;// ����������Ŀ�ȴ���ҳ��Ŀ�ȣ�ȡ�ù������Ŀ�ȣ�����ȡҳ����
		bodySize[1] = (scrollHeight > clientHeight)
				? scrollHeight
				: clientHeight;// ����������ĸ߶ȴ���ҳ��ĸ߶ȣ�ȡ�ù������ĸ߶ȣ�����ȡ�߶�
	}
	return bodySize;
}
// �����ڸǲ�
function popCoverDiv() {
	if (M("cover_div")) {
		// ��������ڸǲ㣬��������ʾ
		M("cover_div").style.display = 'block';
	} else {
		// ���򴴽��ڸǲ�
		var coverDiv = MC('div');
		document.body.appendChild(coverDiv);
		coverDiv.id = 'cover_div';
		with (coverDiv.style) {
			position = 'absolute';
			background = '#CCCCCC';
			left = '0px';
			top = '0px';
			var bodySize = getBodySize();
			width = bodySize[0] + 'px'
			height = bodySize[1] + 'px';
			zIndex = 0;
			if (isIE()) {
				filter = "Alpha(Opacity=60)";// IE�澳
			} else {
				opacity = 0.6;
			}
		}
	}
}

// �õ�½����ʾΪ��
function showLogin() {
	var login = M("login");
	login.style.display = "block";
}

// ����DIV�����ʽ
function change() {
	var login = M("login");
	login.style.position = "absolute";
	login.style.border = "1px solid #CCCCCC";
	login.style.background = "#F6F6F6";
	var i = 0;
	var bodySize = getBodySize();
	login.style.left = (bodySize[0] - i * i * 4) / 2 + "px";
	login.style.top = (bodySize[1] / 2 - 100 - i * i) + "px";
	login.style.width = i * i * 4 + "px";
	login.style.height = i * i * 1.5 + "px";

	popChange(i);
}
// ��DIV���Сѭ������
function popChange(i) {
	var login = M("login");
	var bodySize = getBodySize();
	login.style.left = (bodySize[0] - i * i * 4) / 2 + "px";
	login.style.top = (bodySize[1] / 2 - 100 - i * i) + "px";
	login.style.width = i * i * 4 + "px";
	login.style.height = i * i * 1.5 + "px";
	if (i <= 10) {
		i++;
		setTimeout("popChange(" + i + ")", 10);// ���ó�ʱ10����
	}
}
// ��DIV��
function open() {
	change();
	showLogin();
	popCoverDiv()
	void(0);
}
// �ر�DIV��
function close() {
	M('login').style.display = 'none';
	M("cover_div").style.display = 'none';
	void(0);
}

//�û���¼
function checkLogin(){
	var user_name=$F("user_name");
	user_name=delAllSpace(user_name);
	if(user_name==""||user_name==null){
		alert("�������û�����");
		$("user_name").focus();
		return false;
	}
	var passwd=$F("passwd");
	passwd=delAllSpace(passwd);
	if(passwd==""||passwd==null){
		alert("�������û����룡");
		$("passwd").focus();
		return false;
	}
	return true;
}

/**
 * ɾ�����пո�
 */
function delAllSpace(str) {
	return str.replace(/^\s+|\s+$/g, "")
}

