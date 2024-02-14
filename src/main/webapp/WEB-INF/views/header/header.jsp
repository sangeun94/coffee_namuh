<%@page import="com.cafeapp.dto.user.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        *{
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        }

		   .header_tt {
			   word-break: keep-all;
			   font-size: 16px;
			   color: #1c1c1b;
		   }

               /* all */
			   a, a:link, a:focus{text-decoration:none; color:inherit; cursor:pointer;}
			   img{border:0; max-width:100%; vertical-align:middle; image-rendering:-webkit-optimize-contrast;}
			   .float_right{float:right;}
			   .underline{text-decoration:underline;}
			   .fa, .fas, .icons{vertical-align:baseline;}
			   .material-icons{vertical-align:bottom; font-size:1.3em;}
			   .wrap{width:100%;}
			   .none{display:none !important;}
			   .block{display:block;}
			   .hidden{overflow:hidden;}
			   .m{display:none !important; margin:0 auto;}
			   .w1280{width:1280px; margin:0 auto;}
			   .color{color:#fdd000 !important;}
			   .color_w{color:#fff;}
			   .bg_color{background:#fdd000; color:#1c1c1b; padding:0.5% 1%;}
			   .red{color:#ff0000 !important;}
			   .left0{left:0 !important;}
			   .right0{right:0 !important;}
			   .text_center{text-align:center;}
			   .text_left{text-align:left !important;}
			   .text_right{text-align:right;}
			   .table0{display:table; width:100%; height:100%; border-spacing:0;}
			   .table10{display:table; width:100%; border-spacing:10px;}
			   .cell{display:table-cell; vertical-align:middle;}
			   .cell10{display:table-cell; width:10%; vertical-align:middle;}
			   .cell20{display:table-cell; width:20%; vertical-align:middle;}
			   .cell25{display:table-cell; width:25%; vertical-align:middle;}
			   .cell30{display:table-cell; width:30%; vertical-align:middle;}
			   .cell33{display:table-cell; width:33%; vertical-align:middle;}
			   .cell40{display:table-cell; width:40%; vertical-align:middle;}
			   .cell50{display:table-cell; width:50%; vertical-align:middle;}
			   .cell60{display:table-cell; width:60%; vertical-align:middle;}
			   .cell66{display:table-cell; width:66%; vertical-align:middle;}
			   .cell70{display:table-cell; width:70%; vertical-align:middle;}
			   .cell75{display:table-cell; width:75%; vertical-align:middle;}
			   .cell80{display:table-cell; width:80%; vertical-align:middle;}
			   .cell90{display:table-cell; width:90%; vertical-align:middle;}
			   .inline{display:inline-block; vertical-align:middle;}
			   .inline20{display:inline-block; vertical-align:top; width:20%; padding-right:5px; float:left;}
			   .inline25{display:inline-block; vertical-align:top; width:25%; padding-right:5px; float:left;}
			   .inline33{display:inline-block; vertical-align:top; width:33.33%; padding:0 15px; float:left;}
				   .inline33:first-child{padding-left:0; padding-right:30px;}
				   .inline33:last-child{padding-right:0; padding-left:30px;}
			   .inline50{display:inline-block; vertical-align:top; width:50%; padding-right:15px; float:left;}
				   .inline50:last-child{display:inline-block; width:50%; padding-left:15px; padding-right:0px; float:left;}
			   .inline66{display:inline-block; vertical-align:top; width:66.66%; padding-right:15px; float:left;}
			   .inline80{display:inline-block; vertical-align:top; width:80%; padding-right:5px; float:left;}
			   .overlay{position:fixed; top:0; left:0; height:100%; width:100%; background:#1c1c1b; opacity:0.7; z-index:9;}
			   .close_wrap{cursor:pointer; position:absolute; right:0; top:50%; -webkit-transform:translate(0,-50%); -ms-transform:translate(0,-50%); transform:translate(0,-50%); width:25px; height:25px; z-index:5;}
			   .close_wrap .close:before, .close_wrap .close:after{position:absolute; left:15px; content:''; height:25px; width:2px; background:#fff;}
				   .close_wrap .close{opacity:1;}
				   .close_wrap .close:before{transform:rotate(45deg);}
				   .close_wrap .close:after{transform:rotate(-45deg);}
			   .plus_wrap{position:absolute; right:5px; top:50%; width:30px; height:30px; margin:0 auto; -webkit-transform:translate(0,-50%); -ms-transform:translate(0,-50%); transform:translate(0,-50%);}
				   .plus_wrap .plus:before, .plus_wrap .plus:after{content:""; position:absolute; background:rgba(0,0,0,0.7);}
					   .plus_wrap .plus:before{left:50%; top:5px; bottom:5px; width:1px; transform:translateX(-50%);}
					   .plus_wrap .plus:after{top:50%; left:5px; right:5px; height:1px; transform:translateY(-50%);}
			   .bottom_banner{position:fixed; right:10px; bottom:10px; width:100%; max-width:65px; z-index:9;}
				   .bottom_banner img{width:100%;}
		   
			   .robo{font-family:'Roboto', NanumSquareR; font-weight:900 !important; line-height:1 !important; letter-spacing:-1px !important;}
				   .robo h1, .robo h2{font-weight:900 !important;}
		   
			   input:-webkit-autofill,
			   input:-webkit-autofill:hover, 
			   input:-webkit-autofill:focus,
			   textarea:-webkit-autofill,
			   textarea:-webkit-autofill:hover,
			   textarea:-webkit-autofill:focus,
			   select:-webkit-autofill,
			   select:-webkit-autofill:hover,
			   select:-webkit-autofill:focus {
				   -webkit-box-shadow:0 0 0px 1000px none inset;
				   transition:background-color 5000s ease-in-out 0s;
			   }

        /* head */
.head_wrap{background:#fff; position:fixed; top:0; width:100%; margin:auto 0; z-index:9999; vertical-align:middle; box-shadow:0px 0px 5px 0px rgba(0,0,0,0.1); text-align:center; transition: All 0.2s ease; -webkit-transition: All 0.2s ease; -moz-transition: All 0.2s ease; -o-transition: All 0.2s ease; padding: 0 30px;}
	.main_body .head_wrap{background:none; box-shadow:none;}
	.head_over{background:#fff !important; box-shadow:0px 0px 5px 0px rgba(0,0,0,0.1) !important;}
	.head_fixed{background:#fff !important; box-shadow:0px 0px 5px 0px rgba(0,0,0,0.1) !important;}
		.head_wrap .head{width:100%; max-width:1280px; margin:0 auto; position:relative; transition: All 0.2s ease; -webkit-transition: All 0.2s ease; -moz-transition: All 0.2s ease; -o-transition: All 0.2s ease;}
			.head_wrap .head .head_logo{width:200px; position:absolute; top:13px; left:0;}
				.main_body .head_wrap .head .head_logo .head_logo_img{display:block;}
				.main_body .head_wrap .head .head_logo .head_logo_img_fixed{display:none;}
				.head_wrap .head .head_logo .head_logo_img{display:none;}
				.head_wrap .head .head_logo .head_logo_img_fixed{display:block;}
				.head_fixed .head .head_logo .head_logo_img{display:none !important;}
				.head_fixed .head .head_logo .head_logo_img_fixed{display:block !important;}
				.head_over .head .head_logo .head_logo_img{display:none;}
				.head_over .head .head_logo .head_logo_img_fixed{display:block;}
			.head_wrap .head .head_menu{width:100%; padding:0px 300px;}
				.head_wrap .head .head_menu > ul{display:table; width:100%;}
					.head_wrap .head .head_menu > ul > li{display:table-cell; width:16.66%; vertical-align:top;}
						.head_wrap .head .head_menu > ul > li > a{display:block; padding:40px 0; position:relative; font-weight:500; font-size:1.1em;}
						.head_wrap .head .head_menu > ul > li > a:after{
							content:""; 
							position:absolute; 
							left:0;
							bottom:0; 
							width:0; 
							height:1px; 
							/* ul 밑 선 */
							background:#ffffff; 
							left:50%; 
							-webkit-transform:translate(-50%,0); 
							-ms-transform:translate(-50%,0); 
							transform:translate(-50%,0); 
							transition:All 0.2s ease; 
							-webkit-transition:All 0.2s ease; 
							-moz-transition:All 0.2s ease; 
							-o-transition:All 0.2s ease;}

							.head_wrap .head .head_menu > ul > li:hover a:after{width:50%;}
							/* 헤더 li 메뉴 */
							.head_wrap .head .head_menu > ul > .check{background:#1A3B33; color:#ffffff;}
							.head_wrap .head .head_menu > ul > .check a:after{width:50%;}
			.head_wrap .head .head_sns{position:absolute; top:30px; right:0;}
				.head_wrap .head .head_sns ul li{box-shadow:0px 0px 0px 2px #1c1c1b; border-radius:100%; text-align:center; margin-top:0;}
					.head_wrap .head .head_sns ul li a{display:block; padding:3px; position:relative;}
					/* 헤더 오른쪽 아이콘 호버 */
					.head_wrap .head .head_sns ul li:hover{background:#fdd000; box-shadow:0px 0px 0px 2px #fdd000;}
					.head_wrap .head .head_sns ul li a span{background:#1c1c1b; color:#fff; border-radius:100px; padding:2px 6px; font-size:11px; top:90%; position:absolute; left:50%; -webkit-transform:translate(-50%,0); -ms-transform:translate(-50%,0); transform:translate(-50%,0);}
.snsspan{
	padding: 10px;
}

.pc{display:block !important; margin:0 auto; height: 100px;}

.head_menu {
    height: 100px; 
    overflow: hidden; 
    transition: height 0.3s ease-in-out; 
}

.head_menu:hover {
    height: auto; 
}

.head_menu:hover ul {
    opacity: 1;
    visibility: visible;
}

.head_menu_down_menu ul {
    margin: 8px 0;
    list-style: none;
    box-sizing: border-box;
    display: none;
    grid-template-columns: repeat(auto-fill, minmax(150px, 1fr));
    opacity: 0;
    visibility: hidden;
    transition: opacity 0.3s ease-in-out, visibility 0.3s ease-in-out; 
}

.head_menu_down_menu li:last-child {
    border-bottom: none;
    padding-bottom: 0;
}

.head_menu_wrap:hover .cont_wrap {
    opacity: 0.3;
    pointer-events: none; 
}

.head_menu_wrap:hover .cont_wrap:hover {
    opacity: 1;
    pointer-events: auto; 
}
.head_wrap .head .head_menu > ul > li:hover a:after{
	border-bottom: 1px solid #1c1c1b;
}
#fromInsideOut li:hover{ text-decoration: underline;}

/* cont */
.cont_wrap{padding-top:106px;}
	.main_body .cont_wrap{padding-top:0 !important;}
		.main_body .cont_box{overflow:hidden;}

	.cont_box{padding:100px 0px; width:100%; margin:0 auto; position:relative;}
		/*.cont_box:nth-child(2n-1){background:#fdd000;}*/
		.cont_boxs{width:100%; max-width:1280px; margin:0 auto; margin-bottom:100px;}
			.cont_boxs:last-child{margin-bottom:0;}


		.cont_head{text-align:center; background:#444 !important; color:#fff !important; z-index:1;}
			.cont_head .cont_title_wrap{margin-bottom:20px; text-transform:uppercase;}
				.cont_head .cont_title_wrap .cont_title{margin-bottom:10px;}

		.cont_banner{background:#fdd000; position:relative; overflow:inherit !important; z-index:2; padding:50px 0;}
			.cont_banner:before{position:absolute; z-index:1; content:""; background:#fdd000; width:50px; height:50px; bottom:-25px; left:50%; -webkit-transform:translate(-50%,0) rotate(-45deg); -ms-transform:translate(-50%,0) rotate(-45deg); transform:translate(-50%,0) rotate(-45deg);}
				.cont_banner .cont_title{font-size:1.4em;}

		.cont_title_wrap{font-size:24px; margin-bottom:40px; position:relative;}
			.cont_title_wrap:last-child{margin-bottom:0;}
				.cont_title{font-size:1.8em; line-height:1.2; letter-spacing:-3px;}
					.cont_title h1{font-size:2.8em; text-transform:uppercase;}
					.cont_title h2{font-size:1.4em;}
					.cont_title h3{font-size:1.2em;}

				.cont_title_info{margin:15px 0;}
					.cont_title_info:first-child{margin-top:0;}
					.cont_title_info:last-child{margin-bottom:0;}

			.cont_title_bg{position:relative;}
				.cont_title_bg:before{transition: All 0.4s ease; -webkit-transition: All 0.4s ease; -moz-transition: All 0.4s ease; -o-transition: All 0.4s ease; content:""; position:absolute; background:#fdd000; padding:0px; width:0; height:50%; z-index:-1; top:75%; left:50%; -webkit-transform:translate(-50%,-50%); -ms-transform:translate(-50%,-50%); transform:translate(-50%,-50%);}
				.cont_title_bg2:before{background:#fff;}
				.cont_title_bg_active:before{padding:0px 20px; width:100%;}

		.cont_text_wrap{margin:40px 0;}
			.cont_text_wrap:first-child{margin-top:0;}
			.cont_text_wrap:last-child{margin-bottom:0;}
				.cont_text_box{margin-bottom:20px;}
					.cont_text_box:last-child{margin-bottom:0;}
					.cont_text_title{font-size:1.4em; line-height:1.2;}
						.cont_text_title b{font-weight:400;}
					.cont_text{margin:20px 0;}
						.cont_text:first-child{margin-top:0;}
						.cont_text:last-child{margin-bottom:0;}
					.cont_text_inner{margin:5px 0;}
						.cont_text_inner:first-child{margin-top:0 !important;}
						.cont_text_inner:last-child{margin-bottom:0 !important;}
					.cont_text_info{font-size:0.9em; opacity:0.7;}
					.cont_text_info2{opacity:1;font-weight:400;color:#424242;}
					.cont_text_label{background:#000; color:#fff; font-size:0.6em; padding:2px 8px; border-radius:5px; vertical-align:middle;}


		.cont_list > ul{display:flex; width:100%; flex-wrap:wrap;}
			.cont_list_width > ul{display:table; width:auto; margin:0 auto; text-align:center;}
				.cont_list_width > ul > li{float:none !important;}
			.cont_list_align > ul{margin:0;}
			.cont_list_content_align > ul{align-items:center;}
				.cont_list_content > ul > li{margin-right:50px !important; margin-top:0 !important; width:calc(1 / 2 * 100% - (1 - 1 / 2) * 50px) !important;}
					.cont_list_content > ul > li:nth-child(2n){margin-right:0 !important;}
			.cont_list_content_search > ul > li:last-child .input_btn_wrap{float:right;}

			.cont_list > ul > li{display:inline-block; vertical-align:middle; margin-right:20px; margin-top:20px;}
				.cont_list1 > ul > li{width:100%; margin-right:0;}
					.cont_list1 > ul > li:first-child{margin-top:0;}
				.cont_list2 > ul > li{width:calc(1 / 2 * 100% - (1 - 1 / 2) * 20px);}
					.cont_list2 > ul > li:nth-child(-n+2) {margin-top:0;}
					.cont_list2 > ul > li:nth-child(2n){margin-right:0;}
				.cont_list3 > ul > li{width:calc(1 / 3 * 100% - (1 - 1 / 3) * 20px);}
					.cont_list3 > ul > li:nth-child(-n+3) {margin-top:0;}
					.cont_list3 > ul > li:nth-child(3n){margin-right:0;}
				.cont_list4 > ul > li{width:calc(1 / 4 * 100% - (1 - 1 / 4) * 20px);}
					.cont_list4 > ul > li:nth-child(-n+4) {margin-top:0;}
					.cont_list4 > ul > li:nth-child(4n){margin-right:0;}
				.cont_list5 > ul > li{width:calc(1 / 5 * 100% - (1 - 1 / 5) * 20px);}
					.cont_list5 > ul > li:nth-child(-n+5) {margin-top:0;}
					.cont_list5 > ul > li:nth-child(5n){margin-right:0;}
				.cont_list6 > ul > li{width:calc(1 / 6 * 100% - (1 - 1 / 6) * 20px);}
					.cont_list6 > ul > li:nth-child(-n+6) {margin-top:0;}
					.cont_list6 > ul > li:nth-child(6n){margin-right:0;}

				
			.cont_list_small > ul > li{display:inline-block; float:left; margin-right:10px; margin-top:10px;}
				.cont_list_small1 > ul > li{width:100%; margin-right:0;}
					.cont_list_small1 > ul > li:first-child{margin-top:0;}
				.cont_list_small2 > ul > li{width:calc(1 / 2 * 100% - (1 - 1 / 2) * 10px);}
					.cont_list_small2 > ul > li:nth-child(-n+2) {margin-top:0;}
					.cont_list_small2 > ul > li:nth-child(2n){margin-right:0;}
				.cont_list_small3 > ul > li{width:calc(1 / 3 * 100% - (1 - 1 / 3) * 10px);}
					.cont_list_small3 > ul > li:nth-child(-n+3) {margin-top:0;}
					.cont_list_small3 > ul > li:nth-child(3n){margin-right:0;}
				.cont_list_small4 > ul > li{width:calc(1 / 4 * 100% - (1 - 1 / 4) * 10px);}
					.cont_list_small4 > ul > li:nth-child(-n+4) {margin-top:0;}
					.cont_list_small4 > ul > li:nth-child(4n){margin-right:0;}
				.cont_list_small5 > ul > li{width:calc(1 / 5 * 100% - (1 - 1 / 5) * 10px);}
					.cont_list_small5 > ul > li:nth-child(-n+5) {margin-top:0;}
					.cont_list_small5 > ul > li:nth-child(5n){margin-right:0;}


		.cont_gallery_list > ul > li{position:relative;}
			.cont_gallery_list > ul > li .cont_gallery_list_box{height:100%;overflow:hidden; border-radius:10px; border:1px solid rgba(0,0,0,0.1); margin:0; background:#fff;}
			.cont_gallery_list2 > ul > li .cont_gallery_list_box{border-radius:0; box-shadow:inherit;}
				.cont_gallery_list > ul > li .cont_gallery_list_box .cont_text_box{padding:8%;}
				.cont_gallery_list2 > ul > li .cont_gallery_list_box .cont_text_box{padding:8% 0;}
				.cont_gallery_list > ul > li .cont_gallery_list_box .cont_gallery_list_img{position:relative; overflow:hidden;}
					.cont_gallery_list > ul > li .cont_gallery_list_box .cont_gallery_list_img img{position:absolute; top:50%; left:50%; -webkit-transform:translate(-50%,-50%); -ms-transform:translate(-50%,-50%); transform:translate(-50%,-50%); transition: All 0.1s ease; -webkit-transition: All 0.1s ease; -moz-transition: All 0.1s ease; -o-transition: All 0.1s ease;}
					.cont_gallery_list > ul > li:hover .cont_gallery_list_box .cont_gallery_list_img img{-webkit-transform:translate(-50%,-50%) scale(1.1); -ms-transform:translate(-50%,-50%) scale(1.1); transform:translate(-50%,-50%) scale(1.1);}

				.cont_gallery_list_label{position:absolute; right:10px; bottom:10px; background:#000; color:#fff; padding:5px 15px; z-index:1; border-radius:100px;}
					.cont_gallery_list_label1{background:#ff5a5a;}
					.cont_gallery_list_label2{background:#007eff;}

				.cont_gallery_list .text_wrap .text{word-break:break-word;}


			.cont_gallery_list_end{position:absolute; z-index:1; left:0; top:0; width:100%; height:100%; background:rgba(0,0,0,0.5); text-align:center; color:#fff;}


		.cont_list_map > ul > li{position:relative; display:inline-block; padding:0 15px;}
			.cont_list_map > ul > li:first-child{padding-left:0;}
			.cont_list_map > ul > li:last-child{padding-right:0;}
			.cont_list_map > ul > li:before{height:8px; width:8px; position:absolute; top:55%; right:-5px; margin:0; border:solid rgba(255,255,255,0.5); border-width:0 0 1px 1px; content:""; display:inline-block; transition:All 0.2s ease; -webkit-transition:All 0.2s ease; -moz-transition:All 0.2s ease; -o-transition:All 0.2s ease; -webkit-transform:translate(0,-50%) rotate(-135deg); -ms-transform:translate(0,-50%) rotate(-135deg); transform:translate(0,-50%) rotate(-135deg);}
			.cont_list_map > ul > li:last-child:before{display:none;}


		.cont_tab{margin-bottom:30px;}
			.cont_tab ul{display:table; width:100%; background:#f4f6f8; border-top:1px solid rgba(0,0,0,0.1);}
				.cont_tab ul li{display:table-cell; width:10%; border-right:1px solid rgba(0,0,0,0.1); border-bottom:1px solid rgba(0,0,0,0.1);}
					.cont_tab ul li:first-child{border-left:1px solid rgba(0,0,0,0.1);}
				.cont_tab ul li.check{background:#fff; border-bottom:0;}
					.cont_tab ul li a{display:block; width:100%; padding:15px 0;}


		.cont_info_wrap{background:#f4f6f8; padding:30px;}
		.cont_info_wrap2{background:#fff; border:1px solid rgba(0,0,0,0.1);}
			.cont_info{}
			.cont_info:first-child{margin-top:0;}
			.cont_info:last-child{margin-bottom:0;}
			.cont_info > ul{border:0;}
				.cont_info > ul > li{margin:10px 0; padding-left:10px; position:relative; border-top:0;}
				.cont_info2 > ul > li{margin:20px 0;}
					.cont_info > ul > li:first-child{padding-top:0; margin-top:0;}
					.cont_info > ul > li:last-child{padding-bottom:0; margin-bottom:0;}
					.cont_info > ul > li:after{content:""; position:absolute; top:0.5em; left:0; width:6px; height:1px; background:#0d5646;}

			.cont_info_num > ul{counter-reset:list-number;}
				.cont_info_num > ul > li{margin-left:1em; padding-left:1em;}
				.cont_info_num > ul > li:before{position:absolute; left:-1em; text-align:center; counter-increment:list-number; content:counters(list-number, ""); background:#666; color:#fff; width:1.5em; height:1.5em; line-height:1.5em; border-radius:4px; font-size:0.9em; font-weight:500;}
				.cont_info_num > ul > li:after{display:none;}


		.cont_wrap{padding:0; padding-top:60px;}
			.cont_box{padding:50px 20px !important;}
			.cont_box.cont_banner{padding:30px !important;}
				.cont_boxs{margin-bottom:30px;}
					.cont_title_wrap{margin-bottom:20px; font-size:16px;}
						.cont_banner .cont_title{font-size:1.4em;}
						.cont_title{letter-spacing:-1px;}
						.cont_title h1{font-size:1.4em;}
						.cont_title h2{font-size:1.2em;}
						.cont_title h3{font-size:1.1em;}

					.cont_text_wrap{margin:30px 0;}
						.cont_text_title{font-size:1.2em;}
						.cont_text{margin:15px 0;}

			.cont_list_width{display:flex;}
			.cont_list_width_m > ul{display:table;}

			.cont_list_m > ul > li{margin-right:15px !important; margin-top:15px !important;}
				.cont_list_m1 > ul > li{width:100%; margin-right:0; height:auto; margin-right:0 !important;}
					.cont_list_m1 > ul > li:first-child{margin-top:0 !important;}
					.cont_list_m1 > ul > li:nth-child(2n){margin-right:0 !important;}
				.cont_list_m2 > ul > li{width:calc(1 / 2 * 100% - (1 - 1 / 2) * 15px);}
					.cont_list_m2 > ul > li:nth-child(-n+2){margin-top:0 !important;}
					.cont_list_m2 > ul > li:nth-child(2n){margin-right:0 !important;}
				.cont_list_m3 > ul > li{width:calc(1 / 3 * 100% - (1 - 1 / 3) * 15px);}
					.cont_list_m3 > ul > li:nth-child(-n+3){margin-top:0 !important;}
					.cont_list_m3 > ul > li:nth-child(3n){margin-right:0 !important;}
				.cont_list_m4 > ul > li{width:calc(1 / 4 * 100% - (1 - 1 / 4) * 15px);}
					.cont_list_m4 > ul > li:nth-child(-n+4){margin-top:0 !important;}
					.cont_list_m4 > ul > li:nth-child(4n){margin-right:0 !important;}


			.cont_list_small_m > ul > li{margin-right:5px !important; margin-top:5px !important;}
				.cont_list_small_m1 > ul > li{width:100%; margin-right:0; height:auto;}
					.cont_list_small_m1 > ul > li:first-child{margin-top:0 !important;}
					.cont_list_small_m1 > ul > li:nth-child(2n){margin-right:0 !important;}
				.cont_list_small_m2 > ul > li{width:calc(1 / 2 * 100% - (1 - 1 / 2) * 5px);}
					.cont_list_small_m2 > ul > li:nth-child(-n+2) {margin-top:0 !important;}
					.cont_list_small_m2 > ul > li:nth-child(2n){margin-right:0 !important;}
				.cont_list_small_m3 > ul > li{width:calc(1 / 3 * 100% - (1 - 1 / 3) * 5px);}
					.cont_list_small_m3 > ul > li:nth-child(-n+3) {margin-top:0 !important;}
					.cont_list_small_m3 > ul > li:nth-child(3n){margin-right:0 !important;}
				.cont_list_small_m4 > ul > li{width:calc(1 / 4 * 100% - (1 - 1 / 4) * 5px);}
					.cont_list_small_m4 > ul > li:nth-child(-n+4) {margin-top:0 !important;}
					.cont_list_small_m4 > ul > li:nth-child(4n){margin-right:0 !important;}


			.cont_gallery_list > ul > li{font-size:13px;}

			.site_map_wrap{padding:0;}
				.site_map_wrap .site_map > ul > li:first-child{display:none;}
				.site_map_wrap ul .site_map_down_menu{width:50%; max-width:50%;}

			.cont_list_content > ul > li{width:100% !important; float:none !important; display:block !important; margin-right:0 !important; margin-bottom:30px !important;}
				.cont_list_content > ul > li:last-child{margin-bottom:0 !important;}

			.cont_gallery_list_label{padding:2px 6px; font-size:11px; right:5px; bottom:5px;}

			.cont_gallery_list_end{font-size:11px;}
			.cont_gallery_list.cont_list_m2 > ul > li .cont_gallery_list_box .cont_text_title{font-size:1em; font-weight:400;}
	
            /* header End */

            @media screen and (min-width:1280px){
			   .section_menu .swiper-slide-active{width:75% !important;}
		   }
		   
		 /*   @media screen and (max-width:1280px){
			   body{position:none; width:100%; left:0; padding-top:0 !important; margin-left:0; font-size:13px;}
			   .pc{display:none !important;}
			   .m{display:none !important;}
			   .t{display:block !important;}
			   .go_top_wrap{display:none;}
		   }
		    */
		   @media screen and (max-width:760px){
			   html, body{font-size:12px;}
			   .pc{display:none !important;}
			   .m{display:block !important;}
			   .cell50{display:block; width:100%;}
			   .input_wrap3{height:40px !important;}
				   .input_wrap3 .btn{font-size:16px; padding:0px 20px;}
			   .input_wrap2{height:45px !important;}
				   .input_wrap2 .btn{font-size:14px; padding:0px 15px;}
			   .input_wrap1{height:30px !important;}
				   .input_wrap1 .btn{font-size:12px; padding:0px 10px;}
		   }

    </style>
</head>
<body>
 <!-- 상단 타이틀 -->
  <div class="head_wrap header_tt header">
    <div class="head">
        <div class="head_logo">
            <a href="/mainhome">
                <img src="/images/notice/CoffeeNamuh_White_BG.png" class="head_logo_img_fixed">
            </a>
        </div>
        <div class="head_menu_wrap">
            <div class="head_menu">
                <ul>
                    <li>
                                                                <a href="" class="pc">
                                    나무 스토리										</a>
                                <a class="m head_menu_down">
                                    나무 스토리										</a>
                            <div id="fromInsideOut" class="head_menu_down_menu cont_list cont_list1 cont_list_small cont_list_small1">
                            <ul>
                                                                                <li>
                                            <a href="">
                                                브랜드													</a>
                                        </li>
                                                                                <li>
                                            <a href="">
                                                BI													</a>
                                        </li>
                                                                                <li>
                                            <a href="">
                                                오시는 길													</a>
                                        </li>
                                                                                                            </ul>
                        </div>
                    </li>
                    <li class="">
                                                                <a href="/menu/" class="pc">
                                    메뉴소개										</a>
                                <a class="m head_menu_down">
                                    메뉴소개										</a>
                            <div id="fromInsideOut" class="head_menu_down_menu cont_list cont_list1 cont_list_small cont_list_small1">
                            <ul>
                                                                                <li>
                                            <a href="">
                                                음료													</a>
                                        </li>
                                                                                <li>
                                            <a href="">
                                                푸드													</a>
                                        </li>
                                                                                <li>
                                            <a href="">
                                                상품													</a>
                                        </li>
                                                                                                                                                    </ul>
                        </div>
                    </li>
                    <li>
                        <a href="/store/find/" class="pc">매장</a>
                                <a class="m head_menu_down">매장</a>
                        <div id="fromInsideOut" class="head_menu_down_menu cont_list cont_list1 cont_list_small cont_list_small1">
                            <ul>
                            <li><a href="/store/find/">매장찾기</a></li>			
                            </ul>
                        </div>
                    </li>
                    
                    <li>
                                
                                                                <a href="/faq" class="pc">
                                    나무소식										</a>
                                <a class="m head_menu_down">나무소식</a>
                        <div id="fromInsideOut" class="head_menu_down_menu cont_list cont_list1 cont_list_small cont_list_small1">
                            <ul>
                                                                            <li>
                                        <a href="/notice">
                                            공지사항												</a>
                                    </li>
                                                                            <li>
                                        <a href="/faq">
                                            FAQ												</a>
                                    </li>
                                                                                                                        <li>
                                            <a href="/board">
                                            <a href="/board">
                                                고객의 소리													</a>
                                        </li>
                                                                    </ul>
                        </div>
                    </li>
                    
                </ul>
            </div>
        </div>
        <div class="head_sns">
            <div class="cont_list cont_list_small">
      
            
        
    <!-- 로그인하지 않았을 때 -->
	<c:if test="${empty sessionScope.userName}">
	<ul>	
					<li><a href="/login"><img src="/images/notice/loginIcon3.png"><span>로그인</span></a></li>
                    <li><a href="/register"><img src="/images/notice/joinIcon.png"><span>회원가입</span></a></li>
                    <li><a href="/login" target="_blank"><img src="/images/notice/basket.png"><span>장바구니</span></a></li>
                     <li><a href="/admin/adminLogin" target="_blank"><img src="https://img.79plus.co.kr/megahp/common/img/sns/sns_mng.png"><span>관리자용</span></a></li>  
    </ul>      		
	</c:if>
	
	<!-- 로그인 했을 때 -->
	 <c:if test="${not empty sessionScope.userName}">
	 <ul>
	 <span class="snsspan">환영합니다, <span>${sessionScope.userName}</span>님!</span>
   			        <li><a href="/cart"><img src="/images/notice/basket.png"><span>장바구니</span></a></li>
			        <li><a href="/mypage"><img src="/images/notice/mypageIcon.png"><span>마이페이지</span></a></li>
                    <li><a href="/logout"><img src="/images/notice/logoutIcon.png"><span>로그아웃</span></a></li>
   		</ul> 
   </c:if>
	
		</div>

	
	</div>
	
	
	<br>
          <!-- 로그인하지 않았을 때 -->
          <c:if test="${empty sessionScope.userName}">
              <a href="/login">로그인</a>
              <a href="/register">회원가입</a>
          </c:if>
      
          <!-- 로그인 했을 때 -->
          <c:if test="${not empty sessionScope.userName}">
              <span>환영합니다, <span>${sessionScope.userName}</span>님!</span>
          </c:if>
	
               
            </div>
        </div>
        <div class="mobile_menu_icon_wrap m t">
            <div class="mobile_menu_icon">
                <div class="mobile_menu_icon_bar bar_black"></div>
            </div>
        </div>
    </div>
</div>	
<!-- 헤더 끝 -->

<script>
    document.addEventListener('DOMContentLoaded', function () {
        var headMenuItems = document.querySelectorAll('.head_menu li');

        headMenuItems.forEach(function (item) {
            item.addEventListener('mouseenter', function () {
                this.classList.add('check');
            });

            item.addEventListener('mouseleave', function () {
                this.classList.remove('check');
            });
        });
    });
</script>
</body>
</html>