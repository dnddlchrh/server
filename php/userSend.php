<?
include "conn.php";
include "lib.php";
$table = "copydaumdb";
session_start();
$mode = $_GET['mode'];
$target = $_GET['target'];
//로그인 확인
if(!isset($_SESSION['idx'])){
  exit_("로그인해줴요","/daumcopylogin.php");
}

//삭제
if($mode=="delete"){
  $query = "update $table set {$_GET['target']} = '' where memberseq = {$_SESSION['idx']}";
  $conn->query($query);
  exit_("삭제되었습니다","/main.php");
}
//수정
if($mode=="revise"){
  ?>
  <!DOCTYPE html>
  <html lang="en" dir="ltr">
    <head>
      <meta charset="utf-8">
      <title></title>
      <link rel="stylesheet" href="/css/userSend.css?v8">
    </head>
    <body>
      <div class="head_user" role="banner">
        <div class="inner_head">
          <h1>
            <a href="#" id="daumServiceLogo"><span class="myinfo">내정보</span></a>
          </h1>
        </div>
      </div>
      <div class="content cont_home" role="main">
        <div class="Main_user">
          <div class="mArticle">
            <h2 id="daumBody" class="screen_out">내정보 관리 본문</h2>
            <div class="myinfo_intro intro_addemail">
              <span class="bg_intro"></span>
              <div class="cont_intro">
                <h3 class="tit_comm">등록/수정</h3>
                <p class="desc_g">아이디, 비밀번호 찾기 등 본인확인이 필요한 경우 사용되므로,<br>최신정보로 등록해 주세요.</p>
              </div>
            </div>
            <form class="othermailForm" action="userSend.php?mode=update&target=<?=$target?>" method="post">
              <fieldset class="fld_comm">
                <legend class="screen_out">수정 폼</legend>
                <div class="info_comm info_addmail">
                  <div class="info_detail">
                    <div class="tit_detail">
                      <strong class="txt_comm txt_addeamil">등록/수정</strong>
                    </div>
                    <div class="input_info">
                      <div class="bg_user bg_basic">
                        <input type="text" name="newdate" class="tf_g tf_num">
                      </div>
                      <button type="submit" class="btn_comm btn_numcertify">확인</button>
                    </div>
                  </div>
                </div>
              </fieldset>
            </form>
            </div>

          </div>
        </div>
        <div class="foot footer_comm" role="contentinfo">
          <h2 class="screen_out">서비스 이용 정보</h2>
          <a href="http://policy.daum.net/info/info" target="_blank" class="link_info">서비스 약관/정책</a>|
          <a href="http://policy.daum.net/info_protection/info_protection" target="_blank" class="link_info">개인정보처리방침</a>|
          <a href="https://cs.daum.net/redbell/top.html" target="_blank" class="link_info">권리침해신고</a>|
          <a href="https://cs.daum.net/faq/59.html" target="_blank" class="link_info">권리침해신고</a>
          <small class="txt_copyright">
            Copyright © <a href="http://www.kakaocorp.com" class="link_daum" style="font-weight: bold">Kakao Corp.</a> All rights reserved.
          </small>
        </div>
      </div>
    </body>
  </html>
  <?

}
if ($mode=='update') {
  if($target=='inpPhone'){
    if(!is_numeric($_POST['newdate'])){exit_("숫자만 입력해주세요","/main.php");}
    $query = "update $table set {$target} = '{$_POST['newdate']}' where memberseq = '{$_SESSION['idx']}'";
    $conn->query($query);

}else if ($target=='email') {
  $query = "update $table set {$target} = '{$_POST['newdate']}' where memberseq = '{$_SESSION['idx']}'";
  $conn->query($query);
}

  exit_("변경되었습니다","/main.php");
}
?>
