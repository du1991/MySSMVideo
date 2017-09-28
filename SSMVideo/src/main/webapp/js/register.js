$(function(){
	
	//聚焦失焦input
	$('input').eq(0).focus(function(){
		if($(this).val().length==0){
			$(this).parent().next("div").text("支持中文，字母，数字，'-'，'_'的多种组合");
			$(this).parent().next("div").css("color",'#ccc');
		}
	})
	$('input').eq(1).focus(function(){
		if($(this).val().length==0){
		    $(this).parent().next("div").text("建议使用字母、数字和符号两种以上的组合，6-20个字符");
		    $(this).parent().next("div").css("color",'#ccc');
		}
	})
	$('input').eq(2).focus(function(){
		if($(this).val().length==0){
			$(this).parent().next("div").text("请再次输入密码");
			$(this).parent().next("div").css("color",'#ccc');
		}
	})

	$('input').eq(3).focus(function(){	
		if($(this).val().length==0){
			$(this).parent().next().next("div").text("看不清？点击图片更换验证码");
			$(this).parent().next().next("div").css("color",'#ccc');
		}
	})
	
	//用户名：
	$('input').eq(0).blur(function(){
		if($(this).val().length==0){
			$(this).parent().next("div").text("");
		}else if($(this).val().length>0 && $(this).val().length<4){
			$(this).parent().next("div").text("长度只能在4-20个字符之间");
			$(this).parent().next("div").css("color",'red');
		}else if($(this).val().length>=4&& !isNaN($(this).val())){
			$(this).parent().next("div").text("用户名不能为纯数字");
			$(this).parent().next("div").css("color",'red');
		}
		else{
		var a = $(this).val();
		$.ajax({
			url : "/registValidate",
			dataType : "json",
			
			
			success : function(result) {
				for(var i=0;i<result.length;i++){
					if(a==result[i].username){
						$("#username_msg").text("该用户名已被注册");
						$("#username_msg").css("color",'red');
						return;
					}
				}
				$("#username_msg").text("");
				
			},
			error : function() {
				alert("error");
			}
		});
		}
		
	})
	
	//密码
	$('input').eq(1).blur(function(){
		if($(this).val().length==0){
			$(this).parent().next("div").text("");
		}else if($(this).val().length>0 && $(this).val().length<6){
			$(this).parent().next("div").text("长度只能在6-20个字符之间");
			$(this).parent().next("div").css("color",'red');
		}else{
			$(this).parent().next("div").text("");
		}		
	})
	
	//	确认密码
	$('input').eq(2).blur(function(){
		if($(this).val().length==0){
			$(this).parent().next("div").text("");
		}else if($(this).val()!=$('input').eq(1).val()){
			$(this).parent().next("div").text("两次密码不匹配");
			$(this).parent().next("div").css("color",'red');
		}else{
			$(this).parent().next("div").text("");
		}		
	})

	//	 验证码刷新
	function code(){
		var str="qwertyuiopasdfghjklzxcvbnm1234567890QWERTYUIOPLKJHGFDSAZXCVBNM";
		var str1=0;
		for(var i=0; i<5;i++){
			str1+=str.charAt(Math.floor(Math.random()*62));
		}
		str1=str1.substring(1);
		$("#code").text(str1);
	}
	code();
	
	
	$("#code").click(code);	
	
	//	验证码验证
	$('input').eq(3).blur(function(){
		if($(this).val().length==0){
			$(this).parent().next().next("div").text("");
		}else if($(this).val().toUpperCase()!=$("#code").text().toUpperCase()){
			$(this).parent().next().next("div").text("验证码不正确");
			$(this).parent().next().next("div").css("color",'red');
		}else{
			$(this).parent().next().next("div").text("");
		}		
	})
	
	//	提交按钮
	$("#submit_btn").click(function(e){
		
		for(var j=0 ;j<4;j++){
			if($('input').eq(j).val().length==0){				
				$('input').eq(j).focus();
				if(j==3){
					$('input').eq(j).parent().next().next("div").text("此处不能为空");
					$('input').eq(j).parent().next().next("div").css("color",'red');
					e.preventDefault();
					return;
				}
				$('input').eq(j).parent().next("div").text("此处不能为空");
				$('input').eq(j).parent().next("div").css("color",'red');	
				e.preventDefault();
				return;
			}			
		}
		
		//协议
		if($("#xieyi")[0].checked==false){
			$("#xieyi").next().next().next("div").text("请勾选协议");
			$("#xieyi").next().next().next("div").css("color",'red');
			e.preventDefault();
			return;
		}
		//两次密码不匹配，不能点击提交
		if($("#pd").val()!=$("#rpd").val()){
			e.preventDefault();
			return;
		}		
		//验证码不匹配，不能点击提交
		if($("#vcode").val().toUpperCase()!=$("#code").text().toUpperCase()){
			e.preventDefault();
			return;
		}
		//名字重复不能提交
		if($("#username_msg").text().val()>0){
			e.preventDefault();
			return;
		}
	})

})
