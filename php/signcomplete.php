<?php
header('Content-Type: text/html; charset=UTF-8');
include("conn.php");
include("lib.php");
$table = "copydaumdb";

$id=$_POST['daumId'];
$password=md5($_POST['password1']);
$password2=md5($_POST['password2']);
$name=$_POST['name'];
$inpPhone=$_POST['inpPhone'];
$email=$_POST['email'];
$formList = array('daumId','password1','name','inpPhone','email');

if(isset($id)&&$id==""){hisBack("아이디를 입력해주세요");}
if(isset($password)&&$password==""){hisBack("비밀번호를 입력해주세요");}
if(strlen($_POST['password1'])<8){hisBack("비밀번호가 너무 짧아요");}
if(strcmp($password,$password2)){hisBack("비밀번호가 맞지 않아요");}
if(isset($name)&&$name==""){hisBack("이름을 입력해주세요");}
if(!is_numeric($inpPhone)){hisBack("전화번호는 숫자만 입력해주세요");}
if(isset($inpPhone)&&$inpPhone==""){hisBack("전화번호를 입력해주세요");}
if(isset($email)&&$email==""){hisBack("이메일을 입력해주세요");}
 ?>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>회원가입끝</title>
    <link rel="stylesheet" href="/css/complete.css?v1">
  </head>
  <body>
    <head>
      <div id="wrap">
        <div id="head">
          <div id="inner_head">
            <a href="https://www.daum.net"><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Daum_communication_logo.svg/1200px-Daum_communication_logo.svg.png" alt="logo" ></a>
          </div>
          <h2 class="screen_out">회원가입 안내 본문</h2>
        </div>
        <div id="body">
          <div class="paging_step">
            <span class="ico_join ico_paging "></span>
            <span class="ico_join ico_paging"></span>
            <span class="ico_join ico_paging on"></span>
          </div>
          <div class="wrap_tit">
            <h3 class="tit_join">Daum 회원이 되신 것을 환영합니다.</h3>
          </div>
          <div class="signupcomplete">
            <dl class="info_user">
              <dt>Daum 아이디</dt>
              <dd>
                <?php echo htmlspecialchars($_POST['daumId']); ?>
              </dd>
            </dl>
            <dl class="info_user">
              <dt>이름/닉네임</dt>
              <dd>
                <?php echo htmlspecialchars($_POST['name']); ?>
              </dd>
            </dl>
          </div>
          <div class="txt_desc">
                    닉네임 등 프로필 정보는 <a href="main.php" class="f_link">내정보 관리</a>에서 수정할 수 있어요.
          </div>
          <div class="wrap_btn">
            <button type="button" id="rtnService" class="btn_comm btn_type1" onclick="returnbt();">서비스로 돌아가기</button>
          </div>
        </div>
        <div class="area_banner">
          <a href="http://magazine.channel.daum.net/terius/screensaver" class="link_banner">
            <img src="https://t1.daumcdn.net/id/member/2016/img_banner_161026.jpg" class="img_banner" alt="카카오프렌즈 'cheer up' PC 스크린세이버로 만나보세요!">
          </a>
        </div>
        <div id="foot_ok" class="footer_comm">
          <h2 class="screen_out">서비스 이용정보</h2>
          <a href="http://www.kakaocorp.com/" class="link_info" target="_blank">서비스 약관</a>
          <span class="txt_bar">|</span>
          <a href="https://cs.daum.net/faq/59/14970.html" class="link_info" target="_blank">개인정보처리방침</a>
          <span class="txt_bar">|</span>
          <a href="https://cs.daum.net/faq/59/8034.html" target="_blank" class="link_info">회원가입 도움말</a>
          <div class="txt_copyright">
            ©
            <a href="http://www.kakaocorp.com/main" class="link_daum" target="_blank">Kakao Corp.</a>
        </div>
      </div>
    </head>
    <script type="text/javascript">
      var btnreturn=document.getElementById('rtnService');
      function returnbt() {
        location.href="https://www.daum.net/";
      }
    </script>
  </body>
</html>
<?

for ($i=0; isset($formList[$i]) ; $i++) {
  if(!isset($_POST[$formList[$i]])){
    history.back();
    exit;
  }
}
$query = "select count(*) from $table where id ='$id'";
$result = mysqli_fetch_array($conn->query($query), MYSQLI_BOTH);
if($result[0]>0){
  hisBack("아이디 중복");
}
$query = "insert into copydaumdb(id,password,name,inpPhone,email)
          values('$id','$password','$name','$inpPhone','$email')";
$conn->query($query);
mysqli_close($conn);

?>
