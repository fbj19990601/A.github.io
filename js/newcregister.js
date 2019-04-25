var xmlHttp = null;

function Check_Value()
{
	var   reg=/[^a-z0-9]/g; 
	if (document.NewRegisterForm.user_name.value == ""||document.NewRegisterForm.user_name.value == null)
	{
		alert("User Name can not be empty！");
		document.NewRegisterForm.user_name.focus(); 
		return false;
	}
	/**else	if(reg.test(document.NewRegisterForm.user_name.value))   
	{
		alert("User must be letters or numbers and lowercase letters ！");   
		document.NewRegisterForm.user_name.select();   
		return   false;   
	}**/   
	if (document.NewRegisterForm.passwd[0].value == ""||document.NewRegisterForm.passwd[0].value == null)
	{
		alert("Password can not be empty！");
		document.NewRegisterForm.passwd[0].focus(); 
		return false;
	}
	if (document.NewRegisterForm.passwd[1].value == ""||document.NewRegisterForm.passwd[1].value == null)
	{
		alert("Confirm password can not be empty！");
		document.NewRegisterForm.passwd[1].focus(); 
		return false;
	}
	if (document.NewRegisterForm.passwd[0].value != document.NewRegisterForm.passwd[1].value)
	{
		alert("Enter password twice inconsistency");
		document.NewRegisterForm.passwd[1].focus(); 
		return false;
	}
	if (document.NewRegisterForm.email.value == ""||document.NewRegisterForm.email.value == null)
	{
		alert("The Email can not be  empty！");
		document.NewRegisterForm.email.focus(); 
		return false;
	}
	if (document.NewRegisterForm.cust_name.value == ""||document.NewRegisterForm.cust_name.value == null)
	{
		alert("Customers   can not  be empty！");
		document.NewRegisterForm.cust_name.focus(); 
		return false;
	}
	if (document.NewRegisterForm.pspt_type_code.value == ""||document.NewRegisterForm.pspt_type_code.value == null)
	{
		alert("Types of documents can not be empty！");
		document.NewRegisterForm.pspt_type_code.focus(); 
		return false;
	}
	if (document.NewRegisterForm.pspt_id.value == ""||document.NewRegisterForm.pspt_id.value == null)
	{
		alert("Number of documents can not be empty！");
		document.NewRegisterForm.pspt_id.focus(); 
		return false;
	}
	if (document.NewRegisterForm.company_address.value != "")
	{			
		if (document.NewRegisterForm.website.value == ""||document.NewRegisterForm.website.value == null)
		{
			alert("Please fill out the secondary domain name if you are company ！");
			document.NewRegisterForm.website.focus(); 
			return false;
		}
	}
	if(document.NewRegisterForm.sort1.value=="")
	{
		document.NewRegisterForm.rsrv_str1.value="0";
	}
	else
	{
		document.NewRegisterForm.rsrv_str1.value="1";
	}
	if(document.NewRegisterForm.sort2.value!="")
	{
			document.NewRegisterForm.rsrv_str1.value="2";
	}
	if(document.NewRegisterForm.sort3.value!="")
	{
		document.NewRegisterForm.rsrv_str1.value="3";
	}
	if(document.NewRegisterForm.relation_type_code.value=="0")
	{
		alert("Please select a type of customer relationship ！");
		return false;
	}
}

function ContactVisabled(visabled)
{
	for(var index = 1; index <= 17; index++)
		document.getElementById("trContact" + index).style.display = (visabled ? "block" : "none");
}

function CompanyVisabled(visabled)
{
	document.getElementById("tabCompany").style.display = (visabled ? "block" : "none");
	document.getElementById("spnCompany").style.display = (visabled ? "block" : "none");
}

function showSalebuy(sale, buy)
{
	document.getElementById("trSale").style.display = (sale ? "block" : "none");
	document.getElementById("trBuy").style.display = (buy ? "block" : "none");
}
function checkEmail(){
var mail=document.NewRegisterForm.email.value;
 if (mail.charAt(0)=="." || 
					mail.charAt(0)=="@"|| 
					mail.indexOf('@', 0) == -1 || 
					mail.indexOf('.', 0) == -1 || 
					mail.lastIndexOf("@") 　　
					　 ==mail.length-1 || 
					mail.lastIndexOf(".")
					==mail.length-1)
					{
					alert("Email's not in the correct format ！");
					document.NewRegisterForm.email.focus();
					return false;
}
if(mail.length>0){
      UserInfo.getEmailAddrExist(mail,function(data){
      if(data>0){
		 alert("The e-mail address is already in use, please re-fill other e-mail address ！");
		 document.NewRegisterForm.email.value="";
       }	
     });
    }
}
function user_name_focus(state)
{
	var user_name = document.NewRegisterForm.user_name;
	var div = document.getElementById("divUsername");
	if(state)
	{
		div.className = "green";
		div.innerHTML = "Up to 20 characters, only English lowercase letters and numbers ";
	}
	else
	{
		div.className = "orange";
		div.innerHTML = "<img src=\"/images/icon_yes_small.gif\" align=\"absmiddle\">&nbsp;OK。"
		var   reg=/[^a-z0-9]/g; 
	/**if(reg.test(document.NewRegisterForm.user_name.value))   
	{
		alert("User must be letters or numbers and lowercase letters ！");   
		document.NewRegisterForm.user_name.select();   
		return   false;   
	} **/  
		if(!/\S/.test(user_name.value))
			div.innerHTML = "<img src=\"/images/icon_error_small.gif\" align=\"absmiddle\">&nbsp;Up to 20 characters, only English lowercase letters and numbers "
		else if(!/[a-z]\w{3,19}/.test(user_name.value))
			div.innerHTML = "<img src=\"/images/icon_error_small.gif\" align=\"absmiddle\">&nbsp;Up to 20 characters, only English lowercase letters and numbers "
		else 
		{
			div.className = "";
			div.innerHTML = "<img src=\"/images/server.gif\" align=\"absmiddle\">&nbsp;checking ..."
			CheckUsername();
		}
	}
}

function password_focus(state, value)
{
	var pwd = document.NewRegisterForm.passwd[value];
	var div = document.getElementById("divPassword" + (value + 1));
	
	if(state)
	{
		div.className = "green";
		div.innerHTML = value ? "Please enter  your password again   。" : "Password from 6-20 in English letters (case sensitive) or numbers ";
	}
	else
	{
		div.className = "orange";
		div.innerHTML = "<img src=\"/images/icon_yes_small.gif\" align=\"absmiddle\">&nbsp;OK。"
		
		if(pwd.value.length == 0)
			div.innerHTML = "<img src=\"/images/icon_error_small.gif\" align=\"absmiddle\">&nbsp;" + (value ? "Please enter  your password again" : "The password can not be empty");
		else if(!/\w/.test(pwd.value))
			div.innerHTML = "<img src=\"/images/icon_error_small.gif\" align=\"absmiddle\">&nbsp;" + (value ? "" : "Confirmation") + "Password from 6-20 in English letters (case sensitive) or numbers 。";
		else if(value == 1 && pwd.value != document.NewRegisterForm.passwd[0].value)
			div.innerHTML = "<img src=\"/images/icon_error_small.gif\" align=\"absmiddle\">&nbsp;Enter password twice inconsistency。";
		else
			div.className = "";
		
	}
}

function passwd_ques_focus(state)
{
	var ques = document.NewRegisterForm.passwd_answer;
	var div = document.getElementById("divQues");
	
	/**if(state)
	{
		div.className = "green";
		div.innerHTML = "Keep in mind that the answer to lost password when answering a question by the system. If your answer is correct, the system will automatically show you the password 。";
	}
	else
	{
		div.className = "orange";
		div.innerHTML = "<img src=\"/images/icon_yes_small.gif\" align=\"absmiddle\">&nbsp;OK。"
		
		if(!/\S/.test(ques.value))
			div.innerHTML = "<img src=\"/images/icon_error_small.gif\" align=\"absmiddle\">&nbsp;Secret question can not be empty。"
		else
			div.className = "";
	}*/
}

function CustName_focus(state)
{
	var cust = document.NewRegisterForm.cust_name;
	var div = document.getElementById("divCustName");
	
	cust.value = cust.value.replace(/\s/, "");
	
	if(state)
	{
		div.className = "green";
		div.innerHTML = "Please complete the enterprises in the industrial and commercial registration of name";
	}
	else
	{
		if(/\S+/.test(cust.value))
		{
			div.className = "";
			div.innerHTML = "<img src=\"/images/icon_yes_small.gif\" align=\"absmiddle\">&nbsp;OK。"
		}
		else
		{
			div.className = "orange";
			div.innerHTML = "<img src=\"/images/icon_error_small.gif\" align=\"absmiddle\">&nbsp;Customer name can not be empty 。";
		}
	}
}

function CCCName_focus(state)
{
	var cust = document.NewRegisterForm.cust_name;
	var div = document.getElementById("divCCCName");
	
	cust.value = cust.value.replace(/\s/, "");
	
	if(state)
	{
		div.className = "green";
		div.innerHTML = "Lowercase letters in English, Chinese, numbers, the length of 4-20 characters";
	}
	else
	{
		if(/\S+/.test(cust.value))
		{
			div.className = "";
			div.innerHTML = "<img src=\"/images/icon_yes_small.gif\" align=\"absmiddle\">&nbsp;OK。"
		}
		else
		{
			div.className = "orange";
			div.innerHTML = "<img src=\"/images/icon_error_small.gif\" align=\"absmiddle\">&nbsp;Customer name can not be empty 。";
		}
	}
}

function salebuy_service_focus(state, element)
{
	var div = document.getElementById(element);
	
	if(state)
		div.className = "orange";
	else
		div.className = "";
}

function CheckUsername()
{
	var user_name = document.NewRegisterForm.user_name;
	var div = document.getElementById("divUsername");
	
	if(xmlHttp == null)
		xmlHttp = createXmlHttp();
	
	if(xmlHttp == null)
	{
		div.className = "";
		div.innerHTML = "Your browser is too old or not support AJAX technology, user name can not be detected 。";
		return;
	}
		
	xmlHttp.abort();
	xmlHttp.onreadystatechange = readyStateChange;
	xmlHttp.open("GET", "/chkusr.jsp?u=" + UrlEncode(user_name.value));
	xmlHttp.send(null);
}

function readyStateChange()
{
	if(xmlHttp.readyState == 4)
	{
		if(xmlHttp.status == 200)
		{
			var div = document.getElementById("divUsername");
			var result = xmlHttp.responseText;
			
			if(result == "1")
			{
				div.className = "";
				div.innerHTML = "<img src=\"/images/icon_yes_small.gif\" align=\"absmiddle\">&nbsp;OK。";
			}
			else
			{
				div.className = "orange";
				div.innerHTML = "<img src=\"/images/icon_error_small.gif\" align=\"absmiddle\">&nbsp;User name already occupied by other users 。";

			}
		}
		else
		{
			div.className = "";
			div.innerHTML = "Back to the server, user name test failure ";
		}
	} 
}
/***
 * 判断用名是不是已存在
 */
function checkUserNameExists(name){
	var div=document.getElementById("divUsername");
	if(name=="" || name==null){
		div.className = "orange";
		div.innerHTML = "<img src=\"/images/icon_error_small.gif\" align=\"absmiddle\">&nbsp;Please enter the account name 。";
		document.getElementById("user_name").focus();
	}else{
	UserInfo.getCustIdByUserName(name,function(result){
		if(result == "" || result==null)
		{
			div.className = "";
			div.innerHTML = "<img src=\"/images/icon_yes_small.gif\" align=\"absmiddle\">&nbsp;OK ,you can use。";
		}
		else
		{
			alert(name+":User already exists，please enter again！");
			div.className = "orange";
			div.innerHTML = "<img src=\"/images/icon_error_small.gif\" align=\"absmiddle\">&nbsp;User name already occupied by other users。";
			document.getElementById("user_name").value="";
	
		}
	});
  }
}
function getSubitems(obj, classid, emptyName, emptyValue)
{
	var xmlHttp = createXmlHttp();
	
	if(classid == null)
		return;
	else if(classid == "000000000000000") 
		classid = "";
	xmlHttp.open("GET", "/subsortitems.jsp?classid=" + UrlEncode(classid), false);
	xmlHttp.send(null);
	
	var result = xmlHttp.responseText;
	if(result == null || result.length == 0)
	{
		obj.options.length = 0;
		this.sortDisplay();
		return;	
	}
	else
	{
		obj.options.length = 0;
		
		if(emptyName != null || emptyValue != null)
			obj.options.add(new Option(emptyName, emptyValue));
		
		result = result.split("\n");
		for(var index = 0; index < result.length; index++)
		{
			var columns = result[index].split(",");
			if(columns.length>1)
			{
			var option = new Option(columns[3], columns[0])			
			obj.options.add(option);
			}
		}
		
		this.sortDisplay();
	}
}

function sortDisplay()
{
	if(document.NewRegisterForm.sort2.options.length == 0)
	{
		document.NewRegisterForm.sort2.style.display = "none";
		document.NewRegisterForm.sort3.style.display = "none";
	}
	else
	{
		document.NewRegisterForm.sort2.style.display = "block";
	}
	
	if(document.NewRegisterForm.sort3.options.length == 0)
		document.NewRegisterForm.sort3.style.display = "none";
	else
		document.NewRegisterForm.sort3.style.display = "block";
}

function createXmlHttp()
{
	if (window.ActiveXObject && !window.XMLHttpRequest)
		return new ActiveXObject((navigator.userAgent.toLowerCase().indexOf('msie 5') != -1) ? 'Microsoft.XMLHTTP' : 'Msxml2.XMLHTTP');
	else
		return new window.XMLHttpRequest();
}