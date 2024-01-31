//captcha
function refresh_captcha(){
	document.getElementById("capt_img").src="/manager/common/captcha.php?waste="+Math.random(); 
}
//�곷Ц+�レ옄
function onlyNumberEng(obj) {
	var val = obj.value;
	var pattern = /[��-��~!@#$%^&*()_+|<>?:{}= ]/g;
	if(pattern.test(val)){
		obj.value = val.replace(pattern,"");
	}
};
//�쒓�留뚯젣嫄�
function removeKorean(obj) {
	var val = obj.value;
	var pattern = /[��-��|��-��|媛�-��]/g;
	if(pattern.test(val)){
		obj.value = val.replace(pattern,"");
	}
};

//�뱀닔臾몄옄
function specialCharRemove(obj) {
	var val = obj.value;
	var pattern = /[^(媛�-�ｃ꽦-�롢뀖-�즑-zA-Z0-9)]/gi;
	if(pattern.test(val)){
		obj.value = val.replace(pattern,"");
	}
};

//�쒓�
function onlyKorean(form_name) {
	for (var i = 0; i < form_name.value.length; i++) {
		var chr = form_name.value.charAt(i);
		if (chr.charCodeAt() < '129') {
			form_name.focus();
			form_name.value = "";
		}
	}
};
//�レ옄
function onlyNumber(event) {
	event = event || window.event;
	var keyID = (event.which)
		? event.which
		: event.keyCode;
	if ((keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39) 
		return;
	 else 
		return false;
};
//�レ옄2
function removeChar(event) {
	event = event || window.event;
	var keyID = (event.which)
		? event.which
		: event.keyCode;
	if (keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39) 
		return;
	 else 
		event.target.value = event
			.target
			.value
			.replace(/[^0-9]/g, "");
};


//�대찓�� �좏슚�� 寃���
function email_check( email ) {    
	var regex=/([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
	return (email != '' && email != 'undefined' && regex.test(email)); 
};
//�꾪솕踰덊샇 11�먮━媛� �명뫖�� 1媛쒕줈 �쒗쁽�� �섏씠吏��� �좏슚�� 寃���
$(function() {
	$(".tel_check").on("keyup", function() {
		var value = $(this).val(),
		addValue = [];
		value = value.replace(/-/gi, '');
		if (value.length >= 3) { 
			if (value.substring(0, 2) == '02') { // �쒖슱 踰덊샇瑜� 泥댄겕�섍린 �꾪븳 議곌굔
				addValue.push(value.substring(0, 2)); 
				if (value.length >= 3) { 
					var endKey = (value.length >= 10 ? 6 : 5); // 00-000-000, 00-0000-0000 泥섎━ 
					addValue.push(value.substring(2, endKey)); 
					if (value.length >= 6) { 
						if (value.length >= 10) { // 10�먮━ �댁긽 �낅젰 諛⑹�
							value = value.substring(0, 10); 
						}
						addValue.push(value.substring(endKey, value.length)); 
					}
				}
			} else { 
				addValue.push(value.substring(0, 3)); 
				if (value.length >= 4) { 
					var endKey = (value.length >= 11 ? 7 : 6); // 000-000-0000, 000-0000-0000 泥섎━ 
					addValue.push(value.substring(3, endKey)); 
					if (value.length >= 7) { 
						if (value.length >= 11) {
							value = value.substring(0, 11); 
						}
						addValue.push(value.substring(endKey, value.length)); 
					}
				}
			}
			$(this).val(addValue.join("-")); 
		}
	});
});
//諛붿씠��
$(function () {
	$(".input_limit_byte").each(function () {
		// count �뺣낫 諛� count �뺣낫�� 愿��⑤맂 textarea/input �붿냼瑜� 李얠븘�댁꽌 蹂��섏뿉 ���ν븳��.
		var $maxcount = $(this).find(".maxcount", this);
		var $count = $(this).find(".count", this);
		var $title = $(this).parents(".cont_text").find(".count_input");

		// .text()媛� 臾몄옄�댁쓣 諛섑솚�섍린�� �� 臾몄옄瑜� �レ옄濡� 留뚮뱾湲� �꾪빐 1�� 怨깊븳��.
		var maximumByte = $maxcount.text() * 1;
		// update �⑥닔�� keyup, paste, input �대깽�몄뿉�� �몄텧�쒕떎.
		var update = function () {
			var before = $count.text() * 1;
			var str_len = $title.val().length;
			var cbyte = 0;
			var li_len = 0;
			for (i = 0; i < str_len; i++) {
				var ls_one_char = $title.val().charAt(i);
				if (escape(ls_one_char).length > 4) {
					cbyte += 3; //�쒓��대㈃ 2瑜� �뷀븳��
				} else {
					cbyte++; //�쒓��꾨땲硫� 1�� �ㅽ븳��
				}
				if (cbyte <= maximumByte) {
					li_len = i + 1;
				}
			}
			// �ъ슜�먭� �낅젰�� 媛믪씠 �쒗븳 媛믪쓣 珥덇낵�섎뒗吏�瑜� 寃��ы븳��.
			if (parseInt(cbyte) > parseInt(maximumByte)) {
				var str = $title.val();
				var str2 = $title.val().substr(0, li_len);
				$title.val(str2);
				var cbyte = 0;
				for (i = 0; i < $title.val().length; i++) {
					var ls_one_char = $title.val().charAt(i);
					if (escape(ls_one_char).length > 4) {
						cbyte += 2; //�쒓��대㈃ 2瑜� �뷀븳��
					} else {
						cbyte++; //�쒓��꾨땲硫� 1�� �ㅽ븳��
					}
				}
			}
			$count.text(cbyte);
		};
		// input, keyup, paste �대깽�몄� update �⑥닔瑜� 諛붿씤�쒗븳��
		$title.bind("input keyup keydown paste change", function () {
			setTimeout(update, 0)
		});
		update();
	});
});

function head_menu(){
	var path = location.pathname;
	path = path.split("/")[1];
	path = path.toLowerCase();

	if ( path == "about" ){ //�댁젙蹂�
		$(".head_wrap .head_menu .w1280 > ul > li").eq(0).addClass("check");
	} else if ( path == "mshaped" ) {
		$(".head_wrap .head_menu .w1280 > ul > li").eq(1).addClass("check");
	} else if ( path == "male" ) {
		$(".head_wrap .head_menu .w1280 > ul > li").eq(2).addClass("check");
	} else if ( path == "female" ) {
		$(".head_wrap .head_menu .w1280 > ul > li").eq(3).addClass("check");
	} else if ( path == "circular" ) {
		$(".head_wrap .head_menu .w1280 > ul > li").eq(4).addClass("check");
	} else if ( path == "beauty" ) {
		$(".head_wrap .head_menu .w1280 > ul > li").eq(5).addClass("check");
	} else if ( path == "seborrheic" ) {
		$(".head_wrap .head_menu .w1280 > ul > li").eq(6).addClass("check");
	} else if ( path == "oriental" ) {
		$(".head_wrap .head_menu .w1280 > ul > li").eq(7).addClass("check");
	} else if ( path == "community" ) {
		$(".head_wrap .head_menu .w1280 > ul > li").eq(8).addClass("check");
	}
}

/* input comma */
	function inputNumberFormat(obj) {
		obj.value = comma(uncomma(obj.value));
	}
	function comma(str) {
		str = String(str);
		return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
	}
	function uncomma(str) {
		str = String(str);
		return str.replace(/[^\d]+/g, '');
	}
	Number.prototype.format = function(){
		if(this==0) return 0;
		var reg = /(^[+-]?\d+)(\d{3})/;
		var n = (this + '');
		while (reg.test(n)) n = n.replace(reg, '$1' + ',' + '$2');
		return n;
	};
	String.prototype.format = function(){
		var num = parseFloat(this);
		if( isNaN(num) ) return "0";
		return num.format();
	};
/* text comma */
$(document).ready(function(){
	$(".comma").text(function() {
		$(this).text(
			$(this).text().format()
		);
	});
	$(".comma").each(function() {
		$(this).val($(this).val().toString().replace(/,/g, "").replace(/\B(?=(\d{3})+(?!\d))/g, ","));
	});
	$(".comma").on("keyup",function(){
		inputNumberFormat(this);
	});
	head_menu();
});
$(document).on("click",".modal_open",function(){
	if ( $(this).is(".modal_open_policy1") ) {
		$.ajax({
			url: "/common/modal/policy1.php",
			type: "GET",
			success:function(data){
				$(".modal-dialog").addClass("modal-dialog_720");
				$(".modal .modal-content").html(data);
				$(".modal").modal();
			}
		});
	};
	if ( $(this).is(".modal_open_policy2") ) {
		$.ajax({
			url: "/common/modal/policy2.php",
			type: "GET",
			success:function(data){
				$(".modal-dialog").addClass("modal-dialog_720");
				$(".modal .modal-content").html(data);
				$(".modal").modal();
			}
		});
	};
	if ( $(this).is(".modal_open_map") ) {
		var store_idx = $(this).data("store-idx");
		$.ajax({
			url: "/common/modal/store_detail.php?store_idx="+store_idx,
			type: "GET",
			success:function(data){
				$(".modal-dialog").addClass("modal-dialog_720");
				$(".modal .modal-content").html(data);
				$(".modal").modal();
			}
		});
	};
	if ( $(this).is(".modal_open_store") ) {
		var store_idx = $(this).data("store-idx");
		$.ajax({
			url: "store.php?store_idx="+store_idx,
			type: "GET",
			success:function(data){
				$(".modal-dialog").addClass("modal-dialog_480");
				$(".modal .modal-content").html(data);
				$(".modal").modal();
			}
		});
	};
});
$(document).on("click",".inner_modal_open",function(){
	$(this).siblings(".inner_modal").show(0);
});
$(document).on("click",".inner_modal .inner_modal_title .close_wrap",function(){
	$(this).parents(".inner_modal").hide(0);
});

//�뚯씪愿��� �쒖옉
$(document).on("change",".filebox_wrap .filebox_input input",function(){
	if ( $(this).parents(".filebox_input").is(".filebox_type_img") ) {
		var file_type=$(this).val().split(".").pop().toLowerCase();
		if ($.inArray(file_type, [ "jpg","jpeg","png" ])==-1){
			alert("jpg, png�뚯씪留� �낅줈�� 媛��ν빀�덈떎.");
			$(this).parents(".filebox_wrap").find(".filebox_name input").val("");
			$(this).parents(".filebox_wrap").find(".filebox_input input").val("");
			$(this).parents(".filebox_wrap").find(".filebox_img img").attr("src", "");
			return;
		}
	} else if ( $(this).parents(".filebox_input").is(".filebox_type_date") ) {
		var file_type=$(this).val().split(".").pop().toLowerCase();
		if ($.inArray(file_type, [ "jpg","jpeg","png","pdf" ])==-1){
			alert("jpg, jpeg, png, pdf�뚯씪留� �낅줈�� 媛��ν빀�덈떎.");
			$(this).parents(".filebox_wrap").find(".filebox_name input").val("");
			$(this).parents(".filebox_wrap").find(".filebox_input input").val("");
			$(this).parents(".filebox_wrap").find(".filebox_img img").attr("src", "");
			return;
		}
	} else if ( $(this).parents(".filebox_input").is(".filebox_type_custom") ) {
		var file_type=$(this).val().split(".").pop().toLowerCase();
		if ($.inArray(file_type, ["jpg", "png", "pdf","doc","docx","ppt","pptx","hwp","gul","txt","xlsx","xls" ])==-1){
			alert("jpg, png, pdf, doc, docx, ppt, pptx, hwp, gul, txt, xlsx, xls�뚯씪留� �낅줈�� 媛��ν빀�덈떎.");
			$(this).parents(".filebox_wrap").find(".filebox_name input").val("");
			$(this).parents(".filebox_wrap").find(".filebox_input input").val("");
			$(this).parents(".filebox_wrap").find(".filebox_img img").attr("src", "");
			return;
		}
	} else if ( $(this).parents(".filebox_input").is(".filebox_type_recruit") ) {
		var file_type=$(this).val().split(".").pop().toLowerCase();
		if ($.inArray(file_type, ["doc", "docx", "hwp","pdf" ])==-1){
			alert("doc, docx, hwp, pdf�뚯씪留� �낅줈�� 媛��ν빀�덈떎.");
			$(this).parents(".filebox_wrap").find(".filebox_name input").val("");
			$(this).parents(".filebox_wrap").find(".filebox_input input").val("");
			$(this).parents(".filebox_wrap").find(".filebox_img img").attr("src", "");
			return;
		}
	};
	if(window.FileReader) {
		var filename = $(this)[0].files[0].name;
		var parent = $(this).parent();
		var reader = new FileReader();
		reader.onload = function(e) {
			var src = e.target.result;
			parent.parents(".filebox_wrap").find(".filebox_img img").attr("src", src);
		}
		reader.readAsDataURL($(this)[0].files[0]);
	} else {
		var filename = $(this).val().split("/").pop().split("\\").pop();
	};
	$(this).parents(".filebox_wrap").find(".filebox_name input").val(filename);
});
$(document).on("click",".file_reset",function(){
	$(this).parents(".filebox_wrap").find(".filebox_name input").val("");
	$(this).parents(".filebox_wrap").find(".filebox_input input").val("");
	if ( $(this).parents(".filebox_wrap").find(".filebox_img") ) {
		$(this).parents(".filebox_wrap").find(".filebox_img img").attr("src", "");
	};
});
//�뚯씪愿��� ��
$(document).on("change",".email_select select",function() {
	if ( $(this).val() == "" ){
		$(".email_input input").val("");
		$(".email_input input").attr("readonly",false);
		$(".email_input input").focus();
	} else {
		$(".email_input input").val( $(this).val() );
		$(".email_input input").attr("readonly",true);
	}
});
function addpostCode() {
	new daum.Postcode({
		oncomplete: function(data) {

			var fullAddr = ''; // 理쒖쥌 二쇱냼 蹂���
			var extraAddr = ''; // 議고빀�� 二쇱냼 蹂���

			if (data.userSelectedType === 'R') { // �ъ슜�먭� �꾨줈紐� 二쇱냼瑜� �좏깮�덉쓣 寃쎌슦
				fullAddr = data.roadAddress;

			} else { // �ъ슜�먭� 吏�踰� 二쇱냼瑜� �좏깮�덉쓣 寃쎌슦(J)
				fullAddr = data.jibunAddress;
			}

			// �ъ슜�먭� �좏깮�� 二쇱냼媛� �꾨줈紐� ���낆씪�� 議고빀�쒕떎.
			if(data.userSelectedType === 'R'){
				//踰뺤젙�숇챸�� �덉쓣 寃쎌슦 異붽��쒕떎.
				if(data.bname !== ''){
					extraAddr += data.bname;
				}
				// 嫄대Ъ紐낆씠 �덉쓣 寃쎌슦 異붽��쒕떎.
				if(data.buildingName !== ''){
					extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
				}
				// 議고빀�뺤＜�뚯쓽 �좊Т�� �곕씪 �묒そ�� 愿꾪샇瑜� 異붽��섏뿬 理쒖쥌 二쇱냼瑜� 留뚮뱺��.
				fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
			}

			// �고렪踰덊샇�� 二쇱냼 �뺣낫瑜� �대떦 �꾨뱶�� �ｋ뒗��.
			document.getElementById("member_zip").value = data.zonecode; //5�먮━ �덉슦�몃쾲�� �ъ슜
			document.getElementById("member_address1").value = fullAddr;

			// 而ㅼ꽌瑜� �곸꽭二쇱냼 �꾨뱶濡� �대룞�쒕떎.
			document.getElementById("member_address2").focus();
		}
	}).open();
};
function go_top() {
	$("html, body").stop().animate({
		scrollTop: $("body").offset().top
	});
};