<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Home</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script src="js/jquery-1.11.1.min.js"></script>
</head>

<body>
	<script type="text/javascript">
	
	function ssss(){
		$.ajax({
			url : "/ss",
			dataType : "json",
			type: 'post',
			data : {
				"moviename" : $("#moviename").val(),
				
			},
			success : function(result) {
				alert("成功");
			},
			error : function() {
				alert("error");
			}
		});
	}
	</script>
	
	<input id="moviename"  type="text" name="moviename"/>
	<input  type="submit" onclick="ssss()"/>


	           		



	
</body>
</html>