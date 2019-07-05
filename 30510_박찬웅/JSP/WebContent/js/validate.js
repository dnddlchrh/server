function validate() {
	var array = [join.id,join.pw,join.name,join.gender,join.birth,join.in_date,join.job];
    var txt_array = ["아이디","비밀번호","이름","성별","생년월일","가입일시","직업"];
	for(var i =0; i<array.length;i++){
		if(array[i].value == ""){
			alert(txt_array[i]+"를 입력하지 않았습니다.");
			array[i].focus();
			return false;
		}
	}
	return true;

}