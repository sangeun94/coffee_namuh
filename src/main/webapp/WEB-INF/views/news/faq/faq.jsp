<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link href="/css/news.css" rel="stylesheet" type="text/css">
	
</head>
<body>
	<%@ include file="/WEB-INF/views/header/header.jsp" %>
	<div class="cont_wrap bbs_wrap">
		<div class="cont">
			<div class="cont_box cont_head">
				<div class="cont_boxs">
					<div class="cont_title_wrap">
						<div class="cont_title_info">
							MEGA NEWS						</div>
						<div class="cont_title robo color">
							<h2>FAQ</h2>
						</div>
					</div>
					<div class="cont_text_wrap">
						<div class="cont_text cont_list_map">
							<ul>
								<li>
									홈
								</li>
								<li>
									메가소식								</li>
								<li>
									FAQ								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="cont_box brand01">
				<div class="cont_boxs text_center">
					<div class="cont_title_wrap">
														<div class="cont_title">
									<b>자주하는 질문
</b>
								</div>
											</div>
												<div class="cont_text_wrap">
								<div class="cont_text">
									궁금하신 내용을 검색해 주세요.
								</div>
							</div>
										<div class="cont_text_wrap">
														<div class="cont_tab">
									<ul>
										<li>
											<a href="?bbs_category=4">
												전체
											</a>
										</li>
																					<li class="cont_tab5">
												<a href="?bbs_category=4&bbs_detail_category=5">
													가맹문의												</a>
											</li>
																					<li class="cont_tab6">
												<a href="?bbs_category=4&bbs_detail_category=6">
													매장정보												</a>
											</li>
				
																					<li class="cont_tab7">
												<a href="?bbs_category=4&bbs_detail_category=10">
													고객의 소리												</a>
											</li>
																			</ul>
								</div>
												<div class="cont_list cont_list_content cont_list_content_search">
							<ul>
								<li>
									<div class="board_search_wrap">
										<div class="board_search">
											<form>
												<input type="hidden" name="bbs_category" id="bbs_category" value="4">
												<input type="hidden" name="bbs_detail_category" id="bbs_detail_category" value="">
												<ul>
													<li class="board_search_select">
														<div class="input_select_wrap input_wrap2">
															<select name="bbs_search_category" id="bbs_search_category">
																<option value="bbs_tbl_title">제목</option>
																<option value="bbs_tbl_content">내용</option>
																<option value="bbs_tbl_name">작성자</option>
															</select>
														</div>
													</li>
													<li>
														<div class="input_text_wrap input_wrap2">
															<label>
																<input type="text" name="bbs_search" id="bbs_search" class="" value="" placeholder="검색어를 입력하세요" required="required">
															</label>
														</div>
													</li>
													<li class="board_search_btn">
														<div class="input_btn_wrap input_wrap2">
															<input type="submit" value="검색" class="btn btn1" id="">
														</div>
													</li>
												</ul>
											</form>
										</div>
									</div>
								</li>
								<li style="text-align:right">
								</li>
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
												<th class="board_pc">
													번호
												</th>
												<th>
													제목
												</th>
												<th class="board_pc">
													글쓴이
												</th>
												<th>
													날짜
												</th>
												<th class="board_pc">
													조회
												</th>
											</tr>
										</thead>
										<tbody>
																							<tr>
													<td class="board_pc">공지</td>
													<td>
														<div class="text_wrap">
															<div class="text">
																<a href="detail/?bbs_idx=181&bbs_category=4&bbs_page=1">
																	<em>
																		[고객센터] 9월 1일부터 인상되는 디저트 가격이 어떻게 되나요?																	</em>
																</a>
															</div>
														</div>
													</td>
													<td class="board_pc"> 메가MGC커피</td>
													<td>2022-08-30</td>
													<td class="board_pc">672</td>
												</tr>
																																				<tr>
															<td class="board_pc">36</td>
															<td>
																<div class="text_wrap">
																	<div class="text">
																		<a href="detail/?bbs_idx=177&bbs_category=4&bbs_detail_category=&bbs_page=1">
																			<em>
																				[고객센터] 고객센터 운영시간이 어떻게 되나요?																			</em>
																		</a>
																																			</div>
																</div>
															</td>
															<td class="board_pc">메가MGC커피</td>
															<td>2022-07-01</td>
															<td class="board_pc">463</td>
														</tr>
																									<tr>
															<td class="board_pc">35</td>
															<td>
																<div class="text_wrap">
																	<div class="text">
																		<a href="detail/?bbs_idx=176&bbs_category=4&bbs_detail_category=&bbs_page=1">
																			<em>
																				[고객센터] 고객의 소리 접수는 어떻게 하나요?																			</em>
																		</a>
																																			</div>
																</div>
															</td>
															<td class="board_pc">메가MGC커피</td>
															<td>2022-07-01</td>
															<td class="board_pc">632</td>
														</tr>
																									<tr>
															<td class="board_pc">34</td>
															<td>
																<div class="text_wrap">
																	<div class="text">
																		<a href="detail/?bbs_idx=175&bbs_category=4&bbs_detail_category=&bbs_page=1">
																			<em>
																				[모바일쿠폰] 음료 쿠폰 선물을 받았는데 메뉴 변경이 가능한가요?																			</em>
																		</a>
																																			</div>
																</div>
															</td>
															<td class="board_pc">메가MGC커피</td>
															<td>2022-07-01</td>
															<td class="board_pc">536</td>
														</tr>
																									<tr>
															<td class="board_pc">33</td>
															<td>
																<div class="text_wrap">
																	<div class="text">
																		<a href="detail/?bbs_idx=174&bbs_category=4&bbs_detail_category=&bbs_page=1">
																			<em>
																				[모바일쿠폰] 모바일 쿠폰 이용 시 현금 영수증 발급 가능 한가요?																			</em>
																		</a>
																																			</div>
																</div>
															</td>
															<td class="board_pc">메가MGC커피</td>
															<td>2022-07-01</td>
															<td class="board_pc">503</td>
														</tr>
																									<tr>
															<td class="board_pc">32</td>
															<td>
																<div class="text_wrap">
																	<div class="text">
																		<a href="detail/?bbs_idx=173&bbs_category=4&bbs_detail_category=&bbs_page=1">
																			<em>
																				[모바일쿠폰] 쿠폰 내 잔액 확인을 원하는데 확인 가능 한가요?																			</em>
																		</a>
																																			</div>
																</div>
															</td>
															<td class="board_pc">메가MGC커피</td>
															<td>2022-07-01</td>
															<td class="board_pc">433</td>
														</tr>
																									<tr>
															<td class="board_pc">31</td>
															<td>
																<div class="text_wrap">
																	<div class="text">
																		<a href="detail/?bbs_idx=172&bbs_category=4&bbs_detail_category=&bbs_page=1">
																			<em>
																				[모바일쿠폰] 쿠폰의 유효기간을 연장하고 싶은데 가능한가요?																			</em>
																		</a>
																																			</div>
																</div>
															</td>
															<td class="board_pc">메가MGC커피</td>
															<td>2022-07-01</td>
															<td class="board_pc">424</td>
														</tr>
																									<tr>
															<td class="board_pc">30</td>
															<td>
																<div class="text_wrap">
																	<div class="text">
																		<a href="detail/?bbs_idx=171&bbs_category=4&bbs_detail_category=&bbs_page=1">
																			<em>
																				[모바일쿠폰] 매장에서 쿠폰사용을 거부당했습니다. 사용 가능한가요?																			</em>
																		</a>
																																			</div>
																</div>
															</td>
															<td class="board_pc"> 메가MGC커피 </td>
															<td>2022-07-01</td>
															<td class="board_pc">503</td>
														</tr>
																									<tr>
															<td class="board_pc">29</td>
															<td>
																<div class="text_wrap">
																	<div class="text">
																		<a href="detail/?bbs_idx=170&bbs_category=4&bbs_detail_category=&bbs_page=1">
																			<em>
																				[무료쿠폰] 스탬프 쿠폰이 발급 되지 않는데 확인 가능한가요?																			</em>
																		</a>
																																			</div>
																</div>
															</td>
															<td class="board_pc">메가MGC커피</td>
															<td>2022-07-01</td>
															<td class="board_pc">322</td>
														</tr>
																									<tr>
															<td class="board_pc">28</td>
															<td>
																<div class="text_wrap">
																	<div class="text">
																		<a href="detail/?bbs_idx=169&bbs_category=4&bbs_detail_category=&bbs_page=1">
																			<em>
																				[무료쿠폰] 쿠폰 유효기간 만료 전 알림을 받을 수있나요?																			</em>
																		</a>
																																			</div>
																</div>
															</td>
															<td class="board_pc">메가MGC커피</td>
															<td>2022-07-01</td>
															<td class="board_pc">328</td>
														</tr>
																									<tr>
															<td class="board_pc">27</td>
															<td>
																<div class="text_wrap">
																	<div class="text">
																		<a href="detail/?bbs_idx=168&bbs_category=4&bbs_detail_category=&bbs_page=1">
																			<em>
																				[무료쿠폰] 디저트 구매도 가능한가요?																			</em>
																		</a>
																																			</div>
																</div>
															</td>
															<td class="board_pc"> 메가커피 </td>
															<td>2022-07-01</td>
															<td class="board_pc">331</td>
														</tr>
																					</tbody>
									</table>
								</div>
												<div class="board_page_wrap">
							<div class="board_page">
								<ul>
									<li class='fo_re'><a><span>처음</span></a></li>
									<li class='board_page_check'><a><span>1</span></a></li>
									<li><a class='board_page_link' href='?bbs_category=4&bbs_detail_category=&bbs_page=2&&bbs_search_category=&bbs_search='><span>2</span></a></li>
									<li><a class='board_page_link' href='?bbs_category=4&bbs_detail_category=&bbs_page=3&&bbs_search_category=&bbs_search='><span>3</span></a></li>
									<li><a class='board_page_link' href='?bbs_category=4&bbs_detail_category=&bbs_page=4&&bbs_search_category=&bbs_search='><span>4</span></a></li>
									<li><a class='board_page_link' href='?bbs_category=4&bbs_detail_category=&bbs_page=2'&bbs_search_category=&bbs_search='><span>다음</span></a></li>
									<li><a class='board_page_link' href='?bbs_category=4&bbs_detail_category=&bbs_page=4'&bbs_search_category=&bbs_search='><span>마지막</span></a></li>								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/footer/footer.jsp"%>
</body>
</html>