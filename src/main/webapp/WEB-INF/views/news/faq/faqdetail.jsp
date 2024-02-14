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
							<h2>FAQ</h2>
						</div>
					</div>
					<div class="cont_text_wrap">
						<div class="cont_text cont_list_map">
							<ul>
								<li>홈</li>
								<li>나무소식</li>
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
							<b>${faq.question}</b>
						</div>
					</div>
					<div class="cont_text_wrap">
						<div class="cont_text">${faq.userId} ${faq.postDate} </div>
					</div>
					</div>
					</div>
					</div>
					</div>
		<form action="/boardWrite">
		<div>			<hr>
			<div class="contentbox">${faq.answer}</div>
			
			</div>
			</form>
			
							<hr><br>
			<%@ include file="/WEB-INF/views/footer/footer.jsp"%>
</body>
</html>