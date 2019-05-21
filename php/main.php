<?php
include 'lib.php';
include 'conn.php';
$table = "copydaumdb";
session_start();
$colList = array('kr','아이디','비밀번호','이름','전화번호','이메일');

if(!isset($_SESSION['idx'])){
  exit_("로그인 해주세요.","daumcopylogin.php");
}
$query = "select lv from $table where memberseq = '{$_SESSION['idx']}'";
$result = mysqli_fetch_array($conn->query($query),MYSQLI_BOTH);
if($result[0]>=10){
  ?>
  <script type="text/javascript">
      window.location.href = 'cms.php';
  </script>

  <?
}
$query = "select * from {$table} where memberseq = '{$_SESSION['idx']}'";
$result = mysqli_fetch_array($conn->query($query), MYSQLI_BOTH);
?>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>개인정보 관리 페이지</title>
    <link rel="stylesheet" href="/css/main.css?v10">
  </head>
  <body>
    <div class="wrap_comm">
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
            <div class="section_my">
              <h3 class="tit_comm tit_manage">내 정보를 최신 정보로 관리해 주세요</h3>
              <p class="tit_comm desc_manage">아이디/비밀번호 분실 및 보호조치 해제를 위해 최신 정보로 내 정보를 관리하세요</p>
            </div>
            <div class="set_myinfo clear_g">
              <strong class="txt_comm tit_id2"><?=$colList[1]?></strong>
              <div class="cont_myinfo">
                <dl class="list_myinfo">
                  <dt class="txt_comm txt_daumid">다음 아이디</dt>
                  <dd class="desc_myinfo emph_myinfo"><?=$result[1]?></dd>
                </dl>
              </div>
            </div>
            <div class="set_myinfo clear_g">
              <strong class="txt_comm tit_nick">닉네임/연락처</strong>
              <div class="cont_myinfo">
                <dl class="list_myinfo">
                  <dt class="txt_comm txt_nick">
                    <label for="inpName" class="lab_g">닉네임</label>
                  </dt>
                  <dd class="nicknameDiv desc_myinfo"><?=$result[3]?></dd>
                </dl>
                <dl class="list_myinfo list_contact">
                  <dt class="txt_comm txt_contact">연락처</dt>
                  <dd class="desc_myinfo">
                    <span class="contact_info">
                      <?php if ($result[4]=="0") { ?>
                        <button type="button" id="registerOtherphoneBtn" class="btn_comm btn_enroll" onclick="document.location='userSend.php?mode=revise&target=inpPhone'">등록</button>
                        <span class="txt_none">핸드폰 번호 없음</span>
                        <?}else{?>
                      <span class="ico_comm ico_phone">핸드폰 번호</span>
                      +82 <?=emptyPrint($result[4])?>
                      <button type="button" id="changeNicknameBtn" class="btn_comm btn_change"  onclick="document.location='userSend.php?mode=revise&target=inpPhone'" >
                        <span class="screen_out">변경</span>
                      </button>
                      <button type="button" id="deleteMobileBtn" class="btn_comm btn_del" onclick="document.location='userSend.php?mode=delete&target=inpPhone'">
                        <span class="screen_out">삭제</span>
                      </button>
                      <?}?>
                    </span>
                    <span class="contact_info">
                      <?php if ($result[5]=="") {
                        ?>
                          <button type="button" id="registerOthermailBtn" class="btn_comm btn_enroll" onclick="document.location='userSend.php?mode=revise&target=email'">등록</button>
                          <span class="txt_none">이메일 주소 없음</span>
                        <?
                      }else {?>
                        <span class="ico_comm ico_email">이메일 주소</span>
                        <?=$result[5]?>
                        <button type="button" id="changeNicknameBtn" class="btn_comm btn_change" onclick="document.location='userSend.php?mode=revise&target=email'">
                          <span class="screen_out">변경</span>
                        </button>
                        <button type="button" id="deleteMobileBtn" class="btn_comm btn_del" onclick="document.location='userSend.php?mode=delete&target=email'">
                          <span class="screen_out">삭제</span>
                        </button>

                        <?  } ?>


                    </span>
                  </dd>
                </dl>
              </div>
            </div>
              <button type="button" name="button" class="logoutbtn"onclick="document.location='logout.php'">로그아웃</button>
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
