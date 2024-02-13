<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/css/news.css" rel="stylesheet" type="text/css">
<style>
  textarea{
                    overflow:hidden;
					height:400px; 
					resize: none;
				}

</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/header/header.jsp"%>
	<div class="cont_wrap bbs_wrap">
		<div class="cont">
			<div class="cont_box cont_head">
				<div class="cont_boxs">
					<div class="cont_title_wrap">
						<div class="cont_title_info">MEGA NEWS</div>
						<div class="cont_title robo color">
							<h2>FAQ</h2>
						</div>
					</div>
					<div class="cont_text_wrap">
						<div class="cont_text cont_list_map">
							<ul>
								<li>홈</li>
								<li>메가소식</li>
								<li>고객의 소리</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="cont_box brand01">
				<div class="cont_boxs text_center">
					<div class="cont_title_wrap">
						<div class="cont_title">
							<b>1:1 질문 </b>
						</div>
					</div>
					<div class="cont_text_wrap">
						<div class="cont_text">궁금하신 내용을 질문해 주세요.</div>
					</div>
					<div class="cont_text_wrap">
						
						<div class="cont_list cont_list_content cont_list_content_search">
						<table>
							<div class="write_board">
							<form action="" method="post">
							<ul>
								<br> <li><input name="title" id="bbs_search_category" type="text" name="title" class="input_select_wrap input_wrap2" placeholder="제목"></li><br>
								<li><textarea name="content" id="bbs_search"  rows="" cols="" name="content" class="input_text_wrap" placeholder="내용을 입력해주세요."></textarea></li>
								<br>
								<div class="input_btn_wrap input_wrap2"><button type="submit" class="btn btn1">글쓰기</button></div>
				
								</form>
								<li style="text-align: right"></li>
								</ul>
						</div>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/footer/footer.jsp"%>
	<script>
		document.getElementById("writeButton").addEventListener("click",
				function() {
					location.href = "/boardWrite";
				});
	</script>
</body>
</html>