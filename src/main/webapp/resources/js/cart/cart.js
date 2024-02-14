window.addEventListener('DOMContentLoaded', function () {
    // 페이지가 로드될 때 수량을 sessionStorage에 저장합니다.
    var quantityInput = document.getElementById('usernumber');
    sessionStorage.setItem('previousQuantity', quantityInput.value);

    var quantity = parseInt(quantityInput.value);
    var price = parseInt(document.querySelector('.cont-select-fieldset tr:nth-child(2) td:nth-child(5)').textContent);
    var totalPrice = document.querySelector('.total-price');
    totalPrice = quantity * price + 2500;
    var totalPriceContainer = document.querySelector('.text-center');
    var checkBox = document.querySelector('.chkbox');
    var orderBtn = document.querySelector('.order-btn');

    // 페이지가 로드될 때 총 결제할 금액을 표시합니다.
    totalPriceContainer.textContent = "총 결제할 금액은 " + totalPrice + "원 입니다. (배송비 2500원 포함)";

    // input 요소의 값이 변경될 때마다 총 결제할 금액을 업데이트하고 sessionStorage에 저장합니다.
    quantityInput.addEventListener('change', function () {
        quantity = parseInt(this.value);
        if (quantity < 1) {
            quantity = 1;
            this.value = 1;
        }
        sessionStorage.setItem('previousQuantity', quantity);
        totalPrice = quantity * price + 2500;
        totalPriceContainer.textContent = "총 결제할 금액은 " + totalPrice + "원 입니다. (배송비 2500원 포함)";
    });

    // 체크박스 상태 변화 감지
    checkBox.addEventListener('change', function () {
        // 체크가 해제되었을 때
        if (!this.checked) {
            totalPriceContainer.textContent = "상품을 선택해주세요.";
        } else {
            // 체크가 되었을 때
            totalPriceContainer.innerHTML = "총 결제할 금액은 " + totalPrice + "원 입니다. (배송비 2500원 포함)";
        }
    });

    // order-btn 클릭 시 이벤트 처리
    orderBtn.addEventListener('click', function (event) {
        // 체크박스가 체크되지 않았을 경우 알림창 표시
        if (!checkBox.checked) {
            alert("상품을 먼저 선택해주세요.");
            // 이벤트 전파 중지
            event.preventDefault();
        } else {
            // 체크되었을 경우 /cart/order 페이지로 이동합니다.
            window.location.href = "/cart/order";
        }
    });
});
