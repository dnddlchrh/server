<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>1단계</title>
    <link rel="stylesheet" href="/css/joinOne.css?v6">
  </head>
  <body>
    <div id="wrap">
      <div id="head">
        <div id="inner_head">
          <a href="https://www.daum.net"><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Daum_communication_logo.svg/1200px-Daum_communication_logo.svg.png" alt="logo" ></a>
        </div>
        <h2 class="screen_out">회원가입 안내 본문</h2>
      </div>
      <div class="body">
        <div class="paging_step">
          <span class="ico_join ico_paging on"></span>
          <span class="ico_join ico_paging"></span>
          <span class="ico_join ico_paging"></span>
        </div>
        <div class="wrap_tit">
          <h3 class="tit_join">휴대폰 가입 약관 동의</h3>
          <div class="txt_desc">
            서비스 약관 및 개인정보 수집, 이용에 <strong class="txt_emph">동의</strong>해 주세요.
          </div>
        </div>
        <form class="joinTerms" name="joinTerms" action="signupreal.php" method="post">
          <fieldset class="fld_comm">
            <legend class="screen_out">Daum 서비스 약관 및 개인정보 수집, 이용에 대한 동의</legend>
            <div class="box_comm box_terms">
              <h5 class="tit_agreement">Daum 서비스 약관 동의</h5>
              <div id="termsAgreeContainer" class="cont_areement">
                <strong class="tit_article">제 1 장 총 칙</strong>
                <span class="tit">제 1조 목적</span>
                <p>본 약관은 서비스 이용자가 주식회사 카카오(이하 “회사”라 합니다)가 제공하는 온라인상의 인터넷 서비스(이하 “서비스”라고 하며, 접속 가능한 유∙무선 단말기의 종류와는 상관없이 이용 가능한 “회사”가 제공하는 모든 “서비스”를 의미합니다. 이하 같습니다)에 회원으로 가입하고 이를 이용함에 있어 회사와 회원(본 약관에 동의하고 회원등록을 완료한 서비스 이용자를 말합니다. 이하 “회원”이라고 합니다)의 권리•의무 및 책임사항을 규정함을 목적으로 합니다.</p>
                <span class="tit">제 2조 (약관의 명시, 효력 및 개정)</span>
                <ol class="list_terms">
                  <li>
                    <span class="txt_num">①</span>
                    <p class="txt_clause">회사는 이 약관의 내용을 회원이 쉽게 알 수 있도록 서비스 초기 화면에 게시합니다.</p>
                  </li>
                  <li>
                    <span class="txt_num">②</span>
                    <p class="txt_clause">회사는 온라인 디지털콘텐츠산업 발전법, 전자상거래 등에서의 소비자보호에 관한 법률, 약관의 규제에 관한 법률, 소비자기본법 등 관련법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.</p>
                  </li>
                  <li>
                    <span class="txt_num">③</span>
                    <p class="txt_clause">회사가 약관을 개정할 경우에는 기존약관과 개정약관 및 개정약관의 적용일자와 개정사유를 명시하여 현행약관과 함께 그 적용일자 일십오(15)일 전부터 적용일 이후 상당한 기간 동안, 개정 내용이 회원에게 불리한 경우에는 그 적용일자 삼십(30)일 전부터 적용일 이후 상당한 기간 동안 각각 이를 서비스 홈페이지에 공지하고 기존 회원에게는 회사가 부여한 이메일 주소로 개정약관을 발송하여 고지합니다.</p>
                  </li>
                  <li>
                    <span class="txt_num">④</span>
                    <p class="txt_clause">회사가 전항에 따라 회원에게 통지하면서 공지∙고지일로부터 개정약관 시행일 7일 후까지 거부의사를 표시하지 아니하면 승인한 것으로 본다는 뜻을 명확하게 고지하였음에도 의사표시가 없는 경우에는 변경된 약관을 승인한 것으로 봅니다. 회원이 개정약관에 동의하지 않을 경우 회원은 제17조 제1항의 규정에 따라 이용계약을 해지할 수 있습니다.</p>
                  </li>
                </ol>
              </div>
              <div class="wrap_check">
                <input type="checkbox" id="termsAgree" name="termsAgree" class="input_check">
                <label for="termsAgree" id="ico_click1" class="ico_join ico_check" onclick="javascript:fncShowHideList1();">Daum 서비스 약관에 동의합니다.</label>
              </div>
            </div>
            <div class="box_comm box_terms">
              <h5 class="tit_agreement">Daum 개인정보 수집 및 이용 동의</h5>
              <div id="policyAgreeContainer" class="cont_areement">
                <strong class="tit_article tit_article2">(주)카카오는 아래의 목적으로 개인정보를 수집 및 이용하며, 회원의 개인정보를 안전하게 취급하는데 최선을 다합니다.</strong>
                <span class="tit">1. 수집목적</span>
                • 이용자 식별, 원활한 의사소통, 부정이용 시 제재 및 기록<br>
                • 회원제 서비스 제공, 문의사항 또는 불만 처리, 공지사항 전달 <br>
                • 유료 서비스 이용 시 요금 정산 <br>
                • 신규 서비스 개발, 이벤트 행사 시 정보 전달, 마케팅 및 광고 등에 활용 <br>
                • 서비스 이용 기록 및 통계 분석을 통한 서비스 개선 및 맞춤형 서비스 제공 <br>
                • 프라이버시 보호 측면의 서비스 환경 구축<br>
                <span class="tit">2. 수집항목</span>
                (필수) 아이디, 비밀번호, 이름, 연락처(휴대폰번호 또는 이메일 주소 중 1개 선택)<br>
                <span class="tit">3. 보유기간</span>
                수집된 정보는 회원탈퇴 후 지체없이 파기됩니다. 다만 내부 방침에 의해 서비스 부정이용기록은 부정 가입 및 이용 방지를 위하여 회원 탈퇴 시점으로부터 최대 1년간 보관 후 파기하며, 관계법령에 의해 보관해야 하는 정보는 법령이 정한 기간 동안 보관한 후 파기합니다.<br><br>
                서비스 제공을 위해 필요한 최소한의 개인정보이므로 동의를 해 주셔야 서비스 이용이 가능합니다. <br>
                더 자세한 내용에 대해서는 <a href="http://policy.daum.net/info_protection/info_protection" target="_blank"class="link_privacy">개인정보처리방침</a>을 참고하시기 바랍니다.
              </div>
              <div class="wrap_check">
                <input type="checkbox" id="policyAgree" name="termsAgree" class="input_check">
                <label for="termsAgree" id="ico_click2" class="ico_join ico_check" onclick="javascript:fncShowHideList2();">Daum 서비스 약관에 동의합니다.</label>
              </div>
            </div>
            <div class="wrap_btn">
              <button type="button" class="link_back" id="link_back" onclick="javascript:backdo();">
                <span class="ico_join"></span>
                이전으로
              </button>
              <button type="submit" id="nextBtn" class="btn_comm btn_type1 disabled" onclick="javascript:disalert();">동의하기</button>
            </div>
          </fieldset>
        </form>
      </div>
      <div id="foot_ok" class="footer_comm">
        <h2 class="screen_out">서비스 이용정보</h2>
        <a href="http://www.kakaocorp.com/" class="link_info" target="_blank">서비스 약관</a>
        <span class="txt_bar">|</span>
        <a href="https://cs.daum.net/faq/59/14970.html" class="link_info" target="_blank">개인정보처리방치</a>
        <span class="txt_bar">|</span>
        <a href="https://cs.daum.net/faq/59/8034.html" target="_blank" class="link_info">회원가입 도움말</a>
        <div class="txt_copyright">
          ©
          <a href="http://www.kakaocorp.com/main" class="link_daum" target="_blank">Kakao Corp.</a>
      </div>
    </div>
    <script type="text/javascript">
    var rclick1 = document.getElementById('termsAgree');
    var rclick2 = document.getElementById('policyAgree');
    var click1 = document.getElementById('ico_click1');
    var click2 = document.getElementById('ico_click2');
    var nextgogo = document.getElementById('nextBtn');
    window.backdo=function() {
      history.back();
    }
        window.fncShowHideList1=function() {
          click1.classList.toggle("on");
          if (click1.classList.contains("on")&&click2.classList.contains("on")) {
            nextgogo.classList.remove("disabled");
            nextgogo.disabled=false;
          }else {
            nextgogo.classList.add("disabled");
          }




        //   if(click1.classList.contains("on")){
        //   rclick1.checked = "true";}else {
        //     rclick1.checked = "false";
        //   }
        }
        window.fncShowHideList2=function() {
          click2.classList.toggle("on");
          if (click1.classList.contains("on")&&click2.classList.contains("on")) {
            nextgogo.classList.remove("disabled");
            nextgogo.disabled=false;
          }else {
            nextgogo.classList.add("disabled");
          }
          // if (click2.classList.contains("on")) {
          //   rclick2.checked = "true";
          // }else{
          //   rclick2.checked = "false";
          // }
        }
        window.disalert=function() {
          if (nextgogo.classList.contains("disabled")) {
            nextgogo.disabled = true;
            alert("서비스 약관과 개인정보 수집 및 이용에 모두 동의해 주세요.");
          }
        }
        // if(rclick1.checked=="true"&rclick2.checked=="true"){
        //   nextgogo.classList.remove("disabled");
        //   nextgogo.disabled = false;
        // }else {
        //   nextgogo.classList.add("disabled");
        //   nextgogo.disabled = true;
        // }

    </script>
  </body>
</html>
