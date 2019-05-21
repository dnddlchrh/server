<?php
include "conn.php";
include "lib.php";
$table = "copydaumdb";
if(isset($_POST['id'])&&$_POST['id']==""){hisBack("아이디를 입력해주세요");}
if(isset($_POST['pw'])&&$_POST['pw']==""){hisBack("비밀번호를 입력해주세요");}
if(!is_numeric($_POST['inpPhone'])){hisBack("전화번호는 숫자만 입력해주세요");}
$idx=$_POST['idx'];
$id=$_POST['id'];
if(!isset($_POST['pwd'])||trim($_POST['pwd'])==""){
  $query = "select password from $table where memberseq = '$idx'";
  $result = mysqli_fetch_array($conn->query($query), MYSQLI_BOTH);
  $password = $result[0];
}else{$password = $_POST['pwd'];}
$name=$_POST['name'];
$inpPhone=$_POST['inpPhone'];
$email=$_POST['email'];

$check="SELECT count(*)from $table where id='$id' and memberseq <> $idx";
$result = mysqli_fetch_array($conn->query($check), MYSQLI_BOTH);

if(!isset($_POST['id'])||trim($_POST['id'])==""){
  $query = "select password from $table where memberseq = '$idx'";
  $result = mysqli_fetch_array($conn->query($query), MYSQLI_BOTH);
  $password = $result[0];
}
if($result[0]>0){
  hisBack("아이디 중복입니다");
}
$query = "update {$table} set id = '{$id}',
          password = '{$password}',
          name = '{$name}',
          inpPhone = '{$inpPhone}',
          email = '{$email}'
          where memberseq = {$idx}";
$conn->query($query);
exit_("수정되었습니다","/cms.php")?>
