<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>carindrive : 로그인페이지</title>

<link rel="stylesheet" type="text/css" href="${path}/css/m_log.css">
<script type="text/javascript" src="${path}/js/m_login.js"></script>

<script src="${path}/js/jquery.js"></script>
<script type="text/javascript" src="${path}/js/m_login.js"></script>
<!-- 네이버 인증 로그인 -->
<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
<!-- bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>
<%-- include : main --%>
<%@ include file="../include/header.jsp" %>

<form action="post">
	<div id="wrap">
		<div id="all_form">
			<div id="logo">
				<hr>
				CARINDRIVE
				<hr>
			</div>
			<div id="log_form">
				<div id="id_form">
					<input id="m_id" name="m_id" placeholder="아이디"
					onfocus="this.placeholder=''" onblur="this.placeholder='아이디'">
					<span class="idck"></span>
				</div><%--id_form --%>
				<div id="pwd_form">
					<input id="m_pwd" name="m_pwd" placeholder="비밀번호"
					onfocus="this.placeholder=''" onblur="this.placeholder='비밀번호'">
					<span class="pwdck"></span>
				</div><%--pwd_form --%>
				<div id="maintain">
					<input type="checkbox" id="checkbox" name="checkbox"><label for="checkbox"><span>로그인 상태 유지</span></label>
				</div><%--maitain_form --%>
				<div id="button_form">
					<!-- <input type="button" value="로그인" id="btn1" onclick="return logCk()"> -->
					 <input type="submit" value="로그인" id="btn1">
				</div>
			</div><%--logform end --%>
			<%--아이디, 비밀번호찾기 & 회원가입 --%>
			<div id="another_form">
				<a href="${path}/member/serch_pwd">비밀번호 찾기</a>&nbsp;&nbsp;&#124;
				<a href="${path}/member/serch_id">아이디 찾기</a>&nbsp;&nbsp;&#124;
				<a href="${path}/member/m_join">회원가입</a>&nbsp;&nbsp;
			</div>
			<%-- SNS 로그인 --%>
			<div id="social">
				<a href="#"><img src="${path}/resources/images/naver_icon.png"  id="naver"></a>
				<a href="#"><img src="${path}/resources/images/kakao_icon.png" id="kakao"></a>
				<a href="#"><img src="${path}/resources/images/google_icon.png"  id="google"></a>
			</div>
			<%-- 기타--%>
			<div id="ano">
				<span>CARINDRIVE&nbsp;&nbsp;&#124;</span>
				<span> Copyright&nbsp;</span>
				<span>All Rights Reserved.</span>
			</div>
		</div><%--allform end --%>
	</div><%-- wrap end --%>
</form>
<%-- include : footer --%>
<%@ include file="../include/footer.jsp" %>
</body>
</html>