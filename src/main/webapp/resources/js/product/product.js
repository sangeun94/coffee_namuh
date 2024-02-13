var checkAll = document.querySelector('.checkAll');
var chkbox = document.querySelectorAll('.chkbox');
var pl = document.querySelectorAll('.pl');
var pl1 = document.querySelector('.product-list-1');
var pl2 = document.querySelector('.product-list-2');
var pl3 = document.querySelector('.product-list-3');
var pl4 = document.querySelector('.product-list-4');

/* === 전체선택 클릭시 체크/해제 === */

checkAll.onclick = function () {
	if (checkAll.checked == false) {
		pl1.style.display = 'none';
		pl2.style.display = 'none';
		pl3.style.display = 'none';
		pl4.style.display = 'none';
		for (var i = 0; i < chkbox.length; i++) { chkbox[i].checked = false; }//for
	} else {
		pl1.style.display = '';
		pl2.style.display = '';
		pl3.style.display = '';
		pl4.style.display = '';
		for (var i = 0; i < chkbox.length; i++) { chkbox[i].checked = true; }//for
	}
};//onclick


// 각 체크박스에 대한 클릭 이벤트 핸들러 등록
for (var i = 0; i < chkbox.length; i++) {
	chkbox[i].onclick = function () {
		// 현재 체크박스의 인덱스 가져오기
		var index = Array.from(chkbox).indexOf(this);

		// 해당하는 메뉴의 표시/숨김 설정
		if (this.checked) {
			pl[index].style.display = '';
		} else {
			pl[index].style.display = 'none';
		}

		// 전체 선택 체크박스 상태 변경
		checkAll.checked = Array.from(chkbox).every(function (checkbox) {
			return checkbox.checked;
		});
	};
}

// 페이지 스크롤 이벤트를 감지하고 버튼을 표시 또는 숨깁니다.
window.addEventListener('scroll', function() {
    var scrollToTopButton = document.getElementById('scrollToTopButton');
    if (window.scrollY > 100) { // 스크롤이 100px 이상 이동했을 때 버튼을 표시합니다.
        scrollToTopButton.style.display = 'block';
    } else {
        scrollToTopButton.style.display = 'none';
    }
});

// 맨 위로 버튼 클릭 시 페이지 상단으로 스크롤합니다.
document.getElementById('scrollToTopButton').addEventListener('click', function() {
    window.scrollTo({
        top: 0,
        behavior: 'smooth'
    });
});

// jQuery를 사용하여 마우스가 올라갔을 때와 나갔을 때의 이벤트를 처리합니다.
$(document).ready(function() {
    // 담기 버튼을 클릭했을 때의 이벤트
    $('.add-to-cart').on('click', function() {
        // 해당 상품의 장바구니 페이지 URL을 가져와서 이동합니다.
        var cartUrl = $(this).data('cart-url');
        window.location.href = cartUrl;
    });
});
