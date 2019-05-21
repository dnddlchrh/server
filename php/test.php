<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>php 테스트</title>
  </head>
  <body>
    <?php echo '<p>Hello World</p>';
    echo $_SERVER['HTTP_USER_AGENT'];
    if (strpos($_SERVER['HTTP_USER_AGENT'],'Chrome')!==FALSE) {
      echo "<hr/>크롬 사용중";
      // code...
    }else {
      echo "strpos가 false를 반환 <br/>크롬이 사용 중이 아닙니다.";
    } ?>

  </body>
</html>
<?php
 ?>
