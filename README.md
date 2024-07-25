
<img src="https://github.com/leejm9/Cool-Trade/assets/151510159/be9fd7f4-60b5-4fe0-854f-50e854d1627c" width="300">

# KH 정보교육원 Final Project
**Final Project**
## 📄 프로젝트 소개
**쿨한대학교 : 컴퓨터 공학과 학사 정보 시스템**



<br><br>
## 📆 개발기간
&nbsp; - 2024.03.27 ~ 2024.03.29 - 프로젝트 분석

&nbsp; - 2024.04.01 ~ 2024.04.05 - 화면 및 데이터 설계

&nbsp; - 2024.04.08 ~ 2024.05.01 - 화면 구현, 기능 개발, 프로젝트 검수 및 테스트

&nbsp; - 2024.05.02 - 프로젝트 발표

<br><br>
## 👥 멤버 : 정동석(Project Leader), 조연정, 김도현, 어수지

⭐ 정동석 (https://github.com/knotiez)

&nbsp; - 커뮤니티 게시판 CRUD

&nbsp; - 중앙도서관 정보제공 - API를 통한 서울중앙도서관 데이터베이스 접속 + 데이터 추출

&nbsp; - 회원 관리 - 학생, 교직원, 교수 등록 및 정보 수정

&nbsp; - 공지사항 관리 - 공지사항 관련 CRUD

&nbsp; - 학생, 교직원, 교수 전체 조회 - 등록된 인원 상태 별로 검색, 학생 전체 상태 통계 그래프

&nbsp; - 증명서 발급 - 학생 상태에 따른 증명서 발급 가능 및 PDF파일 제공

     (성적 증명서, 재학 증명서, 등록금 납부 영수증, 등록금 납부 고지서, 졸업 증명서)

⭐ 조연정(https://github.com/you-summer)

&nbsp; - 교수 - 강의 등록/수정/삭제 CRUD

&nbsp; - 교수 - 과제 등록/수정/삭제 CRUD (summernote api)

&nbsp; - 교수 - 성적 등록/수정/삭제 CRUD

&nbsp; - 실시간 날씨정보 (공공데이터api)

&nbsp; - 공채정보 (사람인api)

&nbsp; - 웹소켓 실시간 알림 - 공지사항 등록시 전체회원

&nbsp; - 웹소켓 실시간 알림 - 커뮤니티 댓글 등록시 작성회원에게 알림

⭐ 김도현 (https://github.com/KIMMEONJI)

&nbsp; - 학생, 교직원, 교수 - 로그인 / 아이디 저장(쿠키 활용)

&nbsp; - 학생, 교직원, 교수 - 비밀번호 재설정(gmail API & 구글 reCAPTCHA API)

&nbsp; - 학생 - 성적 조회(이전 성적조회 및 총 이수학점, 총 평점)

&nbsp; - 학생 - 수강 강의 검색 및 조회

&nbsp; - 학생 - 수강 강의실 상세조회 - 공지사항, 강의계획서 조회

&nbsp; - 학생 - 수강 강의실 상세조회 - 자유게시판, 과제게시판 CRUD

&nbsp; - 메인페이지, 학생 - 나의 캘린더 CRUD (Fullcalendar API)

&nbsp; - 메인페이지, 학생 - 나의 캘린더 국가자격증·공휴일 정보 조회 (공공데이터 API, 구글 캘린더 API)

⭐  어수지 (https://github.com/Suuujii)

&nbsp; - 관리자 - 등록금 고지서 생성 및 발급

&nbsp; - 학생 - 성적 장학금 선정 후 등록금 계산

&nbsp; - 학생 - 휴·복학 신청 

&nbsp; - 관리자 - 휴·복학 승인 및 반려

&nbsp; - 학교 셔틀 버스 - 공공데이터 API & 네이버 지도 API

&nbsp; - 에러 페이지

<br><br>
## ⚙️ 개발 환경

- OS : Windows10

- IDE : Eclipse, VSCode

- Server : Apach Tomcat 9.0

- DBMS : Oracle

- Languages : JAVA, HTML, CSS, JavaSciprt, JQuery, JSP, SQL

- Management : Git, GitHub, SourceTree

<br><br>
## 🔧 기술 스택

- FrontEnd : HTML5, CSS3, JavaScript, JQuery, Ajax

- BackEnd : Java 11, JSP & Servlet, Spring, Mybatis

<br><br>
## 🖋️ 설계

ERD Cloud

<br><br>
## 🔎 프로젝트 Q&A
#### ❓ 프로젝트 기획 의도

<div>
  쿨한대학교 학사 정보 시스템은 학생들이 학교 생활에서 필요한 다양한 정보와 서비스를 한 곳에서 쉽게 접할 수 있게 하여, 학교 커뮤니티의 결속력을 강화하고 학생들이 학교 자체 플랫폼을 더 활발히 사용하도록 하는 것에 중점을 두었습니다. 학생들이 학교 자체 플랫폼을 더 자주 방문하고 활용하도록 유도하며, 학생들 사이의 커뮤니케이션과 상호작용을 증진시켜 학우들 간의 결속력을 강화할 수 있습니다. 이 플랫폼은 학생들이 학교 생활에서 격는 다양한 도전과 문제를 해결하는 데 도움을 주어, 보다 만족스러운 대학 생활을 경험하도록  지원할 수 있습니다.
</div>

<br><br>
#### 🧷 프로젝트 특징

&nbsp; - **커뮤니티 포럼 및 소셜 네트워크 기능:** 학생들이 자신의 관심사, 학습 주제, 취미, 소모임 등에 대해 소통할 수 있는 커뮤니티 포럼과 소셜 네트워킹 기능을 구축합니다. 이는 학생들이 서로를 더 잘 알고 교류할 수 있는 기회를 제공합니다.

&nbsp; - **맞춤형 정보 제공:** 학생들의 위치, 관심사, 학과 등에 기반하여 맞춤형 정보를 제공합니다. 예를 들어, 현재 도서관의 재고파악, 날씨 현황, 주변 대중교통 등의 최신 소식을 제공합니다.

&nbsp; - **개인화된 학사 및 일정 관리:** 학생 개인의 학사 일정, 수업 시간표, 시험 일정 등과 함께 개인 스케줄을 관리할 수 있는 기능을 제공합니다. 이는 학교 생활을 보다 체계적으로 관리하는 데 도움을 줍니다.

&nbsp; - **소모임 및 이벤트 플랫폼:** 학생들이 소모임을 쉽게 찾고, 참여하거나 직접 모집을 할 수 있는 플랫폼을 제공합니다. 또한 학교 행사, 세미나, 워크숍 등의 이벤트 정보를 쉽게 공유하고 관리할 수 있습니다.

&nbsp; - **학교 생활 정보 포털:** 학교 내의 다양한 시설 정보, 주변 상가 및 편의시설 정보, 교통 정보 등 학교 생활에 필요한 다양한 정보를 한 곳에서 제공합니다.

&nbsp; - **보안 및 개인 정보 보호:** 사용자의 개인 정보 보호와 데이터 보안을 위해 최신 보안 기술을 적용하고 사용자 동의 하에만 개인 정보를 처리합니다.

<br><br>
#### ✂ 프로젝트 개선점

&nbsp; - 

<br><br>
#### 🧶 프로젝트를 통해 깨달은 점

🧑 

&nbsp; - 


👦 

&nbsp; - 

👩 

&nbsp; -

👧 

&nbsp; -

<br><br>
## 📖 프로젝트 구현

**정동석**

&nbsp; **회원 관리**

-학생 등록
<img src="https://github.com/leejm9/Cool-Trade/assets/151510159/ed23df07-0e96-41ac-bf85-22eb17175cb1">

-교수 등록
<img src="https://github.com/leejm9/Cool-Trade/assets/151510159/93704986-3dff-47c3-bd06-878df9b24a97">
    
-교직원 등록
<img src="https://github.com/leejm9/Cool-Trade/assets/151510159/4918f78f-b128-4a2c-be11-ab75c82e82b0">
    
- 이메일 확인
<img src="https://github.com/leejm9/Cool-Trade/assets/151510159/633f062b-d71b-4485-98e6-84a7be3ab7c1">
    
&nbsp; **개인정보 변경**
- 전화번호 변경
<img src="https://github.com/leejm9/Cool-Trade/assets/151510159/27013805-260f-4bcc-8b19-0b62cd3eaa7f">

- 주소 변경
<img src="https://github.com/leejm9/Cool-Trade/assets/151510159/357d6f97-b5d0-49e3-b540-dd23cb61c337">
   
- 프로필 사진변경
<img src="https://github.com/leejm9/Cool-Trade/assets/151510159/3aa300b2-cab0-412d-a9ef-4aeebe332691">

- 비밀번호 변경
<img src="https://github.com/leejm9/Cool-Trade/assets/151510159/7034fd6d-0edf-4d35-912d-5611b8874cf5">
- 비밀번호 변경 확인
<img src="https://github.com/leejm9/Cool-Trade/assets/151510159/1df7b682-d594-4ca9-9c62-8552f5a13cc8">

&nbsp; **회원 전체 조회**
- 학생 상태별 조회
<img src="https://github.com/leejm9/Cool-Trade/assets/151510159/abd97ddc-8852-4d93-867c-3f4114102396">

- 교수 상태별 조회
<img src="https://github.com/leejm9/Cool-Trade/assets/151510159/f0744ad7-3e0f-4978-86c9-6093f25c4306">

- 학생 상태별 그래프 제작
<img src="https://github.com/leejm9/Cool-Trade/assets/151510159/4d62bec8-2a51-4518-ae66-6c6127c0c21b">

&nbsp; **중앙도서관 정보제공**
- 중앙도서관 서적 검색
<img src="https://github.com/leejm9/Cool-Trade/assets/151510159/789fe776-c54d-46f1-8079-b0578a5982ec">

&nbsp; **자유게시판**
- 자유게시판 작성
<img src="https://github.com/leejm9/Cool-Trade/assets/151510159/166f48d7-a7c6-4907-ad62-7fb48dd0dfa5">

- 자유게시판 수정
<img src="https://github.com/leejm9/Cool-Trade/assets/151510159/3b488a33-a1ba-4ae8-b01d-cf3326de64fb">

- 자유게시판 삭제
<img src="https://github.com/leejm9/Cool-Trade/assets/151510159/3fb6b44f-b843-4cb1-a65f-b534f88c1920">

- 댓글 작성
<img src="https://github.com/leejm9/Cool-Trade/assets/151510159/5dcb885a-e7ba-42ce-9e3d-7b4234fa0522">

&nbsp; **공지사항**
- 공지사항 작성
<img src="https://github.com/leejm9/Cool-Trade/assets/151510159/7343c22b-a988-483e-97ae-307c48496236">

- 공지사항 수정
<img src="https://github.com/leejm9/Cool-Trade/assets/151510159/e66a7a61-d32e-4db9-99c9-a102332502d4">

- 공지사항 삭제
<img src="https://github.com/leejm9/Cool-Trade/assets/151510159/f76375dc-e9ca-4085-9d89-28bc8dc02b17">

&nbsp; **증명서 발급**
- 성적 증명서
<img src="https://github.com/leejm9/Cool-Trade/assets/151510159/5e347e40-e033-4a6f-a42d-10583fbfe4d0">

- 재학 증명서
<img src="https://github.com/leejm9/Cool-Trade/assets/151510159/be334d04-4015-4ee9-9537-3f41fc51ec30">

- 등록금 납부 영수증
<img src="https://github.com/leejm9/Cool-Trade/assets/151510159/6fcc8eca-5851-474e-8039-45ec1723175d">

- 등록금 납부 고지서
<img src="https://github.com/leejm9/Cool-Trade/assets/151510159/cd8373a3-2033-4428-b6ce-f111081f6262">
    
- 졸업 증명서
<img src="https://github.com/leejm9/Cool-Trade/assets/151510159/f70443dc-8821-47d5-8bd3-77e7b8cfc4ee">

<br><br>
조연정

&nbsp; **웹소켓 실시간 알림**
- 공지사항 등록시 전체회원에게 실시간 알림
![공지사항작성알림](https://github.com/user-attachments/assets/7934a152-a14e-44de-ab6d-98f2fe6861ec)

- 작성한 글에 댓글이 달렸을시 실시간 알림
![댓글작성알림](https://github.com/user-attachments/assets/8c177139-164c-4a9f-a5d3-f760b9e444fe)

&nbsp; **날씨정보(공공데이터api)**
- 공공데이터api를 이용한 실시간 날씨 정보
![실시간 날씨](https://github.com/user-attachments/assets/d1954760-5a1f-49f5-a533-2383a8f481a0)

&nbsp; **강의 등록/수정/삭제**
- 강의등록
![강의등록1](https://github.com/user-attachments/assets/ad2b0ebd-df38-48b3-b954-18ba7bd93946)
![강의등록2](https://github.com/user-attachments/assets/eb7afaef-a792-4f58-a11e-74b98e496aaa)

- 첨부파일 다운로드
![파일다운로드](https://github.com/user-attachments/assets/5faf8fa7-8879-4e50-b2b7-8ce6946e6c54)

- 강의수정
![강의수정](https://github.com/user-attachments/assets/7a88584a-bab6-4c8e-b8ed-b371b4867ec6)





<br><br>
김도현

&nbsp; **회원 로그인 및 비밀번호 찾기**
- 회원 로그인 및 아이디 저장(학생, 교직원, 교수)
<img src="https://github.com/koolhandae/KH_University/assets/151509557/0e95fb0e-3017-4d57-8bd8-774196185c18">

- 회원 비밀번호 찾기
<img src="https://github.com/koolhandae/KH_University/assets/151509557/786a84f4-bea7-4c4b-b513-545aacb488a4">

- 비밀번호 재설정 확인
<img src="https://github.com/koolhandae/KH_University/assets/151509557/62556d56-059d-4d3f-be8a-4f88dfb4302a">

&nbsp; **메인 및 학생페이지 캘린더**
- 메인페이지 달력 구현(구글캘린더 공휴일 API)
<img src="https://github.com/koolhandae/KH_University/assets/151509557/a527bee0-9cd5-4cca-8f0b-1fa75773848a">

- 캘린더 추가(FullCalendar API)
<img src="https://github.com/koolhandae/KH_University/assets/151509557/1a6dc329-8959-4950-b387-9aa0e69f9c66">

- 캘린더 수정
<img src="https://github.com/koolhandae/KH_University/assets/151509557/aeb29c3c-bcbf-45b5-a7f1-b42a27df2fa0">

- 캘린더 삭제
<img src="https://github.com/koolhandae/KH_University/assets/151509557/ef46ef8f-cfe2-4ce1-8db0-d55ccb1f2997">

- 자격증 정보 조회 (공공데이터 API)
<img src="https://github.com/koolhandae/KH_University/assets/151509557/0ed4a5c2-1a07-4495-a9f5-517ca65eabd3">

&nbsp; **학점 및 성적조회**
- 학점 및 성적조회
<img src="https://github.com/koolhandae/KH_University/assets/151509557/3fb4705d-bfcc-48e1-9a48-ac9f0ac3bdef">

&nbsp; **수강 강의 조회 및 상세조회**

-  수강 강의 조회
<img src="https://github.com/koolhandae/KH_University/assets/151509557/4fce0bf6-a43a-4b93-b5ea-7150831d63cb">

- 강의실 공지사항 조회
<img src="https://github.com/koolhandae/KH_University/assets/151509557/bfb60467-4730-452c-a322-e8ca4c1459dc">

- 강의실 강의계획서 조회
<img src="https://github.com/koolhandae/KH_University/assets/151509557/80420542-da04-4948-a15f-faecf236bd3a">

- 강의실 자유게시판 등록 및 조회
<img src="https://github.com/koolhandae/KH_University/assets/151509557/6b0871d1-b189-4576-8d86-94a42bf84ab5">

- 강의실 자유게시판 삭제
<img src="https://github.com/koolhandae/KH_University/assets/151509557/467ecc50-e1c7-4d6d-a7d0-fdd3f78f4959">

- 강의실 과제게시판 조회
<img src="https://github.com/koolhandae/KH_University/assets/151509557/2de02c12-b15b-4ef4-8ac3-0050c8919f23">

- 강의실 과제게시판 등록
<img src="https://github.com/koolhandae/KH_University/assets/151509557/481be8e0-a4b3-4608-bee2-6286129365c4">
<br><br>

어수지

- 관리자 등록금 고지서 생성 및 발급
<p align="center">
  <img src="https://github.com/koolhandae/KH_University/assets/151510158/649e2450-3708-4f00-8cfd-263a245e9483">
</p>

- 학생 등록금 납입 및 조회
<p align="center">
  <img src="https://github.com/koolhandae/KH_University/assets/151510158/30cd9f57-ee7e-45bb-bf29-25380cf31d27">
</p>

- 학생 휴학 신청
<p align="center">
  <img src="https://github.com/koolhandae/KH_University/assets/151510158/f80a7ea2-ed6f-40d6-ad1a-f2c5c21e8bc0">
</p>

- 관리자 휴학 승인
<p align="center">
  <img src="https://github.com/koolhandae/KH_University/assets/151510158/e34f0755-f2b8-409d-a33b-ff71f1c19627">
</p>

- 학생 복학 신청
<p align="center">
  <img src="https://github.com/koolhandae/KH_University/assets/151510158/7f584cd1-bedc-43c1-8cc6-d289782a5f1b">
</p>

- 관리자 복학 승인
<p align="center">
  <img src="https://github.com/koolhandae/KH_University/assets/151510158/ab2f53e1-168d-439d-b8ef-28fdd6983cf6">
</p>

- 버스 api (대전시 버스 공공데이터)
<p align="center">
  <img src="https://github.com/koolhandae/KH_University/assets/151510158/ebdb17ef-ded9-4a90-ab7d-077cbb94b9b5">
</p>
















