<?php
include 'lib.php';
include 'conn.php';
$table = "copydaumdb";
session_start();
$query = "select lv from $table where memberseq = '{$_SESSION['idx']}'";
$result = mysqli_fetch_array($conn->query($query),MYSQLI_BOTH);
if($result[0]>=10){
  $query = "select * from $table where lv < 10";
  $result = $conn->query($query);
  ?>
  <!DOCTYPE html>
  <html lang="en" dir="ltr">
    <head>
      <meta charset="utf-8">
      <title>관리자 페이지</title>
      <link rel="stylesheet" href="/css/cms.css?v4">
    </head>
    <body>
      <div id="wrap">

        <div id="head">
          <button type="button" name="button" class="logoutbtn"onclick="document.location='logout.php'">로그아웃</button>
          <div id="inner_head">
            <a href="https://www.daum.net"><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Daum_communication_logo.svg/1200px-Daum_communication_logo.svg.png" alt="logo" ></a>
          </div>
          <h2 class="screen_out">관리자 페이지</h2>
        </div>
      <form action="cmssend.php?mode=deletemulti" method="post">
        <input class="screen_out">
        <div class="box1">
          <button type="button" name="button" onclick="document.location='cmssend.php?mode=plus'">추가</button>
          <button type="submit" name="button">삭제</button>
        </div>
        <table class="table_comm">
          <thead>
            <tr>
              <th>idx</th>
              <th>아이디</th>
              <th>비밀번호</th>
              <th>이름</th>
              <th>전화번호</th>
              <th>이메일</th>
              <th>조회/수정</th>
              <th><input type="checkbox" disabled></th>
            </tr>
          </thead>
          <tbody>
          <?
            foreach ($result as $key) {
              ?>

                <tr>
                  <td><?=$key['memberseq']?></td>
                  <td><?=$key['id']?></td>
                  <td>****</td>
                  <td><?=$key['name']?></td>
                  <td><?=$key['inpPhone']?></td>
                  <td><?=$key['email']?></td>
                  <td><button type="button" name="button" onclick="document.location='cmssend.php?mode=update&target=<?=$key['memberseq']?>'">조회/수정</button></td>
                  <td>
                    <input type="checkbox" name="select[]" value="<?=$key['memberseq']?>">
                  </td>
                </tr>

              <?
            }
          ?></tbody>
        </table>
      </form>
    </div>
    </body>
  </html>
  <?
}else{
  exit_("권한이 없습니다","/main.php");
}
?>
