// 전역 변수
var errmsg = "";
var errfld = null;

// 필드 검사
function check_field(fld, msg)
{
    if ((fld.value = trim(fld.value)) == "")
        error_field(fld, msg);
    else
        clear_field(fld);
    return;
}

// 필드 오류 표시
function error_field(fld, msg)
{
    if (msg != "")
        errmsg += msg + "\n";
    if (!errfld) errfld = fld;
    fld.style.background = "#FFE4E1";
}

// 필드를 깨끗하게
function clear_field(fld)
{
    fld.style.background = "#FFFFFF";
}

// 팝업 중앙에 띄우기
var pwin = null;
function win_open(url, name, w, h, scroll){
	LeftPosition = (screen.width) ? (screen.width-w)/2 : 0;
	TopPosition = (screen.height) ? (screen.height-h)/2 : 0;
	settings = 'height='+h+',width='+w+',top='+TopPosition+',left='+LeftPosition+',scrollbars='+scroll+',resizable=no'
	pwin = window.open(url, name, settings)
}

// 5자리 우편번호 도로명 우편번호 창
function win_zip(frm_name, frm_zip, frm_addr1, frm_addr2, frm_addr3, frm_jibeon)
{
	var url = tb_bbs_url+"/zip.php?frm_name="+frm_name+"&frm_zip="+frm_zip+"&frm_addr1="+frm_addr1+"&frm_addr2="+frm_addr2+"&frm_addr3="+frm_addr3+"&frm_jibeon="+frm_jibeon;
	win_open(url, "winZip", "483", "600", "yes");
}

// 쿠키 입력
function set_cookie(name, value, expirehours, domain)
{
    var today = new Date();
    today.setTime(today.getTime() + (60*60*1000*expirehours));
    document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + today.toGMTString() + ";";
    if (domain) {
        document.cookie += "domain=" + domain + ";";
    }
}

// 쿠키 얻음
function get_cookie(name)
{
    var find_sw = false;
    var start, end;
    var i = 0;

    for (i=0; i<= document.cookie.length; i++)
    {
        start = i;
        end = start + name.length;

        if(document.cookie.substring(start, end) == name)
        {
            find_sw = true
            break
        }
    }

    if (find_sw == true)
    {
        start = end + 1;
        end = document.cookie.indexOf(";", start);

        if(end < start)
            end = document.cookie.length;

        return unescape(document.cookie.substring(start, end));
    }
    return "";
}

/*Left menu구현*/
var old='';
function menu(name)
{
	submenu=eval("submenu_"+name+".style");
	if(old!=submenu)
	{
		if(old!='')
		{
			old.display='none';
		}
		submenu.display='block';
		old=submenu;
	}
	else
	{
		submenu.display='none';
		old='';
	}
}

function MM_swapImgRestore() { //v3.0
	var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_preloadImages() { //v3.0
	var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_swapImage() { //v3.0
	var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
	if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}

function MM_reloadPage(init) {  //reloads the window if Nav4 resized
  if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
    document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
  else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
}
MM_reloadPage(true);


function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_showHideLayers() { //v6.0
  var i,p,v,obj,args=MM_showHideLayers.arguments;
  for (i=0; i<(args.length-2); i+=3) if ((obj=MM_findObj(args[i]))!=null) { v=args[i+2];
    if (obj.style) { obj=obj.style; v=(v=='show')?'visible':(v=='hide')?'hidden':v; }
    obj.visibility=v; }
}

var jumin_field_length=0;
function TabNext(obj,event,len,next_field) {
	if (event == "down") {
		jumin_field_length=obj.value.length;
	}
	else if (event == "up") {
		if (obj.value.length != jumin_field_length) {
			jumin_field_length=obj.value.length;
			if (jumin_field_length == len) {
				next_field.focus();
			}
		}
	}
}

String.prototype.trim = function() {
    return this.replace(/(^\s*)|(\s*$)/g, "");
}

String.prototype.stripspace = function() {
	return this.replace(/ /g, "");
}

String.prototype.replaceAll = function(a, b) {
	var s = this;
	var n1, n2, s1, s2;

	while (true) {
		if ( s=="" || a=="" ) break;
		n1 = s.indexOf(a);
		if ( n1 < 0 ) break;
		n2 = n1 + a.length;
		if ( n1==0 ) {
			s1 = b;
		}
		else {
			s1 = s.substring(0, n1) + b;
		}
		if ( n2 >= s.length ) {
			s2 = "";
		}
		else {
			s2 = s.substring(n2, s.length);
		}
		s = s1 + s2;
	}
	return s;
}

// Event 추가 ##################################################
function addEvent(obj, evt, exec) {
	if (window.attachEvent) obj.attachEvent('on'+evt, exec);
	else if (window.addEventListener) obj.addEventListener(evt, exec, false);
	else obj['on'+evt] = exec;
}

// 팝업 ##################################################
function openPopup(theURL, winName, width, height, remFeatures) {
	var features = "";
	if (typeof winName == "undefined") winName = "";
	if (typeof width != "undefined") features += ((features) ? "," : "")+"width="+width;
	if (typeof height != "undefined") features += ((features) ? "," : "")+"height="+height;
	if (typeof remFeatures != "undefined") features += ((features) ? "," : "")+remFeatures;
	if (features.indexOf("status") < 0) features += ",status=yes";

	var popup = window.open(theURL, winName, features);
	popup.focus();

	return popup;
}

// 팝업 - 팝업창 화면중앙 오픈 ##################################################
function openPopupCenter(theURL, winName, width, height, remFeatures) {
	var left = (screen.width/2) - (width/2);
	var top = (screen.availHeight/2) - (height/2);
	var features = "left="+left+",top="+top+",width="+width+",height="+height;
	if (typeof winName == "undefined") winName = "";
	if (typeof remFeatures != "undefined") features += ","+remFeatures;
	if (features.indexOf("status") < 0) features += ",status=yes";

	var popup = window.open(theURL, winName, features);
	popup.focus();

	return popup;
}

// 팝업 - 팝업창 사이즈 조정 ##################################################
function resizePopupWindow(width, height) {
	var strAgent = navigator.userAgent.toLowerCase();
	var isIE7 = (strAgent.indexOf('msie 7.0') != -1);
	var isMoz = (strAgent.indexOf('gecko') != -1);
	window.resizeTo(width+10, height+(isIE7?71:(isMoz?81:49)));
}

// 팝업 - 팝업창 위치 조정 ##################################################
function movePopupWindow(left, top) {
	window.moveTo(left, top);
}

// 모달 ##################################################
function MM_openModal(theURL, obj, features) {
	window.showModalDialog(theURL, obj, features);
}

// 키 관련 함수 ##################################################
function blockKey(e) {
	var e = window.event || e;
	if (window.event) {
		e.returnValue = false;
	}
	else {
		if (e.which != 8) e.preventDefault(); // 8 : Back Space
	}
}

function blockEnter(e) {
	var e = window.event || e;
	if (window.event) {
		if (e.keyCode == 13) e.returnValue = false;
	}
	else {
		if (e.which == 13) e.preventDefault();
	}
}

function blockNotNumber(e) {
	var e = window.event || e;
	if (window.event) {
		if (e.keyCode < 48 || e.keyCode > 57) e.returnValue = false;
	}
	else {
		if (e.which != 8 && (e.which < 48 || e.which > 57)) e.preventDefault(); // 8 : Back Space
	}
}

function onEnter(e, exec) {
	var e = window.event || e;
	var keyCode = (window.event) ? e.keyCode : e.which;
	if (keyCode == 13) eval(exec);
}

// 즐겨찾기 추가
function addFavorites(title, url) {
	// Google Chrome
	if(window.chrome){
		alert("Ctrl+D키를 누르시면 즐겨찾기에 추가하실 수 있습니다.");
	}
	// Firefox
	else if(window.sidebar) {
		window.sidebar.addPanel(title, url, "");
	}
	// Opera
	else if(window.opera && window.print) {
		var elem = document.createElement('a');
		elem.setAttribute('href',url);
		elem.setAttribute('title',title);
		elem.setAttribute('rel','sidebar');
		elem.click();
	}
	// Internet Explorer
	else if (window.external && ('AddFavorite' in window.external)) {
		window.external.AddFavorite(url, title);
	}
}

// 시작페이지 설정 ##################################################
// 예) <a href="javascript:;" onClick="setStartPage(this, 'http://www.homepage.com');">시작페이지로</a>
function setStartPage(obj, url) {
	if (document.all && window.external) { // IE
		obj.style.behavior = "url(#default#homepage)";
		obj.setHomePage(url);
	}
	else { // Firefox, Opera, Safari ...
		alert("현재 브라우져에서는 이용할 수 없습니다.");
		return;
    }
}

// 페이지 이동 ##################################################
function gotoUrl(url) {
	if (url.stripspace() != "") {
		location.href = url;
	}
}

// 페이지 최상단으로 ##################################################
function goTop() {
	window.scrollTo(0, 0);
}

// 이미지 미리보기 ##################################################
function previewImage(obj, imgId) {
	var objImg = document.getElementById(imgId);

	if (obj.value.stripspace() == "") return;

	var ext = getFileExt(obj.value).toUpperCase();

	if (ext == 'JPG' || ext == 'GIF' || ext == 'BMP' || ext == 'PNG') objImg.src = obj.value;
}

// 이미지 사이즈 줄이기 ##################################################
function resizeImage(objImg, limitId) {
	if (typeof (objImg) != "object") objImg = document.getElementById(objImg);
	var objParent = objImg.parentNode;
	var imgWidth = parseInt(objImg.width, 10);
	var fixWidth = imgWidth;

	if (typeof limitId == 'undefined') return;

	while (objParent) {
		if (objParent && objParent.id == limitId) {
			fixWidth = objParent.clientWidth;
			break;
		}
		objParent = objParent.offsetParent;
	}

	if (imgWidth > fixWidth) {
		objImg.width = fixWidth;
	}
}

function resizeImageAll(limitId) {
	var objLimit = document.getElementById(limitId);
	if (objLimit) {
		var fixWidth = objLimit.clientWidth;
		var arrImgs = objLimit.getElementsByTagName("IMG");
		for (var i=0, len=arrImgs.length; i<len; i++) {
			if (parseInt(arrImgs[i].width, 10) > fixWidth) {
				arrImgs[i].width = fixWidth;
			}
		}
	}
}

// IFRAME RESIZE 함수 ##################################################
function resizeFrame(iframeWindow, minWidth, minHeight, fixWidth, fixHeight) {
	if (!iframeWindow.name) return false;

	var iframeElement = document.getElementById(iframeWindow.name);
	var resizeWidth = 0;
	var resizeHeight = 0;

	minWidth = (typeof minWidth != 'undefined') ? parseInt(minWidth, 10) : 0;
	minHeight = (typeof minHeight != 'undefined') ? parseInt(minHeight, 10) : 0;
	fixWidth = (typeof fixWidth != 'undefined') ? parseInt(fixWidth, 10) : 0;
	fixHeight = (typeof fixHeight != 'undefined') ? parseInt(fixHeight, 10) : 0;

	if (document.all) { // ie
		if (iframeWindow.document.compatMode && iframeWindow.document.compatMode != 'BackCompat') {
			resizeWidth = iframeWindow.document.documentElement.scrollWidth;
			resizeHeight = iframeWindow.document.documentElement.scrollHeight;
		}
		else {
			resizeWidth = iframeWindow.document.body.scrollWidth;
			resizeHeight = iframeWindow.document.body.scrollHeight;
		}
	}
	else {
		resizeWidth = iframeWindow.document.body.scrollWidth;
		resizeHeight = iframeWindow.document.body.scrollHeight;
	}

	if (minWidth > 0 && resizeWidth < minWidth) resizeWidth = minWidth;			// 최소 폭
	if (minHeight > 0 && resizeHeight < minHeight) resizeHeight = minHeight;		// 최소 높이

	if (fixWidth > 0) resizeWidth = fixWidth;		// 고정 폭
	if (fixHeight > 0) resizeHeight = fixHeight;	// 고정 높이

	if (fixWidth > -1) iframeElement.style.width = resizeWidth + 'px';
	if (fixHeight > -1) iframeElement.style.height = resizeHeight + 'px';
}

// 현재 이벤트객체 Index 가져오기 ##################################################
function getDisObjIdx(obj) {
	var i = 0;
	var result = 0;

	var arrTag = document.getElementsByTagName('*');

	if (obj.sourceIndex) {
		while (arrTag[i].sourceIndex < obj.sourceIndex) {
			if (arrTag[i].id == obj.id) ++result;
			++i;
		}
	}
	else if (obj.compareDocumentPosition) {
		while ((arrTag[i].compareDocumentPosition(obj) & 6) - 3 > 0) {
			if (arrTag[i].id == obj.id) ++result;
			++i;
		}
	}

	return result;
}

// 체크박스 전체선택 ##################################################
function checkCbAll(cbList, isChecked) {
	if (cbList) {
		if (typeof(cbList.length) == "undefined") {
			if (!cbList.disabled) cbList.checked = isChecked;
		}
		else {
			for (var i=0; i<cbList.length; i++) {
				if (cbList[i].type.toUpperCase() == 'CHECKBOX') {
					if (cbList[i].value.stripspace() != "" && !cbList[i].disabled) {
						cbList[i].checked = isChecked;
					}
				}
			}
		}
	}
}

// 텍스트 길이 확인 (일반) ##################################################
function checkTextLen(obj, mLen) {
	if (obj.value.length > mLen){
		alert("1~"+mLen+"자까지 입력이 가능합니다.");
		obj.value = obj.value.substring(0, mLen);
		obj.focus();
		return false;
	}

	return true;
}

// 텍스트 길이 확인 (Byte) ##################################################
function checkTextLenByte(obj, mLen) {
	var i, len;
	var byteLen = 0;
	var value = obj.value;

	for (i=0, len=value.length; i<len; i++) {
		++byteLen;

		if ((value.charCodeAt(i) < 0) || (value.charCodeAt(i) > 127)) ++byteLen;

		if (byteLen > mLen) {
			alert("1~"+(mLen / 2)+"자의 한글, 또는 2~"+mLen+"자의 영문, 숫자, 문장기호로 입력이 가능합니다.");
			obj.value = value.substring(0, i);
			obj.focus();
			return false;
		}
	}

	return true;
}

// 객체 Offset 가져오기 ##################################################
function getOffset(obj) {
	var objOffset = { left : 0, top : 0 };
	var objOffsetParent = obj.offsetParent;

	objOffset.left = parseInt(obj.offsetLeft, 10);
	objOffset.top = parseInt(obj.offsetTop, 10);

	while (objOffsetParent) {
		objOffset.left += parseInt(objOffsetParent.offsetLeft, 10);
		objOffset.top += parseInt(objOffsetParent.offsetTop, 10);

		objOffsetParent = objOffsetParent.offsetParent;
	}

	return objOffset;
}

// 텍스트 Byte 길이 가져오기 ##################################################
function getTextByte(value) {
	var i, len;
	var byteLen = 0;

	for (i=0, len=value.length; i<len; i++) {
		if (escape(value.charAt(i)).length >= 4) {
			byteLen += 2;
		}
		else if (escape(value.charAt(i)) != "%0D") {
			++byteLen;
		}
	}

	return byteLen;
}

// 입력 문자길이 확인후 다음항목으로 포커스 옮기기 ##################################################
function goNextFocus(obj, len, next_item) {
	if (obj.value.stripspace().length == len){
		next_item.focus();
	}
}

// 영문 문자열 확인 ##################################################
function strEngCheck(value){
	var i;

	for(i=0;i<value.length-1;i++){
		// 한글 체크 (한글 ASCII코드 : 12593부터)
		if (value.charCodeAt(i) > 12592) return false;
		// 공백 체크
		if (value.charAt(i) == " ") return false;
	}
	return true;
}

// 파일명 확인 ##################################################
function checkFileName(obj) {
	var result = false;

	if (obj.value.stripspace() != "") {
		var fidx = obj.value.lastIndexOf("\\")+1;
		var filename = obj.value.substr(fidx, obj.value.length);
		result = strEngCheck(filename);
	}

	if (!result) {
		alert("파일명을 반드시 영문 또는 숫자로 해주세요.");
		obj.focus();
		return false;
	}
	return true;
}

// 파일 확장자 ##################################################
function getFileExt(value) {
	if (value != "") {
		var fidx = value.lastIndexOf("\\")+1;
		var filename = value.substr(fidx, value.length);
		var eidx = filename.lastIndexOf(".")+1;

		return filename.substr(eidx, filename.length);
	}
}

// 파일확장자 확인 ##################################################
function checkFileExt(obj, exts, errMsg) {
	var arrExt = exts.toLowerCase().split(",");
	var result = false;

	if (obj.value.stripspace() != "") {
		var ext = getFileExt(obj.value).toLowerCase();

		for (var i=0; i<arrExt.length; i++) {
			if (arrExt[i].trim() == ext) result = true;
		}
	}

	if (!result) {
		alert(errMsg);
		obj.focus();
		return false;
	}
	return true;
}

// 영문/숫자 혼용 확인 ##################################################
function checkEngNum(str) {
	var RegExpE = /[a-zA-Z]/i;
	var RegExpN = /[0-9]/;

	return (RegExpE.test(str) && RegExpN.test(str)) ? true : false;
}

// 특수문자 확인 ##################################################
function checkSpecialChar(value) {
	var specialChar = "`~!@#$%^&*_+=|\\[]{}:;,<.>/?'\"";
	for (var i=0, len=specialChar.length; i<len; i++) {
		if (value.indexOf(specialChar.substr(i, 1)) != -1) return true;
	}
	return false;
}

// 아이디 확인 ##################################################
function checkID(value, min, max) {
	var RegExp = /^[a-zA-Z0-9_]*$/i;
	var returnVal = RegExp.test(value) ? true : false;
	if (typeof(min) != "undefined" && value.length < min) returnVal = false;
	if (typeof(max) != "undefined" && value.length > max) returnVal = false;
	return returnVal;
}

// 비밀번호 확인 ##################################################
function checkPass(value, min, max) {
	var RegExp = /^[a-zA-Z0-9]*$/i;
	var returnVal = RegExp.test(value) ? true : false;
	if (typeof(min) != "undefined" && value.length < min) returnVal = false;
	if (typeof(max) != "undefined" && value.length > max) returnVal = false;
	return returnVal;
}

// 숫자 확인 ##################################################
function checkNum(value, isDec) {
	var RegExp;

	if (!isDec) isDec = false;
	RegExp = (isDec) ? /^-?[\d\.]*$/ : /^-?[\d]*$/;

	return RegExp.test(value)? true : false;
}

// 이메일 확인 ##################################################
function checkEmail(email) {
	if (email.search(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/) != -1) {
		return true;
	}
	else {
		return false;
	}
}

// URL 확인 ##################################################
function checkUrl(url) {
	var exp = new RegExp("^(http|https)\:\/\/");
	if (exp.test(url.toLowerCase())) {
		return true;
	}
	else {
		return false;
	}
}

// 공백 확인 ##################################################
function checkEmpty(obj) {
	if (obj.value.stripspace() == "") {
		return true;
	}
	else {
		return false;
	}
}

// Radio(CheckBox) 설정값 가져오기 ##################################################
function getRadioVal(obj) {
	var i, value = "";

	if (obj) {
		if (typeof(obj.length) == "undefined") {
			if (obj.checked) {
				value = obj.value;
			}
		}
		else {
			for (i=0; i<obj.length; i++) {
				if (obj[i].checked) {
					value = obj[i].value;
					break;
				}
			}
		}
	}
	return value;
}

// Radio 설정하기 ##################################################
function setRadioVal(obj, value) {
	var i;

	if (obj) {
		if (typeof(obj.length) == "undefined") {
			if (obj.value == value) {
				obj.checked = true;
			}
		}
		else {
			for(i=0; i<obj.length; i++) {
				if (obj[i].value == value) {
					obj[i].checked = true;
					break;
				}
			}
		}
	}
}

// Radio Disabled 설정하기 ##################################################
function setRadioDisabled(obj, value, disabled) {
	var i;

	if (obj) {
		if (typeof(obj.length) == "undefined") {
			if (obj.value == value) {
				obj.disabled = disabled;
			}
		}
		else {
			for(i=0; i<obj.length; i++) {
				if (obj[i].value == value) {
					obj[i].disabled = disabled;
					break;
				}
			}
		}
	}
}

// Form Disabled 전체 설정하기 ##################################################
function setRadioDisabledAll(obj, disabled) {
	var i;

	if (obj) {
		if (typeof(obj.length) == "undefined") {
			obj.disabled = disabled;
		}
		else {
			for(i=0; i<obj.length; i++) {
				obj[i].disabled = disabled;
			}
		}
	}
}

// Select 설정값 가져오기 ##################################################
function getSelectVal(obj) {
	var value = "";
	var idx = obj.selectedIndex;

	if (idx >= 0){
		value = obj.options[idx].value;
	}

	return value;
}

// Select Option 추가 ##################################################
function selectAddList(obj, text, value) {
	var newOpt = document.createElement("OPTION");
	newOpt.text = text;
	newOpt.value = value;
	obj.options.add(newOpt);
}

// Select Option 전체삭제 ##################################################
function selectRemoveAll(obj) {
	for (var i=obj.length-1; i>=0; i--) {
		selectRemoveList(obj, i);
	}
}

// Select Option 삭제 ##################################################
function selectRemoveList(obj, i) {
	obj.remove(i);
}

// Hidden 추가 ##################################################
function addHidden(f, name, value) {
	var input = document.createElement('INPUT');
	input.type = 'HIDDEN';
	input.name = name;
	input.value = value;
	f.appendChild(input);
}

// 숫자 문자열에서 문자열 제거 ##################################################
function stripCharFromNum(value, isDec) {
	var i;
	var minus = "-";
	var nums = "1234567890"+((isDec) ? "." : "");
	var result = "";

	for(i=0; i<value.length; i++) {
		numChk = value.charAt(i);
		if (i == 0 && numChk == minus) {
			result += minus;
		}
		else {
			for(j=0; j<nums.length; j++) {
				if(numChk == nums.charAt(j)) {
					result += nums.charAt(j);
					break;
				}
			}
		}
	}
	return result;
}

// 콤마(,) 제거 ##################################################
function stripComma(str) {
    var re = /,/g;
    return str.replace(re, "");
}

// 숫자 3자리수마다 콤마(,) 찍기 ##################################################
function formatComma(num, pos) {
	if (!pos) pos = 0;  //소숫점 이하 자리수
	var re = /(-?\d+)(\d{3}[,.])/;

	var strNum = stripComma(num.toString());
	var arrNum = strNum.split(".");

	arrNum[0] += ".";

    while (re.test(arrNum[0])) {
        arrNum[0] = arrNum[0].replace(re, "$1,$2");
    }

	if (arrNum.length > 1) {
		if (arrNum[1].length > pos) {
			arrNum[1] = arrNum[1].substr(0, pos);
		}
		return arrNum.join("");
	}
	else {
		return arrNum[0].split(".")[0];
	}
}

// 강제 소수점 이하 0채우기 ##################################################
// num: 대상숫자, pos: 출력을 원하는 소수점자리수
function setRoundZero(num, pos) {
	var strNum = stripComma(num.toString());
	var arrNum = strNum.split(".");

	if (arrNum.length <= 1) {
		num = arrNum[0]+".";
		for (var i=0; i<pos; i++) {
			num += "0";
		}
	}
	else {
		num = setRound(num, pos);
	}
	return num;
}

// 소수점 이하 반올림 ##################################################
// num: 대상숫자, pos:출력을 원하는 소수점자리수
function setRound(num, pos) {
	if(!pos) pos = 0;
	return Math.round(num*Math.pow(10,pos)) / Math.pow(10, pos);
}

// 소수점 이하 자름
// num: 대상숫자, pos:출력을 원하는 소수점자리수
function setFloor(num, pos)
{
	if(!pos) pos = 0;
	return Math.floor(num*Math.pow(10,pos)) / Math.pow(10, pos);
}

// 금액 절사
// num: 대상숫자, pos:절사 자릿수 (Default 10원단위 절사)
function setCutting(num, pos)
{
	if(!pos) pos = 10;
	return Math.floor(num/pos) * pos;
}

// 소수점 이하 자리수 확인 ##################################################
// num: 대상숫자, pos: 희망 소수점 이하자리수
function checkRound(num, len) {
	var strNum = stripComma(num.toString());
	var arrNum = strNum.split(".");

	if (arrNum.length > 1 && arrNum[1].length > len) return false;
	else return true;
}

// 통화형태로 변환 ##################################################
function toCurrency(obj) {
	if (obj.disabled) return false;

	var num = obj.value.stripspace();
	if (num == "") return false;

	if (!checkNum(stripComma(num))) {
		//alert ("숫자만 입력해주세요.");
		num = stripCharFromNum(num, false);
		obj.blur(); obj.focus();
	}
	num = stripCharFromNum(stripComma(num), false);
	num = removePreZero(num);
	obj.value = formatComma(num);
}

// 숫자입력 확인 ##################################################
function numberOnly(obj, isDec) {
	if (!isDec) isDec = false;
	if (obj.disabled) return false;

	var num = obj.value.stripspace();
	if (num == "") return false;

	if (!checkNum(num, isDec)) {
		alert ("숫자만 입력해주세요.");
		num = stripCharFromNum(num, isDec);
		obj.blur(); obj.focus();
	}
	num = stripCharFromNum(stripComma(num), isDec);

	var arrNum = num.split(".");
	if (arrNum.length > 1) {
		obj.value = arrNum[0]+"."+arrNum[1];
	}
	else {
		obj.value = arrNum[0];
	}
}

// 숫자 증감 처리 ##################################################
function controllNum(obj, mode, isminus) {
	var num = obj.value;
	if (!isminus) isminus = 0;

	num = (num.stripspace() == "") ? 0 : num;
	num = (isNaN(num)) ? 0 : parseInt(num, 10);

	if (mode == '+') ++num;
	else --num;

	if (isminus != 1 && num < 0) num = 0;

	obj.value = num;
}

// 자바스크립트로 PHP의 number_format 흉내를 냄
// 숫자에 , 를 출력
function number_format(num, pos) {
	if (!pos) pos = 0;  //소숫점 이하 자리수
	var re = /(-?\d+)(\d{3}[,.])/;

	var strNum = no_comma(num.toString());
	var arrNum = strNum.split(".");

	arrNum[0] += ".";

    while (re.test(arrNum[0])) {
        arrNum[0] = arrNum[0].replace(re, "$1,$2");
    }

	if (arrNum.length > 1) {
		if (arrNum[1].length > pos) {
			arrNum[1] = arrNum[1].substr(0, pos);
		}
		return arrNum.join("");
	}
	else {
		return arrNum[0].split(".")[0];
	}
}

// , 를 없앤다.
function no_comma(data)
{
    var tmp = '';
    var comma = ',';
    var i;

    for (i=0; i<data.length; i++)
    {
        if (data.charAt(i) != comma)
            tmp += data.charAt(i);
    }
    return tmp;
}

function getPosition(e)
{
	try
	{
		var mouseX = e.pageX ? e.pageX : document.documentElement.scrollLeft + event.clientX;
		var mouseY = e.pageX ? e.pageX : document.documentElement.scrollLeft + event.clientY;
	}
	catch (e)
	{
		var mouseX = document.body.offsetWidth - 350;
		var mouseY = document.body.offsetHeight - 400;
	}

    return {x: mouseX, y: mouseY};
}

/**
 * 필드 자동 포커스이동
 * obj 체크할 필드, toID 이동할 필드의 ID, maxLen 이동될 문자열길이
 */
function fieldLengthFocus(obj, toID, maxLen)
{
    if(toID == null || maxLen == null)
    {
        return false;
    }

    if(obj.value.length >= maxLen)
    {
        document.getElementById(toID).focus();
    }
}

// 양쪽 공백 없애기
function trim(sVal)
{
    var pattern = /(^\s*)|(\s*$)/g; // \s 문자열 시작부분과 문자열 끝나는 부분의 공백, 탭을 모두 찾는다.
    sReturnVal = sVal.replace(pattern, "");
    return sReturnVal;
}

// Sub ID		: getRadioValue
// Description	: 체크된 라디오버튼 값
// Param		: obj	- RadioButton object
// Return		: 체크된 라디오버튼 값
function getRadioValue(obj){
	if(obj){
		if(obj.length){
			for(i=0;i<obj.length;i++){
				if(obj[i].checked == true){
					return obj[i].value;
				}
			}

		}else{
			return obj.value;
		}
	} else { return false; }
}

// 이미지맵 위치로 이동
function pg_anchor(uid) {
	location.hash = uid;
}

// 숫자 3자리 마다 콤마를 삽입
function commaStr(n)
{
    var reg = /(^[+-]?\d+)(\d{3})/;
    n += "";

    while (reg.test(n))
        n = n.replace(reg, "$1" + "," + "$2");
    return n;
}

// 콤마제거
function deCommaStr(obj)
{
    num = obj.value+"";
    if (obj.value!="") {
        obj.value = obj.value.replace(/,/g, "");
    }
}

// 입력폼에 숫자 3자리 마다 콤마를 삽입
function addComma(obj,fLen)
{
	if(event.keyCode == 37 || event.keyCode == 39 )
	{
		return;
	}

	var fLen = fLen || 2;
	var strValue = obj.value.replace(/,|\s+/g,'');
	var strBeforeValue = (strValue.indexOf('.') != -1)? strValue.substring(0,strValue.indexOf('.')) :strValue ;
	var strAfterValue = (strValue.indexOf('.') != -1)? strValue.substr(strValue.indexOf('.'),fLen+1) : '' ;

	if(isNaN(strValue))
	{
		alert(strValue.concat(' -> 특수문자/영문/한글은 입력할 수 없습니다.'));
		return false;
	}

	var intLast = strBeforeValue.length-1;
	var arrValue = new Array;
	var strComma = '';

	for(var i=intLast,j=0; i >= 0; i--,j++)
	{
		if( j !=0 && j%3 == 0)
		{
			strComma = ',';
		}
		else
		{
			strComma = '';
		}

		arrValue[arrValue.length] = strBeforeValue.charAt(i) + strComma ;
	}

	obj.value= arrValue.reverse().join('') + strAfterValue;
}

// 날짜검색
function search_date(fr_date, to_date, today)
{
	if(today == "오늘") {
		var obj1 = document.getElementById(fr_date);
		var obj2 = document.getElementById(to_date);
		var mydate = new Date();
		mydate.setDate(mydate.getDate());

		obj1.value = formatDate(mydate);
		if(obj2 != null) {
			obj2.value = obj1.value;
		}
	} else if(today == "어제") {
		var obj1 = document.getElementById(fr_date);
		var obj2 = document.getElementById(to_date);
		var mydate = new Date();
		mydate.setDate(mydate.getDate() - 1);

		obj1.value = formatDate(mydate);
		if(obj2 != null) {
			obj2.value = obj1.value;
		}
	} else if(today == "이번주") {
		var obj1 = document.getElementById(fr_date);
		var obj2 = document.getElementById(to_date);

		var now = new Date();
		var nowDayOfWeek = now.getDay();
		var nowDay = now.getDate();
		var nowMonth = now.getMonth();
		var nowYear = now.getYear();
		nowYear += (nowYear < 2000) ? 1900 : 0;
		var weekStartDate = new Date(nowYear, nowMonth, nowDay - nowDayOfWeek);
		var weekEndDate = new Date(nowYear, nowMonth, nowDay + (6 - nowDayOfWeek));

		obj1.value = formatDate(weekStartDate);
		obj2.value = formatDate(weekEndDate);
	} else if(today == "일주일") {
		var obj1 = document.getElementById(fr_date);
		var obj2 = document.getElementById(to_date);
		var mydate = new Date();

		mydate.setDate(mydate.getDate() - 7);
		obj1.value = formatDate(mydate);
		obj2.value = formatDate(new Date());
	} else if(today == "1개월") {
		var obj1 = document.getElementById(fr_date);
		var obj2 = document.getElementById(to_date);
		var mydate = new Date();
		mydate.setDate(mydate.getDate() - 30);

		obj1.value = formatDate(mydate);
		obj2.value = formatDate(new Date());
	} else if(today == "2개월") {
		var obj1 = document.getElementById(fr_date);
		var obj2 = document.getElementById(to_date);
		var mydate = new Date();
		mydate.setDate(mydate.getDate() - 60);

		obj1.value = formatDate(mydate);
		obj2.value = formatDate(new Date());
	} else if(today == "3개월") {
		var obj1 = document.getElementById(fr_date);
		var obj2 = document.getElementById(to_date);

		var mydate = new Date();
		mydate.setDate(mydate.getDate() - 90);

		obj1.value = formatDate(mydate);
		obj2.value = formatDate(new Date());
	} else if(today == "이번달") {
		var obj1 = document.getElementById(fr_date);
		var obj2 = document.getElementById(to_date);

		var d2, d3;
		var now = new Date();
		var nowYear = now.getYear();
		nowYear += (nowYear < 2000) ? 1900 : 0;

		d2 = new Date(nowYear, now.getMonth());
		d3 = new Date(nowYear, now.getMonth() + 1, "");

		obj1.value = formatDate(d2);
		obj2.value = formatDate(d3);
	} else if(today == "지난달") {
		var obj1 = document.getElementById(fr_date);
		var obj2 = document.getElementById(to_date);

		var d2, d3;
		var now = new Date();
		var nowYear = now.getYear();
		nowYear += (nowYear < 2000) ? 1900 : 0;

		d2 = new Date(nowYear, now.getMonth() -1);
		d3 = new Date(nowYear, now.getMonth(), "");

		obj1.value = formatDate(d2);
		obj2.value = formatDate(d3);
	} else if(today == "전체") {
		var obj1 = document.getElementById(fr_date);
		var obj2 = document.getElementById(to_date);
		obj1.value = "";
		obj2.value = "";
	}
}

// 날짜계산
function formatDate(date)
{
	var mymonth = date.getMonth() + 1;
    var myweekday = date.getDate();
    return (date.getFullYear() + "-" + ((mymonth < 10) ? "0" : "") + mymonth + "-" + ((myweekday < 10) ? "0" : "") + myweekday);
}

// SNS
function share_sns(id, url) {
	switch(id) {
		case 'facebook' :
			window.open(url, "win_facebook", "menubar=0,resizable=1,width=600,height=400");
			break;
		case 'twitter' :
			window.open(url, "win_twitter", "menubar=0,resizable=1,width=600,height=400");
			break;
		case 'googleplus' :
			window.open(url, "win_googleplus", "menubar=0,resizable=1,width=600,height=600");
			break;
		case 'naverband' :
			window.open(url, "win_naverband", "menubar=0,resizable=1,width=410,height=540");
			break;
		case 'naver' :
			window.open(url, "win_naver", "menubar=0,resizable=1,width=450,height=540");
			break;
		case 'kakaostory' :
			window.open(url, "win_kakaostory", "menubar=0,resizable=1,width=500,height=500");
			break;
		case 'pinterest' :
			window.open(url, "win_tumblr", "menubar=0,resizable=1,width=600,height=400");
			break;
		case 'tumblr' :
			window.open(url, "win_tumblr", "menubar=0,resizable=1,width=540,height=600");
			break;
	}
    return false;
}

// 주문 구매확정
function final_confirm(hash)
{
	if(confirm("구매확정 하시겠습니까?")) {
		var save_result = "";
		$.ajax({
			type: "POST",
			data: { "hash": hash },
			url: tb_shop_url+"/ajax.orderfinalsave.php",
			cache: false,
			async: false,
			success: function(data) {
				save_result = data;
			}
		});

		if(save_result) {
			alert(save_result);
			return false;
		}

		location.reload();
    } else {
        return false;
    }
}

function itemlistwish(gs_id) {
	$.post(
        tb_shop_url+"/ajax.wishupdate.php",
        { gs_id: gs_id },
        function(data) {
			if(data == 'INSERT') {
				$("."+gs_id).attr('class',gs_id+' zzim on');
			} else if(data == 'DELETE') {
				$("."+gs_id).attr('class',gs_id+' zzim');
			} else {
				alert(data);
			}
        }
    );
}

function saupjaonopen(saupjano) {
	var url = "http://www.ftc.go.kr/info/bizinfo/communicationViewPopup.jsp?wrkr_no="+saupjano;
	window.open(url, "communicationViewPopup", "width=750, height=700;");
}

$(function(){
	// 최상단 큰배너
	$("#hd_close").click(function(){
		$("#hd_banner").slideUp('fast');
		$.post(tb_bbs_url+"/ajax.hd_banner.php", { type: "close" });
	});
});
