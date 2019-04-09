$(document).ready(function(){
	$("[name='allSel']").click(function(){
		if($(this).is(':checked')){
			$("[name='sele']").attr('checked',true);
		}else{
			$("[name='sele']").attr('checked',false);
		}
	})
	
	$("[name='sele']").click(function(){
		var allSel=false;
		$("[name='sele']").each(function(){
			if(!$(this).is(':checked')){
				allSel=true;
			}
		})
		if(allSel){
			$("[name='allSel']").attr('checked',false);
		}else{
			$("[name='allSel']").attr('checked',true);
		}
	})
	
	//提交
	$("#ttj").click(function(){
		var bool=true;
		var chk_value = [];
		$('input[name="sele"]:checked').each(function () {
			chk_value.push($(this).val());
		});
		 
		if (chk_value.length < 1) {
			alert("至少选1种方案！")
			return false;
		}
		return true;
	})
		
})