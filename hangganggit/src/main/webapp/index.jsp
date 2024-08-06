<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>항공 게시판 메인 페이지</title>
    <link rel="icon" href="HG.ico" type="image/x-icon">
    <script src="https://kit.fontawesome.com/c47106c6a7.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="css/style.css">
    <script src="js/ie.js"></script>
</head>

<body>

    <header>
        <div class="inner">
            <h1><a href="">항공게시판메인</a></h1>

            <ul id="gnb">
                <li><a href="noticeList.jsp">공지사항</a></li>
                <li><a href="https://www.google.com/search?q=%ED%95%AD%EA%B3%B5%EC%82%AC%EC%9D%B4%ED%8A%B8&sca_esv=04f11db33f1535fb&sca_upv=1&ei=yYewZpC1D7nBvr0P0qfKqQU&ved=0ahUKEwjQvbqfst2HAxW5oK8BHdKTMlUQ4dUDCBA&uact=5&oq=%ED%95%AD%EA%B3%B5%EC%82%AC%EC%9D%B4%ED%8A%B8&gs_lp=Egxnd3Mtd2l6LXNlcnAiD-2VreqzteyCrOydtO2KuDIFEAAYgAQyCBAAGIAEGKIEMggQABiABBiiBDIIEAAYgAQYogRIwCNQgglYniJwBXgAkAEAmAFzoAHiC6oBAzcuOLgBA8gBAPgBAZgCEKACjgnCAgoQABiwAxjWBBhHwgIEEAAYA8ICCxAAGIAEGLEDGIMBwgIEEC4YA8ICCxAuGIAEGLEDGIMBwgIIEAAYgAQYsQPCAhEQLhiABBixAxjRAxiDARjHAcICDhAuGIAEGLEDGNEDGMcBwgIKEAAYgAQYQxiKBcICCxAuGIAEGNEDGMcBwgILEC4YgAQYxwEYrwHCAgwQABiABBhDGIoFGArCAg0QABiABBixAxiDARgKwgIHEAAYgAQYCpgDAIgGAZAGCpIHBDYuMTCgB5R6&sclient=gws-wiz-serp">항공예매사이트검색링크</a></li>
                <li><a href="https://www.youtube.com/results?search_query=%ED%95%AD%EA%B3%B5">항공 관련 유투브 링크</a></li>
                <li><a href="list.jsp">항공게시판</a></li>
                <li><a href="contact.jsp">문의</a></li>
            </ul>

            <ul class="util">
                <li><a href="aboutUs.jsp">소개</a></li>
                <li><a href="help.jsp">도움말</a></li>
                <li><a href="login_main.jsp">로그인</a></li>
                <li><a href="join_form.jsp">회원가입</a></li>
                <li><a href="terms.jsp">이용안내사항</a></li>
            </ul>
        </div>
    </header>

    <figure>
        <video src="img/visual.mp4" autoplay muted loop></video>
        <div class="inner">
            <h1>HangGangGit</h1>
            <p>게시판을 이용해서, 서로 소통해보세요! <br>
                자세한 사이트 사용방법을 알고 싶으세요? 우측상단의 도움말을 클릭하세요!</p>
            <a href="PostFolder/list.jsp">게시판 작성하러 하러가기</a>
        </div>
    </figure>

    <section>
        <div class="inner">
            <h1>HangGangGit 최근 소식</h1>
            <div class="wrap">
                <article>
                    <div class="pic">
                        <img src="img/news1.jpg" alt="1번째 콘텐츠 이미지">
                    </div>
                    <h2><a href="noticeList.jsp">나라별 현재 상황을 알아보세요!</a></h2>
                    <p>해당하는 나라에 가기전에 미리 정보를 얻어가세요!</p>
                </article>

                <article>
                    <div class="pic">
                        <img src="img/news2.jpg" alt="2번째 콘텐츠 이미지">
                    </div>
                    <h2><a href="noticeList.jsp">지난주의 항공사 예매율 순위입니다.</a></h2>
                    <p>다른 항공사와의 가격 및 예매 순위를 알아보세요!</p>
                </article>

                <article>
                    <div class="pic">
                        <img src="img/news3.jpg" alt="3번째 콘텐츠 이미지">
                    </div>
                    <h2><a href="noticeList.jsp">여행지를 어디로 선택할지 고민되시나요?</a></h2>
                    <p>다른 사용자들이 선택한 여행지와 리뷰보고 선택하세요!</p>
                </article>

                <article>
                    <div class="pic">
                        <img src="img/news4.jpg" alt="4번째 콘텐츠 이미지">
                    </div>
                    <h2><a href="noticeList.jsp">Foreigners-only(외국인 전용)</a></h2>
                    <p> Please use the website's translation feature and review the usage guidelines.</p>
                </article>
            </div>
        </div>
    </section>

    <footer>
        <div class="inner">
            <div class="upper">
                <h1>HangGangGit회사 이용약관</h1>
                <ul>
                    <li><a href="policy.jsp">정책</a></li>
                    <li><a href="terms.jsp">이용약관</a></li>
                    <li><a href="creator.jsp">제작자 사이트</a></li>
                </ul>
            </div>

            <div class="lower">
                <address>
                    HangGanggit회사 담당부서외선번호 내선번호<br>
                    TEL : 031-111-1234 C.P : 010-1234-5678
                </address>
                <p>
                    2024 HangGang회사 &copy; 저작권 모든 권리를 보유하고 있습니다.
                </p>
            </div>
        </div>
    </footer>

</body>
</html>
