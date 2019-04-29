
/**
 * 
 */
function validate() {
	var array = [joinfr.sale_ymd,joinfr.sale_no,joinfr.store_cd,joinfr.menu_cd,joinfr.size_cd,joinfr.sale_cnt,joinfr.pay_type];
    var txt_array = ["판매일자","판매번호","점포코드","메뉴코드","사이즈코드","판매수량","수취구분"];
	for(var i =0; i<array.length;i++){
		if(array[i].value == ""){
			alert(txt_array[i]+"를 입력하지 않았습니다.");
			array[i].focus();
			return false;
		}
	}
	return true;

}
function validate1() {
	var array = [joinobj.goods_cd,joinobj.goods_nm,joinobj.goods_price,joinobj.cost,joinobj.sale_ymd];
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