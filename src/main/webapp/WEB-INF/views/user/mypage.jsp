<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
                <input type="text" id="userName" name="userName" value="${user.userName}" disabled>
                <button onclick="openModal('userName')">수정</button>
            </div>

            <div class="label-input-group">
                <label for="userId">아이디:</label>
                <input type="text" id="userId" name="userId" value="${user.userId}" disabled>
                
            </div>

            <div class="label-input-group">
                <label for="userPassword">비밀번호:</label>
                <input type="text" id="userPassword" name="userPassword" value="${user.userPassword}" disabled>
                
            </div>

            <div class="label-input-group">
                <label for="userEmail">이메일:</label>
                <input type="email" id="userEmail" name="userEmail" value="${user.userEmail}">
                
            </div>

            <div class="label-input-group">
                <label for="userBirth">생년월일:</label>
                <input type="text" id="userBirth" name="userBirth" value="${user.userBirth}">
                
            </div>

            <div class="label-input-group">
                <label>우편번호:</label>
                <input type="text" id="userZipcode" name="userZipcode" value="${user.userZipcode}" disabled>
                <input type="button" value="우편번호검색" id="btn">
                <div id="zipCheckResult"></div>
            </div>

            <div class="label-input-group">
                <label for="userAddress">주소:</label>
                <input type="text" id="userAddress" name="userAddress" value="${user.userAddress}" disabled>
                <div id="AddressCheckResult"></div>

                <label for="userDetailAddress">상세주소:</label>
                <input type="text" id="userDetailAddress" name="userDetailAddress" value="${user.userDetailAddress}" disabled>
            </div>
        </div>

        <div class="button-container">
            <button onclick="updateUserInfo()">변경사항 저장</button>
        </div>
    </div>

    
    <div id="myModal" class="modal">
	    <div class="modal-content">
	        <span class="close" onclick="closeModal()">&times;</span>
	        <label id="modalLabel"></label>
	        <input type="text" id="modalInput">
	        <button onclick="updateUserInfo()">확인</button>
	    </div>
	</div>
    
    
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
        const btn = document.querySelector("#btn");
        btn.addEventListener("click", () => {
            new daum.Postcode({
                oncomplete: function (data) {
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
    <script>
    function openModal(fieldName) {
        var modal = document.getElementById("myModal");
        var label = document.getElementById("modalLabel");
        var input = document.getElementById("modalInput");

        // 필드 이름에 따라 레이블 및 입력 값을 설정합니다.
        label.innerText = "변경할 " + fieldName;
        input.value = document.getElementById(fieldName).value;

        modal.style.display = "block";
    }

    function closeModal() {
        document.getElementById("myModal").style.display = "none";
    }

    function updateUserInfo() {
        // 모달 입력에서 업데이트된 값을 가져옵니다.
        var updatedValue = document.getElementById("modalInput").value;

        // 메인 페이지의 해당 입력 필드를 업데이트합니다.
        var fieldName = document.getElementById("modalLabel").innerText.split(" ")[1];
        document.getElementById(fieldName).value = updatedValue;

        // 모달을 닫습니다.
        closeModal();
    }
</script>
    
   
    
</body>
</html>
