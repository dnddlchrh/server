<?php
include "conn.php";
include "lib.php";
$table = "copydaumdb";
session_start();

if(isset($_GET['mode'])&&$_GET['mode']=='plus'){

  ?>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>관리자 회원 추가</title>
  </head>
  <body>
    <form action="cmsplus.php" method="post">
      <table>
        <tr>
          <td>아이디</td>
          <td><input type="text" name="id"></td>
        </tr>
        <tr>
          <td>비밀번호</td>
          <td><input type="text" name="pwd"></td>
        </tr>
        <tr>
          <td>이름</td>
          <td><input type="text" name="name"></td>
        </tr>
        <tr>
          <td>전화번호</td>
          <td><input type="text" name="inpPhone"></td>
        </tr>
        <tr>
          <td>이메일</td>
          <td><input type="text" name="email"></td>
        </tr>
      </table>
      <button type="submit" name="button">완료</button>
      <button type="button" name="button" onclick="history.back()">취소</button>
    </form>
  </body>
</html>
  <?
}
if(isset($_GET['mode'])&&$_GET['mode']=='update'){
  $query="select * from $table where memberseq = '{$_GET['target']}'";
  $result = mysqli_fetch_array($conn->query($query),MYSQLI_BOTH);
  ?>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>관리자 회원 조회/수정</title>
  </head>
  <body>
    <form action="cmsupdate.php" method="post">
      <input type="hidden" name="idx" value="<?=$_GET['target']?>">
      <table>
        <tr>
          <td>아이디</td>
          <td><input type="text" name="id" value="<?=$result['id']?>"></td>
        </tr>
        <tr>
          <td>비밀번호</td>
          <td><input type="text" name="pwd"></td>
        </tr>
        <tr>
          <td>이름</td>
          <td><input type="text" name="name" value="<?=$result['name']?>"></td>
        </tr>
        <tr>
          <td>전화번호</td>
          <td><input type="text" name="inpPhone" value="<?=$result['inpPhone']?>"></td>
        </tr>
        <tr>
          <td>이메일</td>
          <td><input type="text" name="email" value="<?=$result['email']?>"></td>
        </tr>
      </table>
      <button type="submit" name="button">완료</button>
      <button type="button" name="button" onclick="history.back()">취소</button>
    </form>
  </body>
</html>
  <?
}
if (isset($_GET['mode'])&&$_GET['mode']=="deletemulti") {
  $select = $_POST['select'];
  $message = "";
  for($i = 0; isset($select[$i]) ; $i++){
    $query = "select id from $table where memberseq = '{$select[$i]}'";
    $result = mysqli_fetch_array($conn->query($query),MYSQLI_BOTH);
    $message .= $result[0]."님, ";
    $query = "delete from $table where memberseq = '{$select[$i]}'";
    $conn->query($query);
  }
  $message = subStr($message,0,-2)."을 삭제했습니다.";
  exit_($message,"/cms.php");
}
?>
