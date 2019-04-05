function validate() {
	var array = [fr.custno,fr.custname,fr.phone,fr.address,fr.joindate,fr.grade,fr.city];
    var txt_array = ["회원번호","회원성명","핸드폰전화","회원주소","가입일자","고객등급","도시코드"];
	for(var i =0; i<array.length;i++){
		if(array[i].value == ""){
			alert(txt_array[i]+"의 값이 없습니다.");
			array[i].focus();
			return false;
		}
	}
	return true;

}