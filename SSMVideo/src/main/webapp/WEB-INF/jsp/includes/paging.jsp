<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>


						<script>
							//分页
							$("#page").paging({
								pageNo : 4,
								totalPage : 10,
								totalSize : 300,
								callback : function(num) {
									alert(num)
								}
							})
						</script>
						<div id="page" class="page_div">sss</div>