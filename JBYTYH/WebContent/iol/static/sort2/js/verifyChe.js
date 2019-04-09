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
	$("#tj").click(function(){
		var bool=true;
		var i=1;
		for(i;i<4;i++){
			if(!$("#"+i).val()){
				$("#msg"+i).text("不能为空！");
				bool=false;
			}else{
				$("#msg"+i).text("");
			}
		}
		var chk_value = [];
		$('input[name="sele"]:checked').each(function () {
			chk_value.push($(this).val());
		});
		 
		if (chk_value.length < 1) {
			alert("至少选1种方案！")
			bool=false;
		}
		
		if(bool){
			$("#form1").submit();
		}
	})
		
})