
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>회원가입하자</title>
    <link rel="stylesheet" href="/css/signreal.css?v8">
  </head>
  <body>
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
            <span class="ico_join ico_paging on"></span>
            <span class="ico_join ico_paging"></span>
          </div>
          <div class="wrap_tit">
            <h3 class="tit_join">가입 정보 입력</h3>
            <div class="txt_desc">
              로그인 정보 및 가입 정보를 입력하세요.
            </div>
          </div>
          <form id="joinInput" name="joinInput" action="signcomplete.php" method="post">
            <fieldset class="fld_comm">
              <legend class="screen_out">가입 정보</legend>
              <div class="wrap_info">
                <div class="box_info">
                  <dl class="item_info">
                    <dt>
                      <label for="inpID" class="lab_info" >Daum 아이디</label>
                    </dt>
                    <dd>
                      <div class="wrap_inp">
                        <label for="daumId" class="txt_placeholder">아이디</label>
                        <input type="text" id="daumId" name="daumId" class="inp_info" autocomplete="off" maxlength="15" onfocus="javascript:foucs1();" onfocusout="check1();">
                        <span class="txt_fix txt_domain">@daum.net</span>
                        <span class="mark_valid">
                          <span class="ico_join ico_valid"></span>
                          <span class="screen_out">유효</span>
                        </span>
                      </div>
                      <p class="txt_message" style="display:none;">이미 사용된 Daum 메일입니다. 다른 아이디를 입력하세요</p>
                    </dd>
                  </dl>
                  <dl class="item_info info_password">
                    <dt>
                      <label for="inpPw" class="lab_info">비밀번호</label>
                    </dt>
                    <dd>
                      <div class="wrap_inp">
                        <input type="password" id="password1" name="password1" class="inp_info pw" autocomplete="off" valuemaxlength="32" onfocus="javascript:foucs2();" onfocusout="checkpw1();">
                        <label for="password1" class="txt_placeholder">비밀번호 (8자 이상)</label>
                      <span class="mark_valid">
                        <span class="ico_join ico_valid"></span>
                        <span class="screen_out" id="notmatch2">불가</span>
                      </span>
                    </div>
                  </dd>
                    <dt>
                      <label for="inpPw2" class="lab_info">비밀번호 재확인</label>
                    </dt>
                    <dd>
                      <div class="wrap_inp notop" >

                      <input type="password" id="password2" name="password2" class="inp_info pw" autocomplete="off" valuemaxlength="32" onfocus="javascript:foucs3();" onfocusout="checkpw2();">
                      <label for="password2" class="txt_placeholder">비밀번호 재확인</label>
                      <span class="mark_valid">
                        <span class="ico_join ico_valid"></span>
                        <span class="screen_out" id="notmatch">불일치</span>
                      </span>
                    </div>
                    </dd>
                  </dl>
                </div>
                <div class="box_info">
                  <dl class="item_info">
                    <dt>
                      <label for="inpName" class="lab_info">이름</label>
                    </dt>
                    <dd>
                      <div class="wrap_inp">

                        <input type="text" id="name" name="name" class="inp_info" maxlength="30" onfocus="foucs4();" onfocusout="checkname1();">
                          <label for="name" class="txt_placeholder">이름</label>
                        <span class="mark_valid" style="display:none;">
                          <span class="ico_join ico_valid"></span>
                          <span class="screen_out">유효</span>
                        </span>
                      </div>
                    </dd>
                  </dl>
                  <dl class="item_info info_phone" id="countryListContainer">
                    <dt><label for="inpPhone" class="lab_info">휴대폰 번호</label></dt>
                    <dd>
                      <div class="wrap_inp">

                        <a href="#" class="num_naction" id=numNation>
                          <span class="ico_join downarrow"></span>
                          <span class="link_nationnum">+82</span>
                        </a>
                        <input type="text" id="inpPhone" name="inpPhone" class="inp_info" autocomplete="off" onfocus="javascript:foucs5();" onfocusout="checkinpphone();">
                        <label for="inpPhone" class="txt_placeholder" id="left76">휴대폰 번호</label>
                        <button type="button" id="certBtn" class="btn_check disabled" disabled>인증</button>
                        <span class="mark_valid">
                          <span class="ico_join ico_valid"></span>
                          <span class="screen_out">유효</span>
                        </span>
                      </div>
                    </dd>
                  </dl>
                  <dl class="item_info info_phone">
                    <dt>
                      <label for="inpCertCode" class="lab_info screen_out">휴대폰 인증 번호</label>
                    </dt>
                    <dd>
                      <div class="wrap_inp">

                        <input type="text" id="inpCertCode" name="inpCertCode" class="inp_info" autocomplete="off"maxlength="6" disabled onfocus="javascript:foucs6();" onfocusout="checkcertCode();">
                        <label for="inpPhone" class="txt_placeholder">인증번호 (10분 동안 유효)</label>
                        <button type="button" id="confirmBtn" class="btn_check disabled">확인</button>
                        <span class="mark_valid" style="display:none;">
                          <span class="ico_join ico_valid"></span>
                          <span class="screen_out">일치</span>
                        </span>
                      </div>
                    </dd>
                  </dl>
                  <dl class="item_info info_email">
                    <dt>
                      <label for="inpEmail" class="lab_info">본인 확인용<br>이메일 주소</label>
                    </dt>
                    <dd>
                      <div class="wrap_inp">
                        <input type="text" id="email" name="email" class="inp_info" autocomplete="off" onfocus="javascript:foucs7();" onfocusout="checkemail();">
                        <label for="inpPhone" class="txt_placeholder">본인확인용 이메일(선택)</label>
                        <span class="mark_valid" style="display:none;">
                          <span class="ico_join ico_valid"></span>
                          <span class="screen_out">유효</span>
                        </span>
                      </div>
                    </dd>
                  </dl>
                </div>
              </div>
              <div class="wrap_btn">
                <button type="button" class="link_back" id="link_back" onclick="javascript:backdo();">
                  <span class="ico_join"></span>
                  이전으로
                </button>
                <button type="submit" id="nextBtn" class="btn_comm btn_type1" disabled>다음 단계</button>
              </div>
            </fieldset>
          </form>
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
      <iframe src="" id="ifrm1" class="screen_out" width="0" height="0" name="ifrm1"></iframe>
    <script type="text/javascript">
    var id1=document.getElementById('daumId');
    var pw1=document.getElementById('password1');
    var pw2=document.getElementById('password2');
    var name1=document.getElementById('name');
    var inpPhone=document.getElementById('inpPhone');
    var inpCertCode=document.getElementById('inpCertCode');
    var email=document.getElementById('email');
    var btn1=document.getElementById('nextBtn');
    var notmatch1=document.getElementById('notmatch');
    var notmatch2=document.getElementById('notmatch2');
    window.backdo=function() {
      history.back();
    }
    window.foucs1=function() {
          id1.style.background="white";
          id1.style.color="black";
    }
    window.foucs2=function() {
          pw1.style.background="white";
    }
    window.foucs3=function() {
          pw2.style.background="white";
    }
    function foucs4() {
      name1.style.backgroundColor="white";
    }
    window.foucs5=function() {
          inpPhone.style.background="white";
    }
    window.foucs6=function() {
          inpCertCode.style.background="white";
    }
    window.foucs7=function() {
          email.style.background="white";
    }
    function check1() {
      if(id1.value==""||id1.value==null){
          id1.style.background=0;
      }else {
          id1.style.background="white";
      }
      if (pw1.value==""||pw2.value==""||id1.value==""||name1.value==""||pw1.value==null||pw2.value==null||id1.value==null||name1.value==null) {
        btn1.disabled=true;
      }else{
        btn1.disabled=false;
      }
    }
    function checkpw1() {
      if(pw1.value==""||pw1.value==null){
          pw1.style.background=0;
      }else {
          pw1.style.background="white";
      }
      if(pw1.value.length>=8){
        notmatch2.classList.add('screen_out');
      }else {
        notmatch2.classList.remove('screen_out');
      }
      if (pw1.value==""||pw2.value==""||id1.value==""||name1.value==""||pw1.value==null||pw2.value==null||id1.value==null||name1.value==null) {
        btn1.disabled=true;
      }else{
        btn1.disabled=false;
      }
    }
    function checkpw2() {
      if(pw2.value==""||pw2.value==null){
          pw2.style.background=0;
      }else {
          pw2.style.background="white";
      }
      if(pw2.value==pw1.value){
        notmatch1.classList.add('screen_out');
      }else {
        notmatch.classList.remove('screen_out');
      }
      if (pw1.value==""||pw2.value==""||id1.value==""||name1.value==""||pw1.value==null||pw2.value==null||id1.value==null||name1.value==null) {
        btn1.disabled=true;
      }else{
        btn1.disabled=false;
      }
    }
    function checkname1() {
      if(name1.value==""||name1.value==null){
          name1.style.background=0;
      }else {
          name1.style.background="white";
      }
      if (pw1.value==""||pw2.value==""||id1.value==""||name1.value==""||pw1.value==null||pw2.value==null||id1.value==null||name1.value==null) {
        btn1.disabled=true;
      }else{
        btn1.disabled=false;
      }
    }
    function checkinpphone() {
      var btn2=document.getElementById('certBtn');
      if(inpPhone.value==""||inpPhone.value==null){
          inpPhone.style.background=0;
      }else {
          inpPhone.style.background="white";
      }
      if (inpPhone.value.length<=11) {
        btn2.classList.remove("disabled");
        btn2.disabled=false;
      }else if (inpPhone.value=="") {
        btn2.classList.add("disabled");
        btn2.disabled=true;
      }
      else {
        btn2.classList.add("disabled");
        btn2.disabled=true;
      }
    }
    function checkcertCode() {
      if(inpCertCode.value==""||inpCertCode.value==null){
          inpCertCode.style.background=0;
      }else {
          inpCertCode.style.background="white";
      }
    }
    function checkemail() {
      if(email.value==""||email.value==null){
          email.style.background=0;
      }else {
          email.style.background="white";
      }
    }
    </script>
  </body>
</html>
