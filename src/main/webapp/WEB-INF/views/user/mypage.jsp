<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>마이페이지</title>
        <link rel="stylesheet" href="styles.css">
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                background-color: #f4f4f4;
            }
    
            #container {
                max-width: 600px;
                margin: 50px auto;
                background-color: #fff;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                overflow-y: auto;
                max-height: 700px;
            }
    
            #container::-webkit-scrollbar {
                width: 0px;
            }
    
            #container::-webkit-scrollbar-track {
                background-color: #f1f1f1;
            }
    
            #container::-webkit-scrollbar-thumb {
                background-color: #888;
                border-radius: 6px;
            }
    
            #container::-webkit-scrollbar-thumb:hover {
                background-color: #555;
            }
    
            .profile-header {
                background-color: #1A3B33;
                color: #fff;
                padding: 20px;
                text-align: center;
                border-top-left-radius: 8px;
                border-top-right-radius: 8px;
            }
    
            .profile-form {
                padding: 20px;
            }
    
            .label-input-group {
                margin-bottom: 16px;
            }
    
            .label-input-group label {
                display: block;
                margin-bottom: 8px;
                color: #333;
            }
    
            .label-input-group input {
                width: calc(100% - 16px);
                padding: 8px;
                margin-bottom: 16px;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
            }
    
            .button-container {
                text-align: center;
            }
    
            .button-container button {
                background-color: #1A3B33;
                color: #fff;
                padding: 10px 20px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }
    
            .label-input-group {
        margin-bottom: 16px;
        display: flex;
        align-items: center;
    }
    
    .label-input-group label {
        flex: 1;
        margin-right: 8px;
    }
    
    .label-input-group input {
        flex: 2;
        width: calc(100% - 16px);
        padding: 8px;
        margin-bottom: 16px;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
    }
    
    .label-input-group button {
        flex: 0.5;
        background-color: #1A3B33;
        color: #fff;
        padding: 10px 20px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        margin-left: 8px;
    }
    
    .update-button {
        background-color: #1A3B33;
        color: #fff;
        padding: 8px 14px;
        font-size: 14px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        margin-bottom: 12px;
    }
    
    .modal {
                display: none;
                position: fixed;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                background-color: #fff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                z-index: 1000;
            }
    
            .modal-overlay {
                display: none;
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background: rgba(0, 0, 0, 0.5);
                z-index: 999;
            }
    
            /* 모달 버튼 스타일 */
            .modal-button {
                background-color: #1A3B33;
                color: #fff;
                padding: 10px 20px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }
    
    
        </style>
    </head>
    <body>
        <div id="container">
            <div class="profile-header">
                <h1>마이페이지</h1>
            </div>
            <div class="profile-form">
                <div class="label-input-group">
                    <label>이름:</label>
                    <input type="text" id="userName" name="userName" value="" disabled>
                    <button class="modal-button" onclick="openModal('userName')">이름 수정</button>
                </div>
                
                
    
                <div class="label-input-group">
                    <label for="userId">아이디:</label>
                    <input type="text" id="userId" name="userId" value="" disabled>
                    <button class="modal-button" onclick="openModal('userId')">수정</button>
                </div>
    
                <div class="label-input-group">
                    <label for="userId">비밀번호:</label>
                    <input type="text" id="userId" name="userId" value="" disabled>
                    <button class="modal-button" onclick="openModal('userPassword')">수정</button>
                </div>
    
    
                <div class="label-input-group">
                    <label for="userEmail">이메일:</label>
                    <input type="email" id="userEmail" name="userEmail" value="">
                    <button class="modal-button" onclick="openModal('userEmail')">수정</button>
                </div>
    
                <div class="label-input-group">
                    <label for="userBirth">생년월일:</label>
                    <input type="text" id="userBirth" name="userBirth" value="">
                    <button class="modal-button" onclick="openModal('userBirth')">수정</button>
                </div>
    
                <div class="label-input-group">
                    <label>우편번호:</label>
                    <input type="text" id="userZipcode" name="userZipcode">
                    <input type="button" value="우편번호검색" id="btn">
                    <div id="zipCheckResult"></div>
                </div>
                <div class="label-input-group">
                    <label for="userAddress">주소:</label>
                    <input type="text" id="userAddress" name="userAddress">
                    <div id="AddressCheckResult"></div>
                   
                    <label for="userDetailAddress">상세주소:</label>
                    <input type="text" id="userDetailAddress" name="userDetailAddress">
                    <div id="detailAddressCheckResult"></div>		
                </div>
            </div>
    
                <div class="button-container">
                    <button id="saveButton">수정하기</button>
                </div>
            </div>
        </div>
    
        <!-- 모달 버튼 -->
        
        
        <!-- 다른 필드에 대한 수정 버튼도 추가 가능 -->
    
        <!-- 모달 창 -->
        <div id="userNameModal" class="modal">
            <label for="modalUserName">이름:</label>
            <input type="text" id="modalUserName">
            <button class="update-button" onclick="updateInfo('userName')">저장</button>
            <button class="update-button" onclick="closeModal('userName')">취소</button>
        </div>
    
        <div id="userIdModal" class="modal">
            <label for="modalUserName">ID:</label>
            <input type="text" id="modalUserName">
            <button class="update-button" onclick="updateInfo('userName')">저장</button>
            <button class="update-button" onclick="closeModal('userName')">취소</button>
        </div>
    
        <div id="userIdModal" class="modal">
            <label for="modalUserName">ID:</label>
            <input type="text" id="modalUserName">
            <button class="update-button" onclick="updateInfo('userName')">저장</button>
            <button class="update-button" onclick="closeModal('userName')">취소</button>
        </div>
    
    
        <!-- 다른 필드에 대한 모달 창도 추가 가능 -->
    
        <!-- 모달 오버레이 -->
        <div id="modalOverlay" class="modal-overlay" onclick="closeAllModals()"></div>
    
    </div>
    
    <script>
        function openModal(field) {
            document.getElementById(field + 'Modal').style.display = 'block';
            document.getElementById('modalOverlay').style.display = 'block';
        }
    
        function closeModal(field) {
            document.getElementById(field + 'Modal').style.display = 'none';
            document.getElementById('modalOverlay').style.display = 'none';
        }
    
        function closeAllModals() {
            // 모든 모달 창과 오버레이 닫기
            var modals = document.querySelectorAll('.modal');
            modals.forEach(modal => modal.style.display = 'none');
            document.getElementById('modalOverlay').style.display = 'none';
        }
    
        function updateInfo(field) {
            // 여기에 정보 업데이트 로직 추가
            var newValue = document.getElementById('modal' + field).value;
            // AJAX 또는 다른 방법으로 서버에 업데이트 요청을 보낼 수 있음
            // 서버 업데이트가 성공하면 모달을 닫거나 필요한 작업 수행
            console.log('Updating ' + field + ' to: ' + newValue);
            closeModal(field);
        }
    </script>
    
    <script>
        window.addEventListener('scroll', function () {
            var headerHeight = document.querySelector('header').offsetHeight;
            document.querySelector('main').style.marginTop = headerHeight + 'px';
        });
    
        function validateForm() {
            // 여기에 유효성 검사 로직 추가
            return true; // 현재는 항상 true를 반환하도록 설정되어 있습니다.
        }
    </script>
    
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
        const btn = document.querySelector("#btn");
        btn.addEventListener("click", () => {
            new daum.Postcode({
                oncomplete: function (data) {
                    console.log(data);
    
                    let fullAddr = '';
                    let extraAddr = '';
    
                    if (data.userSelectedType === 'R') {
                        fullAddr = data.roadAddress;
                    } else {
                        fullAddr = data.jibunAddress;
                    }
    
                    if (data.userSelectedType === 'R') {
                        if (data.baname !== '') {
                            extraAddr += data.bname;
                        }
                        if (data.buildingName !== '') {
                            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                        }
    
                        fullAddr += (extraAddr !== '' ? ' (' + extraAddr + ')' : '')
                    }
                    document.getElementById('userZipcode').value = data.zonecode;
                    document.getElementById('userAddress').value = fullAddr;
                    document.getElementById('userDetailAddress').focus();
                }
            }).open();
        });
    </script>
    
    </body>
    </html>
    

