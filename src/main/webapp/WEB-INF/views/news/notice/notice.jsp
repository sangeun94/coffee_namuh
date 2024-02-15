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
</head>
<body>
	<%@ include file="/WEB-INF/views/header/header.jsp"%>
	<div class="cont_wrap bbs_wrap">
		<div class="cont">
			<div class="cont_box cont_head">
				<div class="cont_boxs">
					<div class="cont_title_wrap">
						<div class="cont_title_info">NAMUH NEWS</div>
						<div class="cont_title robo">
							<h2>NAMUH NOTICE</h2>
						</div>
					</div>
					<div class="cont_text_wrap">
						<div class="cont_text cont_list_map">
							<ul>
								<li>홈</li>
								<li>나무소식</li>
								<li>공지사항</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="cont_box brand01">
				<div class="cont_boxs text_center">
					<div class="cont_title_wrap">
						<div class="cont_title">
							<b>커피나무 공지사항 </b>
						</div>
					</div>
					<div class="cont_text_wrap">
						<div class="cont_text">커피나무 소식을 알려드립니다.</div>
					</div>
					<div class="cont_text_wrap">
						<div class="cont_list cont_list_content cont_list_content_search">
							<ul>
								<li>
									<div class="board_search_wrap">
										<div class="board_search">
											<form>
												<input type="hidden" name="bbs_category" id="bbs_category"
													value="1"> <input type="hidden"
													name="bbs_detail_category" id="bbs_detail_category"
													value="">
												<ul>
													<li class="board_search_select">
														<div class="input_select_wrap input_wrap2">
															<select name="bbs_search_category"
																id="bbs_search_category">
																<option value="bbs_tbl_title">제목</option>
																<option value="bbs_tbl_content">내용</option>
																<option value="bbs_tbl_name">작성자</option>
															</select>
														</div>
													</li>
													<li>
														<div class="input_text_wrap input_wrap2">
															<label> <input type="text" name="bbs_search"
																id="bbs_search" class="" value=""
																placeholder="검색어를 입력하세요" required="required">
															</label>
														</div>
													</li>
													<li class="board_search_btn">
														<div class="input_btn_wrap1 input_wrap2">
															<input type="submit" value="검색" class="btn btn1" id="">
														</div>
													</li>
												</ul>
											</form>
										</div>
									</div>
								</li>
								<li style="text-align: right"></li>
							</ul>
						</div>
					</div>
					<div class="cont_text_wrap">
						<div class="board_list">
							<table>
								<colgroup>
									<col class="board_w75 board_pc">
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
									<tr>

										<c:forEach var="announceList" items="${announcementList}">
											<tr>
												<td class="board_pc">${announceList.announcementNumber}</td>
												<td>
													<div class="text_wrap">
														<div class="text">
															<a href="/noticedetail/${announceList.announcementNumber}">${announceList.title}</a>
														</div>
													</div>
												</td>
												<td class="board_pc">${announceList.userId}</td>
												
												                  <td>
                     <!-- parseDate를 사용하여 문자열을 날짜 객체로 변환 -->
                  <fmt:parseDate value="${announceList.postDate}" pattern="yyyy-MM-dd HH:mm:ss" var="parsedDate"/>
                  <fmt:formatDate value="${parsedDate}" pattern="yy-MM-dd" />                                 
                  </td>
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
</body>
</html>