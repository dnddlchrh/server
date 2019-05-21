<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>다음 로그인 페이지 베끼기</title>
    <link rel="stylesheet" href="/css/copydaum.css?v3">
    <meta name="viewport" content="width=device-width, initial-scale=1">
  </head>
  <body>
    <div id="wrap">
      <div id="head">
        <div id="inner_head">
          <a href="https://www.daum.net"><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Daum_communication_logo.svg/1200px-Daum_communication_logo.svg.png" alt="logo" ></a>
        </div>
      </div>
      <div id="section">
        <div id="mArticle">
          <div id="loginformdiv">
                  <form novalidate id="loginform" method="post" action="logincheck.php">
                    <fieldset class="fld_comm">
                      <legend class="screen_out">아이디,비밀번호 로그인 정보 입력 </legend>
                      <div class="box_inp">
                      <input type="email" name="id" id="id" class="tf_g"  onfocus="inputfoucs1();" onfocusout="clickout1();">
                      <label for="id" id="nodap1" class="lab_g" style="display:block">아이디 입력</label>
                      </div>
                      <div class="box_inp">
                        <input type="password" name="pw" id="inputPwd" class="tf_g" maxlength="32"autocomplete="off" onfocus="inputfoucs2();" onfocusout="clickout2();">
                        <label for="inputPwd" id="nodap2" class="lab_g">비밀번호 입력</label>
                      </div>
                      <button type="submit" id="loginBtn" class="btn_comm">로그인</button>
                      <div class="set_login">
                        <span class="set_comm">
                          <label for="stln" class="lab_check">로그인 상태 유지</label>
                          <span class="check_g">
                            <input type="checkbox" id="stln" name="stln">
                          </span>
                        </span>
                        <span class="set_security">
                          <a href="#none" id="linkSecurity" class="link_security" target="_blank">IP보안</a>
                          <input type="checkbox" name="ipSecurity" id="ipSecurity" class="inp_check" value="checked" checked="checked">
                          <label for="ipSecurity" class="ico_login lab_security">IP보안 설정 ON</label>
                        </span>
                      </div>
                    </fieldset>
                  </form>
                  <div class="login_rel">
                    <a href="signroot.php" id="signUp" class="link_rel" target="_blank">회원가입</a>
                    <span class="txt_bar">|</span>
                    <a href="https://member.daum.net/find/id.do" id="findID" class="link_rel" target="_blank">아이디 찾기</a>
                    <span class="txt_bar">|</span>
                    <a href="https://memeber.daum.net/find/password.do" id="findPW" class="link_rel" target="_blank">비밀번호 찾기</a>
                  </div>
            </div>
            <div class="info_etc">
                <div class="daum_ddn_area">
                  <a href="https://search.daum.net/search?w=tot&DA=YZR&t__nil_searchbox=btn&sug=&sugo=&q=%EB%8B%A4%EC%9D%8C%EA%B2%80%EC%83%89">
                  <img src="data:image/png;base64,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" alt="광고입니다">
                  </a>
                </div>
            </div>
          </div>
        </div>
        <div class="footer">
          <h2 class="screen_out">서비스 이용정보</h2>
          <a href="http://www.kakaocorp.com/" class="link_kcorp" target="_blank">© Kakao Corp.</a>
          <span class="txt_bar">|</span>
          <a href="https://cs.daum.net/faq/59/14970.html" class="link-custom" target="_blank">고객센터</a>
        </div>
      </div>
      <script type="text/javascript">
        var id1=document.getElementById('id');
        var Pwd1=document.getElementById('inputPwd');
        var nodap1=document.getElementById('nodap1');
        var nodap2=document.getElementById('nodap2');
        function inputfoucs1(){
          nodap1.style.display="none";
        }
        function clickout1(){
          if (id1.value==""||id1.value==null) {
            nodap1.style.display="block";
          }else {
            nodap1.style.display="none";
          }
        }
        function inputfoucs2(){
          nodap2.style.display="none";
        }
        function clickout2(){
          if (Pwd1.value==""||Pwd1.value==null) {
            nodap2.style.display="block";
          }else {
            nodap2.style.display="none";
          }
        }
      </script>
  </body>
</html>
