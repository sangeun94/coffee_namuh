<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" type="text/css" href="/mainhome/mainhome.css">
  
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function () {
            var $html = $("html, body");
            var page = 1;

            $(window).on("wheel", function (e) {
                e.preventDefault();

                if ($html.is(":animated")) return;

                if (e.originalEvent.deltaY > 0) {
                    if (page == $(".content").length) return;
                    page++;
                } else if (e.originalEvent.deltaY < 0) {
                    if (page == 1) return;
                    page--;
                }

                var posTop = (page - 1) * $(window).height();
                $html.animate({scrollTop: posTop}, 800); // Adjust the animation speed if needed
            });
        });
        
    </script>
</head>
<body>
<%@ include file="/WEB-INF/views/header/header.jsp"%>

<div class="content"style="margin-top: 50px"><img src="/images/notice/20210201112150.jpg"></div>
<div class="content"><img src="/images/notice/mqdefault.jpg"></div>
<div class="content"><img src="/images/notice/IMG_2019.jpg"></div>
<div class="content"><img src="/images/notice/20210201112030.jpg"></div>
<div class="content"><img src="/images/notice/coding1.jpg"></div>
<div class="content"><img src="/images/notice/coding2.jpg"></div>
<div class="content"><h1>7</h1></div>

<div class="chap_list_wrap robo">
		<ul>
			<li class="chap_list on">
				<span></span>
				<div class="chap_list_wrap_title">
					MAIN
				</div>
			</li>
			<li class="chap_list">
				<span></span>
				<div class="chap_list_wrap_title">
					MENU
				</div>
			</li>
			<li class="chap_list">
				<span></span>
				<div class="chap_list_wrap_title">
					FRANCHISE
				</div>
			</li>
			<li class="chap_list">
				<span></span>
				<div class="chap_list_wrap_title">
					MEGA
				</div>
			</li>
			<li class="chap_list">
				<span></span>
				<div class="chap_list_wrap_title">
					EVENT
				</div>
			</li>
		</ul>
	</div>
</body>
</html>