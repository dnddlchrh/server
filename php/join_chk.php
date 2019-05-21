<?php
include "conn.php";
include "lib.php";
$id=$_GET['daumId'];

$check="SELECT count(*)from copydaumdb where id='$id'";
$result = mysqli_fetch_array($conn->query($check), MYSQLI_BOTH);
if(isset($_GET['daumId'])&&$_GET['daumId']==""){hisBack("아이디를 입력해주세요");}
if($result[0]>0){
  ?>
  <script type="text/javascript">
    var id1=parent.document.getElementById('daumId');
    id1.style.color="red";
    alert("아이디 중복");
  </script>
  <?php
  exit();
}
 ?>
