$(function(){
	$("#stpe1").click(function(){
		var bool=true;
		for(var i=1;i<=5;i++){
			if(!$("#t"+i).val()){
				bool=false;
				$("#t"+i).next().text("不能为空");
			}
			else if($("#t"+i).val()){
				$("#t"+i).next().text("");
			}
		}
		return bool;
	})
})
