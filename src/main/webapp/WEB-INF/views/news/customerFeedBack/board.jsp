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
							<ul>
								<li>
									<div class="board_search_wrap">
										<div class="board_search">
											<form id="writeForm"  action="/boardWrite" method="get">
												<input type="hidden" name="bbs_category" id="bbs_category"
													value="4"> <input type="hidden"
													name="bbs_detail_category" id="bbs_detail_category"
													value="10">
												<ul>
											

													<li class="board_search_btn">
														<div class="input_btn_wrap input_wrap2">
															<input type="submit" value="글쓰기"
																class="btn btn1 float_right" id="writeButton">
														</div>

													</li>
												</ul>
											</form>
										</div>
									</div>
								</li>
								<li style="text-align: left;"></li>
							</ul>
						</div>
					</div>
					<div class="cont_text_wrap">
						<div class="board_list">
							<table>
								<colgroup>
									<col class="board_w75 board_pc">
									<col>
									<col class="board_w150 board_pc">
									<col class="board_w100">
									<col class="board_w100 board_pc">
								</colgroup>
								<thead>
									<tr>
										<th class="board_pc">번호</th>
										<th>제목</th>
										<th class="board_pc">글쓴이</th>
										<th>날짜</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="list" items="${boardList}">
										<tr>
											<td class="board_pc">${list.feedbackNumber}</td>
											<td>
												<div class="text_wrap">
													<div class="text">
														<a href="/detail/${list.feedbackNumber}">${list.title}</a>
													</div>
												</div>
											</td>
											<td class="board_pc">${list.userId}</td>
											<td class="board_pc">${list.feedbackDate}</td>
										</tr>
									</c:forEach>

								</tbody>
							</table>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>
	
	<%@ include file="/WEB-INF/views/footer/footer.jsp"%>
	<script>
    document.getElementById("writeButton").addEventListener("click", function(event) {
    	event.preventDefault(); // 기본 동작 방지
        document.getElementById("writeForm").submit(); // form 제출
    });
</script>
</body>
</html>