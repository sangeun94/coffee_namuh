var checkAll = document.querySelector('.checkAll');
var chkbox = document.querySelectorAll('.chkbox');

/* === 전체선택 클릭시 체크/해제 === */
checkAll.onclick = function(){
    if(checkAll.checked == false){
        for(var i=0; i<chkbox.length; i++){ chkbox[i].checked = false; }//for
    }else{
        for(var i=0; i<chkbox.length; i++){ chkbox[i].checked = true; }//for
    }
};//onclick


/* === 하위요소 해제시 전체선택 해제 === */
for(var i=0; i<chkbox.length; i++){
    chkbox[i].onclick = function(){
        if( this.checked == false ){ checkAll.checked = false; }
    }//onclick
}//for