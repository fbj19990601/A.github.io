
/**
 * 预警参数类型设置
 */
 function createHtml(type){
   if(type=="" || type==null){
     $("typeA").style.display="none";
     $("typeB").style.display="none";
     $("typeC").style.display="none";
     $("typeD").style.display="none";
   }else{
     if(type=="0"){
       $("typeA").style.display="block";
       $("typeB").style.display="none";
       $("typeC").style.display="none";
       $("typeD").style.display="none";
     }else if(type=="1"){
       $("typeA").style.display="none";
       $("typeB").style.display="block";
       $("typeC").style.display="none";
       $("typeD").style.display="none";
     }else if(type=="2"){
       $("typeA").style.display="none";
       $("typeB").style.display="none";
       $("typeC").style.display="block";
       $("typeD").style.display="none";
     }else if(type=="3"){
       $("typeA").style.display="none";
       $("typeB").style.display="none";
       $("typeC").style.display="none";
       $("typeD").style.display="block";
     }
   }
 }
 
 function  setPosition(house_id){
		   var cust_id=document.getElementById("cust_id").value;
		   $("param_value").value=house_id+"|h";
		   WareHousePosInfo.getOnePosByHouseId(cust_id,house_id,function(data){
		      DWRUtil.removeAllOptions("posit_name");
		      DWRUtil.addOptions("posit_name",data);
		   }) 
		 }
 
function setParamValue(posit_id){
	$("param_value").value=posit_id+"|p";
}
