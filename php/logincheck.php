<?php
$table = "copydaumdb";
session_start();
$id=$_POST['id'];
include "conn.php";
include "lib.php";

//필수값 확인
if(isset($_POST['id'])&&$_POST['id']==""){hisBack("아이디를 입력해주세요");}
if(isset($_POST['pw'])&&$_POST['pw']==""){hisBack("비밀번호를 입력해주세요");}

$check="SELECT count(*) FROM $table WHERE id='$id'";
$result = mysqli_fetch_array($conn->query($check), MYSQLI_BOTH);
if ($result[0]>0){//아이디 존재 확
  $query = "select password,memberseq from $table where id = '$id'";
  $result = mysqli_fetch_array($conn->query($query), MYSQLI_BOTH);
  if (md5($_POST['pw']) == $result['password']){//패스워드 일치 확인
    $_SESSION['idx'] = $result['memberseq'];
    exit_("로그인 성공",'/main.php');
  }else{
    hisBack("비밀번호 불일치");
  }
}
else {
  hisBack("존재하지 않는 아이디 입니다");
}
?>
