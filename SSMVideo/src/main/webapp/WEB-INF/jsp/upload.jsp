<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@	taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html >

<head>
<title>Home</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/bootstrap.min.css" rel='stylesheet' type='text/css'
	media="all" />
<link href="css/dashboard.css" rel="stylesheet">
<link href="css/style.css" rel='stylesheet' type='text/css' media="all" />
<script src="js/jquery-1.11.1.min.js"></script>
</head>

<body >
<div style="height: 800px">

	 <nav class="navbar navbar-inverse navbar-fixed-top " role="navigation" style="height: 10%;opacity:0.8;" >
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="/home"><h1>
						<img src="images/logo.png" alt="" />
					</h1></a>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<div class="header-top-right">
					<div class="file">
						<c:if test="${!empty su }">
						上传成功！
						</c:if>						
						<c:if test="${!empty sessionScope}">
							<a href="myUpload">我的上传</a>
						</c:if>
						<c:if test="${!empty sessionScope}">
							<a href="upload">上传</a>
						</c:if>
						<c:if test="${empty sessionScope}">
							<a onclick="pleaseupload()">上传</a>
						</c:if>
					</div>
					<div class="signin">
						<c:if test="${empty sessionScope}">
							<a href="#small-dialog2" class="play-icon popup-with-zoom-anim"
								id="register">注册</a>
						</c:if>
						<c:if test="${!empty sessionScope}">
							<a id="loginout" href="logout">退出</a>
						</c:if>
						<link href="css/popuo-box.css" rel="stylesheet" type="text/css"
							media="all" />
						<script src="js/jquery.magnific-popup.js" type="text/javascript"></script>						
						<script>
							$(document).ready(function() {
								$('.popup-with-zoom-anim').magnificPopup({
									type : 'inline',
									fixedContentPos : false,
									fixedBgPos : true,
									overflowY : 'auto',
									closeBtnInside : true,
									preloader : false,
									midClick : true,
									removalDelay : 300,
									mainClass : 'my-mfp-zoom-in'
								});
							});
						</script>
						<script type="text/javascript">
							function pleaseupload() {
								alert("请先登陆！")
							}
							function login() {
								$.ajax({
									url : "/login",
									dataType : "json",
									data : {
										"username" : $("#username").val(),
										"password" : $("#password").val(),
									},
									success : function(result) {
										if (result.tr) {
											window.location = "/home";
										} else {
											$("#error").html("用户或者密码错误！")
													.show();
										}
									},
									error : function() {
										alert("error");
									}
								});
							}
						</script>
					</div>
					<div class="signin">
						<c:if test="${empty sessionScope}">
							<a href="#small-dialog" class="play-icon popup-with-zoom-anim">登录</a>
						</c:if>

						<div id="small-dialog" class="mfp-hide">
							<h3>登录</h3>
							<div class="social-sits">
								<img src="/images/gm1.jpg">
							</div>
							<div class="signup">
								<p id=error style="color: red; height: 20px"></p>
								<input type="text" class="email" id="username" name="username" />
								<input type="password" id="password" name="password" /> 
								<input type="button" value="登录" onclick="login()" id="login" />
							</div>
							<div class="clearfix"></div>
						</div>
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
			<div class="clearfix"></div>
		</div>
	</nav>
	<!-- <script type="text/javascript">
		function handleFile(){
			
		}
	</script> -->
		<!--中间板块  -->
		<div  style="margin-top: 100px;background:url(/images/bizi.jpg) no-repeat 60% 30%;background-size:cover;height: 85%" >
		    <div  style="padding-left: 20%;padding-top: 50px">
		    
		            <div class="form-group "  style="font-size: 15px">
		            <p>	
		           <c:if test="${success=='1'}">
		            <script type="text/javascript">
		            		$(function(){
		            				alert("上传成功");
		            		})
		            </script>
					</c:if>
						</p>
		            	<form  action="uploadfile" method="post" enctype="multipart/form-data" >		           		
		            		<div style="height:20px;width:400px;background-color:white"><div id="progress" style="height:100%;width:1px;background-color:green;"></div></div>	            
		            		<div id="progressbar"> 0%</div>
		            		<p>
							<input type="text" disabled="disabled" value="请选择视频文件" id="fileName" style=" color: #CCCCCC; ">
							<input type="file" name="file" onchange="handleFile()" id="filemovie" style="color: transparent;float:none;font-size:20px;width:100px" /> 
						</p>                     	
                       	<p >视频名称：
                       	  <input id="url" name="moviename" type="text" style="height:30px;width:200px;font-size: 13px;color: #ADADAD ;" maxlength="10" class="inputstyle keywords form-control" />
                       	</p>                     	
                      	<p>
						      <label >主要类型：</label>
					       		     <select onchange="chg1();" id="province" name="movietypehead">
											
											<option value="0" >电影</option>
											<option value="1">体育</option>
											<option value="2" selected="selected">MV</option>
											<option value="3"  >TV</option>
											<option value="4">新闻</option>
									</select>
						</p>
						<p >
						     <label >详细类型：</label>
						                <select id="city" name="movietypedetail">
											<option >MV</option>
										</select>
						</p>				
						<div style="text-align:center;width:75px" class="btn-group form-group" data-toggle="buttons"  >
						
						
						<p style="vertical-align:top;">
						    <span >电影描述：</span>
						</p>
						<p>
						   <textarea name="introduction"></textarea>
                       	</p>
						<p>
							  <input id="confirmUpload" type="submit" value="点击提交" style="font-size:14px;width:70px">
						</p>	 
                       	
                       
				       </div></form>  	
						
				      </div> 
                 
			</div>	
		</div>
<div style="background:#fff7fb; width: 100%;margin-top:40px ;height: 15%;" >
				
					
						<div class="divCSS"  style="text-align: center;padding-top: 20px;font-size: 20px;font-family: serif;">
							
							<a href="#" >关于</a>
					        <a href="#" style="margin-left: 10px">版权</a>
							<a href="#" style="margin-left: 10px">广告</a>
							<a href="#" style="margin-left: 10px">开发者</a>
							<hr style="color: red;" >
						</div>
		</div>
	</div>
  </body>
  <script>
  $(function(){
  $("#confirmUpload").click(function(event) {
	   
	//循环查看状态
	   var t = setInterval(function(){	
		   console.log("进度条");
	               $.ajax({
	                    url: 'UploadProgressHandle',
	                    type: 'POST',		                   
	                    dataType : "json",	        		  
              success: function (result) {	                        
                 if(result.progress!=0){   	 
                $("#progressbar").text(Math.floor(((result.progress)*100)/(result.totalSize))+"%");  
                 $("#progress").css("width",(((result.progress)*100)/(result.totalSize)+"%"));
                 }
                 else{
                	 $("#progressbar").text("正在解析文件，请等待...").css("color","red"); 
                 }
             },
	                     error: function(){
	                    	 console.log("Progress error...");
	                   }
          });
      }, 1000);		 
		
		
	
	
	
		
	});
  })

</script>	
<script>
	var cities;
	$(function(){
		cities=[
		           ["喜剧","科幻","动作","恐怖"],
		           ["足球","篮球","羽毛球","乒乓球"],
		           ["MV"],
		           ["TV"],
		           ["新闻"],
		           ];
	})

	function chg1(){
		$("#city option").remove();
		$("#city").val("<option>请选择</option>");
		var newobjects= cities[$("#province").val()];
		for(var i=0;i<newobjects.length;i++){
			$("#city").append("<option value='"+newobjects[i]+"'>"+newobjects[i]+"</option>");
		}
	}
</script>

<script>
        function handleFile(){
        	$("#uploadmsg").hide();
        	$("#progressbar").text("0%");
		     $("#progress").css("width","1px"); 
            $("#fileName").val($("#filemovie").val());
            var reg = /[^\\\/]*[\\\/]+/g; //匹配文件的名称和后缀的正则表达式
		    var name = $("#fileName").val().replace(reg, '');
		    var postfix = /\.[^\.]+/.exec(name);//获取文件的后缀
		    var text =name.substr(0,postfix['index']);//参考网址：http://www.jb51.net/article/66470.htm
			$("#url").val(text);
        }
</script>

<style type="text/css">
			.divCSS a{
			color: #BEBEBE;	
			}
</style>

</html>