<?php
include "conn.php";
include "lib.php";
$table = "copydaumdb";
if(isset($_POST['id'])&&$_POST['id']==""){hisBack("아이디를 입력해주세요");}
if(isset($_POST['pw'])&&$_POST['pw']==""){hisBack("비밀번호를 입력해주세요");}
if(!is_numeric($_POST['inpPhone'])){hisBack("전화번호는 숫자만 입력해주세요");}
$id=$_POST['id'];
$password=md5($_POST['pwd']);
$name=$_POST['name'];
$inpPhone=$_POST['inpPhone'];
$email=$_POST['email'];
$check="SELECT count(*)from copydaumdb where id='$id'";
$result = mysqli_fetch_array($conn->query($check), MYSQLI_BOTH);
if($result[0]>0){
  hisBack("아이디 중복입니다");
}

$query = "insert into copydaumdb(id,password,name,inpPhone,email)
          values('$id','$password','$name','$inpPhone','$email')";
$conn->query($query);
exit_("추가되었습니다","/cms.php")?>
