<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>COFFEE NAMUH</title>
    <link rel="shortcut icon" href="../images/favicon-32x32.png"
	type="image/x-icon">
    <link rel="stylesheet" type="text/css" href="/css/mainhome.css">
  
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
    $(document).ready(function () {
        var $html = $("html, body");
        var page = 1;

        $(window).on("wheel", function (e) {
            if (e.originalEvent.deltaY === 0) return; // Do nothing if deltaY is zero

            // passive event listener로 변경
            if (e.target === document || e.target === document.documentElement || e.target === document.body) {
                e.preventDefault();
            }

            if ($html.is(":animated")) return;

            if (e.originalEvent.deltaY > 0) {
                if (page == $(".content, .contentft").length) return;
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

<div class="content contentimg"><img src="/images/notice/배경이미지6.png"></div>
<div class="content contentimg"><img src="/images/notice/배경이미지15.png"></div>
<div class="contentft "><%@ include file="/WEB-INF/views/footer/footer.jsp"%></div>


</body>
</html>