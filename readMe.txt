# 🚗 CarInDrive
> 차량 렌트 예약 웹 서비스  
> 사용자 인증, 이메일 인증, 카카오 소셜 로그인 기반의 차량 렌트 플랫폼

---

## 프로젝트 개요

| 항목 | 내용 |
| --- | --- |
| **프로젝트명** | CarInDrive |
| **기간** | 2023.06.20 ~ 2023.10.06 |
| **인원** | 5명 |
| **역할** | 백엔드 (회원/인증 모듈 개발), ERD 설계 |
| **주요 기능** | 일반 로그인, 회원가입, 이메일 인증 기반 아이디 찾기, 비밀번호 변경, 카카오 소셜 로그인, Spring Security 적용 |
| **GitHub** | [🔗 Repository Link](https://github.com/porcupine7021/carindrive) |

---

## 프로젝트 목적 / 배경

> 차량 대여 과정을 온라인으로 간편하게 처리할 수 있는 렌트 서비스 구축.  
> 사용자 인증과 계정 보안을 강화하여 예약, 결제 등 확장 기능의 기반을 마련.

---

## ⚙️ 기술 스택

| 구분 | 기술 |
| --- | --- |
| **Frontend** | - |
| **Backend** | Java 8, Spring MVC (Spring Boot 호환), MyBatis |
| **Database** | Oracle 18c |
| **Infra** | Windows (Local) |
| **Tools** | Eclipse 4.27, STS3, SQL Developer |
| **Version Control** | Git, GitHub |

---

## 🧱 시스템 구조

### 🗂 ERD / 아키텍처
- 회원(`c_member`) 및 소셜(`social`) 테이블 중심의 인증 및 마이페이지 구조

### 📡 주요 API (요약)
| 구분 | 엔드포인트 | 설명 |
| --- | --- | --- |
| 회원가입 | `POST /member/member_join_ok` | 신규 회원 등록 |
| 아이디 중복 | `POST /member/member_idcheck` | 중복 체크 |
| 로그인 | `POST /member/m_login_ok` | 일반 및 관리자 로그인 |
| 아이디 찾기 | `POST /member/serch_id_email_ck` | 이메일 인증 기반 |
| 비밀번호 찾기 | `POST /member/serch_pwd_email_ck` | 이메일 인증 기반 |
| 비밀번호 변경 | `POST /member/pwd_change_ok` | 인증 후 비밀번호 변경 |
| 카카오 로그인 | `GET /member/kakaotest` | OAuth2.0 기반 로그인 |
| 마이페이지 | `/member/mypage` 등 | 회원정보 조회·수정·탈퇴 |

---

## 🔑 주요 기능 상세

### 1️⃣ 회원가입 & 이메일 중복 체크
- MyBatis 기반 SQL 실행
- 비밀번호 MD5 해시 암호화 (학습용)
- 중복 이메일 검사 후 가입 처리

```java
cm.setM_pwd(CarPwdCh.getPassWordToXEMD5String(cm.getM_pwd()));
memberService.insertMember(cm);
xml
코드 복사
<insert id="C_mem_in">
  INSERT INTO c_member(m_id, m_pwd, m_name, m_email, m_phone, m_state, m_regdate)
  VALUES (#{m_id}, #{m_pwd}, #{m_name}, #{m_email}, #{m_phone}, 1, SYSDATE)
</insert>
2️⃣ 로그인 & 세션 관리
일반회원(m_state=1) / 관리자(m_state=9) 구분

비밀번호 해시 검증 후 세션에 사용자 정보 저장

java
코드 복사
MemberVO cm = m_id.equals("admin01")
  ? memberService.adminCk(m_id)
  : memberService.loginCheck(m_id);

if (cm != null && cm.getM_pwd().equals(CarPwdCh.getPassWordToXEMD5String(m_pwd))) {
    session.setAttribute("memberInfo", cm);
    session.setAttribute("id", m_id);
}
3️⃣ 이메일 인증 기반 아이디 / 비밀번호 찾기
RegisterMail 서비스로 인증코드 발송

세션에 인증코드 저장 후 검증 처리

java
코드 복사
String code = registerMail.sendSimpleMessage(m_email);
session.setAttribute("code", code);
session.setAttribute("userid", cm.getM_id());
4️⃣ 카카오 소셜 로그인 (OAuth2.0)
Access Token 발급 후 사용자 정보 요청

신규 가입자 자동 등록, 기존 회원 자동 로그인

java
코드 복사
ResponseEntity<String> response = restTemplate.exchange(
    "https://kauth.kakao.com/oauth/token",
    HttpMethod.POST,
    new HttpEntity<>(params, headers),
    String.class
);
xml
코드 복사
<insert id="insertKakao">
  INSERT INTO social(id, username, password, email, role, create_date, k_state)
  VALUES (DEFAULT, #{username}, #{password}, #{email}, 'user', SYSDATE, 1)
</insert>
5️⃣ 비밀번호 해시 유틸
CarPwdCh — MD5 기반 학습용 암호화 유틸
운영 환경에서는 Spring Security의 BCryptPasswordEncoder 사용 권장

java
코드 복사
public static String getPassWordToXEMD5String(String password) {
    MessageDigest md = MessageDigest.getInstance("MD5");
    byte[] bytes = md.digest(password.getBytes());
    StringBuilder sb = new StringBuilder();
    for (byte b : bytes) {
        String hex = Integer.toHexString(b & 0xff);
        if (hex.length() < 2) sb.append('0');
        sb.append(hex);
    }
    return sb.toString();
}
🧩 트러블슈팅
문제	원인	해결
로그인 시 비밀번호 불일치	평문/해시 혼용	가입·로그인 시 동일 해시 적용
이메일 중복 가입	동시 요청 경쟁	DB UNIQUE 제약 + 서비스 중복 검사 병행
카카오 이메일 null	일부 계정 이메일 미제공	닉네임 기반 식별자 생성 로직 추가
MD5 보안 취약	레거시 해시 사용	BCrypt 기반 PasswordEncoder 전환 예정

🧠 배운 점 & 개선 계획
회원 인증과 OAuth 흐름을 직접 구현하면서 세션, 암호화, 외부 API 연동 구조를 이해함.
이후 버전에서는

Spring Security 기반 비밀번호 인코딩(BCrypt)

예외/응답 표준화

Swagger API 문서 자동화

이메일 인증/비밀번호 재설정 절차 고도화
를 목표로 개선 예정.

🖼 시연 이미지
로그인 / 회원가입 / 이메일 인증 / 카카오 로그인 주요 흐름 캡처 예정

(GIF or 시연 영상 추가 예정)

📁 디렉토리 구조 (요약)
css
코드 복사
carindrive/
 ┣ src/main/java/com/carindrive/
 ┃ ┣ controller/
 ┃ ┃ ┗ MemberController.java
 ┃ ┣ service/
 ┃ ┃ ┗ MemberServiceImpl.java
 ┃ ┣ dao/
 ┃ ┃ ┗ MemberDAOImpl.java
 ┃ ┣ vo/
 ┃ ┃ ┗ MemberVO.java, SocialVO.java
 ┃ ┗ utils/
 ┃    ┗ CarPwdCh.java
 ┣ src/main/resources/
 ┃ ┗ mapper/
 ┃    ┣ member-mapper.xml
 ┃    ┗ social-mapper.xml
 ┗ pom.xml
