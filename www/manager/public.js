//---------��ñ��Ľ���------//
function MakeFocus(current_form) {
       var current_form;
       var temp_obj=current_form;
	   temp_obj.focus();
}
//---------����trim��left��right����------//
function trim_spaces(from_where){
       var temp_string=this;
	   if(arguments.length == 0){
	   from_where = "BOTH";
	   }
	   
	   if(from_where.toUpperCase() == "LEFT" || from_where == "BOTH"){
	          while (temp_string.left(1) == " ")
	             {
				  temp_string = temp_string.substring(1);
	              }
	   }
	   if(from_where.toUpperCase() == "RIGHT" || from_where == "BOTH"){
	          while (temp_string.right(1) == " ")
			     {
	              temp_string = temp_string.substring(0,temp_string.length-2);
	              }
	   
	   }
	   return temp_string;

}
function extract_left(total_chars){
       return this.substring(0,total_chars);

}
function extract_right(total_chars){
       return this.substring(this.length-total_chars)
}
//---------left�����������ȡ�ַ�------//
String.prototype.left = extract_left;
//---------right�������ұ���ȡ�ַ�------//
String.prototype.right = extract_right;
//---------trim��������ȥ���ַ������ߵĿո�------//
String.prototype.trim = trim_spaces;

//---------����ѡ���б��б�ѡ�����������������------//
function get_selections(current_list){
var selected_num=0;
var selected_value = new Array();
for (var counter=0;counter<current_list.options.length;counter++){
       if (current_list.options[counter].selected){
	       selected_value[selected_num]=current_list.options[counter].value;
	       selected_num++;
		   }
       }
	   return selected_value;
}

//---------��������Ƿ�Ϊ��������------//

function its_a_digit(character){
      var digit_characters = "0123456789";
	  if (digit_characters.indexOf(character) ==-1){
	  return false;
	  }
	  else return true;
}
function its_integer(string_value){
      for (var counter=0;counter<string_value.length;counter++){
	  current_char=string_value.charAt(counter);
	  if(!its_a_digit(current_char)){
	  return false;
	  }
	  }
	  return true;
}