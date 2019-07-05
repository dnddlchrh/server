function validate() {
	var array = [join.sale_no,join.sale_ymd,join.sale_fg,join.store_cd,join.goods_cd,join.sale_cnt,join.pay_type];
    var txt_array = ["번호","날짜","판매구분","점포코드","상품코드","판매수량","수취구분"];
	for(var i =0; i<array.length;i++){
		if(array[i].value == ""){
			alert(txt_array[i]+"를 입력하지 않았습니다.");
			array[i].focus();
			return false;
		}
	}
	return true;

}
function validate2() {
	var array = [joinobj.goods_cd,joinobj.goods_nm,joinobj.goods_price,joinobj.cost,joinobj.in_date];
    var txt_array = ["상품코드","상품명","단가","원가","입고일자"];
	for(var i =0; i<array.length;i++){
		if(array[i].value == ""){
			alert(txt_array[i]+"를 입력하지 않았습니다.");
			array[i].focus();
			return false;
		}
	}
	return true;

}