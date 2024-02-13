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
	        *{
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        }

		.bodybox {
			height: 100px;
		}

		.titlebox{
			width: 100%;
			height: 100px;
		}
		.contentbox{
			width:100%;
			height: 400px
		}
		 .btnntwidth{width:5%;font-family:'Noto Sans kr',sans-serif; border:1px solid #e0e0e0; font-weight:400; font-size:12px; text-align:center; padding:0px 20px; height:100%; font-weight:500; cursor:pointer; font-weight:500; transition:All 0.2s ease; -webkit-transition:All 0.2s ease; -o-transition:All 0.2s ease; -ms-transition:All 0.2s ease; overflow:hidden;}
		 .btnwd5{width:50%;font-family:'Noto Sans kr',sans-serif; border:1px solid #e0e0e0; font-weight:400; font-size:12px; text-align:center; padding:0px 20px; height:100%; font-weight:500; cursor:pointer; font-weight:500; transition:All 0.2s ease; -webkit-transition:All 0.2s ease; -o-transition:All 0.2s ease; -ms-transition:All 0.2s ease; overflow:hidden;}
		 
		 textarea{
                    overflow:hidden;
					height:45px; 
					resize: none;
				}
				.input_text_wrap1{position:relative;width:95%; display:inline-block; font-size:16px;}
		.li_left{
		float:left;
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
						<div class="cont_title robo color">
							<h2>NAMUH</h2>
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
							<b>${announcement.title}</b>
						</div>
					</div>
					<div class="cont_text_wrap">
						<div class="cont_text">${announcement.userId} ${announcement.postDate} </div>
					</div>
					</div>
					</div>
					</div>
					</div>
		<form action="/boardWrite">
		<div>			<hr>
			<div class="contentbox">${announcement.content}</div>
			<hr>
			<div class="input_btn_wrap input_wrap2">
		<%-- 	<button class="btnwd5 btn1 float_right" onclick="location.href='/boardDelete/${faq.feedbackNumber}'">삭제</button>
			<button class="btnwd5 btn1 float_right" onclick="location.href='/boardUpdate/${faq.feedbackNumber}'">수정</button> --%>
			</div>
			</div>
			</form>
			<hr>
			<div class="cont_list cont_list_content cont_list_content_search">
								<form action="/boardWrite" method="post">
									<ul>
										<li>
											<div class="board_search_wrap">
											<li><textarea name="content" id="bbs_search"  rows="" cols="" name="content" class="input_text_wrap1 li_left" placeholder="내용을 입력해주세요."></textarea></li>
											
												<div class="board_search">
													<li class="board_search_btn">
														<div class="input_btn_wrap input_wrap2">
														
															<input type="submit" value="글쓰기"
																class="btnntwidth btn1 float_right" id="writeButton">
														</div>

													</li>
												</div>
											</div>
										</li>
									</ul>
								</form>
							</div>
							<hr><br>
			<%@ include file="/WEB-INF/views/footer/footer.jsp"%>
</body>
</html>