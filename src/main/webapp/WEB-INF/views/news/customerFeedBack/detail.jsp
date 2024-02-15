<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>COFFEE NAMUH</title>
    <link rel="shortcut icon" href="../images/favicon-32x32.png"
	type="image/x-icon">
<link href="/css/news.css" rel="stylesheet" type="text/css">
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

.bodybox {
	height: 100px;
}

.titlebox {
	width: 100%;
	height: 100px;
}


.btnntwidth {
	width: 5%;
	font-family: 'Noto Sans kr', sans-serif;
	border: 1px solid #e0e0e0;
	font-weight: 400;
	font-size: 12px;
	text-align: center;
	padding: 0px 20px;
	height: 100%;
	font-weight: 500;
	cursor: pointer;
	font-weight: 500;
	transition: All 0.2s ease;
	-webkit-transition: All 0.2s ease;
	-o-transition: All 0.2s ease;
	-ms-transition: All 0.2s ease;
	overflow: hidden;
}

.btnwd5 {
	width: 40%;
	font-family: 'Noto Sans kr', sans-serif;
	border: 1px solid #e0e0e0;
	font-weight: 400;
	font-size: 12px;
	text-align: center;
	padding: 0px 20px;
	height: 100%;
	font-weight: 500;
	cursor: pointer;
	font-weight: 500;
	transition: All 0.2s ease;
	-webkit-transition: All 0.2s ease;
	-o-transition: All 0.2s ease;
	-ms-transition: All 0.2s ease;
	overflow: hidden;
}

textarea {
	overflow: hidden;
	height: 45px;
	resize: none;
}

.input_text_wrap1 {
	position: relative;
	width: 95%;
	display: inline-block;
	font-size: 16px;
}

.li_left {
	float: left;
}
.board_pc{
width:100%;
border-top: 1px solid rgba(0,0,0,0.1);
}
.pdding{
padding: 30px
px
 70px !important;
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/header/header.jsp"%>

	<div class="bodybox"></div>

	<div class="cont_wrap bbs_wrap">
		<div class="cont">
			<div class="cont_box cont_head">
				<div class="cont_boxs">
					<div class="cont_title_wrap">
						<div class="cont_title_info">NAMUH NEWS</div>
						<div class="cont_title robo">
							<h2>FAQ</h2>
						</div>
					</div>
					<div class="cont_text_wrap">
						<div class="cont_text cont_list_map">
							<ul>
								<li>홈</li>
								<li>나무소식</li>
								<li>1:1 상담</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<!-- 게시판 시작 -->
			<div class="cont_box brand01">
				<div class="cont_boxsr">
					<div class="cont_title_wrap">
						<div class="board_detail_title">
							<h1>${feedback.title}<br></h1>
							<div class="board_detail_title_info">
								<div class="float_right">
									<span>구분 질문</span>
									<span>작성자 ${feedback.userId}</span>
									<span>작성일 ${feedback.feedbackDate}</span>
								</div>
							</div>
						</div>
						
					</div>
				
				</div>
			</div>
		</div>
	</div>
	
		<div class="board_detail_text_wrap">
			
			<div class="board_detail_text"><span>${feedback.content}</span></div>
			
	<div class="input_btn_wrap input_wrap2">
    <!-- 삭제 버튼 -->
    <c:set var="isAuthor" value="${feedback.userId eq loggedInUserId}" />
<c:if test="${isAuthor}">
    <div class="input_btn_wrap input_wrap2">
        <button class="btnwd5 btn1" onclick="location.href='/boardDelete/${feedback.feedbackNumber}'">삭제</button>
        <button class="btnwd5 btn1" onclick="location.href='/boardUpdate/${feedback.feedbackNumber}'">수정</button>
    </div>
</c:if>
</div>
		</div>
		<!-- 게시판끝 밑은 댓글 -->
	
	<div class="cont_text_wrap">
		<div class="board_list">
			<table>
				<tbody>
					 <c:forEach var="response" items="${responseList}">
						<tr>
							<td class="board_pc"><h3>관리자의 답변</h3></td>
							</tr>
							<tr>
							<td class="pdding">
								<div class="text_wrap">
									<div class="text ">
									<span>${response.responseContent}</span><br>
									<div class="board_detail_title_info">
								<div class="float_right">
									
									<span>작성자 : Admin</span>
							<span><fmt:parseDate value="${response.responseDate}"
													pattern="yyyy-MM-dd HH:mm:ss" var="parsedDate" /> <fmt:formatDate
													value="${parsedDate}" pattern="yy-MM-dd" /></span>
								</div>
							</div>
										
									</div>
								</div>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>


	<%@ include file="/WEB-INF/views/footer/footer.jsp"%>
	<

	<script>
   
</script>
</body>
</html>