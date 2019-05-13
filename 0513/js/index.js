
	
function keypress() {
	alert(document.getElementsByTagName("th")[0].textContent+" 변경금지");
	event.returnValue = false;
}
function keypress1() {
	alert(document.getElementsByTagName("th")[2].textContent+" 변경금지");
	event.returnValue = false;
}