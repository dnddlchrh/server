function vaildate() {
	var array = [fr.saleno,fr.scode,fr.saledate,fr.pcode,fr.amount];
    var txt_array = ["매출전표번호","지점코드","판매일자","피자코드","판매수량"];
	for(var i =0; i<array.length;i++){
		if(array[i].value == ""){
			alert(txt_array[i]+"의 값이 없습니다.");
			array[i].focus();
			return false;
		}
	}
	return true;
}