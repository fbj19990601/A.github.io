function CheckCustValue()
{
	var   reg=/[^a-z0-9]/g; 
	if (document.NewRegisterForm.user_name.value == ""||document.NewRegisterForm.user_name.value == null)
	{
		alert("�û���������Ϊ�գ�");
		document.NewRegisterForm.user_name.focus(); 
		return false;
	}
	/**else if   (reg.test(document.NewRegisterForm.user_name.value))   
	{
		alert("�û�����������ĸ������������ĸСд��");   
		document.NewRegisterForm.user_name.select();   
		return   false;   
	}  **/ 
	if (document.NewRegisterForm.passwd[0].value == ""||document.NewRegisterForm.passwd[0].value == null)
	{
		alert("���벻����Ϊ�գ�");
		document.NewRegisterForm.passwd[0].focus(); 
		return false;
	}
	if (document.NewRegisterForm.passwd[1].value == ""||document.NewRegisterForm.passwd[1].value == null)
	{
		alert("ȷ�����벻����Ϊ�գ�");
		document.NewRegisterForm.passwd[1].focus(); 
		return false;
	}
	if (document.NewRegisterForm.passwd[0].value != document.NewRegisterForm.passwd[1].value)
	{
		alert("�����������벻һ��");
		document.NewRegisterForm.passwd[1].focus(); 
		return false;
	}

	if (document.NewRegisterForm.email.value == ""||document.NewRegisterForm.email.value == null)
	{
		alert("�����ַ����Ϊ�գ�");
		document.NewRegisterForm.email.focus(); 
		return false;
	}
	else
	{
		  var mail=document.NewRegisterForm.email.value;
		  if(mail.length!=0)
			{
					if (mail.charAt(0)=="." || 
					mail.charAt(0)=="@"|| 
					mail.indexOf('@', 0) == -1 || 
					mail.indexOf('.', 0) == -1 || 
					mail.lastIndexOf("@") ����
					�� ==mail.length-1 || 
					mail.lastIndexOf(".")
					==mail.length-1)
					{
					alert("Email�ĸ�ʽ�����_��");
					document.NewRegisterForm.email.focus();
					return false;
					}
			}
	}
	
	if (document.NewRegisterForm.cust_name.value == "" || document.NewRegisterForm.cust_name.value == null)
	{
		alert("�ͻ���������Ϊ�գ�");
		document.NewRegisterForm.cust_name.focus(); 
		return false;
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
		alert("��ѡ��ͻ�����");
		return false;
	}
	if(document.NewRegisterForm.e_class_id.value=="0")
	{
		alert("��ѡ��ͻ����࣡");
		return false;
	}
	if(document.NewRegisterForm.sort1.value=="")
	{
		alert("��ѡ����Ӫ��ҵ��");
		document.NewRegisterForm.sort1.focus();
		return false;
	}
	document.NewRegisterForm.relation_type_name.value=DWRUtil.getText("relation_type_code");
	return true;
}